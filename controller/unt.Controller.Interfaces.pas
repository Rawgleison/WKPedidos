unit unt.Controller.Interfaces;

interface

uses
  Data.DB, System.Generics.Defaults, unt.Model.DTO.Produtos,
  unt.Model.DTO.Pedidos, unt.Model.DTO.Cliente;

Type
  IEntitie = interface
  ['{F4B9779B-D94B-4219-B1F8-71DF7195798E}']
  end;

  IControllerEntitie = interface
  ['{54322CF6-28F2-44FC-B346-438B482A3634}']
    function GetAll: TDataSet;
    procedure Delete(pId: Integer);
  end;

  IProdutoController = interface
  ['{C9D278CA-7FA5-42DC-B73B-3D09240525EB}']
    function InsertOrUpdate(pProduto: TProdutoDTO): TProdutoDTO;
    function GetById(vId: Integer): TProdutoDTO; overload;
    function GetById(vId: String): TProdutoDTO; overload;
    function Update(pProduto: TProdutoDTO): TProdutoDTO;
  end;

  IPedidoController = interface
  ['{181A0C31-27E8-4C3B-8318-7B68B11DED76}']
    function InsertOrUpdate(pPedido: TPedidoDTO): TPedidoDTO;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TPedidoDTO;
    function Update(pPedido: TPedidoDTO): TPedidoDTO;
    procedure Delete(pId: Integer);
  end;

  IClienteController = interface
  ['{A0C54FEC-DC6A-4FDF-9E5A-F9D048036BA8}']
    function InsertOrUpdate(pCliente: TClienteDTO): TClienteDTO;
    function GetById(vId: Integer): TClienteDTO;
    function Update(pCliente: TClienteDTO): TClienteDTO;
    procedure Delete(pId: Integer);
  end;

implementation

end.
