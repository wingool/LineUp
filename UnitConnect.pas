unit UnitConnect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, FuncPackage, OleServer, ExtCtrls;

type
  TfrmConnect = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    Label2: TLabel;
    ListBox1: TListBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
//    function Trial(FilePath:string;AppTitle:string;strMac:string='';strLic:string=''):boolean;

  public
    { Public declarations }
    function CheckLicense(FilePath:string;AppTitle:string):boolean;
  end;

implementation

{$R *.DFM}

function TfrmConnect.CheckLicense(FilePath:string;AppTitle:string):boolean;
//var
//  strMac,strLic:string;
//  LicFile:textfile;
begin
  //注册验证网卡id''''''''''''''''''''''''''''''''
  result:=true;
 { strMac:=mac.GetMacAddress;
  if fileexists(filepath) then begin
    AssignFile(LicFile,filepath);
    Reset(LicFile);
    if IOResult<>0 then begin  //打开文件错误
      RaiseLastWin32error;
    end;
    try
      Readln(LicFile,strLic);
    finally
      CloseFile(LicFile);
    end;
    result:=Trial(FilePath,AppTitle,strMac,strLic);
  end
  else  //若在此认为文件不存在
    result:=Trial(FilePath,AppTitle,strMac);}
end;

{function TfrmConnect.Trial(FilePath:string;AppTitle:string;strMac:string='';strLic:string=''):boolean;
var
  strDate:string;
  UseDays:variant;
  wstrlic:widestring;
begin
  result:=true;
  If strMac<>'' Then begin
    if strLic<>'' then begin //strLic=''表示注册文件不存在
      //若存在，则进行检验
      //转化为widestring
      //原因是传地址的参数必须与要调用的函数的参数类型严格一致
      wstrlic:=strLic;
      if Licensedll.EximLicense(strMac,wstrlic) then exit;
    end;
      //不存在或注册码不正确，则询问用户是否进行注册
    if Licensedll.InputLicense(strMac,filepath) then exit; //注册成功
  end
  else
    if strLic=EnDeCode('AllviewSoft') then exit;
//  SaveSetting(AppTitle,'register','licnonet',EnDeCode('AllviewSoft'));
  strDate:=GetSetting(AppTitle,'register','license');
  if strDate='' then
    SaveSetting(AppTitle,'register','license',EnDeCode(datetostr(date)))
  else begin
    strDate:= EnDeCode(strDate);
    usedays:=Date - strtodate(strDate);
    If usedays > 30 Then begin
      application.MessageBox('你的使用版已过期，系统将退出，请与奥维公司联系!','警告',MB_OK+mb_iconwarning);
      result:=false;
    end
    Else
      application.MessageBox(pchar('你还能使用' + inttostr(30 - usedays) + '天!'),'警告',MB_OK+mb_iconwarning);
  end;
end; }

procedure TfrmConnect.FormCreate(Sender: TObject);
var
  rgn:hrgn;
begin
  Animate1.FileName:=ExtractFilePath(Application.ExeName) + 'FINDCOMP.AVI';
  rgn:=CreateRoundRectRgn(0,0,width,height,6,6);
  setwindowrgn(handle,rgn,true);
end;

procedure TfrmConnect.FormShow(Sender: TObject);
begin
  Label2.Caption:=getharddiskID;
  if fileexists(ExtractFilePath(Application.Exename) + 'License.lic') then begin
    self.ListBox1.Items.Clear;
    self.ListBox1.Items.LoadFromFile(ExtractFilePath(Application.Exename) + 'License.lic');
    self.Label3.Caption:=self.ListBox1.Items.Strings[0];
  end;
  license(Label2.Caption,self.Label3.Caption);
  Animate1.Active :=true;
  Application.ProcessMessages;
end;

end.
