unit unt.Controller.Pedido;

interface

Uses
  System.SysUtils, System.Variants, System.Classes, Data.DB,
  unt.Model.Provider.Pedidos, unt.Model.DTO.Pedidos, unt.Controller.Interfaces;

Type
  TPedidoController = class(TInterfacedObject, IPedidoController, IControllerEntitie)
  private
    FPedidoProvider: TPedidoProvider;
  public
    function InsertOrUpdate(pPedido: TPedidoDTO): TPedidoDTO;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TPedidoDTO; overload;
    function GetById(vId: String): TPedidoDTO; overload;
    function Update(pPedido: TPedidoDTO): TPedidoDTO;
    procedure Delete(pId: Integer);
  end;

implementation

{ TPedidoController }

procedure TPedidoController.Delete(pId: Integer);
begin
  FPedidoProvider.Delete(pId);
end;

function TPedidoController.GetAll: TDataSet;
begin
  Result := FPedidoProvider.GetAll;
end;

function TPedidoController.GetById(vId: String): TPedidoDTO;
begin
  Result := GetById(Vid.ToInteger);
end;

function TPedidoController.GetById(vId: Integer): TPedidoDTO;
begin
  Result := FPedidoProvider.GetById(vId);
end;

function TPedidoController.InsertOrUpdate(pPedido: TPedidoDTO): TPedidoDTO;
begin
    Result := FPedidoProvider.InsertOrUpdate(pPedido);
end;

function TPedidoController.Update(pPedido: TPedidoDTO): TPedidoDTO;
begin
  FPedidoProvider.Update(pPedido);
  Result := FPedidoProvider.GetById(pPedido.id);
end;

end.
