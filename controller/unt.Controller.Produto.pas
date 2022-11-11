unit unt.Controller.Produto;

interface

Uses
  System.SysUtils, System.Variants, System.Classes, Data.DB,
  unt.Model.Provider.Produtos, unt.Model.DTO.Produtos,
  unt.Controller.Interfaces;

Type
  TProdutoController = class(TInterfacedObject, IProdutoController, IControllerEntitie)
  private
    FProdutoProvider: TProdutoProvider;
  public
    function InsertOrUpdate(pProduto: TProdutoDTO): TProdutoDTO;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TProdutoDTO; overload;
    function GetById(vId: String): TProdutoDTO; overload;
    function Update(pProduto: TProdutoDTO): TProdutoDTO;
    procedure Delete(pId: Integer);
  end;

implementation

{ TProdutoController }

procedure TProdutoController.Delete(pId: Integer);
begin
  FProdutoProvider.Delete(pId);
end;

function TProdutoController.GetAll: TDataSet;
begin
  Result := FProdutoProvider.GetAll;
end;

function TProdutoController.GetById(vId: String): TProdutoDTO;
begin
  Result := GetById(vId.ToInteger);
end;

function TProdutoController.GetById(vId: Integer): TProdutoDTO;
begin
  Result := FProdutoProvider.GetById(vId);
end;

function TProdutoController.InsertOrUpdate(pProduto: TProdutoDTO): TProdutoDTO;
begin
    pProduto.id := FProdutoProvider.InsertOrUpdate(pProduto);

    Result := pProduto;
end;

function TProdutoController.Update(pProduto: TProdutoDTO): TProdutoDTO;
begin
  FProdutoProvider.Update(pProduto);
  Result := FProdutoProvider.GetById(pProduto.id);
end;

end.
