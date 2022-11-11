unit unt.Model.Provider.Pedidos;

interface

Uses
  System.SysUtils, System.Variants, System.Classes,
  Data.DB, unt.Model.DTO.Pedidos, System.Generics.Collections,
  unt.Model.DTO.Pedidos.Itens, unt.Model.Provider.Interfaces;

Type
  TPedidoProvider = class(TInterfacedObject, IPedidoProvider)
  public
    { public declarations }
    function InsertOrUpdate(pPedido: TPedidoDTO): TPedidoDTO;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TPedidoDTO;
    function Update(pPedido: TPedidoDTO): Integer;
    procedure Delete(pId: Integer);
    { private declarations }
    function GetItens(vIdPedido: Integer): TList<TPedidosItensDTO>;
  end;

implementation

uses
  unt.Model.DAO.MySql, unt.Model.Provider.Cliente, unt.Model.Provider.Produtos;

{ TPedidoProvider }

procedure TPedidoProvider.Delete(pId: Integer);
begin
  dmConnection.ExecSQL('delete from pedidos where id = :id',[pId]);
end;

function TPedidoProvider.GetAll: TDataSet;
begin
  Result := dmConnection.GetDataSet('select * from vw_pedidos_cliente');
end;

function TPedidoProvider.GetById(vId: Integer): TPedidoDTO;
var
  ds: TdataSet;
  vCli: TClienteProvider;
begin
  ds := dmConnection.GetDataSet('select * from pedidos where id = '+vId.ToString);
  try
    if ds.RecordCount=0 then
      raise Exception.Create('Pedido não encontrad com o id: '+vId.ToString);
    Result         := TPedidoDTO.Create;
    Result.id      := ds.FieldByName('id').AsInteger;
    Result.data    := ds.FieldByName('data').AsDateTime;
    Result.cliente := vCli.GetById(ds.FieldByName('id_cliente').AsInteger);
    Result.itens   := GetItens(Result.id);
  finally
    ds.Free;
  end;
end;

function TPedidoProvider.GetItens(vIdPedido: Integer): TList<TPedidosItensDTO>;
var
  ds: TDataSet;
  vItem: TPedidosItensDTO;
  vProd: TProdutoProvider;
begin
  ds := dmConnection.GetDataSet('select * from pedido_itens where id_pedido = '+vIdPedido.ToString);
  try
    Result := TList<TPedidosItensDTO>.Create;
    while not ds.Eof do
    begin
      vItem.id         := ds.FieldByName('id').AsInteger;
      vItem.item       := ds.FieldByName('item').AsInteger;
      vItem.id_pedido  := ds.FieldByName('id_pedido').AsInteger;
      vItem.produto    := vProd.GetById(ds.FieldByName('id_produto').AsInteger);
      vItem.vrUnit     := ds.FieldByName('valor_unit').AsFloat;
      vItem.quantidade := ds.FieldByName('quantidade').AsFloat;
      Result.Add(vItem);
      ds.Next;
    end;
  finally
    ds.Free;
  end;

end;

function TPedidoProvider.InsertOrUpdate(pPedido: TPedidoDTO): TPedidoDTO;
var
  vSql: String;
  vIdPedido: integer;
  item: TPedidosItensDTO;
begin
  vSql := 'INSERT INTO pedidos(id, data, id_cliente) '+
          'values(:id, :data, :id_cliente)' +
          'on duplicate key update ' +
          'data = :data, ' +
          'id_cliente = :id_cliente';

  dmConnection.StartTransaction;
  try
    dmConnection.ExecSQL(vSql,[pPedido.id, pPedido.data, pPedido.cliente.id]);

    if pPedido.id>0 then
      vIdPedido := pPedido.id
    else
      vIdPedido := dmConnection.GetLastId;

    pPedido.id := vIdPedido;

    dmConnection.ExecSQL('delete from pedido_itens where id_pedido = :id_pedido',[pPedido.id]);

    vSql := 'insert into pedido_itens(id, item, id_pedido, id_produto, quantidade, valor_unit) ' +
            'values(:id, :item, :id_pedido, :id_produto, :quantidade, :valor_unit)';

    for var I := 0 to pred(pPedido.itens.Count) do
    begin
      item := pPedido.itens[I];
      dmConnection.ExecSQL(vSql,[item.id, item.item, vIdPedido, item.produto.id, item.quantidade, item.vrUnit]);
      item.id := dmConnection.GetLastId;
      pPedido.itens[I] := item;
    end;
    Result := pPedido;
    dmConnection.Commit;
  except
    dmConnection.RolBack;
    raise;
  end;
end;

function TPedidoProvider.Update(pPedido: TPedidoDTO): Integer;
var vSql: String;
begin
  if pPedido.id < 1 then
    raise Exception.Create('Para editar o pedido o ID deve ser passado.');

  vSql := 'update pedidos set ' +
          'data = :data, ' +
          'id_cliente = :id_cliente ' +
          'where id = :id';

  dmConnection.StartTransaction;
  try
    Result := dmConnection.ExecSQL(vSql,[pPedido.data, pPedido.cliente.id, pPedido.cliente.id]);

    dmConnection.ExecSQL('delete from pedido_itens where id_pedido = :id_pedido',[pPedido.id]);

    vSql := 'insert into pedido_itens(id, item, id_pedido, id_produto, quantidade, valor_unit) ' +
              'values(:id, :item, :id_pedido, :id_produto, :quantidade, :valor_unit)';

    for var item in pPedido.itens do
    begin
      dmConnection.ExecSQL(vSql,[item.id, item.item, pPedido.id, item.produto.id, item.quantidade, item.vrUnit]);
    end;

    dmConnection.Commit;
  except
    dmConnection.RolBack;
    raise;
  end;
end;

end.
