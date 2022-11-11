unit unt.Model.DAO.IniFile;

interface

Uses
  System.SysUtils, System.Variants, System.Classes, IniFiles;

Type
  TConfigIniFile = class
  protected
    { private declarations }
    class function GetFileName: String;
    class function GetValue(pSection, pField, pDef: String): String; static;
    class procedure SetValue(pSection, pField, pValue: String); static;
  public
    { public declarations }
  end;

implementation

{ TConfigIniFile }

class function TConfigIniFile.GetFileName: String;
begin
  result := ExtractFilePath(ParamStr(0)) + 'config.ini';
end;

class procedure TConfigIniFile.SetValue(pSection, pField, pValue: String);
var
  vIniFile: TIniFile;
begin
  vIniFile := TIniFile.Create(GetFileName);
  try
    vIniFile.WriteString(pSection,pField,pValue);
  finally
    vIniFile.Free;
  end;
end;

class function TConfigIniFile.GetValue(pSection, pField, pDef: String): String;
var
  vIniFile: TIniFile;
begin
  vIniFile := TIniFile.Create(GetFileName);
  try
    result := vIniFile.ReadString(pSection,pField,pDef);
  finally
    vIniFile.Free;
  end;
end;

end.
