unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, Panel3D, DB;

type
  TfrmMain = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    menuFile: TMenuItem;
    menuModifyPassword: TMenuItem;
    Ns8: TMenuItem;
    N6: TMenuItem;
    menuExit: TMenuItem;
    menuHelp: TMenuItem;
    MenuRuleQuery: TMenuItem;
    menuUseSys: TMenuItem;
    N11: TMenuItem;
    menuAbout: TMenuItem;
    miImportsource: TMenuItem;
    N1: TMenuItem;
    mXtcs: TMenuItem;
    pnlList: TPanel3D;
    N5: TMenuItem;
    N12: TMenuItem;
    CalWindow: TMenuItem;
    est1: TMenuItem;
    ds_1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
    procedure mXtcsClick(Sender: TObject);
    procedure CalWindowClick(Sender: TObject);
  private
    { Private declarations }
    function getVersiondTime : TDateTime ;
    function getLimitTime : String ;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  LoginUnit,unitDefine,DBPackage ,Funcpackage ,
   ExportNet, XtcsSet, CalWindows;

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
var
  VerTime : TDateTime ;
  i : integer ;
  scurdate,sLimittime: string ;
begin
  if not assigned(frmLogin) then
    frmLogin:=TfrmLogin.Create(application);
  if frmLogin.ShowModal=mrCancel then
  begin
    Application.Terminate ;
    exit;
  end;
  Caption:=Caption+'V1.6 '+ DateTimeToStr(Now());
  statusbar1.Panels[4].Text:=datetimetostr(date());
  statusbar1.Panels[0].Text:='操作员: '+g_UserInfo.EMPNAME ;

  VerTime:= getVersiondTime ;
  // showmessage(datetostr(VerTime));
   dm.OpenChannel(self.Handle,ds_1,'select getdate()  as curdate ');
   scurdate:=datetostr(ds_1.DataSet.fieldvalues['curdate']) ;
   dm.FreeChannel(self.Handle,ds_1);

   if  strtodate(c_earlyTime)<VerTime then
      VerTime:=strtodate(c_earlyTime) ;

   sLimittime:=getLimitTime ;
   if ((strtodate(scurdate)<VerTime) or (strtodate(scurdate)>strtodate(sLimittime)) ) then //如过把改成当前之前
   begin  //当前时间必须要大于文件创建时间 or  当前时间在限制日期之前
     Application.MessageBox('您的程序文件已被破坏，无法使用，即将退出','文件丢失',MB_ICONWARNING+MB_OK);
     Application.Terminate;
   end;
   i:= round(strtodate(sLimittime))-round(strtodate(scurdate));
   if i<=30 then
   begin
      self.Caption:='华润武宣物流管控系统V1.6，还余'+inttostr(i)+'天将过期，请更新新版本!' ;
   end;
 //  InitUserOption ;
end;

procedure TfrmMain.menuExitClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmMain.mXtcsClick(Sender: TObject);
begin
  try
      frmXtcsSet:=TfrmXtcsSet.create(nil);
   //   frmClientAllList.isCallBack:=false ;
      frmXtcsSet.showmodal();
  finally
      FreeAndNil(frmXtcsSet);
  end;

end;

procedure TfrmMain.CalWindowClick(Sender: TObject);
begin
  try
      frmCalWindows:=TfrmCalWindows.create(nil);
      frmCalWindows.showmodal();
   finally
      FreeAndNil(frmCalWindows);
   end;

end;

function TfrmMain.getVersiondTime: TDateTime;
var
  ffd:TWin32FindData;
  dft:DWord;
  lft,Time:TFileTime;
  H:THandle;
  s : string ;
begin
  s:=application.ExeName ;
  H:=Windows.FindFirstFile(PChar(s),ffd);

  Time :=ffd.ftCreationTime ;

  //获取文件信息
  if(H<>INVALID_HANDLE_VALUE)then
  begin
  //只查找一个文件 
    Windows.FindClose(H);
  //转换FILETIME格式成为localFILETIME格式
    FileTimeToLocalFileTime(Time,lft);
  //转换FILETIME格式成为DOStime格式
    FileTimeToDosDateTime(lft,LongRec(dft).Hi,LongRec(dft).Lo);
  // 换DOStime格式成为Delphi's应用的TdateTime格式
    Result:=FileDateToDateTime(dft);
  end
  else
    result:=0;


end;

function TfrmMain.getLimitTime: String;
var
  ts: TStringlist ;
begin
  if fileExists( ExtractFilePath(application.ExeName)+'license.lic') then
    begin
    ts:=TStringlist.Create;
    try
      ts.LoadFromFile(ExtractFilePath(application.ExeName)+'license.lic');
      if ts.Count<3 then
        result:=''
      else
        result:=EnDeCode(trim(ts.Strings[1])) ;
    finally
       ts.Free ;
    end;
  end
  else
  begin
    showmessage('系统文件已被破坏，请重新安装');
    Application.Terminate;
  end;
end;

end.

