unit unt.View.Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  unt.Model.Imagens, unt.Controller.Cliente, unt.Model.DTO.Cliente,
  unt.Helpers.Messages, Vcl.AppEvnts;

type
  TStatusTela=(stINSERINDO, stEDITANDO, stAGUARDANDO);
  TfrmCadastroCliente = class(TForm)
    edtCliente: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtUf: TLabeledEdit;
    Panel1: TPanel;
    butBuscarCliente: TSpeedButton;
    butGravar: TBitBtn;
    butCancel: TBitBtn;
    butNovoCliente: TSpeedButton;
    lblStatus: TLabel;
    ApplicationEvents1: TApplicationEvents;
    procedure butBuscarClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure butNovoClienteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure butGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butCancelClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FClienteCtrl: TClienteController;
    Fcliente: TClienteDTO;
    { Private declarations }
    procedure GetCliente;
    procedure GravaCliente;
    procedure Clear;
    function GetStatus: TStatusTela;
    procedure SetStatus(const Value: TStatusTela);
    procedure BuscarCliente;
  public
    { Public declarations }
    property Status: TStatusTela read GetStatus write SetStatus;
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

uses
  unt.View.Find.Generic;

{$R *.dfm}

procedure TfrmCadastroCliente.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
    for var I := 0 to pred(Self.ControlCount) do
    if (Self.Controls[I] is TCustomEdit) then
      if TEdit(Self.Controls[I]).Focused then
        TEdit(Self.Controls[I]).Color := $00D9FFFF
      else
        TEdit(Self.Controls[I]).Color := clWindow;
end;

procedure TfrmCadastroCliente.BuscarCliente;
begin
  frmFindGeneric.ControllerEntitie := TClienteController.Create;
  if frmFindGeneric.ShowModal = mrOk then
  begin
    edtCliente.Text := frmFindGeneric.ID.ToString;
    GetCliente;
  end;
end;

procedure TfrmCadastroCliente.butBuscarClienteClick(Sender: TObject);
begin
  BuscarCliente;
end;

procedure TfrmCadastroCliente.butNovoClienteClick(Sender: TObject);
begin
  Status := stINSERINDO;;
end;

procedure TfrmCadastroCliente.butCancelClick(Sender: TObject);
begin
  Status := stAGUARDANDO;
end;

procedure TfrmCadastroCliente.butGravarClick(Sender: TObject);
begin
  GravaCliente;
  Status := stAGUARDANDO;
end;

procedure TfrmCadastroCliente.Clear;
begin
  for var I := 0 to pred(Self.ControlCount) do
    if Self.Controls[I] is TCustomEdit then
      TEdit(Self.Controls[I]).Clear;
end;

procedure TfrmCadastroCliente.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_RETURN then
  begin
  Key:=0;
    if edtCliente.GetTextLen=0 then
      BuscarCliente
    else
      GetCliente;
  end;
end;

procedure TfrmCadastroCliente.FormCreate(Sender: TObject);
begin
  FClienteCtrl := TClienteController.Create;
end;

procedure TfrmCadastroCliente.FormDestroy(Sender: TObject);
begin
  FClienteCtrl.Free;
end;

procedure TfrmCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
  begin
    key:=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
  Status := stAGUARDANDO;
end;

procedure TfrmCadastroCliente.GetCliente;
begin
  if edtCliente.GetTextLen=0 then
    Exit;

  FCliente := FClienteCtrl.GetById(edtCliente.Text);
  edtNome.Text := FCliente.nome;
  edtCidade.Text := FCliente.cidade;
  edtUf.Text := FCliente.uf;
  Status := stEDITANDO;
end;

function TfrmCadastroCliente.GetStatus: TStatusTela;
begin

end;

procedure TfrmCadastroCliente.GravaCliente;
begin
  FCliente.id     := StrToIntDef(edtCliente.Text,0);
  FCliente.nome   := edtNome.Text;
  FCliente.cidade := edtCidade.Text;
  FCliente.uf     := edtUf.Text;

  Fcliente := FClienteCtrl.InsertOrUpdate(FCliente);

  Message_AVISO('Cliente gravado com sucesso.'#13'Código: '+FCliente.id.ToString)
end;

procedure TfrmCadastroCliente.SetStatus(const Value: TStatusTela);
begin
  edtCliente.Enabled := Value in [stAGUARDANDO];
  edtNome.Enabled    := Value in [stINSERINDO, stEDITANDO];
  edtCidade.Enabled  := Value in [stINSERINDO, stEDITANDO];
  edtUf.Enabled      := Value in [stINSERINDO, stEDITANDO];

  butBuscarCliente.Enabled := Value in [stAGUARDANDO];
  butNovoCliente.Enabled   := Value in [stAGUARDANDO];
  butGravar.Enabled        := Value in [stINSERINDO, stEDITANDO];
//  butCancel.Enabled        := Value in [stINSERINDO, stEDITANDO];

  case value of
    stINSERINDO:
    begin
      lblStatus.Font.Color := clGreen;
      lblStatus.Caption := 'Inserindo';
      edtNome.SetFocus;
    end;
    stEDITANDO:
    begin
      lblStatus.Font.Color := clYellow;
      lblStatus.Caption := 'Editando';
      edtNome.SetFocus;
    end;
    stAGUARDANDO:
    begin
      lblStatus.Font.Color := clBlack;
      lblStatus.Caption := '';
      CLear;
      edtCliente.SetFocus;
    end;
  end;
end;

end.
