unit unt.Helpers.Messages;

interface

Uses
  Dialogs, WinAPI.Windows, System.UITypes;

procedure Message_AVISO(Msg: string);
procedure Message_ATENCAO(Msg: string);
procedure Message_ERRO(Msg: string);
function Message_Confirma(Msg: string): boolean;
function Message_ATENCAO_Confirma(Msg: string): boolean;
function Message_ERRO_Confirma(Msg: string): boolean;

implementation

procedure Message_AVISO(Msg: string);
begin
  MessageDlg(Msg, mtInformation, [mbOK], 0);
end;

{ Simplificador do MessageDialog }
procedure Message_ATENCAO(Msg: string);
begin
  MessageDlg(Msg, mtWarning, [mbOK], 0);
end;

{ Simplificador do MessageDialog }
procedure Message_ERRO(Msg: string);
begin
  MessageBeep(MB_ICONERROR);
  MessageDlg(Msg, mtError, [mbOK], 0);
end;

{ Simplificador do MessageDialog }
function Message_Confirma(Msg: string): boolean;
begin
  Result:=MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

function Message_ATENCAO_Confirma(Msg: string): boolean;
begin
  Result:=MessageDlg(Msg, mtWarning, [mbYes, mbNo], 0) = mrYes;
end;

{ Simplificador do MessageDialog }
function Message_ERRO_Confirma(Msg: string): boolean;
begin
  Result:=MessageDlg(Msg, mtError, [mbYes, mbNo], 0) = mrYes;
end;


end.

