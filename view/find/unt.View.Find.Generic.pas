unit unt.View.Find.Generic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, unt.Controller.Interfaces;

type
  TfrmFindGeneric = class(TForm)
    Panel1: TPanel;
    dbgLista: TDBGrid;
    edtFindByName: TEdit;
    dsLista: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure edtFindByNameChange(Sender: TObject);
    procedure dbgListaDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FControllerEntitie: IControllerEntitie;
    FFieldName: String;
    FID: Integer;
    procedure FecharOK;
  public
    property ControllerEntitie: IControllerEntitie read FControllerEntitie write FControllerEntitie;
    property ID: Integer read FID write FID;
  end;

var
  frmFindGeneric: TfrmFindGeneric;

implementation

uses
  unt.Controller.Cliente;

{$R *.dfm}

procedure TfrmFindGeneric.dbgListaDblClick(Sender: TObject);
begin
  FecharOK;
end;

procedure TfrmFindGeneric.edtFindByNameChange(Sender: TObject);
begin
  if not Assigned(dsLista.DataSet) then
    Exit;

  dsLista.DataSet.Filtered := false;
  if edtFindByName.GetTextLen > 0 then
  begin
    dsLista.DataSet.Filter := ' upper('+FFieldName+') like '+QuotedStr('%'+UpperCase(edtFindByName.Text)+'%');
    dsLista.DataSet.Filtered := true;
  end;
end;

procedure TfrmFindGeneric.FecharOK;
begin
  FID := dsLista.DataSet.FieldByName('id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfrmFindGeneric.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FControllerEntitie := nil;
  FreeAndNil(dsLista.DataSet);
end;

procedure TfrmFindGeneric.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_UP: dsLista.DataSet.Prior;
    VK_DOWN: dsLista.DataSet.Next;
    VK_RETURN: FecharOK;
    VK_ESCAPE: ModalResult := mrCancel;
  end;
end;

procedure TfrmFindGeneric.FormShow(Sender: TObject);
begin
  FID := 0;
  edtFindByName.Clear;
  dbgLista.Columns[1].Visible := false;

  if not Assigned(FControllerEntitie) then
    raise Exception.Create('A propriedade ControllerEntitie, deve ser instanciada.');

  if Supports(FControllerEntitie, IProdutoController) then
  begin
    FFieldName := 'descricao';
    Self.Caption := 'Buscar Produto';
  end
  else
  begin
    FFieldName := 'nome';
    if Supports(FControllerEntitie, IClienteController) then
      Self.Caption := 'Buscar Cliente'
    else
    begin
      dbgLista.Columns[1].Visible := true;
      Self.Caption := 'Buscar Pedido';
    end;
  end;

  dbgLista.Columns.Items[2].FieldName := FFieldName;

  dsLista.DataSet := FControllerEntitie.GetAll;
  edtFindByName.SetFocus;
end;

end.
