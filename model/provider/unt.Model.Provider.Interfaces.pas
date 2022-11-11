unit unt.Model.Provider.Interfaces;

interface

uses
  unt.Model.DTO.Produtos, Data.DB, unt.Model.DTO.Pedidos.Itens,
  unt.Model.DTO.Pedidos, System.Generics.Collections, unt.Model.DTO.Cliente;

Type
  IProdutoProvider = interface
  ['{77DDF597-3BF1-4C33-AB15-5B78ED4FA668}']
    function InsertOrUpdate(pProduto: TProdutoDTO): Integer;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TProdutoDTO;
    function Update(pProduto: TProdutoDTO): Integer;
    procedure Delete(pId: Integer);
  end;

  IPedidoProvider = interface
  ['{5C9F2ADA-AF27-4F22-84DA-63ADD3823C3C}']
    function GetItens(vIdPedido: Integer): TList<TPedidosItensDTO>;
    function InsertOrUpdate(pPedido: TPedidoDTO): TPedidoDTO;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TPedidoDTO;
    function Update(pPedido: TPedidoDTO): Integer;
    procedure Delete(pId: Integer);
  end;

  IClientePrvider = interface
  ['{895D0F04-C0F1-4090-9085-C6083EB1552C}']
    function InsertOrUpdate(pCliente: TClienteDTO): Integer;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TClienteDTO;
    function Update(pCliente: TClienteDTO): Integer;
    procedure Delete(pId: Integer);
  end;

implementation

end.
