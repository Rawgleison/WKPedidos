unit unt.View.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  unt.Model.Imagens, unt.Helpers.Messages, Vcl.AppEvnts, unt.Controller.Produto,
  unt.Model.DTO.Produtos;

type
  TStatusTela=(stINSERINDO, stEDITANDO, stAGUARDANDO);
  TfrmCadastroProduto = class(TForm)
    edtCod: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtValor: TLabeledEdit;
    Panel1: TPanel;
    butBuscar: TSpeedButton;
    butGravar: TBitBtn;
    butCancel: TBitBtn;
    butNovo: TSpeedButton;
    ApplicationEvents1: TApplicationEvents;
    lblStatus: TLabel;
    procedure butBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure butGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butCancelClick(Sender: TObject);
    procedure edtCodExit(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure edtValorExit(Sender: TObject);
  private
    FProdutoCtrl: TProdutoController;
    FProduto: TProdutoDTO;
    { Private declarations }
    procedure GetProduto;
    procedure GravaProduto;
    procedure Clear;
    function GetStatus: TStatusTela;
    procedure SetStatus(const Value: TStatusTela);
    procedure BuscarProduto;
  public
    { Public declarations }
    property Status: TStatusTela read GetStatus write SetStatus;
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

uses
  unt.View.Find.Generic;

{$R *.dfm}

procedure TfrmCadastroProduto.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
    for var I := 0 to pred(Self.ControlCount) do
    if (Self.Controls[I] is TCustomEdit) then
      if TEdit(Self.Controls[I]).Focused then
        TEdit(Self.Controls[I]).Color := $00D9FFFF
      else
        TEdit(Self.Controls[I]).Color := clWindow;
end;

procedure TfrmCadastroProduto.BuscarProduto;
begin
  frmFindGeneric.ControllerEntitie := TProdutoController.Create;
  if frmFindGeneric.ShowModal = mrOk then
  begin
    edtCod.Text := frmFindGeneric.ID.ToString;
    GetProduto;
  end;
end;

procedure TfrmCadastroProduto.butBuscarClick(Sender: TObject);
begin
  BuscarProduto;
end;

procedure TfrmCadastroProduto.butNovoClick(Sender: TObject);
begin
  Status := stINSERINDO;;
end;

procedure TfrmCadastroProduto.butCancelClick(Sender: TObject);
begin
  Status := stAGUARDANDO;
end;

procedure TfrmCadastroProduto.butGravarClick(Sender: TObject);
begin
  GravaProduto;
  Status := stAGUARDANDO;
end;

procedure TfrmCadastroProduto.Clear;
begin
  for var I := 0 to pred(Self.ControlCount) do
    if Self.Controls[I] is TCustomEdit then
      TEdit(Self.Controls[I]).Clear;
end;

procedure TfrmCadastroProduto.edtCodExit(Sender: TObject);
begin
  if edtCod.GetTextLen=0 then
    BuscarProduto
  else
    GetProduto;
end;

procedure TfrmCadastroProduto.edtValorExit(Sender: TObject);
begin
  edtValor.Text := FormatCurr('0.00',StrToCurrDef(edtValor.Text,0));
end;

procedure TfrmCadastroProduto.FormCreate(Sender: TObject);
begin
  FProdutoCtrl := TProdutoController.Create;
end;

procedure TfrmCadastroProduto.FormDestroy(Sender: TObject);
begin
  FProdutoCtrl.Free;
end;

procedure TfrmCadastroProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  Status := stAGUARDANDO;
end;

procedure TfrmCadastroProduto.GetProduto;
begin
  if edtCod.GetTextLen=0 then
    Exit;

  FProduto := FProdutoCtrl.GetById(edtCod.Text);
  edtDescricao.Text := FProduto.descricao;
  edtValor.Text := FormatCurr('0.00',FProduto.valor);
  Status := stEDITANDO;
end;

function TfrmCadastroProduto.GetStatus: TStatusTela;
begin

end;

procedure TfrmCadastroProduto.GravaProduto;
begin
  FProduto.id        := StrToIntDef(edtCod.Text,0);
  FProduto.descricao := edtDescricao.Text;
  FProduto.valor     := StrToCurrDef(edtValor.Text,0);

  FProduto := FProdutoCtrl.InsertOrUpdate(FProduto);

  Message_AVISO('Cliente gravado com sucesso.'#13'Código: '+FProduto.id.ToString)
end;

procedure TfrmCadastroProduto.SetStatus(const Value: TStatusTela);
begin
  edtCod.Enabled       := Value in [stAGUARDANDO];
  edtDescricao.Enabled := Value in [stINSERINDO, stEDITANDO];
  edtValor.Enabled     := Value in [stINSERINDO, stEDITANDO];

  butBuscar.Enabled := Value in [stAGUARDANDO];
  butNovo.Enabled := Value in [stAGUARDANDO];

  butGravar.Enabled := Value in [stINSERINDO, stEDITANDO];

  case value of
    stINSERINDO:
    begin
      lblStatus.Font.Color := clGreen;
      lblStatus.Caption := 'Inserindo';
      edtDescricao.SetFocus;
    end;
    stEDITANDO:
    begin
      lblStatus.Font.Color := clYellow;
      lblStatus.Caption := 'Editando';
      edtDescricao.SetFocus;
    end;
    stAGUARDANDO:
    begin
      lblStatus.Font.Color := clBlack;
      lblStatus.Caption := '';
      CLear;
      edtCod.SetFocus;
    end;
  end;
end;

end.
