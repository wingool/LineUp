program AutoForHRWX;

uses
  Forms,
  Windows ,
  MainUnit in 'MainUnit.pas' {frmMain},
  LoginUnit in 'LoginUnit.pas' {frmLogin},
  DBPackage in 'DBPackage.pas' {DM: TDataModule},
  unitDefine in 'unitDefine.pas',
  UnitConnect in 'UnitConnect.pas' {frmConnect},
  FuncPackage in 'FuncPackage.pas',
  XtcsSet in 'XtcsSet.pas' {frmXtcsSet},
  CalWindows in 'CalWindows.pas' {frmCalWindows},
  uScreenDefine in 'uScreenDefine.pas';

{$R *.res}

var
  str: string ;
begin
  Application.Initialize;
  Application.Title:='华润武宣物流管控系统' ;
  str := 'yyyy-MM-dd';
        SetLocaleInfoa(LOCALE_SYSTEM_DEFAULT, LOCALE_SLONGDATE, PChar(str));
        str := 'yyyy-MM-dd';
        SetLocaleInfoa(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE, PChar(str));
        str := 'HH:mm:ss';
        SetLocaleInfoa(LOCALE_SYSTEM_DEFAULT, LOCALE_STIMEFORMAT, PChar(str));
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
