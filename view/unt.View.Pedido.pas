unit unt.View.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unt.Controller.Pedido,
  unt.Controller.Produto, unt.Controller.Cliente, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unt.Conytroller.Viewer.Produto,
  unt.Helpers.Messages, Vcl.Mask, unt.Model.DTO.Produtos,
  unt.Model.DTO.Pedidos.Itens, Vcl.Menus, Vcl.AppEvnts, unt.Model.Imagens;

type
  TStatusTela = (stAGUARDANDO, stINSERINDO_PEDIDO, stINSERINDO_PRODUTO, stEDITANDO_PRODUTO);
  TfrmPedido = class(TForm)
    pnlCliente: TPanel;
    pnlRodape: TPanel;
    dbgItens: TDBGrid;
    pnlPedido: TPanel;
    edtPedido: TLabeledEdit;
    pnlProduto: TPanel;
    edtCliente: TLabeledEdit;
    edtProdCod: TLabeledEdit;
    edtProdVrUnit: TLabeledEdit;
    edtProdQtd: TLabeledEdit;
    edtProdTotal: TLabeledEdit;
    butProdAdd: TBitBtn;
    edtDataPedido: TLabeledEdit;
    edtNomeCliente: TLabeledEdit;
    edtProdDesc: TLabeledEdit;
    dsItens: TDataSource;
    memTblItens: TFDMemTable;
    memTblItensitem: TIntegerField;
    memTblItensid: TIntegerField;
    memTblItensid_produto: TIntegerField;
    memTblItensdescricao: TStringField;
    memTblItensvrUnit: TCurrencyField;
    memTblItensquantidade: TCurrencyField;
    memTblItensvrTotal: TCurrencyField;
    butPedCancel: TBitBtn;
    butPedGravar: TBitBtn;
    edtPedQtdItens: TLabeledEdit;
    edtPedTotal: TLabeledEdit;
    butProdCancel: TBitBtn;
    butBuscarPedido: TSpeedButton;
    butNovoPedido: TSpeedButton;
    butBuscarCliente: TSpeedButton;
    butNovoCliente: TSpeedButton;
    butBuscarProduto: TSpeedButton;
    butNovoProduto: TSpeedButton;
    ppmenuItens: TPopupMenu;
    butEditar: TMenuItem;
    butExcluir: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    butPedExcluir: TBitBtn;
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure butBuscarClienteClick(Sender: TObject);
    procedure butBuscarProdutoClick(Sender: TObject);
    procedure edtProdVrUnitKeyPress(Sender: TObject; var Key: Char);
    procedure butPedCancelClick(Sender: TObject);
    procedure butProdCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butNovoPedidoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdVrUnitExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure butProdAddClick(Sender: TObject);
    procedure memTblItensAfterPost(DataSet: TDataSet);
    procedure dbgItensDblClick(Sender: TObject);
    procedure butPedGravarClick(Sender: TObject);
    procedure butBuscarPedidoClick(Sender: TObject);
    procedure dbgItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butEditarClick(Sender: TObject);
    procedure butExcluirClick(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure butNovoClienteClick(Sender: TObject);
    procedure edtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butPedExcluirClick(Sender: TObject);
    procedure butNovoProdutoClick(Sender: TObject);
    procedure edtProdCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    FPedidoController: TPedidoController;
    FProdutoController: TProdutoController;
    FClienteController: TClienteController;
    FStatus: TStatusTela;
    FProdutoViewer: TProdutoViewer;
    FCancelTab: Boolean;
    procedure SetStatus(const Value: TStatusTela);
    procedure ClearPedido;
    procedure ClearAll;
    procedure newPedido;
    procedure GetCliente;
    procedure GetProduto;
    procedure GetPedido;
    procedure inserirItem(pProduto: TPedidosItensDTO);
    procedure CalcTotais;
    procedure GravarPedido;
    function GetNexItem: integer;
    procedure EditarItem;
    procedure DeleteItem;
    procedure CheckFocus(pControl: TWinControl);
    procedure BuscarCliente;
    procedure BuscarPedido;
    procedure BuscarProduto;
  public

    property Status: TStatusTela read FStatus write SetStatus;
  end;

var
  frmPedido: TfrmPedido;

implementation

uses
  unt.Model.DTO.Cliente, unt.Model.DTO.Pedidos, unt.View.Find.Generic,
  unt.View.Clientes, unt.View.Produto;

{$R *.dfm}

procedure TfrmPedido.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  butEditar.Enabled := not memTblItens.IsEmpty;
  butExcluir.Enabled := not memTblItens.IsEmpty;
  CheckFocus(Self);
end;

procedure TfrmPedido.BuscarCliente;
begin
  frmFindGeneric.ControllerEntitie := TClienteController.Create;
  if frmFindGeneric.ShowModal = mrOk then
  begin
    edtCliente.Text := frmFindGeneric.ID.ToString;
    GetCliente;
  end;
end;

procedure TfrmPedido.BuscarPedido;
begin
  frmFindGeneric.ControllerEntitie := TPedidoController.Create;
  if frmFindGeneric.ShowModal = mrOk then
  begin
    edtPedido.Text := frmFindGeneric.ID.ToString;
    GetPedido;
  end;
end;

procedure TfrmPedido.BuscarProduto;
begin
  frmFindGeneric.ControllerEntitie := TProdutoController.Create;
  if frmFindGeneric.ShowModal = mrOk then
  begin
    edtProdCod.Text := frmFindGeneric.ID.ToString;
    GetProduto;
  end;
end;

procedure TfrmPedido.butBuscarClienteClick(Sender: TObject);
begin
  BuscarCliente;
end;

procedure TfrmPedido.butBuscarPedidoClick(Sender: TObject);
begin
  BuscarPedido;
end;

procedure TfrmPedido.butBuscarProdutoClick(Sender: TObject);
begin
  BuscarProduto;
end;

procedure TfrmPedido.butNovoClienteClick(Sender: TObject);
begin
  frmCadastroCliente.ShowModal;
end;

procedure TfrmPedido.butNovoPedidoClick(Sender: TObject);
begin
  newPedido;
end;

procedure TfrmPedido.butNovoProdutoClick(Sender: TObject);
begin
  frmCadastroProduto.ShowModal;
end;

procedure TfrmPedido.butPedCancelClick(Sender: TObject);
begin
  Message_ATENCAO_Confirma('Deseja limpara a tela?'#13'Todo o progresso não salvo será perdido.');
  Status := stAGUARDANDO;
end;

procedure TfrmPedido.butPedExcluirClick(Sender: TObject);
begin
  if Message_ATENCAO_Confirma('Deseja excluir o pedido permanentemente?'#13'Esta ação não poderá ser desfeita.') then
  begin
    FPedidoController.Delete(StrToInt(edtPedido.Text));
    Status := stAGUARDANDO;
  end;
end;

procedure TfrmPedido.butPedGravarClick(Sender: TObject);
begin
  GravarPedido;
  ClearAll;
end;

procedure TfrmPedido.butProdAddClick(Sender: TObject);
begin
  inserirItem(FProdutoViewer.AsPedidosItensDTO);
end;

procedure TfrmPedido.butProdCancelClick(Sender: TObject);
begin
  Status := stINSERINDO_PEDIDO;
  FProdutoViewer.Clear;
  edtProdCod.SetFocus;
end;

procedure TfrmPedido.CalcTotais;
var VrTotal: Double;
begin
  memTblItens.First;
  while not memTblItens.Eof do
  begin
    VrTotal := VrTotal + memTblItens.FieldByName('vrTotal').AsCurrency;
    memTblItens.Next;
  end;
  edtPedTotal.Text := FormatCurr('R$#,##0.00',vrTotal);
  edtPedQtdItens.Text := memTblItens.RecordCount.ToString;
end;

procedure TfrmPedido.CheckFocus(pControl: TWinControl);
begin
    for var I := 0 to pred(pControl.ControlCount) do
    if (pControl.Controls[I] is TCustomEdit) and (not TEdit(pControl.Controls[I]).ReadOnly) then
    begin
      if (TEdit(pControl.Controls[I]).Focused) then
        TEdit(pControl.Controls[I]).Color := $00D9FFFF
      else
        TEdit(pControl.Controls[I]).Color := clWindow;
    end else
      if (pControl.Controls[I] is TWinControl) then
        CheckFocus(TWinControl(pControl.Controls[I]));
end;

procedure TfrmPedido.ClearAll;
begin
  FProdutoViewer.Clear;
  ClearPedido;
end;

procedure TfrmPedido.ClearPedido;
begin
  edtPedido.Clear;
  edtDataPedido.Clear;
  edtCliente.Clear;
  edtNomeCliente.Clear;
  edtPedQtdItens.Clear;
  edtPedTotal.Clear;
  memTblItens.Close;
  if edtPedido.Enabled then
    edtPedido.SetFocus;
end;

procedure TfrmPedido.Clientes1Click(Sender: TObject);
begin
  frmCadastroCliente.ShowModal;
end;

procedure TfrmPedido.dbgItensDblClick(Sender: TObject);
begin
  editarItem;
end;

procedure TfrmPedido.dbgItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      FCancelTab := true;
      Key := 0;
      EditarItem;
    end;
    VK_DELETE:
    begin
      Key := 0;
      deleteItem;
    end;
  end;

end;

procedure TfrmPedido.DeleteItem;
var
  itemMsg: String;
begin
  itemMsg:= memTblItens.FieldByName('item').AsString + ' - ' + memTblItens.FieldByName('descricao').AsString;
  if Message_ATENCAO_Confirma('Deseja realmente excluir o item:  '+itemMsg) then
    memTblItens.Delete;
end;

procedure TfrmPedido.butEditarClick(Sender: TObject);
begin
  EditarItem;
end;

procedure TfrmPedido.EditarItem;
begin
  Status := stINSERINDO_PRODUTO;
  FProdutoViewer.Clear;
  FProdutoViewer.codItem := memTblItensid.AsInteger;
  FProdutoViewer.item := memTblItensitem.AsInteger;
  FProdutoViewer.Cod := memTblItensid_produto.AsInteger;
  FProdutoViewer.descricao := memTblItensdescricao.AsString;
  FProdutoViewer.vrUnit := memTblItensvrUnit.AsCurrency;
  FProdutoViewer.qtd := memTblItensquantidade.AsCurrency;
end;

procedure TfrmPedido.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if edtCliente.GetTextLen=0 then
      BuscarCliente
    else
      GetCliente;
    Key:=0;
  end;
end;

procedure TfrmPedido.edtPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if edtPedido.GetTextLen=0 then
      BuscarPedido
    else
      GetPedido;
    Key:=0;
  end;
end;

procedure TfrmPedido.edtProdCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    FCancelTab := True;
    if edtProdCod.GetTextLen=0 then
      BuscarProduto
    else
      GetProduto;
  end;
end;

procedure TfrmPedido.edtProdVrUnitExit(Sender: TObject);
begin
  TEdit(Sender).Text := FormatCurr('0.00',FProdutoViewer.vrUnit);
end;

procedure TfrmPedido.edtProdVrUnitKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',Char(VK_BACK)]) then
    Key := #0;
end;

procedure TfrmPedido.butExcluirClick(Sender: TObject);
begin
  DeleteItem;
end;

procedure TfrmPedido.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (Status = stAGUARDANDO) or Message_Confirma('Deseja fechar a tela sem salvar?');
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  FPedidoController := TPedidoController.Create;
  FProdutoController := TProdutoController.Create;
  FClienteController := TClienteController.Create;
  FProdutoViewer := TProdutoViewer.Create(
                      edtProdCod,
                      edtProdDesc,
                      edtProdVrUnit,
                      edtProdQtd,
                      edtProdTotal);
end;

procedure TfrmPedido.FormDestroy(Sender: TObject);
begin
  FPedidoController.Free;
  FProdutoController.Free;
  FClienteController.Free;
  FProdutoViewer.Free;
end;

procedure TfrmPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (not FCancelTab) then
  begin
    key:=#0;
    if (sender is TDBGrid) then
      TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
    else
      Perform(Wm_NextDlgCtl,0,0);
  end;
  FCancelTab := False;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  Status := stAGUARDANDO;
end;

procedure TfrmPedido.GetCliente;
begin
  if edtCliente.GetTextLen > 0 then
  begin
    edtNomeCliente.Text := FClienteController.GetById(StrToInt(edtCliente.Text)).nome;
    if edtNomeCliente.GetTextLen=0 then
      raise Exception.Create('Cliente não encontrado.');
  end
  else
  begin
    edtNomeCliente.Clear;
    edtCliente.Clear;
  end;
end;

function TfrmPedido.GetNexItem: integer;
var RecNo: Integer;
begin
  RecNo := memTblItens.RecNo;
  memTblItens.DisableControls;
  memTblItens.First;
  Result:=0;
  while not memTblItens.Eof do
  begin
    if Result < memTblItens.FieldByName('item').AsInteger then
      Result := memTblItens.FieldByName('item').AsInteger;
    memTblItens.Next;
  end;
  inc(Result);
  memTblItens.EnableControls;
  memTblItens.RecNo := RecNo;
end;

procedure TfrmPedido.GetPedido;
var
  vPedido: TPedidoDTO;
begin
  if edtPedido.GetTextLen = 0 then
    Exit;

  vPedido := FPedidoController.GetById(edtPedido.Text);
  try
    Status := stINSERINDO_PEDIDO;
    edtDataPedido.Text  := FormatDateTime('dd/MM/yyyy hh:mm',vPedido.data);
    edtCliente.Text     := vPedido.cliente.id.ToString;
    edtNomeCliente.Text := vPedido.cliente.nome;
    for var item in vPedido.Itens do
    begin
      inserirItem(item);
    end;
    edtCliente.SetFocus;
  finally
    vPedido.Free;
  end;
end;

procedure TfrmPedido.GetProduto;
begin
  if edtProdCod.GetTextLen>0 then
  begin
    FProdutoViewer.ReadProdDTO(FProdutoController.GetById(edtProdCod.Text));
    Status := stINSERINDO_PRODUTO;
  end;
end;

procedure TfrmPedido.GravarPedido;
var
  vPedido: TPedidoDTO;
  vItem: TPedidosItensDTO;
begin
  if edtCliente.GetTextLen=0 then
    raise Exception.Create('O cliente deve ser passado.');

  vPedido := TPedidoDTO.Create;
  try
  vPedido.data    := now;
  vPedido.id      := StrToIntDef(edtPedido.Text,0);
  vPedido.cliente := FClienteController.GetById(StrToInt(edtCliente.Text));

  memTblItens.First;
  while not memTblItens.Eof do
  begin
    vItem.item       := memTblItens.FieldByName('item').AsInteger;
    vItem.id         := memTblItens.FieldByName('id').AsInteger;
    vItem.produto    := FProdutoController.GetById(memTblItens.FieldByName('id_produto').AsInteger);
    vItem.quantidade := memTblItens.FieldByName('quantidade').AsFloat;
    vItem.vrUnit     := memTblItens.FieldByName('vrUnit').AsCurrency;
    vPedido.itens.Add(vItem);
    memTblItens.Next;
  end;

  FPedidoController.InsertOrUpdate(vPedido);

  Message_AVISO('Pedido gravado no banco com sucesso!'+#13+
                'Código do Pedido: '+vPedido.id.ToString);
  Status := stAGUARDANDO;
  finally
    vPedido.Free;
  end;
end;

procedure TfrmPedido.inserirItem(pProduto: TPedidosItensDTO);
begin
  if pProduto.item = 0 then
    pProduto.item := GetNexItem;

  if memTblItens.Locate('item',FProdutoViewer.item) then
    memTblItens.Edit
  else
    memTblItens.Append;

  memTblItens.FieldByName('id').AsInteger          := pProduto.id;
  memTblItens.FieldByName('item').AsInteger        := pProduto.item;
  memTblItens.FieldByName('id_produto').AsInteger  := pProduto.produto.id;
  memTblItens.FieldByName('descricao').AsString    := pProduto.produto.descricao;
  memTblItens.FieldByName('vrUnit').AsCurrency     := pProduto.vrUnit;
  memTblItens.FieldByName('quantidade').AsCurrency := pProduto.quantidade;
  memTblItens.FieldByName('vrTotal').AsCurrency    := pProduto.vrTotal;
  memTblItens.Post;
  FProdutoViewer.Clear;
  Status := stINSERINDO_PEDIDO;
  edtProdCod.SetFocus;
end;

procedure TfrmPedido.memTblItensAfterPost(DataSet: TDataSet);
begin
  CalcTotais;
end;

procedure TfrmPedido.newPedido;
begin
  ClearAll;
  edtDataPedido.Text := 'NOVO PEDIDO';
  Status := stINSERINDO_PEDIDO;
  edtCliente.SetFocus;
end;

procedure TfrmPedido.Produtos1Click(Sender: TObject);
begin
  frmCadastroProduto.ShowModal;
end;

procedure TfrmPedido.SetStatus(const Value: TStatusTela);
begin
  FStatus := Value;

  edtPedido.Enabled     := FStatus in [stAGUARDANDO];
  edtCliente.Enabled    := FStatus in [stINSERINDO_PEDIDO];
  edtProdCod.Enabled    := FStatus in [stINSERINDO_PEDIDO];
  edtProdQtd.Enabled    := FStatus in [stINSERINDO_PRODUTO];
  edtProdVrUnit.Enabled := FStatus in [stINSERINDO_PRODUTO];

  butBuscarPedido.Enabled  := FStatus in [stAGUARDANDO];
  butNovoPedido.Enabled    := FStatus in [stAGUARDANDO];
  butBuscarCliente.Enabled := FStatus in [stINSERINDO_PEDIDO];
  butNovoCliente.Enabled   := FStatus in [stINSERINDO_PEDIDO];
  butBuscarProduto.Enabled := FStatus in [stINSERINDO_PEDIDO];
  butNovoProduto.Enabled   := FStatus in [stINSERINDO_PEDIDO];
  butProdAdd.Enabled       := FStatus in [stINSERINDO_PRODUTO];
  butProdCancel.Enabled    := FStatus in [stINSERINDO_PRODUTO];
  butPedGravar.Enabled     := FStatus in [stINSERINDO_PEDIDO];
  butPedCancel.Enabled     := FStatus in [stINSERINDO_PEDIDO];
  butPedExcluir.Enabled    := (FStatus in [stINSERINDO_PEDIDO]) and (edtPedido.GetTextLen>0);

  dbgItens.Enabled := FStatus in [stINSERINDO_PEDIDO];

   case FStatus of
    stAGUARDANDO: ClearAll;
    stINSERINDO_PEDIDO: memTblItens.Open;
    stINSERINDO_PRODUTO: edtProdVrUnit.SetFocus;
  end;

end;

end.
