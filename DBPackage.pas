//本模块对数据库的操作进行集中控制
//

unit DBPackage;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,Dialogs,
  ADODB, Db, DBGrids, StdCtrls, UnitConnect,  DBCtrls, MSDASC_TLB,ADOInt,
  FuncPackage, OleServer,
  ActnList, unitDefine, inifiles,Buttons;

type
  ADOQueryRecord = record
    ADOQuery:TADOQuery;
    FormHandle:Hwnd;//FormHandle记录使用该ADOQuery的窗体的handle,若=0则表示未使用
    FormPart:integer;//若=0则表示未使用 ，FormPart用来记录是窗体的哪部分来使用
  end;              //因为一个窗体可能要用多个，初始值为0
                    //使用时应先申请一个，窗体退出时应把相应的FormHandle置0
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    ADOCmd: TADOCommand;
    dqSequence: TADOQuery;
    DataLinks: TDataLinks;
    ADOQueryBZX: TADOQuery;
    aq_Temp: TADOQuery;
    ADOQueryLoadData: TADOQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure dqSQLAfterInsert(DataSet: TDataSet);
   private
    { Private declarations }
    ADOQueryArray: array[1..cstADOQueryNumber] of ADOQueryRecord;
    function ConnectServer():boolean;
    function ApplyChannel(FormHandle:Hwnd;FormPart:integer=1):integer;
    function GetChannel(FormHandle:Hwnd;FormPart:integer=1):integer;

  public
    { Public declarations }
    inputstr:string;
    tsPicID : TStringList ;
    isEdit : boolean ;
    net_QuotedNum : integer ;
    ClientisNew : boolean ;
    function ReConnectServer(blnChange:boolean=false):smallint;
    procedure OpenChannel(FormHandle:Hwnd;datasource:TDataSource;Sql:String;FormPart:integer=1;CursorType:TCursorType=ctKeyset;LockType:TADOLockType=ltOptimistic);
    procedure FreeChannel(FormHandle:Hwnd;datasource:TDataSource;FormPart:integer=1);
    function CheckModifyed(FormHandle:Hwnd;FormPart:integer=1;strFKey:string='';blnShowMessage:boolean=false):boolean;
    procedure RequeryChannel(FormHandle:Hwnd;FormPart:integer=1;blnShowMessage:boolean=false);
    procedure LoadDataFromChannel(FormHandle:Hwnd;datasource:TDataSource;strSql:String;FormPart:integer=1);
    function SaveChannel(FormHandle:Hwnd;FormPart:integer=1;strFKey:string='';blnShowMessage:boolean=false):boolean;
    procedure InitComboBox(Contain:TWinControl);
    procedure InitComboBox1(cbo:TCustomComboBox);
    procedure LoadQueryCustom(AppTitle:string;FormName:string;Parent:TWinControl);
    function LoadDBCustom(const BigJobName,FKeyValue:string;FormHandle:Hwnd;FormPart:integer=1):boolean;
    procedure NewAcceptReg(FormHandle:Hwnd;datasource:TDataSource;Sql,PKey:String;FormPart:integer=1;CursorType:TCursorType=ctKeyset;LockType:TADOLockType=ltOptimistic);
    procedure InsertChannel(FormHandle:Hwnd;FormPart:integer=1);
    procedure EditChannel(FormHandle:Hwnd;FormPart:integer=1);
    function CallDBProc(const ProcName:string;InputParams:string='';OutputParams:smallint=1):string;
    procedure EnterQuery(sender:TObject;forminfo:TformInfo;tableName:string;DarkQuery:boolean;FormHandle:Hwnd;datasource:Tdatasource;FormPart:integer=1);
    procedure logout(sender:TObject;tableName:string;whereStr:string;dataset:Tdataset);
    function GetCatalogName(): string;
    function GetPrintRemark(): string;
    procedure SaveAll;
    function FenPeiBzx(APackLineNO: integer) : boolean ;
    function BlankBzxWichel(APackLineNo: integer): boolean ;
  end;

  function CheckByRightIndex(const RightIndex:integer;blnShowMsg:boolean=false):boolean;

var
  DM: TDM;
  g_UserInfo:userinfotype;
    
implementation

{$R *.DFM}
uses Dblogdlg,RzRadChk,RzEdit;

Const
  CT_DATASOURCE='DATA SOURCE=';
  CT_INITCATALOG='INITIAL CATALOG=';

  c_SQLcon='Provider=SQLOLEDB.1;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s';

  c_connMDB ='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\bird_s.mdb;Persist Security Info=False;Jet OLEDB:Database Password=BIRD_SYS' ;
           // Provider=Microsoft.Jet.OLEDB.4.0;Password=BIRD_SYS;Data Source=E:\DongRui_Soft\single_SendPrice\bird_s.mdb;Persist Security Info=True

//从连接字符串中获取想要的部分
//CT_PROVIDER,CT_USERID
function ExtractConnStr(const ConnStr, PartStr: string): string;
var
  UIDPos, UIDLen: Integer;
begin
  UIDPos := Pos(PartStr, AnsiUpperCase(ConnStr)) + Length(PartStr);
  if UIDPos > Length(PartStr) then
  begin
    UIDLen := Pos(';', Copy(ConnStr, UIDPos, 255)) - 1;
    IF UIDLen = -1 then UIDLen := Length(ConnStr);
    Result := Copy(ConnStr, UIDPos, UIDLen);
  end else
    Result := '';
end;

//RightIndex为传入管理权限的下标
//当用户权限包含传入权限时返回true,否则返回false
function CheckByRightIndex(const RightIndex:integer;blnShowMsg:boolean):boolean;
var
  intRight:integer;
begin
  if (RightIndex<1) or (RightIndex>32) then
  begin
    Result:=false;
  end
  else begin
    intRight:=g_Userinfo.EMPisSUPER or g_Userinfo.GrantRight;
    intRight:=intRight shr (RightIndex-1);
    Result:=(intRight and 1) = 1
  end;
  if blnShowMsg and not Result then
    Application.MessageBox('你无此权限！','提示',mb_iconinformation+mb_Ok);
end;

//连接数据库服务器
//从注册表中取得connectionstring,
//若没有，则给出连接向导，并把新的connectionstring存注册表
function TDM.ConnectServer():boolean;
var
  strCnn,username,password,provider:string;
begin
//Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\bird_s.mdb;
//PersistSecurity Info=False;Jet OLEDB:Database Password=BIRD_SYS

  Result:=false; //设处置为连接不成功
 // strCnn:=c_SQLcon;//c_connMDB ;
  strCnn:=GetSetting(Application.Title,'database','数据库连接');
  username:='';
  password:='';
  if strCnn='' then
  begin
     try
       strCnn:=(datalinks.PromptNew() as _Connection).ConnectionString;
     except
       exit ;//取消连接向导则推出应用程序
     end;
     username:=ExtractuserID(strCnn);
     provider:=ExtractPROVIDER(strCnn);
     if not LoginDialogEx(provider,username,password,true) then
     begin
       application.Terminate;
       exit ;
     end;
     savesetting(Application.Title,'database','数据库连接',strCnn);
     savesetting(Application.title,'database','login',EnDeCode(password)) ;
  end ;
  adocnn.Connected :=false ;
  adocnn.ConnectionString :=strCnn;
  if username='' then
    username:=ExtractuserID(strCnn);
  if password='' then
    password:=EnDeCode(getsetting(Application.Title,'database','login'));
  try  //试着打开连接
    adocnn.open(username,password);
   // adocnn.Connected :=true ;
    Result:=true; //连接成功
  except
     if ReConnectServer()=-1 then
       Result:=true ;
  end;


end;

//在原连接信息基础上再次给出连接向导
//可以用此改变数据库连接
//blnChange表示是否是变换原数据库连接，
//true表示是，并且在新连接失败后仍用旧连接
//false表示否，在新连接失败后不用就连接
//返回1表示连接成功，0表示不成功，-1表示取消
function TDM.ReConnectServer(blnChange:boolean=false):smallint;
var
  DisPatch:IDispatch;
 // DisPatchCh:IDispatch;
  strCnn,username,password,provider:string;
 // int:integer;
begin
 // int:=0;
  Result:=-1; //设初值为取消
  ADOCnn.Close;
  strCnn:=adocnn.connectionstring;
  DisPatch:= ADOCnn.ConnectionObject as IDispatch;
  if datalinks.PromptEdit(DisPatch) then begin //给出向导
    ADOCnn.ConnectionObject:=DisPatch as _Connection;//转换接口
    try
      username:=ExtractUserID(adocnn.connectionstring);
      provider:=ExtractPROVIDER(adocnn.connectionstring);
      if not LoginDialogEx(provider,username,password,true) then begin
        if blnChange then begin
          ADOCnn.ConnectionString:=strCnn;
          username:=ExtractUserID(strCnn);
          password:=EnDeCode(getsetting(Application.Title,'database','login'));
          ADOCnn.Open(username,password);
        end
        else begin
          exit;
          application.Terminate;
        end;
      end;
      ADOCnn.Open(username,password);
      //Result:=1;//连接成功
      application.MessageBox('主应用程序数据库设置成功！','提示',mb_OK+mb_iconinformation);
     // int:=1;
      strCnn:=adocnn.connectionstring;
      savesetting(Application.Title,'database','数据库连接',strCnn);//存注册表
      savesetting(Application.Title,'database','login',EnDeCode(password));//存注册表
    except
      Result:=0;
      if blnChange then begin
        ADOCnn.ConnectionString:=strCnn;
        username:=ExtractUserID(strCnn);
        password:=EnDeCode(getsetting(Application.Title,'database','login'));
        ADOCnn.Open(username,password);
      end;
    end;
  end;

end;
//模块创建时自动调用，一般用在主程序中
procedure TDM.DataModuleCreate(Sender: TObject);
var
  inti:integer;
  formcheck:TfrmConnect;
begin
  //检测license
  formCheck:=TfrmConnect.Create(Application);
  if not formcheck.CheckLicense(ExtractFilePath(Application.Exename) + 'License.lic',Application.Title) then begin
    //application.messagebox('您无权使用该产品，请与..公司联系！','警告',mb_iconError+mb_OK);
    Application.Terminate ;
  end;
  try //连接数据库服务器
    formCheck.show;
    formcheck.Refresh;
    if ADOCnn.Connected then
      ADOCnn.Connected:=false;
    if not ConnectServer then
    begin
      application.MessageBox('数据库服务器连接失败，系统将被迫退出！','错误',MB_OK+MB_ICONERROR);
      exit;
      application.Terminate;
    end;
  finally
    formcheck.Release;
  end;
  //初始化系统参数
  //InitSysOption(ADOCnn);

 // InitUserOption();

  //初始化ADOQuery
  for inti:=1 to cstADOQueryNumber do
  begin
    with ADOQueryArray[inti] do
    begin
      adoquery:=tadoquery.create(self);
      adoquery.Connection :=adocnn;
      adoquery.Active:=false;
      formhandle:=0;
      formpart:=0;
    end;
  end;
  g_UserInfo.LogID := '';
 // ADOQueryBZX.open; //取全部标准项信息
 // dtSysInfo.open;
  
end;

//模块卸载时自动调用
procedure TDM.DataModuleDestroy(Sender: TObject);
var
  inti:integer;
begin
  for inti:=1 to cstADOQueryNumber do
  begin
    ADOQueryArray[inti].ADOQuery.Close;
    ADOQueryArray[inti].ADOQuery.free;
  end;
  if ADOCnn.state<>[stClosed] then
   ADOCnn.Close;
end;

//打开一个数据库连接，即申请一个ADOQuery
//FormHandle为申请窗体的Handle
//datasource为在窗体上的datasource控件名称
//Formpart用于区分一个窗体上申请的多个ADOQuery
procedure TDM.OpenChannel(FormHandle:Hwnd;datasource:TDataSource;Sql:String;FormPart:integer=1;CursorType:TCursorType=ctKeyset;LockType:TADOLockType=ltOptimistic);
var
  ChannelIndex:integer;
begin
  //查看是否已申请了一个ADOQuery
  ChannelIndex:=GetChannel(FormHandle,Formpart);
  if ChannelIndex=0 then //还未申请则新申请一个ADOQuery
    ChannelIndex:=ApplyChannel(FormHandle,FOrmpart);
  if ChannelIndex=0 then begin
    application.MessageBox('ADOQuery已用完!','警告',mb_OK+MB_ICONWARNING);
    exit;
  end
  else begin
    with ADOQueryArray[ChannelIndex] do begin
      ADOQuery.active:=false;
      ADOQuery.CursorType:= CursorType;
      ADOQuery.LockType:= LockType;
      ADOQuery.sql.Clear;
      ADOQuery.sql.add(sql);
      ADOQuery.active:=true;
      if ADOQuery.CanModify = false then
        datasource.AutoEdit :=false;
      Datasource.dataset:=ADOQuery;
    end;
  end;
end;

//查询，从数据库中取回满足要求的数据
procedure TDM.LoadDataFromChannel(FormHandle:Hwnd;datasource:TDataSource;strSql:String;FormPart:integer=1);
var
  ChannelIndex:integer;

begin
  ChannelIndex:=GetChannel(FormHandle,formpart);
  if ChannelIndex=0 then
    application.MessageBox('您还未连接ADOQuery！','警告',mb_OK+MB_ICONWARNING)
  else begin
    with ADOQueryLoadData do begin
      Active:=false;
      SQL.clear;
      SQL.text:=strsql;
      Active:=true;
      if IsEmpty then begin
        application.MessageBox('查不到满足条件的数据!','提示',mb_OK+MB_ICONINFORMATION);
        exit;
      end
      else begin
        {  frmConfirm:=TfrmConfirm.Create(self);
          frmConfirm.DataSource1.DataSet:=ADOQueryLoadData;
          frmConfirm.ADOQuery:=ADOQueryArray[ChannelIndex].ADOQuery;
          frmConfirm.LoadType:='查询';//‘查询’|‘调库’
          frmConfirm.ShowModal;  }
      end;
      active:=false;
    end;
  end;
end;

//重新查询ADOQuery
//当blnShowMessage=true时才有提示，否则做保存处理
procedure TDM.RequeryChannel(FormHandle:Hwnd;FormPart:integer=1;blnShowMessage:boolean=false);
var
  ChannelIndex:integer;
begin
  ChannelIndex:=GetChannel(FormHandle,formpart);
  if ChannelIndex=0 then
  //  application.MessageBox('您还未连接ADOQuery！','警告',mb_OK+MB_ICONWARNING)
  else begin
    with adoqueryarray[ChannelIndex] do begin
      if ADOQuery.Modified then //判断是否已做修改
        if blnShowMessage then
        begin
           if application.MessageBox('内容已被修改，是否保存？','警告',mb_YESNO+MB_ICONWARNING)=IDYES then
            ADOQuery.UpdateBatch
          else
            ADOQuery.Cancel;
        end
        else
          ADOQuery.UpdateBatch;
      ADOQuery.Requery;
    end;
  end;
end;

//申请一个数据库连接查询通道即一个ADOQuery
function TDM.ApplyChannel(FormHandle:Hwnd;FormPart:integer=1):integer;
var
  inti:integer;
begin
  Result:=0;
  for inti:=1 to cstADOQueryNumber do
    if adoqueryarray[inti].FormHandle=0 then
    begin
       adoqueryarray[inti].FormHandle:=FormHandle;
       adoqueryarray[inti].FormPart :=FormPart;
       Result:=inti;
       exit;
    end;
end;

//查找给定的条件（窗体）是否已申请一个通道ADOQuery
function TDM.GetChannel(FormHandle:Hwnd;FormPart:integer=1):integer;
var
  inti:integer;
begin
  Result:=0;
  for inti:=1 to cstADOQueryNumber do
    if (ADOQueryArray[inti].FormHandle=FormHandle) and (ADOQueryArray[inti].FormPart=FormPart) then
    begin
       Result:=inti;
       exit;
    end
end;

//释放通道ADOQuery
procedure TDM.FreeChannel(FormHandle:Hwnd;datasource:TDataSource;FormPart:integer=1);
var
  ChannelIndex :integer;
begin
  ChannelIndex:=GetChannel(FormHandle,formPart);
  if ChannelIndex<>0 then begin
    adoqueryarray[ChannelIndex].formhandle:=0;
    adoQueryArray[ChannelIndex].ADOQuery.close;
    datasource.dataset:=nil;
  end;
end;

//保存修改
//blnShowMessage标记是否显示保存成功信息
function TDM.SaveChannel(FormHandle:Hwnd;FormPart:integer=1;strFKey:string='';blnShowMessage:boolean=false):boolean;
var
  ChannelIndex :integer;
begin
  Result:=false;
  ChannelIndex:=GetChannel(FormHandle,formPart);
  if ChannelIndex<>0 then
  begin
    with adoqueryarray[ChannelIndex] do
    begin
      //判断该视图是否能更新
      if not ADOQuery.CanModify then
      begin
        application.MessageBox('记录集以只读方式打开，无法保存！','警告',mb_OK+MB_ICONWARNING);
        exit;
      end;
      try
        if strFKey<>'' then
          GetDisplayFromString(ADOQuery,strFkey);
        if ADOQuery.Modified then
        begin
          //ADOQuery.UpdateBatch; //保存
          ADOQuery.Post;
          Result:=true;
        end;
        if blnShowMessage then
          application.MessageBox('保存成功！','提示',mb_OK+MB_ICONINFORMATION);
      except
        ADOQuery.Cancel;
        application.MessageBox('保存不成功，请重新输入！','警告',mb_OK+MB_ICONWARNING);
      end;
    end;
  end;
end;

//检查用户是否已做修改，若已做修改，
//则当blnShowMessage=true时，提示用户是否保存，否则做保存处理
function TDM.CheckModifyed(FormHandle:Hwnd;FormPart:integer=1;strFkey:string='';blnShowMessage:boolean=false):boolean;
var
  ChannelIndex :integer;
  ReturnValue:word;
begin
  ChannelIndex:=GetChannel(FormHandle,formPart);
  Result:=true;
  if ChannelIndex<>0 then
  begin
    with adoqueryarray[ChannelIndex] do
    begin
      if ADOQuery.Modified then
      begin//判断是否已做修改
        if blnShowMessage then
        begin
          returnvalue:=application.MessageBox('修改内容未做保存，是否保存？！','提示',MB_YESNOCANCEL+MB_ICONINFORMATION);
          case returnvalue of
            IDYES : begin
                      if strFKey<>'' then
                          GetDisplayFromString(ADOQuery,strFkey);
                      ADOQuery.UpdateBatch;
                    end;
            IDNo  : ADOQuery.Cancel;
            IDCancel: Result:=false;
          end;
        end
        else begin
          if strFKey<>'' then
             GetDisplayFromString(ADOQuery,strFkey);
          ADOQuery.UpdateBatch;
        end
      end;
    end;
  end;
end;

//在指定Channel中插入一条空记录（不做保存，用户保存后才有效）
procedure TDM.InsertChannel(FormHandle:Hwnd;FormPart:integer=1);
var
  channelIndex:integer;
begin
  ChannelIndex:=GetChannel(FormHandle,formPart);
  if ChannelIndex=0 then
  begin
    application.MessageBox('你还未申请一个数据库连接通道！','警告',mb_OK+MB_ICONWARNING);
     exit;
  end
  else begin
    adoqueryarray[ChannelIndex].ADOQuery.insert;
  end;
end;

//把指定channel设为可编辑
procedure TDM.EditChannel(FormHandle:Hwnd;FormPart:integer=1);
var
  channelIndex:integer;
begin
  ChannelIndex:=GetChannel(FormHandle,formPart);
  if ChannelIndex=0 then begin
    application.MessageBox('你还未申请一个数据库连接通道！','警告',mb_OK+MB_ICONWARNING);
    exit;
  end
  else begin
    adoqueryarray[ChannelIndex].ADOQuery.Edit;
  end;
end;

//初始化窗体上的组合框
procedure TDM.InitComboBox(Contain:TWinControl);
var
  ctrl:TControl;
  cbo:TCustomComboBox;
  inti:integer;
  grid:Tdbgrid;
  str:string;
  int:integer;
begin
  with ADOQueryBZX do
  for inti:=0 to Contain.ControlCount-1 do
  begin
    ctrl:=Contain.Controls[inti];
    if (ctrl is TDBComboBox)   then
    begin
      cbo:=ctrl as TCustomComboBox;
      str:=cbo.Hint;
      if cbo.hint='' then continue;
      filtered:=false;
      filter:='[type]=''' +str + '''';
      cbo.Clear;
      filtered:=true;
      if IsEmpty then continue;
      First;
      while not Eof do
      begin
        cbo.Items.Add(fieldvalues['name']);
        Next;
      end;
    end
    else if (ctrl is TDBgrid)  then
    begin
      grid:=ctrl as Tdbgrid;
      for int:=0 to grid.Columns.Count-1 do
      begin
        if grid.Columns[int].ImeName='' then continue;
        str:=grid.Columns[int].ImeName;
        filter:='[type]=''' +str + '''';
        grid.Columns[int].PickList.Clear;
        if IsEmpty then continue;
        First;
        while not Eof do
        begin
          grid.Columns[int].PickList.Add(fieldvalues['name']);
          Next;
        end;
      end;
    end
    else if ctrl.ClassName='TPanel' then InitComboBox(TWinControl(ctrl))
    else if ctrl.ClassName='TFlatPanel' then InitComboBox(TWinControl(ctrl))
    else if ctrl.ClassName='TGroupBox' then InitComboBox(TWinControl(ctrl))
    else if ctrl.ClassName='TPageControl' then InitComboBox(TWinControl(ctrl))
    else if ctrl.ClassName='TTabSheet' then InitComboBox(TWinControl(ctrl))
    else if ctrl.ClassName='TBevel' then InitComboBox(TWinControl(ctrl));
  end;
end;

procedure TDM.InitComboBox1(cbo:TCustomComboBox);
var
  str:string;
//  txt:string;
begin
  with ADOQueryBZX do begin
    str:=cbo.Hint;
    if cbo.hint='' then exit;
    filtered:=false;
    filter:='[type]=''' +str + '''';
    cbo.Items.Clear;
    filtered:=true;
    if IsEmpty then exit;
    First;
    while not Eof do
    begin
      cbo.Items.Add(fieldvalues['name']);
      Next;
    end;
  end;
end;

//根据数据库sys_Querycustom表中的查询自定义信息初始化查询界面
procedure TDM.LoadQueryCustom(AppTitle:string;FormName:string;Parent:TWinControl);
var
  chk:TRzCheckBox;
  rad:TRzRadioButton;
  txt:TRzEdit;
  Top, inti:integer;
  ctrl:TControl;
  inifile:Tinifile;
  underInt:integer;
  //查询自定义显示具体样式定义
  //小数部分内容显示的实际数值 = 父容器宽度 * 其具体的值
  //一行显示
  QueryCostom1_Top,QueryCostom1_Height,QueryCostom1_Sep,QueryCostom1_FontSize:integer;
  QueryCostom1_Left,QueryCostom1_Width1,QueryCostom1_Width2:real;
  //分行显示
  QueryCostom2_Top,QueryCostom2_Height,QueryCostom2_SepIn,QueryCostom2_SepOut,QueryCostom2_FontSize:integer;
  QueryCostom2_Left1,QueryCostom2_Left2,QueryCostom2_Width1,QueryCostom2_Width2:real;
begin
  //取配置信息
  inifile:=Tinifile.Create(extractfilepath(application.ExeName) + 'userOption.ini');
  QueryCostom1_Top:=inifile.ReadInteger('QueryCustom','QueryCostom1_Top',8);
  QueryCostom1_Height:=inifile.ReadInteger('QueryCustom','QueryCostom1_Height',24);
  QueryCostom1_Sep:=inifile.ReadInteger('QueryCustom','QueryCostom1_Sep',6);
  QueryCostom1_FontSize:=inifile.ReadInteger('QueryCustom','QueryCostom1_FontSize',10);
  QueryCostom1_Left:=inifile.ReadFloat('QueryCustom','QueryCostom1_Left',0.1);
  QueryCostom1_Width1:=inifile.ReadFloat('QueryCustom','QueryCostom1_Width1',0.4);
  QueryCostom1_Width2:=inifile.ReadFloat('QueryCustom','QueryCostom1_Width2',0.4);
  QueryCostom2_Top:=inifile.ReadInteger('QueryCustom','QueryCostom2_Top',8);
  QueryCostom2_Height:=inifile.ReadInteger('QueryCustom','QueryCostom2_Height',24);
  QueryCostom2_SepIn:=inifile.ReadInteger('QueryCustom','QueryCostom2_SepIn',4);
  QueryCostom2_SepOut:=inifile.ReadInteger('QueryCustom','QueryCostom2_SepOut',6);
  QueryCostom2_FontSize:=inifile.ReadInteger('QueryCustom','QueryCostom2_FontSize',10);
  QueryCostom2_Left1:=inifile.ReadFloat('QueryCustom','QueryCostom2_Left1',0.1);
  QueryCostom2_Width1:=inifile.ReadFloat('QueryCustom','QueryCostom2_Width1',0.6);
  QueryCostom2_Left2:=inifile.ReadFloat('QueryCustom','QueryCostom2_Left2',0.3);
  QueryCostom2_Width2:=inifile.ReadFloat('QueryCustom','QueryCostom2_Width2',0.6);
  inifile.Free;
  //具体处理
  with ADOQueryLoadData do begin
    Active :=false;
    SQL.Clear;
    sql.Add('select * from sys_QueryCustom');
    sql.add('where appname=''' + apptitle + ''' and formname='''
        + formname + ''' order by [order]');
    Active :=true;
    First;
    top:=0;
    if not eof then
    begin
      //清除容器parent内原有控件，以便重新生成
      for inti:=parent.ControlCount -1 downto 0 do
      begin
        ctrl:=parent.Controls[inti];
        ctrl.free;
      end;
      inti:= Fieldvalues['DisplayStyle'];
      case inti of
        1,3: top:=QueryCostom1_top;
        2,4: top:=QueryCostom2_top;
      end;
      underInt:=0;
      while not Eof do   begin
        //把控件显示在容器parent中
        inti:= Fieldvalues['DisplayStyle'];
        case inti of  //根据不同的样式显示
          1:begin
              txt:=TRzEdit.Create(self);
              txt.Name:='txt'+inttostr(underInt);
              txt.Text:='';
              txt.Tag:=inti;
              rad:=TRzRadioButton.Create(self);
              rad.Name:='rad'+inttostr(underInt);
              rad.Tag:=inti;
              rad.left:=round(Parent.Width * QueryCostom1_Left);
              rad.top:=Top;
              rad.Height := QueryCostom1_Height;
              rad.width:=round(Parent.Width * QueryCostom1_width1);
              rad.Font.Size :=QueryCostom1_FontSize;
              rad.Caption := Fieldvalues['Caption'];
              rad.parent:=Parent;
              txt.top:=Top;
              txt.left:=round(Parent.Width * (QueryCostom1_Left + QueryCostom1_width1));
              txt.Height := QueryCostom1_Height;
              txt.width:=round(Parent.Width * QueryCostom1_width2);
              txt.Font.Size :=QueryCostom1_FontSize;
              txt.hint:=Fieldvalues['Datafield'];
              txt.parent:=Parent;
              top:=top + QueryCostom1_Height + QueryCostom1_Sep;
            end;
          2:begin
              txt:=TRzEdit.Create(self);
              txt.Name:='txt'+inttostr(underInt);
              txt.Text:='';
              txt.tag:=inti;
              rad:=TRzRadioButton.Create(self);
              rad.Name:='rad'+inttostr(underInt);
              rad.tag:=inti;
              rad.left:=round(Parent.Width * QueryCostom2_Left1);
              rad.top:=Top;
              rad.Height := QueryCostom2_Height;
              rad.width:=round(Parent.Width * QueryCostom2_width1);
              rad.Font.Size :=QueryCostom2_FontSize;
              rad.Caption := Fieldvalues['Caption'];
              rad.parent:=Parent;
              top:=top + QueryCostom2_SepIn + QueryCostom2_Height;
              txt.top:=Top;
              txt.left:=round(Parent.Width * QueryCostom2_Left2);
              txt.Height := QueryCostom2_Height;
              txt.width:=round(Parent.Width * QueryCostom2_width2);
              txt.Font.Size :=QueryCostom2_FontSize;
              txt.hint:=Fieldvalues['Datafield'];
              txt.parent:=Parent;
              top:=top + QueryCostom2_SepOut + QueryCostom2_Height;
            end;
          3:begin
              chk:=TRzCheckBox.create(self);
              chk.Name:='chk'+inttostr(underInt);
              chk.Tag:=inti;
              txt:=TRzEdit.Create(self);
              txt.Name:='txt'+inttostr(underInt);
              txt.Text:='';
              txt.tag:=inti;
              chk.left:=round(Parent.Width * QueryCostom1_Left);
              chk.top:=Top;
              chk.Height := QueryCostom1_Height;
              chk.width:=round(Parent.Width * QueryCostom1_width1);
              chk.Font.Size :=QueryCostom1_FontSize;
              chk.parent:=Parent;
              chk.Caption := Fieldvalues['Caption'];
              txt.top:=Top;
              txt.left:=round(Parent.Width * (QueryCostom1_Left + QueryCostom1_width1));
              txt.Height := QueryCostom1_Height;
              txt.width:=round(Parent.Width * QueryCostom1_width2);
              txt.Font.Size :=QueryCostom1_FontSize;
              txt.hint:=Fieldvalues['Datafield'];
              txt.parent:=Parent;
              top:=top + QueryCostom1_Height + QueryCostom1_Sep;
            end;
          4:begin
              txt:=TRzEdit.Create(self);
              txt.Name:='txt'+inttostr(underInt);
              txt.Text:='';
              txt.tag:=inti;
              chk:=TRzCheckBox.Create(self);
              chk.Name:='chk'+inttostr(underInt);
              chk.tag:=inti;
              chk.left:=round(Parent.Width * QueryCostom2_Left1);
              chk.top:=Top;
              chk.Height := QueryCostom2_Height;
              chk.width:=round(Parent.Width * QueryCostom2_width1);
              chk.Font.Size :=QueryCostom2_FontSize;
              chk.Caption := Fieldvalues['Caption'];
              chk.parent:=Parent;
              top:=top + QueryCostom2_SepIn + QueryCostom2_Height;
              txt.top:=Top;
              txt.left:=round(Parent.Width * QueryCostom2_Left2);
              txt.Height := QueryCostom2_Height;
              txt.width:=round(Parent.Width * QueryCostom2_width2);
              txt.Font.Size :=QueryCostom2_FontSize;
              txt.hint:=Fieldvalues['Datafield'];
              txt.parent:=Parent;
              top:=top + QueryCostom2_SepOut + QueryCostom2_Height;
            end;
        end;
        underInt:=underInt+1;
        next;
      end;
    end
    else
      application.MessageBox('此界面无查询自定义信息！','警告',mb_OK+MB_ICONWARNING);
    Active :=false;
  end;
end;

//根据数据库sys_LoadDBcustom表中的调库自定义信息完成调库工作
//BigJobName为业务大类名称，FKeyValue为要插入的外键值
//返回值表示是否完成调库
function TDM.LoadDBCustom(const BigJobName,FKeyValue:string;FormHandle:Hwnd;FormPart:integer=1):boolean;
var
  DisplayMsg,strSQL,strWhere,strDatafield,strInput:string;
  disFields,InsertTable:string;
  ChannelIndex:integer;
  bFound: boolean;
begin
  Result:=false;
  ChannelIndex:=GetChannel(FormHandle,FormPart);
  if ChannelIndex=0 then begin
    application.MessageBox('您还未按“新受理”，不能调库！','警告',mb_OK+MB_ICONWARNING);
    exit;
  end;
  with ADOQueryLoadData do begin
    Active :=false;
    SQL.Clear;
    sql.Add('select * from sys_LoadDBCustom');
    sql.add('where JobName=''' + BigJobName  + ''' order by [order]');
    Active :=true; //读取自定义信息
    First;
    while not Eof do begin
      DisplayMsg:=fieldvalues['DisplayMsg'];
      strSQL:=fieldvalues['SQL'];
      strDatafield:=fieldvalues['datafield'];
      strInput:=inputbox(application.title,DisplayMsg,'');
      inputstr:=strinput;
      disFields:=fieldvalues['disFields'];
      insertTable:=fieldvalues['InsertTable'];
      if strInput<>'' then begin
        //生成实际调库语句，有多个字段时，中间用“|”隔开
        strWhere:=GetLoadDBSql(strDatafield,strInput,'|','|');
        if strWhere='' then begin
          application.MessageBox('输入数据格式不符合要求，请重新输入！','警告',mb_OK+MB_ICONWARNING);
          exit;
        end;
        Active :=false;
        SQL.Clear;

          sql.Add(strSQl + ' where ' + strWhere);
        Active :=true;
        //调入数据
        if IsEmpty then begin
          application.MessageBox('库中无此数据，调库不成功！','警告',mb_OK+MB_ICONWARNING);
        end
        else begin
          //库中有满足条件的数据，则显示相应的信息界面
          //供用户查看及确认，多于一条的让用户进行选择
          //用户一经确认，即生成相应的明细信息和调用信息
          //同时把调库形成的信息赋给其数据库连接通道
          //这样重新查询该窗体连接的通道即可（使原窗体上有显示内容）
          bFound:=false;
          while not eof do
          begin
            if fieldvalues['altertype']=1 then
            begin
              bFound:=true;
              break;
            end;
            next;
          end;
          if not bFound then
            first
          else begin
//          if (recordcount=1) and (fieldvalues['altertype']=1) then begin //分证调库
           // strsql:='select * from sys_view_分证调库 where FID=' + vartostr(fieldvalues['房间编号']);
            active:=false;
            sql.clear;
            sql.Add(strsql);
            active:=true;
            if isempty then begin
              application.MessageBox('该证已全部转移，调库不成功！','警告',mb_OK+MB_ICONWARNING);
              active:=false;
              exit;
            end;
          end;

        end;
        active:=false;
        exit;
      end;
      next;
    end;
  end;
end;

//调用数据库的存储过程
//InputParams以“|”分隔,OutputParams为返回参数的个数，结果放在返回值中，以“|”分隔
function TDM.CallDBProc(const ProcName:string;InputParams:string='';OutputParams:smallint=1):string;
var
  inti:integer;
  strReturn:string;
begin
  with adoCmd do
  begin
    commandtext:=procName; //存储过程名必须先于参数创建
    if InputParams<>'' then begin
      for inti:=1 to Getfieldcount(inputparams,'|') do begin
        parameters.CreateParameter(inttostr(inti),ftstring,pdInput,20,Getfield(inputparams,'|',inti));
      end;
    end;
    for inti:=1 to OutputParams do begin
      parameters.CreateParameter('out' + inttostr(inti),ftstring,pdOutput,50,'');
    end;
    execute;
    strReturn:='';
    for inti:=1 to OutputParams do begin
      strReturn:=strReturn + trim({vartostr}(parameters.paramvalues['out' + inttostr(inti)])) + '|';
    end;
    Result:=copy(strReturn,1,length(strReturn)-1);
  end;
end;

//传入FormHandle，FormPart
//本过程调用存储过程 sys_sp_NewReg，获取受理编号和受理ID
//并在该窗体部分对应的ADOQuery上新建一条记录
//同时把受理编号和受理ID赋给该记录并做保存
procedure TDM.NewAcceptReg(FormHandle:Hwnd;datasource:TDataSource;sql,PKey:String;FormPart:integer=1;CursorType:TCursorType=ctKeyset;LockType:TADOLockType=ltOptimistic);
var
  ChannelIndex:integer;
  regnum,maxkey:string;
begin
  with adoCmd do
  begin
    commandtext:='sys_sp_NewRegExt'; //存储过程名必须先于参数创建
    parameters.CreateParameter('regnum',ftstring,pdOutput,20,'');
    parameters.CreateParameter('maxkey',ftstring,pdOutput,50,'');
 //   parameters.CreateParameter('userid',ftstring,pdInput,20,g_userinfo.CurrentRegInfo.JobStepID);
 //   parameters.CreateParameter('bigjob',ftstring,pdInput,20,g_userinfo.CurrentRegInfo.BigJobName);
 //   parameters.CreateParameter('jobname',ftstring,pdInput,20,g_userinfo.CurrentRegInfo.JobName);
    parameters.CreateParameter('pwd',ftstring,pdInput,10,GetRandPwd(6));
    execute;
    regnum:=parameters.paramvalues['regnum'];
    maxkey:=parameters.paramvalues['maxkey'];
  end;
  //查看是否已申请了一个ADOQuery
  ChannelIndex:=GetChannel(FormHandle,Formpart);
  if ChannelIndex=0 then //还未申请则新申请一个ADOQuery
    ChannelIndex:=ApplyChannel(FormHandle,FOrmpart);
  if ChannelIndex=0 then begin
    application.MessageBox('ADOQuery已用完！','警告',mb_OK+MB_ICONWARNING);
    exit;
  end
  else begin
    with ADOQueryArray[ChannelIndex] do
    begin
      ADOQuery.active:=false;
      ADOQuery.CursorType:= CursorType;
      ADOQuery.LockType:= LockType;
      ADOQuery.sql.Clear;
      ADOQuery.sql.add(sql);
      ADOQuery.Parameters.Paramvalues[PKey]:=0;
      ADOQuery.Prepared :=true;
      ADOQuery.active:=true;
      if ADOQuery.CanModify = false then begin
        application.MessageBox('记录集以只读方式打开，无法进行新受理！','警告',mb_OK+MB_ICONWARNING);
        exit;
      end;
      ADOQuery.insert;
      ADOQuery.fieldvalues['受理编号']:= regnum;
      ADOQuery.fieldvalues['受理ID']:= maxkey;
//      ADOQuery.fieldvalues['受理编号']:= regnum;
      ADOQuery.updatebatch;
      maxkey:= ADOQuery.fieldvalues[pkey];
      ADOQuery.Parameters.ParamValues[pkey]:=maxkey;
      ADOQuery.Prepared :=true;
      ADOQuery.Requery;
      datasource.DataSet :=ADOQuery;
    end;
  end;
end;
//处理输入框的回车查询
procedure TDM.EnterQuery(sender:TObject;forminfo:TformInfo;tableName:string;
    DarkQuery:boolean;FormHandle:Hwnd;datasource:Tdatasource;FormPart:integer=1);
var
   tempDBcombobox:TDBCOmbobox;
   TempDBEdit:TDBEdit;
   datafieldstr:string;
   sqlstr:string;
begin
   if (sender.ClassName='TDBEdit') or (sender.ClassName='TDBEditFlat') then
   begin
      tempDBedit:=sender as TDBEDit;
      datafieldstr:=tempdbedit.DataField;
      sqlstr:='select * from  '+tableName+' where '+' '
         +datafieldstr+'='+''''+tempDBedit.Text+'''';
      if darkquery then
         sqlstr:='select * from  '+tableName+' where '+' '
            +datafieldstr+' like  ''%'+tempDBedit.Text+'%'+'''';
   end;
   if (sender.ClassName='TDBComboBox') or (sender.classname='TDBComboBoxFlat') then
   begin
      tempDBcombobox:=sender as TDBComboBox;
      datafieldstr:=tempDBcombobox.DataField;
      sqlstr:='select * from  '+tableName+' where '+' '
         +datafieldstr+'='''+tempDBcombobox.Text+'''';
      if darkquery then
         sqlstr:='select * from  '+tableName+' where '+' '
            +datafieldstr+' like  ''%'+tempDBcombobox.Text+'%'+'''';
   end;
   sqlstr:=sqlstr+' and status=' + inttostr(integer(forminfo.TableState))+ ' and state=1';
   DM.LoadDataFromChannel(FormHandle,DataSource,sqlstr,FormPart);
end;

//处理注销及注销恢复
procedure TDM.logout(sender:TObject;tableName:string;whereStr:string;dataset:Tdataset);
begin
   
end;



function TDM.GetCatalogName: string;
begin
  Result:=ExtractConnStr(ADOCnn.Connectionstring,CT_INITCATALOG);
end;

function TDM.GetPrintRemark: string;
begin

end;

 

procedure TDM.dqSQLAfterInsert(DataSet: TDataSet);
{var
  fieldname: string;
  seq: Integer;  }
begin
 { if DataSet.Fields[0].DataType = ftBCD then
  begin
    fieldname := DataSet.Fields[0].FullName;
   // seq := GetNextSequence(fieldname);
    DataSet.Fields[0].AsInteger := seq;
  end; }
end;


procedure TDM.SaveAll;
begin
{
 //暂时留着
  try
     if aq.state in [dsedit,dsinsert] then
       aq.post;

     if isEdit=false then
     begin

       sSql:=
       Adocnn.Execute(sSql) ;

     end;
     showmessage('保存成功');
  except
     showmessage('保存不成功,请重新保存');
  end;  }

end;


//这里用来在装车后，包装线重启后，刷新时，对包装线重新分配车辆（每条包装线最多分配3辆车，和前台,LED显示y数量一致）
function TDM.FenPeiBzx(APackLineNO: integer): boolean;
var
 sql : string ;
begin
  //这里需要对分配包装重新分配车辆start  2013-12-21
  result:=true ;
  try
     sql:=' exec sp_SetPackLineData ';
     dm.ADOCnn.Execute(sql) ;
  except
     result:=false ;
  end;
  //这里需要对分配包装重新分配车辆 end   2013-12-21
end;



function TDM.BlankBzxWichel(APackLineNo: integer): boolean;
var
 sql : string ;
begin
//包装线停用了，需要把分配的车辆还原
  result:=true ;
  try
     sql:=' begin tran '+
          ' insert into cux_9_om_wx_ship_v '+
          ' select shipment_number,schedule_qty,schedule_count,bill_date, '+
          ' customer_number,customer_name,item_no,item_name, '+
          ' status,card_no,tool_number,address,lot_number,0,0,0 '+
          ' from pm_data '+
          ' where isnull(readok,0)<>1 and packlineno='+quotedstr(inttostr(ApackLineNo+1))+
          '  delete from pm_data '+
          ' where isnull(readok,0)<>1 and packlineno='+quotedstr(inttostr(ApackLineNo+1))+
          ' if @@error=0  commit tran  else  rollback tran ';
     dm.ADOCnn.Execute(sql) ;
  except
    Result:=false ;
  end;
end;

end.


