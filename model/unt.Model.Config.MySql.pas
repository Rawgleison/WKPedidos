unit unt.Model.Config.MySql;

interface
Uses
  System.SysUtils, System.Variants, System.Classes, unt.Model.DAO.IniFile;

Type
  TConfigConnection = class(TConfigIniFile)
  private
    class function GetHost: String; static;
    class procedure SetHost(const Value: String); static;
    class function GetPort: integer; static;
    class procedure SetPort(const Value: integer); static;
    class function GetUserName: String; static;
    class procedure SetUserName(const Value: String); static;
    class function GetPassword: String; static;
    class procedure SetPassword(const Value: String); static;
    class function GetDatabase: String; static;
    class procedure SetDatabase(const Value: String); static;
    { private declarations }
  public
    { public declarations }
    class property Host: String read GetHost write SetHost;
    class property Port: integer read GetPort write SetPort;
    class property UserName: String read GetUserName write SetUserName;
    class property Password: String read GetPassword write SetPassword;
    class property Database: String read GetDatabase write SetDatabase;
  end;

const cSection = 'MySql';

implementation

{ TConfigConnection }

class function TConfigConnection.GetDatabase: String;
begin
  result := GetValue(cSection,'Database','');
end;

class function TConfigConnection.GetHost: String;
begin
  result := GetValue(cSection,'Host','');
end;

class function TConfigConnection.GetPassword: String;
begin
  result := GetValue(cSection,'Password','');
end;

class function TConfigConnection.GetPort: integer;
begin
  result := GetValue(cSection,'Port','').ToInteger;
end;

class function TConfigConnection.GetUserName: String;
begin
  result := GetValue(cSection,'UserName','');
end;

class procedure TConfigConnection.SetDatabase(const Value: String);
begin
  SetValue(cSection,'Database',Value);
end;

class procedure TConfigConnection.SetHost(const Value: String);
begin
  SetValue(cSection,'Host',Value);
end;

class procedure TConfigConnection.SetPassword(const Value: String);
begin
  SetValue(cSection,'Password',Value);
end;

class procedure TConfigConnection.SetPort(const Value: integer);
begin
  SetValue(cSection,'Port',Value.ToString);
end;

class procedure TConfigConnection.SetUserName(const Value: String);
begin
  SetValue(cSection,'UserName',Value);
end;

end.
