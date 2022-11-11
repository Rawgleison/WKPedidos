unit unt.Model.Provider.Produtos;

interface

Uses
  System.SysUtils, System.Variants, System.Classes,
  Data.DB, unt.Model.DTO.Produtos, unt.Model.Provider.Interfaces;

Type
  TProdutoProvider = class(TInterfacedObject, IProdutoProvider)
  private
    { private declarations }
  public
    { public declarations }
    function InsertOrUpdate(pProduto: TProdutoDTO): Integer;
    function GetAll: TDataSet;
    function GetById(vId: Integer): TProdutoDTO;
    function Update(pProduto: TProdutoDTO): Integer;
    procedure Delete(pId: Integer);
  end;

implementation

uses
  unt.Model.DAO.MySql;

{ TProdutoProvider }

procedure TProdutoProvider.Delete(pId: Integer);
begin
  dmConnection.ExecSQL('delete from produtos where id = :id',[pId]);
end;

function TProdutoProvider.GetAll: TDataSet;
begin
  Result := dmConnection.GetDataSet('select * from produtos');
end;

function TProdutoProvider.GetById(vId: Integer): TProdutoDTO;
var
  ds: TdataSet;
begin
  ds := dmConnection.GetDataSet('select * from produtos where id = '+vId.ToString);
  try
  Result.id     := ds.FieldByName('id').AsInteger;
  Result.descricao   := ds.FieldByName('descricao').AsString;
  Result.valor := ds.FieldByName('valor').AsCurrency;
  finally
    ds.Free;
  end;
end;

function TProdutoProvider.InsertOrUpdate(pProduto: TProdutoDTO): Integer;
var
  vSql: String;
begin
  vSql := 'INSERT INTO produtos '+
          'values(:id, :descricao, :valor) '+
          'on duplicate key update ' +
          'descricao = :descricao, ' +
          'valor = :valor';

  dmConnection.ExecSQL(vSql,[pProduto.id, pProduto.descricao, pProduto.valor]);

  if pProduto.id>0 then
    Result := pProduto.id
  else
    Result := dmConnection.GetLastId;
end;

function TProdutoProvider.Update(pProduto: TProdutoDTO): Integer;
var vSql: String;
begin
  if pProduto.id < 1 then
    raise Exception.Create('Para editar o produto o ID deve ser passado.');

  vSql := 'update produtos set ' +
          'descricao = :descricao, ' +
          'valor = :valor ' +
          'where id = :id';
  Result := dmConnection.ExecSQL(vSql,[pProduto.descricao, pProduto.valor, pProduto.id]);
end;

end.
