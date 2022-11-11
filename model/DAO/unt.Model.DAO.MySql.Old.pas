unit unt.Model.DAO.MySql.Old;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TdmConnection = class(TDataModule)
    FDConnection: TFDConnection;
  private
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    function GetDataSet(pSql: String): TDataSet;
    function ExecSQL(pSql: String; pParams: array of Variant): Integer;
    function GetLastId: Integer;
    procedure StartTransaction;
    procedure Commit;
    procedure RolBack;
  end;

var
  dmConnection: TdmConnection;

implementation

uses
  unt.Model.Config.MySql;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConnection.Commit;
begin
  FDConnection.Commit;
end;

procedure TdmConnection.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Open;
end;

function TdmConnection.ExecSQL(pSql: String; pParams: array of Variant): Integer;
begin
  Result := FDConnection.ExecSQL(pSql,pParams);
end;

procedure TdmConnection.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.Values['Server'] := TConfigConnection.Host;
  FDConnection.Params.Values['Port'] := TConfigConnection.Port.ToString;
  FDConnection.Params.Values['Password'] := TConfigConnection.Password;
  FDConnection.Params.Values['UserName'] := TConfigConnection.UserName;
  FDConnection.Params.Values['Database'] := TConfigConnection.Database;
end;

function TdmConnection.GetDataSet(pSql: String): TDataSet;
begin
  FDConnection.ExecSQL(pSql,Result);
end;

function TdmConnection.GetLastId: Integer;
begin
  Result := FDConnection.ExecSQLScalar('select last_insert_id()');
end;

procedure TdmConnection.RolBack;
begin
  FDConnection.Rollback;
end;

procedure TdmConnection.StartTransaction;
begin
  FDConnection.StartTransaction;
end;

end.

