unit unt.Model.DTO.Pedidos.Itens;

interface

uses
  unt.Model.DTO.Produtos;

Type
  TPedidosItensDTO = record
    id: Integer;
    item: Integer;
    id_pedido: Integer;
    produto: TProdutoDTO;
    quantidade: Double;
    vrUnit: Currency;
    function VrTotal: Currency;
  end;

implementation

{ TPedidosItensDTO }

function TPedidosItensDTO.VrTotal: Currency;
begin
  Result := quantidade * vrUnit;
end;

end.
