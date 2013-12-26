unit LoginUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, RzCmboBx, Mask, RzEdit, RzButton,
  RzRadChk,winSock;

type
  TfrmLogin = class(TForm)
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    DataSource1: TDataSource;
    cmdOK: TRzButton;
    cmdCancel: TRzButton;
    txtUserID: TRzEdit;
    txtPassWord: TRzEdit;
    procedure cmdOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtPassWordKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboUserClick(Sender: TObject);
    procedure txtUserIDChange(Sender: TObject);
    procedure cmdCancelClick(Sender: TObject);
    procedure txtUserIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
     intLogintimes:integer;
     function GetLogID(UserRightID:string;PreLog_id:string):string;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;



implementation

  uses
     FuncPackage,DBPackage , MainUnit,unitDefine;

{$R *.dfm}

procedure TfrmLogin.cmdOKClick(Sender: TObject);
var
  P1:pchar;
  strName,strPWD:string;
  blnLogin:boolean;
begin
  blnLogin:=false;
 { //暂时不要从数据库取用户名和密码
  p1:=pchar(lowercase(txtUserID.Text));
 // p1:=strrScan(p1,' ');
//  inc(p1);

  with datasource1 do
  begin
     if not dataset.IsEmpty then
     begin
        DataSet.First;
        if DataSet.Locate('LOGINNAME',txtUserID.text,[loCaseInsensitive]) then
        begin
           strName:= dataset.FieldValues['LOGINNAME'];
           strPWD:= dataset.FieldValues['PASSWORD'];
           if (strcomp(pchar(lowercase(strName)),p1)=0) and (strcomp(pchar(strPWD),pchar(txtPassWord.text))=0) then
           begin
              blnlogin:=true;
              g_UserInfo.EMPID := dataset.FieldValues['EMPID'];
              g_UserInfo.EMPCODE := dataset.FieldValues['EMPCODE'];
              g_UserInfo.DepID := dataset.fieldvalues['DEPTID'];
              g_UserInfo.EMPNAME := dataset.FieldValues['EMPCNAME'];
            //  g_UserInfo.EMPisSUPER:= dataset.fieldByname('isSUPER').asinteger;
              g_UserInfo.EMPPwd:=strPWD;

           end;
        end;
     end
     else begin
        blnlogin:=true;
     end;
  end;    }
  if  (txtUserID.Text ='123') and (txtPassWord.Text ='123') then
    blnlogin:=true;
  if not blnlogin then
  begin
    inc(intLogintimes);
    if intLogintimes>2 then begin
      beep;
      application.MessageBox('您已连续三次登录失败，系统将退出...','警告',MB_OK+MB_ICONWARNING);
      Application.Terminate;
      ModalResult:=mrCancel;
    end;
    beep;
    application.MessageBox('口令错误，请重新输入!','错误',MB_OK+MB_ICONERROR);
    txtPassWord.selstart:=0;
    txtPassWord.sellength:=strlen(Pchar(txtPassWord.text));
    txtPassWord.setfocus;
    exit;
  end;

    ModalResult:=mrOk;


end;

//获取Log_id,并生成相应的信息（用户名，计算机名，IP地址）
function TfrmLogin.GetLogID(UserRightID:string;PreLog_id:string):string;
var
  PR_User,PR_Host,PR_IP:PChar;
  intLen:cardinal;
  phoste:PHostEnt;
  WSAData:TWSADATA;
begin
  intLen:=100;
  PR_User:=stralloc(intLen);
  GetUserName(PR_User,intLen);//获取用户名
  if WSASTartup($0101, WSAData) = 0 then begin
    PR_Host:=stralloc(100);
    GetHostName(PR_Host,sizeof(PR_Host)); //获取计算机名
    phoste:=GetHostByName(PR_Host); //获取计算机信息
    if phoste = nil then 
    begin
      PR_IP:='127.0.0.1'; //取默认IP地址
    end
    else
    begin
      PR_IP:=inet_ntoa(PInAddr(phoste^.h_addr_list^)^); //获取IP地址
    end;
    WSACleanup;
  end
  else begin
    PR_Host:='';
    PR_IP:='';
  end;
  {with dtmodule.adocmd do
  begin
//    ExecuteOptions :=[];
    commandtext:='sys_sp_GetLogID'; //存储过程名必须先于参数创建
    parameters.CreateParameter('1',ftstring,pdInput,20,strpas(pr_user));
    parameters.CreateParameter('2',ftstring,pdInput,20,strpas(pr_host));
    parameters.CreateParameter('3',ftstring,pdInput,20,strpas(pr_IP));
    parameters.CreateParameter('4',ftstring,pdInput,50,UserRightID);
    parameters.CreateParameter('5',ftstring,pdInput,50,PreLog_id);
    parameters.CreateParameter('log_id',ftstring,pdOutput,20,'');
    execute;
    Result:=Parameters.ParamValues['log_id'];
  end; }
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin

  intLogintimes:=0;
 // cboUser.Clear;
 // DM.OpenChannel(self.handle,datasource1,'select * from tsys_employee order by empid');
 { with datasource1.dataset do
    while not eof do
    begin
      cboUser.Items.Add(inttostr(fieldvalues['EMPID']) + ' ' + FieldValues['EMPCNAME']);
      next;
    end;
  if cboUser.Items.count>0 then
  begin
    cboUser.ItemIndex :=0;
    cboUserClick(self);
  end;   }
  txtUserID.SetFocus;

end;

procedure TfrmLogin.txtPassWordKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
     cmdOKClick(cmdok);
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM.FreeChannel(self.handle,datasource1);
end;

procedure TfrmLogin.cboUserClick(Sender: TObject);
var
  strUser:string;
  P1:pchar;
begin
 // strUser:=cboUser.text;
  if strUser='' then exit;
  p1:=strScan(pchar(strUser),' ');
  p1^:=chr(0);
  txtUserID.text:=strUser;
end;

procedure TfrmLogin.txtUserIDChange(Sender: TObject);
var
  inti: integer;
  strUser:string;
  P1:pchar;
begin
  {
  with cboUser do
    for inti:=0 to items.Count-1 do
    begin
      strUser:=items.Strings[inti];
      p1:=strScan(pchar(strUser),' ');
      if p1=nil then continue;
      p1^:=chr(0);
      if strcomp(pchar(txtUserID.text),pchar(struser))=0 then
      begin
        ItemIndex :=inti;
        txtPassWord.SetFocus;
        exit;
      end;
    end;
      }
end;

procedure TfrmLogin.cmdCancelClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmLogin.txtUserIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
     if trim(txtuserID.Text)='' then
         txtuserID.SetFocus
     else
        txtPassWord.SetFocus ;    
  end;
  
end;

end.
