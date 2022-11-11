unit unt.Model.DTO.Pedidos;

interface

uses
  unt.Model.DTO.Cliente, unt.Model.DTO.Pedidos.Itens,
  System.Generics.Collections, System.SysUtils;

Type
  IPedidoDTO = interface
  ['{CB33EB89-4B71-4A2B-9CB8-7476C858A155}']
    function GetVrTotal: Currency;
    property vrTotal: Currency read GetVrTotal;
  end;

  TPedidoDTO = class(TInterfacedObject, IPedidoDTO)
    id: Integer;
    data: TDateTime;
    cliente: TClienteDTO;
  private
    FItens: TList<TPedidosItensDTO>;
    function GetVrTotal: Currency;
    function GetItens: TList<TPedidosItensDTO>;
    procedure SetItens(const Value: TList<TPedidosItensDTO>);
    destructor Destroy; override;
  public
    property Itens: TList<TPedidosItensDTO> read GetItens write SetItens;
    property vrTotal: Currency read GetVrTotal;
  end;

implementation

{ TPedidoDTO }

destructor TPedidoDTO.Destroy;
begin
  FItens.Free;

  inherited;
end;

function TPedidoDTO.GetItens: TList<TPedidosItensDTO>;
begin
  if not Assigned(FItens) then
    FItens := TList<TPedidosItensDTO>.Create;

  Result := FItens;
end;

function TPedidoDTO.GetVrTotal: Currency;
begin
  if Assigned(FItens) then
  begin
    for var item in FItens do
      Result := item.VrTotal + Result;
  end;
end;


procedure TPedidoDTO.SetItens(const Value: TList<TPedidosItensDTO>);
begin
  FItens := Value;
end;

initialization

finalization


end.
