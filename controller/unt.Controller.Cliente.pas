unit unt.Controller.Cliente;

interface

Uses
  System.SysUtils, System.Variants, System.Classes,
  unt.Model.Provider.Cliente, Data.DB, unt.Model.DTO.Cliente,
  unt.Controller.Interfaces;

Type
  TClienteController = class(TInterfacedObject, IClienteController, IControllerEntitie)
  private
    FClienteProvider: TClienteProvider;
  public
    function InsertOrUpdate(pCliente: TClienteDTO): TClienteDTO;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TClienteDTO; overload;
    function GetById(vId: String): TClienteDTO; overload;
    function Update(pCliente: TClienteDTO): TClienteDTO;
    procedure Delete(pId: Integer);
    procedure ChecarRegras(pCliente: TClienteDTO);
  end;

implementation

{ TClienteController }

procedure TClienteController.ChecarRegras(pCliente: TClienteDTO);
begin
  if pCliente.nome.Length = 0 then
    raise Exception.Create('O nome deve ser informado.');

  if pCliente.cidade.Length = 0 then
    raise Exception.Create('A Cidade deve ser informada.');

  if pCliente.uf.Length <> 2 then
    raise Exception.Create('A UF deve conter dois caracteres.');
end;

procedure TClienteController.Delete(pId: Integer);
begin
  FClienteProvider.Delete(pId);
end;

function TClienteController.GetAll: TDataSet;
begin
  Result := FClienteProvider.GetAll;
end;

function TClienteController.GetById(vId: String): TClienteDTO;
begin
  Result := GetById(vId.ToInteger);
end;

function TClienteController.GetById(vId: Integer): TClienteDTO;
begin
  Result := FClienteProvider.GetById(vId);
end;

function TClienteController.InsertOrUpdate(pCliente: TClienteDTO): TClienteDTO;
begin
  ChecarRegras(pCliente);

  pCliente.id := FClienteProvider.InsertOrUpdate(pCliente);

  Result := pCliente;
end;

function TClienteController.Update(pCliente: TClienteDTO): TClienteDTO;
begin
  FClienteProvider.Update(pCliente);
  Result := FClienteProvider.GetById(pCliente.id);
end;

end.
