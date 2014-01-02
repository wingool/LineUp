//本模块提供常用的公用的一些函数和过程
//

unit FuncPackage;

interface
uses
  Windows, Classes, dialogs, Messages, Controls, SysUtils, math, ComConst, ComObj, Forms,
  jpeg, ExtCtrls, Db, dbctrls, dbgrids, Grids, ExtDlgs, Graphics, inifiles, ADODB, unitDefine,
  Buttons,StdCtrls,ComCtrls,RzEdit,TLHelp32,ShellApi;
type
  PPkeyValue=^string;
  function GetSetting(const ParentKey, Key, ValueName: string): string;
  procedure SaveSetting(const ParentKey, Key, ValueName, Value: string);
  function EnDeCode(const Value : String) : String;
  function obtainpath(Title:pchar;Owner:hwnd=0):string;
  Function GetFieldCount(const theStr,delimiter:string):integer;
  Function GetField(const theStr,delimiter:string;whichField:Integer):String;
  function GetLoadDBSql(Datafield,strInput:string;DatafieldSep:char='/';strInputSep:char='/'):string;
  procedure ClearContain(Contain:TWinControl);
  procedure InitArrayFromString(strDetail:string;var FeeArray:array of FeeDetailRowArray);
  function EximInputChar(const strInput,strLimit:string;var ReturnValue:string;blnLabel:boolean=true):boolean;
  function EximNumber(strInput:string;var ReturnValue:string;dtype:smallint=0):boolean;
  function EximNumberText(strInput:string):string;
  procedure ShowModalDLLFormByCall(ahandle:integer;ConnectionString,DLLName,ProcName:string);
  procedure ShowModalDLLFormWithSender(ahandle:integer;ConnectionString,DLLName,ProcName:string;Sender:TObject);
  procedure ShowDllFrm(AHandle: integer; ConnectionString, DllName, ProcName: string);
  procedure ShowModalDLLFormWithUserInfo(ahandle:integer;ConnectionString,DLLName,ProcName:string;UserInfo:UserInfoType;frmcaption:string);
  procedure LoadImageFromFile(Field:TField;Image:TImage=nil;JPEGSet:TJPEGDefaultsPoint=nil;blnCompress:boolean=false);
  procedure LoadImageFromImage(Field:TField;pic:TPicture;Image:TImage);
  procedure LoadImageDirectly(Field:TField;Image:TImage=nil;JPEGSet:TJPEGDefaultsPoint=nil;blnCompress:boolean=false);
  procedure ClearImageFile(sPath, sPrev, sExt: string; iLen: Integer);
  procedure DeleteAllImageFile();
  procedure SaveImageToField(Field:TField;Pic:TPicture;JPEGSet:TJPEGDefaultsPoint=nil;blnCompress:boolean=false);
  procedure ShowJpgFromDB(Field:TField;Image:TImage);
  procedure ClearImageFromDB(Field:TField;Image:TImage);
  function GetInsertSQl(Contain:TWinControl;const TableName,ctrlname:string):string;
  function SaveStringFromDisplay(Contain:TWinControl;const ctrlname:string):string;
  procedure GetDisplayFromString(DataSet:TDataSet;const SaveString:string);
  function SaveDataFieldIntoString(Contain:TWinControl;const ctrlname:string):string;
  procedure DrawDBGridCellWithColor(Sender: TObject;const Rect: TRect; DataCol: Integer; Column: TColumn;State: TGridDrawState);
  function CheckRightByRightName(HaveRight:integer;RightName:string):boolean;
  function CheckRightWithReturn(HaveRight:integer;RightName:string;var ReturnRight:integer):boolean;
  procedure ExplainUserRight(Strings:TStrings;intRight:integer);
  procedure InitSysOption(ADOCnn:TADOConnection);
  procedure InitUserOption();
  procedure DrawLineWithCanvas(Canvas:TCanvas;X1,Y1,X2,Y2:single);
  procedure DrawTextWithCanvas(Canvas:TCanvas;X1,Y1,X2,Y2:single;text:string;Align:TAlignment);
  procedure DrawVTextWithCanvas(Canvas:TCanvas;X1,Y1,X2,Y2:single;text:string);
  procedure frmbutset(pnl:Tpanel;var frmstate:Tforminfo;jobstepname:string);

  function CopyFiles(fwnd:hwnd;pcFrom,pcto:pchar;fcFlags:FILEOP_FLAGS=0):integer;
  function ExtractUserID(ConnStr: string): string;
  function ExtractPROVIDER(ConnStr: string): string;
  procedure modifyfrmbutset(frm:Tform);
  procedure InitTrvWithTwoLevel(trvlist:TTreeView;DataSet:TDataSet;Pkey,ParentField,ChildField:string;
    ParentDetail:string='';ChildDetail:string='');
  procedure setControlReadOnly(Contain:Twincontrol);
  procedure SetControlDesign(contain:Twincontrol);
  function getHardDiskID:string;
  procedure license(str,str3:string);

  function  SmalltoBig(numberformat:string):string;
  function ReplaceRtfText(rtf: TRichEdit; old,new:string):boolean;
 
  procedure ShowMsg(sCaption:string='保存成功！');
  function SaveRichEdit(RichEdit:TRichEdit;Field:TField):boolean;
  function LoadRichEdit(RichEdit:TRichEdit;Field:TField):boolean;

  function GetUniqueFileName(sPrefix, sExt: string; uUnique: UINT): string;
  function SaveFileToField(sFileName: string;Field:TField):boolean;
  function SaveFieldToFile(sFileName: string;Field:TField):boolean;
  function Roundcalculateway(Originaldata:string;remainnumber:integer;pos:boolean=false):string;
  function GetRandPwd(nLen: Integer): string;

  procedure copyfile(Sfname,Dfname:string);
  function GetLastImage(sPath, sPrev, sExt: string; iLen: Integer):string;
  function HaveExistProc(AFileName: string): Boolean ;
  procedure KillProcess(AFileName: string);
  //删除文件夹(包含里面的文件页一起删除)
  function deleteFileDirToRecyle(filePath_Name: string):boolean ;
  //清空回收站
  function EmptyRecycle:boolean ;

  function getTimetoInt(): integer ;
  function BuildSendFile(ASL:TStringList; AFileName: string): boolean; //生成文件
  function getChanelOX(chNo: integer): integer ; //获取16进制通道号
  function DataCheckJy(data: array of byte ;len: integer): integer ;
  function ReplaceContentInFile(AFilename: string ;AQuantity: integer ): boolean;
  function RefStringAll_Car(srcStr :string): string ;
  function RefStringAll_Snpz(srcStr: string): string ;
  function buildPmContent(Asnpz,ACustomCode,ACph,APhNo: string ): string ;
  function getHhLen(CarStr: string ): integer;
 // function IIF(srcS,src1,)

implementation

uses
  shlobj,adoint;


function Roundcalculateway(Originaldata:string;remainnumber:integer;pos:boolean=false):string;
var
  Decimalpointright,Decimalpointleft,Comparison:string;
  firstresult,secondresult,temp,str,Comparisonleft:string;
  init,i,j:integer;
  strarray:array[0..20] of string;
begin
  result:='';
  Decimalpointright:=getfield(Originaldata,'.',2);                     //四舍五入
  if Decimalpointright='' then
  begin
    for init:=0 to remainnumber-1 do
      temp:=temp+'0';
    if remainnumber=0 then
      firstresult:=Originaldata
    else
      firstresult:=Originaldata+'.'+temp;
  end
  else if length(Decimalpointright)<=remainnumber then
  begin
    for init:=0 to remainnumber-length(Decimalpointright)-1 do
      temp:=temp+'0';
    firstresult:=Originaldata+temp;
  end
  else
  begin
    Comparison:=copy(Decimalpointright,remainnumber+1,1);
    Decimalpointleft:=getfield(Originaldata,'.',1);
    if remainnumber=0 then
      Comparisonleft:=Decimalpointleft
    else
    begin
      str:=copy(Decimalpointright,1,remainnumber);
      Comparisonleft:=Decimalpointleft+'.'+str;
    end;
    if strtoint(Comparison)>=5 then
       firstresult:=floattostr(strtofloat(Comparisonleft)+1)
    else firstresult:=Comparisonleft;
  end;

  if pos=true then                                             //标准格式  如232,095.00
  begin
    Decimalpointleft:=getfield(firstresult,'.',1);
    Decimalpointright:=getfield(firstresult,'.',2);
    if length(Decimalpointleft)>3 then           //如果小数点左边位数大于三位，则表示形式改变
    begin
      init:=1;i:=0;
      if (length(Decimalpointleft))mod 3=0 then
      begin
        while init<=(length(Decimalpointleft)) do
        begin
          strarray[i]:=copy(Decimalpointleft,init,3);
          init:=init+3;
          i:=i+1;
        end;
        for j:=0 to i-1 do
          secondresult:=secondresult+strarray[j]+',';
        secondresult:=copy(secondresult,1,length(secondresult)-1);
      end;
      if (length(Decimalpointleft))mod 3=1 then
      begin
        strarray[0]:=copy(Decimalpointleft,init,1);
        init:=init+1;
        i:=i+1;
        while init<=(length(Decimalpointleft)) do
        begin
          strarray[i]:=copy(Decimalpointleft,init,3);
          init:=init+3;
          i:=i+1;
        end;
        for j:=0 to i-1 do
          secondresult:=secondresult+strarray[j]+',';
        secondresult:=copy(secondresult,1,length(secondresult)-1);
      end;
      if (length(Decimalpointleft))mod 3=2 then
      begin
        strarray[0]:=copy(Decimalpointleft,init,2);
        init:=init+2;
        i:=i+1;
        while init<=(length(Decimalpointleft)) do
        begin
          strarray[i]:=copy(Decimalpointleft,init,3);
          init:=init+3;
          i:=i+1;
        end;
        for j:=0 to i-1 do
          secondresult:=secondresult+strarray[j]+',';
        secondresult:=copy(secondresult,1,length(secondresult)-1);
      end;
    if remainnumber=0 then
      result:=secondresult
    else
      result:=secondresult+'.'+Decimalpointright;
    end
    else
      result:=firstresult;
  end
  else
    result:=firstresult;
end;

procedure license(str,str3:string);
//var
//  str1:string;
begin
  {if fileexists(ExtractFilePath(Application.Exename) + 'License.lic') then begin
    str1:=EnDeCode(getsetting(Application.Title,'license','SN'));
    //str2:=getharddiskID;
    if EnDeCode(str3)<>str then begin
      application.MessageBox('您不是合法用户，系统将退出，请与公司联系!','警告',MB_OK+mb_iconwarning);
      Application.Terminate;
    end;
  end
  else begin
    application.MessageBox('您不是合法用户，系统将退出，请与公司联系!','警告',MB_OK+mb_iconwarning);
    Application.Terminate;
  end;}
end;
//取得硬盘的序列号
function getHardDiskID:string;
var
  SerialNum : pdword;
  a, b : dword;
  Buffer  : array [0..255] of char;
begin
  result:='0';
  new(SerialNum);
  if GetVolumeInformation('c:\', Buffer, SizeOf(Buffer), SerialNum, a, b, nil, 0) then
    result:=IntToStr(SerialNum^);
  dispose(SerialNum);
end;

function getTimetoInt(): integer ;
var
  hh,mm,se ,MSec: word ;
begin
 // DeCodeDate(now,y,m,d);
  DeCodeTime(now,hh,mm,se,msec);

  result :=trunc(now)+hh*60+mm;

end;



procedure SetControlDesign(contain:Twincontrol);
var
  ctrl:TControl;
  inti:integer;
begin
  for inti:=0 to Contain.ControlCount-1 do begin
    ctrl:=Contain.Controls[inti];
   { if (ctrl is TdbeditFlat) then begin
      (ctrl as TdbeditFlat).readonly:=false;
    end
    else if (ctrl is TdbComboboxFlat) then begin
      (ctrl as TdbComboboxFlat).readonly:=false;
    end
    else if (ctrl is TDBGridFlat) then begin
      (ctrl as Tdbgrid).readonly:=false;
    end
    else if (ctrl is TDBmemoFlat) then begin
      (ctrl as TDBmemoFlat).readonly:=false;
    end   }
    if ctrl.ClassName='TPanel' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TFlatPanel' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TGroupBox' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TPageControl' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TTabSheet' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TBevel' then setControlReadOnly(TWinControl(ctrl));
  end;
end;

procedure setControlReadOnly(Contain:Twincontrol);
var
  ctrl:TControl;
  inti:integer;
begin
  for inti:=0 to Contain.ControlCount-1 do begin
    ctrl:=Contain.Controls[inti];
  {  if (ctrl is TdbeditFlat) then begin
      (ctrl as TdbeditFlat).readonly:=true;
    end
    else if (ctrl is TdbComboboxFlat) then begin
      (ctrl as TdbComboboxFlat).readonly:=true;
    end
    else if (ctrl is TDBGridFlat) then begin
      (ctrl as Tdbgrid).readonly:=true;
    end
    else if (ctrl is TDBmemoFlat) then begin
      (ctrl as TDBmemoFlat).readonly:=true;
    end       }
    if ctrl.ClassName='TPanel' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TFlatPanel' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TGroupBox' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TPageControl' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TTabSheet' then setControlReadOnly(TWinControl(ctrl))
    else if ctrl.ClassName='TBevel' then setControlReadOnly(TWinControl(ctrl));
  end;
end;

procedure DrawLineWithCanvas(Canvas:TCanvas;X1,Y1,X2,Y2:single);
begin
  canvas.moveto(round(x1),round(y1));
  canvas.lineto(round(x2),round(y2));
end;

procedure DrawTextWithCanvas(Canvas:TCanvas;X1,Y1,X2,Y2:single;text:string;Align:TAlignment);
var
  x,y:integer;
begin
  x:=0;
  y:=round(y1 + (y2-y1-Canvas.TextHeight(text))/2);
  case Align of
    taLeftJustify:
      x:=round(x1+2);
    taRightJustify:
      x:=round(x2-Canvas.TextWidth(text)-2);
    taCenter:
      x:=round(x1 + (x2-x1- Canvas.TextWidth(text))/2);
  end;
  Canvas.TextOut(x,y,text);
end;

procedure DrawVTextWithCanvas(Canvas:TCanvas;X1,Y1,X2,Y2:single;text:string);
var
  x,y,inti:integer;
  sep:single;
  wstr:widestring;
begin
  wstr:=text;//转化为widestring，因为string的length值按字节取，一个汉字占2位
  x:=round(x1 + (x2-x1- canvas.TextWidth(copy(wstr,1,1)))/2);
  sep:=(y2-y1-length(wstr)*canvas.textheight(wstr))/(length(wstr)+1);
  for inti:=1 to length(wstr) do begin
    y:=round(y1+sep*inti+(inti-1)*canvas.textheight(wstr));
    canvas.TextOut(x,y,copy(wstr,inti,1));
  end;
end;

function CopyFiles(fwnd:hwnd;pcFrom,pcto:pchar;fcFlags:FILEOP_FLAGS=0):integer;
var
	opStruct:TSHFileOpStruct;
begin
	with opStruct do begin
    Wnd:=fwnd;
    wFunc:=FO_copy;
    pFrom:=pcFrom;
    pto:=pcto;
    fFlags:=fcFlags;
  end;
  result:=SHFileOperation(opStruct);
end;

//显示对话框让用户指定系统路径
//Owner是窗体的Handle ,指定对话框显示在哪个窗体上
function obtainpath(Title:pchar;Owner:hwnd=0):string;
var
	 lpbi:_browseinfoA;
   pidl: PItemIDList;
   pszPath: PChar;
begin
   result:='';
   lpbi.lpszTitle:=Title;
	 lpbi.pidlRoot:=nil;
   lpbi.pszDisplayName:=stralloc(256);
   lpbi.hwndOwner:=Owner;
   lpbi.ulFlags := BIF_RETURNONLYFSDIRS;
   lpbi.lpfn:=nil;
   pidl := SHBrowseForFolderA(lpbi);
   if pidl<>nil then begin
   	  pszPath:=stralloc(256);
   		if SHGetPathFromIDListA(pidl, pszPath) then begin
      	result:=string(pszPath);
      	if result[length(result)]<>'\' then result:=result + '\';
      end;
   end;
End;

function GetSetting(const ParentKey, Key, ValueName: string): string;
var
  Size: DWord;
  RegKey: HKEY;
begin
  Result := '';
  if RegOpenKey(HKEY_LOCAL_MACHINE, PChar('SOFTWARE\BirdSoft\' + ParentKey), RegKey) = ERROR_SUCCESS then begin
    if RegOpenKey(RegKey, PChar(Key), RegKey) = ERROR_SUCCESS then
    try
      Size := 512;
      SetLength(Result, Size);
      if RegQueryValueEx(RegKey, PChar(ValueName), nil, nil, PByte(PChar(Result)), @Size) = ERROR_SUCCESS then
        SetLength(Result, Size - 1)
      else
        Result := '';
    finally
      regclosekey(Regkey);
    end;
  end;
end;

procedure SaveSetting(const ParentKey, Key, ValueName, Value: string);
var
  RegKey: HKey;
  Status, Disposition: Integer;
begin
  status:=0;
  if RegOpenKey(HKEY_LOCAL_MACHINE, PChar('SOFTWARE\'), RegKey) = ERROR_SUCCESS then begin
     Status := RegCreateKeyEx(RegKey, PChar('BirdSoft\' + ParentKey + '\' + Key), 0, '',
              REG_OPTION_NON_VOLATILE, KEY_READ or KEY_WRITE, nil, RegKey,@Disposition);
    if Status = 0 then begin
      Status := RegSetValueEx(RegKey, PChar(ValueName), 0, REG_SZ,
      PChar(Value), Length(Value) + 1);
      RegCloseKey(RegKey);
    end;
  end;
  if Status <> 0 then raise EOleRegistrationError.CreateRes(@SCreateRegKeyError);
end;

//加密和解密
function EnDeCode(const Value : String) : String;
var
  CharIndex   : Integer;
  ReturnValue : String;
  Inti:int64;
begin
  ReturnValue := Value;
  for CharIndex := 1 to Length(Value) do
  begin
    inti:= (CharIndex+10)*(CharIndex+10) mod 128;
    ReturnValue[CharIndex] := chr(inti xor ord(Value[CharIndex]));
  end;
  Result := ReturnValue;
end;

//从指定字符串中取出以指定字符串为分隔符的被分隔成的份数
Function GetFieldCount(const theStr,delimiter:string):integer;
var
  p1,p2:pchar;
  count:integer;
begin
  p1:=pchar(theStr);
  p2:=pchar(delimiter);
  p1:=strpos(p1,p2);
  count:=1;
  while p1<>nil do begin
    p1:=p1+length(delimiter);
    p1:=strpos(p1,p2);
    inc(count);
  end;
  Result:=count;
end;

//从指定字符串中取出以指定字符串为分隔符的指定部分
Function GetField(const theStr,delimiter:string;whichField:Integer):String;
var
  p1,p2,P3,p4:pchar;
  inti:integer;
begin
  Result:='';
  If (Length(theStr) = 0) Or (whichField < 1) Then begin
    Exit;
  end;
  p4:=strNew(pchar(theStr));//申请空间,把字符串复制过来，以免下面的处理破坏原字符串
  p2:=pchar(delimiter);
  p3:=p4;
  p1:=p3;
  for inti:=1 to whichField do begin
    p1:=p3;
    p3:=strpos(p1,p2);
    if p3=nil then break;
    p3:=p3+length(delimiter);
  end;
  if p3<>nil then begin
    p3:=p3-length(delimiter);
    p3^:=#0;
  end;
  if inti>=whichfield then
    Result:=string(p1);
  strdispose(p4);//释放空间
End;

//blnLabel=false ,则strInput中不允许出现strLimit中有的字符
//blnLabel=true ,则strInput中只允许出现strLimit中有的字符
//返回true表示都满足条件，false表示有不满足的字符存在（但已除掉）
//结果放在ReturnValue中
function EximInputChar(const strInput,strLimit:string;var ReturnValue:string;blnLabel:boolean=true):boolean;
var
  p1,p2:pchar;
  strValue:string;
begin
  Result:=true;
  strValue:='';
  p1:=pchar(strInput);
  while p1^<>#0 do begin
    p2:=strScan(pchar(strLimit),p1^);
    if (blnlabel and (p2<>nil)) or (not blnlabel and (p2=nil)) then
      strValue:=strValue + p1^
    else
      Result:=false;
    inc(p1);
  end;
  ReturnValue:=strValue;
end;

//检测数据类值的有效性，dtype=0表示整数，=1表示非整数
//返回true表示都满足条件，false表示有不满足的字符存在（但已除掉）
function EximNumber(strInput:string;var ReturnValue:string;dtype:smallint=0):boolean;
begin
  Result:=false;
  case dtype of
    0:if not EximInputChar(strInput,'1234567890',ReturnValue) then
     exit;
    1:if not EximInputChar(strInput,'1234567890.',ReturnValue) then
     exit;
  end;
  Result:=true;
end;

//只能输入整数
function EximNumberText(strInput:string):string;
var ReturnValue:string;
begin
  EximNumber(strInput,ReturnValue,0);
  Result:=ReturnValue;
end;

//生成调库SQL语句的where子句，有多个字段时，默认中间用“/”隔开
//无效时返回‘’,数据库字段类型均为字符串
function GetLoadDBSql(Datafield,strInput:string;DatafieldSep:char='/';strInputSep:char='/'):string;
var
  P1,P2:pchar;
  sql:string;
begin
  p1:=pchar(datafield);
  p2:=pchar(strinput);
  sql:=' ';
  while (p1^<>#0) and (p2^<>#0) do begin
    while (p1^<>datafieldsep) and (p1^<>#0) do begin
      sql:=sql + p1^;
      inc(p1);
    end;
    if p1^<>#0 then inc(p1);
    sql:=sql + '=''';
    while (p2^<>strInputsep) and (p2^<>#0) do begin
      sql:=sql + p2^;
      inc(p2);
    end;
    if p2^<>#0 then inc(p2);
    sql:=sql + ''' and '
  end;
  if (p1^<>#0) or (p2^<>#0) then
    Result:=''
  else begin
    p1:=pchar(sql);
    try
      p2:=stralloc(length(sql)-4);//先为p2分配内存
      strlcopy(p2,p1,length(sql)-5);
      Result:=string(p2);
    finally
      strdispose(p2);
    end;
  end;
end;

//清除容器内的所有控件
procedure ClearContain(Contain:TWinControl);
var
  inti:integer;
begin
  for inti:=Contain.ControlCount-1 downto 0 do
    Contain.Controls[inti].free;
end;

 
procedure InitArrayFromString(strDetail:string;var FeeArray:array of FeeDetailRowArray);
begin

end;


//调用DLL，显示模式窗体
//注意DLL的名字不区分大小写，但DLL内的过程等的名字区分大小写
procedure ShowModalDLLFormByCall(ahandle:integer;ConnectionString,DLLName,ProcName:string);
type
  TDLLProc=procedure(ahandle:integer;ConnectionString:string);safecall;
var
  LibHandle:THandle;
  DLLProc:TDLLProc;
begin
  LibHandle:=loadlibrary(pchar(DLLName));
  try
    if LibHandle=0 then
      RaiseLastWin32error;
    @DLLProc:=GetProcAddress(LibHandle,pchar(ProcName));
    if @DLLProc<>nil then
      DLLProc(ahandle,ConnectionString)
    else
      RaiseLastWin32error;
  finally
    FreeLibrary(LibHandle);
  end;
end;

procedure ShowDllFrm(AHandle: integer; ConnectionString, DllName,
  ProcName: string);
type
  TDLLProc=procedure(AHandle:integer;ConnectionString:string);safecall;
var
  LibHandle:THandle;
  DLLProc:TDLLProc;
begin
  LibHandle:=loadlibrary(pchar(DLLName));
  try
    if LibHandle=0 then
      RaiseLastWin32error;
    @DLLProc:=GetProcAddress(LibHandle,pchar(ProcName));
    if @DLLProc<>nil then
      DLLProc(application.Handle,ConnectionString)
    else
      RaiseLastWin32error;
  finally
    FreeLibrary(LibHandle);
  end;
end;

//调用DLL，该DLL内部要使用g_usrinfo
procedure ShowModalDLLFormWithUserInfo(ahandle:integer;ConnectionString,DLLName,ProcName:string;UserInfo:UserInfoType;frmcaption:string);
type
   TDLLProc=procedure(handle:integer;ConnectionString:string;UserInfo:UserInfoType;frmcaption:string);safecall;
var
   LibHandle:THandle;
   DLLProc:TDLLProc;
begin
  LibHandle:=loadlibrary(pchar(DLLName));
  try
    if LibHandle=0 then
      RaiseLastWin32error;
    @DLLProc:=GetProcAddress(LibHandle,pchar(ProcName));
    if @DLLProc<>nil then
      DLLProc(ahandle,ConnectionString,UserInfo,frmcaption)
    else
      RaiseLastWin32error;
  finally
    FreeLibrary(LibHandle);
  end;
end;

//处理中介服务动态链接库的调用
procedure CallMidDll(frmName:string;frmState:TformInfo;ConnStr:string;tabName:string);
var
  showform: procedure(Handle:HWNd;formInfo:TformInfo;
      connetstr:string;frmname:string;tableName:string);
  lib:THandle;
begin
  lib:=loadlibrary('MidCompanyManageDll.dll');
  try
    if lib=0 then
      RaiseLastWin32error;
    @showform:=GetProcAddress(lib,'ShowFormModal');
    if @showform<>nil then
      begin
        showform(application.Handle,frmstate,connStr,frmName,tabName);
      end
    else
      RaiseLastWin32error;
  finally
    FreeLibrary(lib);
  end;
end;

//调用DLL，该DLL内部要使用传入的Sender
procedure ShowModalDLLFormWithSender(ahandle:integer;ConnectionString,DLLName,ProcName:string;Sender:TObject);
type
  TDLLProc=procedure(ahandle:integer;ConnectionString:string;Sender:TObject);safecall;
var
  LibHandle:THandle;
  DLLProc:TDLLProc;
begin
  LibHandle:=loadlibrary(pchar(DLLName));
  try
    if LibHandle=0 then
      RaiseLastWin32error;
    @DLLProc:=GetProcAddress(LibHandle,pchar(ProcName));
    if @DLLProc<>nil then
      DLLProc(ahandle,ConnectionString,Sender)
    else
      RaiseLastWin32error;
  finally
    FreeLibrary(LibHandle);
  end;
end;

//清除照片
procedure ClearImageFromDB(Field:TField;Image:TImage);
begin
  if (not field.IsBlob) or field.isnull then exit;
  field.DataSet.Edit;
  field.setdata(nil);
  Image.Picture:=nil;
end;

//在Image中显示从数据库中取出的Jpg图象
procedure ShowJpgFromDB(Field:TField;Image:TImage);
var
  stream:TStream;
  jpeg:TJPEGImage;
begin
  if (not field.IsBlob) or field.isnull then begin
    image.Picture:=nil;
    exit;
  end;
  stream:=field.DataSet.CreateBlobStream(field,bmRead);
  try
    jpeg:=TJPEGImage.Create;
    try
      jpeg.LoadFromStream(stream);
      Image.Width:=round(jpeg.Width * Image.Height / jpeg.Height);
      Image.picture.Assign(jpeg);
    finally
      jpeg.Free;
    end;
  finally
    stream.Free;
  end;
end;

procedure SaveImageToField(Field:TField;Pic:TPicture;JPEGSet:TJPEGDefaultsPoint=nil;blnCompress:boolean=false);
var
  jpeg:TJPEGImage;
  stream:TStream;
begin
  jpeg:=TJPEGImage.Create;
  try
    jpeg.Assign(Pic.Graphic);
    if (JPEGSet<>nil) and blnCompress then begin
      jpeg.CompressionQuality:=JPEGSet.CompressionQuality;
      jpeg.Grayscale:=JPEGSet^.Grayscale;
      jpeg.Performance:=JPEGSet^.Performance;
      jpeg.PixelFormat:=JPEGSet^.PixelFormat;
      jpeg.ProgressiveDisplay:=JPEGSet^.ProgressiveDisplay;
      jpeg.ProgressiveEncoding:=JPEGSet^.ProgressiveEncoding;
      jpeg.Scale:=JPEGSet^.Scale;
      jpeg.Smoothing:=JPEGSet^.Smoothing;
      jpeg.Compress; //压缩
    end;
    field.DataSet.Edit;
    stream:=field.DataSet.CreateBlobStream(field,bmWrite);
//    field.DataSet.Post ;    // hjm
    try
//      field.DataSet.Edit ;   // hjm
      jpeg.SaveToStream(stream);
      (field as TBlobField).loadfromstream(stream);
    finally
      stream.Free;
      field.DataSet.Post ;
    end;
  finally
    jpeg.free;
  end;
end;
//从文件中读取图片，并把它存入对应的字段中（还为保存）
//blnCompress表示是否压缩，CompressionQuality为压缩的质量
procedure LoadImageFromFile(Field:TField;Image:TImage=nil;JPEGSet:TJPEGDefaultsPoint=nil;blnCompress:boolean=false);
var
  pic:TPicture;
  openPicDlg:TOpenPictureDialog;
begin
  if (not field.IsBlob) then exit;
  openPicDlg:=TOpenPictureDialog.Create(Application);
  if openPicDlg.Execute then begin
    pic:=TPicture.Create;
    try
      pic.LoadFromFile(openPicDlg.filename);
      SaveImageToField(Field,pic,JPEGSet,blnCompress and (Lowercase(ExtractFileExt(openPicDlg.filename))<>'.jpg'));
      if image<>nil then begin
        Image.Width:=round(pic.Width * Image.Height / pic.Height);
        Image.picture.Assign(pic);
      end;
    finally
      pic.free;
    end;
  end;
end;
//blnCompress表示是否压缩，CompressionQuality为压缩的质量
procedure LoadImageFromImage(Field:TField;pic:TPicture;Image:TImage);
begin
  if (not field.IsBlob) then exit;
  SaveImageToField(Field,pic,nil,true);
  Image.picture.Assign(pic);
end;
//删除在指定路径下的图片文件（数码相机拍摄的）
procedure ClearImageFile(sPath, sPrev, sExt: string; iLen: Integer);
var
  sr: TSearchRec;
begin
  if FindFirst(sPath+sPrev+'*'+sExt, faDirectory, sr) = 0 then
  begin
    DeleteFile(sPath+sr.Name);
    while FindNext(sr) = 0 do
      DeleteFile(sPath+sr.Name);
    FindClose(sr);
  end;
end;
//删除在指定路径下的图片文件（数码相机拍摄的）
procedure DeleteAllImageFile();
var
  sPath:string;
begin
  sPath:=GetSetting(application.Title,'syspath','LoadPicPath');
  if sPath='' then
    exit;
  ClearImageFile(sPath,'Capture_','.jpg',5);
end;
//获取最大的拍摄文件（照片）
//sPath为路径（含'\'），sPrev为前缀，sExt为扩展名（包含‘，’），
//iLen为查找最大部分的长度
// Capture_00015.JPG
function GetLastImage(sPath, sPrev, sExt: string; iLen: Integer):string;
var
  sr: TSearchRec;
  iCount : Integer;
begin
 // Index:=length(sPrev)+1;
  if FindFirst(sPath+sPrev+'*'+sExt, faDirectory, sr) = 0 then
  begin
    iCount:=1;

    FindClose(sr);
    if iCount>50 then  //多过一定的数量，可进行删除
    begin

    end;
  end;
  if length(sr.name)<10 then
   Result:=''
  else
   Result:=sPath+sr.Name;

end;

//直接从数码相机存放图片的位置载入图片
procedure LoadImageDirectly(Field:TField;Image:TImage;JPEGSet:TJPEGDefaultsPoint;blnCompress:boolean);
var
  pic:TPicture;
  sFile, sPath:string;
begin
  if (not field.IsBlob) then
    exit;
  sPath:=GetSetting(application.Title,'syspath','LoadPicPath');
  sFile:=GetLastImage(sPath,'Capture_','.jpg',5);
  if sFile='' then
  begin
    application.MessageBox('找不到照片文件，请查看路径是否指定正确！','警告',mb_Ok+mb_Iconwarning);
    exit;
  end;
  pic:=TPicture.Create;
  try
    pic.LoadFromFile(sFile);
    SaveImageToField(Field,pic,JPEGSet,blnCompress and (Lowercase(ExtractFileExt(sFile))<>'.jpg'));
    if image<>nil then
    begin
      Image.Width:=round(pic.Width * Image.Height / pic.Height);
      Image.Picture.Assign(pic);
    end;
  finally
    pic.free;
  end;
end;
//传入一容器，根据ctrlname的值（如：pagea,pageb等），
//是容器内控件名称的部分，以此来判断是否生成进InsertSql
function GetInsertSQl(Contain:TWinControl;const TableName,ctrlname:string):string;
var
  strSql,strValue:string;
  ctrl:TControl;
  inti:integer;
  blnHaveField:boolean; //标记是否有生成Insert语句的字段
begin
  blnHaveField:=false;
  strsql:='insert into ' + tablename + '(';
  strvalue:=' values(';
  for inti:=0 to contain.ControlCount-1 do begin
    ctrl:=contain.Controls[inti];
    if pos(Lowercase(ctrl.Name),Lowercase(ctrlname))>0 then continue;

    if (ctrl is TDBComboBox) or (ctrl is TDBComboBox) then begin
      if (ctrl as TDBComboBox).text ='' then continue;
      blnHaveField:=true;
      strsql:=strsql + (ctrl as TDBComboBox).datafield + ',';
      strvalue:=strvalue + (ctrl as TDBComboBox).text + ',';
    end;
  end;
  if blnHaveField then
    Result:=copy(strsql,1,length(strsql)-1) + ') ' + copy(strvalue,1,length(strvalue)-1) + ')'
  else
    Result:='';
end;

//把界面上的显示存成一字符串，格式为“字段名|字段值||。。。”
//传入一容器，根据ctrlname的值（如：pagea,pageb等），
//是容器内控件名称的部分，以此来判断是否生成进返回的字符串
function SaveStringFromDisplay(Contain:TWinControl;const ctrlname:string):string;
var
  strValue:string;
  ctrl:TControl;
  inti:integer;
begin
  strValue:='';
  for inti:=0 to contain.ControlCount-1 do begin
    ctrl:=contain.Controls[inti];
    if pos(Lowercase(ctrlname),Lowercase(ctrl.Name))=0 then continue;
    if (ctrl is TDBComboBox)   then
    begin
      if (ctrl as TDBComboBox).text ='' then continue;
      strvalue:=strvalue + (ctrl as TDBComboBox).datafield + '|' + (ctrl as TDBComboBox).text + '||';
    end;
  end;
  Result:=copy(strvalue,1,length(strvalue)-2);
end;

//把传入的字符串还原成界面上的显示，字符串格式为“字段名|字段值||。。。”
procedure GetDisplayFromString(DataSet:TDataSet;const SaveString:string);
var
  strValue:string;
  inti:integer;
begin
  if SaveString='' then exit;
  with dataset do begin
    if dataset.state<>dsInsert then Edit;
    for inti:=1 to GetFieldCount(SaveString,'||') do begin
      strValue:=GetField(savestring,'||',inti);
      FieldValues[getfield(strvalue,'|',1)]:=getfield(strvalue,'|',2);
    end;
  end;
end;

//把所有要引入数据的字段组合成一字符串，以便在UnitConfirm中使用
function SaveDataFieldIntoString(Contain:TWinControl;const ctrlname:string):string;
var
  strValue:string;
  ctrl:TControl;
  inti:integer;
begin
  strValue:='';
  for inti:=0 to contain.ControlCount-1 do begin
    ctrl:=contain.Controls[inti];
    if pos(Lowercase(ctrlname),Lowercase(ctrl.Name))=0 then continue;
    if (ctrl is TDBComboBox)  then begin
      strvalue:=strvalue + (ctrl as TDBComboBox).datafield + ',';
    end;
  end;
  Result:=copy(strvalue,1,length(strvalue)-1);
end;

procedure DrawDBGridCellWithColor(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

begin

end;

//RightName为传入管理权限名字，HaveRight为用户的管理权限值，ReturnRight返回该权限的Integer值
//当用户权限包含传入权限时返回true,否则返回false
function CheckRightWithReturn(HaveRight:integer;RightName:string;var ReturnRight:integer):boolean;
var
  inti:smallint;
begin
  for inti:=1 to 31 do
    if cstRightDescribe[inti]=RightName then break;
  if inti>31 then begin
    ReturnRight:=0;
    Result:=false;
  end
  else begin
    ReturnRight:=1 shl (inti-1);
    Result:=(HaveRight div ReturnRight) mod 2 = 1
  end
end;

//RightName为传入管理权限名字，HaveRight为用户的管理权限值
//当用户权限包含传入权限时返回true,否则返回false
function CheckRightByRightName(HaveRight:integer;RightName:string):boolean;
var
  inti:smallint;
  intRight:integer;
begin
  for inti:=1 to 31 do
    if cstRightDescribe[inti]=RightName then break;
  if inti>31 then begin
    Result:=false;
  end
  else begin
    intRight:=1 shl (inti-1);
    Result:=(HaveRight div intRight) mod 2 = 1
  end
end;

//解释授权用户权限
procedure ExplainUserRight(Strings:TStrings;intRight:integer);
var
  inti:smallint;
  rightint:integer;
begin
  strings.Clear;
  rightint:=intRight;
  for inti:=1 to 31 do begin
    if (rightint mod 2) = 1 then
      strings.Add(cstRightDescribe[inti]);
    rightint:=rightint shr 1; //右移一位
  end;
end;

//初始化系统选项
procedure InitSysOption(ADOCnn:TADOConnection);
begin

end;

//初始化用户选项
procedure InitUserOption();
var
  inifile:TIniFile;
begin
  inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
  cstPreYjNumber:=inifile.ReadInteger('Sys_Param','cstPreYjNumber',10);
  cstStopAndTurnTime:=inifile.ReadInteger('Sys_Param','cstScsttopAndTurnTime',2);
 // cstWaitTime:=inifile.ReadInteger('Sys_Param','cstWaitTime',5);
  cstBackNumber:=inifile.ReadInteger('Sys_Param','cstBackNumber',5);
  cstPageViewpkgLine:=inifile.ReadInteger('Sys_Param','cstPageViewpkgLine',4);
  cstUsePkgLine:=inifile.ReadInteger('Sys_Param','cstUsePkgLine',2); //有几条包装线
  cstDkqCk :=inifile.ReadString('Sys_Param','dkq_ck','0');  //读卡器串口
  cstDkqBtl :=inifile.ReadString('Sys_Param','dkq_btl','288000'); //读卡器比特率
  cstDkqCssksj:=inifile.ReadInteger('Sys_Param','dkq_cssksj',120);//超时刷卡时间（秒）
  cstlength:=inifile.ReadInteger('Sys_Param','cstLength',16);
  cstPreShuaKa:=inifile.ReadInteger('Sys_Param','cstPreShuaKa',0);//是否允许提前刷卡；0不允许；1允许
  cstAutoRefresh:=inifile.ReadInteger('Sys_Param','AutoRefresh',0) ; //0不启用 ，1-30分钟
  cstStartAutoRefeshNum:=inifile.ReadInteger('Sys_Param','AutoRefresh',50) ;//要启用自动刷新必须是当前包装中大于才启动
  cstTimerNum:=inifile.ReadInteger('Sys_Param','cstTimerNum',3) ;//启用几个定时器后如果不来刷卡，把当前车排在最后
  cstCanModifyPacket:=inifile.readbool('Sys_Param','cstCanModifyPacket',false) ; //是否允许补包

  if cstTimerNum<=0 then
     cstTimerNum:=3;
  if cstStartAutoRefeshNum<40 then
    cstStartAutoRefeshNum:=40 ; //只要还余40包才启动，否则不启用自动刷新
  inifile.Free;
end;

//设置各窗体按钮的显示
procedure frmbutset(pnl:TPanel;var frmstate:Tforminfo;jobstepname:string);  //初始化窗体按钮
var
   inti:integer;
begin
  with pnl do
  begin
    for inti:=0 to Controlcount-1  do
    begin
	    if Controls[inti].ClassType=TRzEdit then
      begin


      end;
    end;
  end;
end;



function ExtractUserID(ConnStr: string): string;
var
  UIDPos, UIDLen: Integer;
begin
  UIDPos := Pos(CT_USERID, AnsiUpperCase(ConnStr)) + Length(CT_USERID);
  if UIDPos > Length(CT_USERID) then
  begin
    UIDLen := Pos(';', Copy(ConnStr, UIDPos, 255)) - 1;
    Result := Copy(ConnStr, UIDPos, UIDLen);
  end else
    Result := '';
end;

function ExtractPROVIDER(ConnStr: string): string;
var
  UIDPos, UIDLen: Integer;
begin
  UIDPos := Pos(CT_PROVIDER, AnsiUpperCase(ConnStr)) + Length(CT_PROVIDER);
  if UIDPos > Length(CT_PROVIDER) then
  begin
    UIDLen := Pos(';', Copy(ConnStr, UIDPos, 255)) - 1;
    Result := Copy(ConnStr, UIDPos, UIDLen);
  end else
    Result := '';
end;

//是否显示定义窗体按钮
procedure modifyfrmbutset(frm:Tform);
var
   intj:integer;
begin
   for intj:=0 to frm.ComponentCount-1 do begin
      if frm.components[intj].ClassType=tspeedbutton then begin
         if (frm.Components[intj] as tspeedbutton).caption='+' then begin
            if cstModifyform then (frm.Components[intj] as tspeedbutton).Visible:=true
            else (frm.Components[intj] as tspeedbutton).Visible:=false;
         end;
      end;
   end;
end;
//ParentDetail, ChildDetail用于相应接点text的辅助显示
//如: ParentDetail='第?层',则用对应的字段值取代？形成最终的text
procedure InitTrvWithTwoLevel(trvlist:TTreeView;DataSet:TDataSet;Pkey,ParentField,ChildField:string;
  ParentDetail:string='';ChildDetail:string='');
var
  strParent,strChild,strPre:string;
  p1:PPkeyValue;
  inti:integer;
  tParent,firstNode:TTreeNode;
begin
  with trvList do begin
    for inti:=1 to Items.Count-1 do
      if items[inti].Data<>nil then dispose(items[inti].Data);
    Items[0].DeleteChildren;
    firstNode:=items[0];
    tParent:=firstnode;
    if dataset.IsEmpty then exit;
    strPre:='-1';
    dataset.first;
    while not dataset.eof do begin
      strParent:=dataset.FieldByName(ParentField).asstring;
      if strParent<>strPre then begin
        strPre:=strParent;
        if ParentDetail<>'' then
          strParent:=stringreplace(ParentDetail,'?',strParent,[]);
        tParent:=items.Addchildobject(firstNode,strParent,nil);
      end;
      new(p1);
      p1^:=dataset.fieldbyname(pkey).asstring;
      strchild:=dataset.fieldbyname(childfield).asstring;
      if childDetail<>'' then
        strChild:=stringreplace(Childdetail,'?',strChild,[]);
      items.Addchildobject(tParent,strChild,p1);
      dataset.next;
    end;
    firstnode.Expand(false);
  end;
end;


procedure ShowMsg(sCaption:string);
begin
  Application.MessageBox(pchar(sCaption),'提示',mb_ok+mb_iconInformation);
end;

function SaveRichEdit(RichEdit:TRichEdit;Field:TField):boolean;
var
  stream:TMemoryStream;
begin
  Result:=false;
  if not field.IsBlob then exit;
  try
    stream:=TMemoryStream.Create; //TStream不行，TMemoryStream可以
    try
      RichEdit.Lines.SaveToStream(stream);
      (field as TBlobField).LoadFromStream(stream);
    finally
      stream.Free;
    end;
    Result:=true;
  except
    Result:=false;
  end;
end;

function LoadRichEdit(RichEdit:TRichEdit;Field:TField):boolean;
var
  stream:TStream;
begin
  Result:=false;
  if not field.IsBlob then exit;
  try
    stream:=field.DataSet.CreateBlobStream(field,bmRead);
    try
      RichEdit.Lines.LoadFromStream(stream);
    finally
      stream.Free;
    end;
    Result:=true;
  except
    Result:=false;
  end;
end;

function GetUniqueFileName(sPrefix, sExt: string; uUnique: UINT): string;
var
  sTempPath, sFileName: pchar;
begin
  Result:='';
  GetMem(sTempPath, 256);
  try
    if GetTempPath(256, sTempPath)<>0 then
    begin
      GetMem(sFileName, 256);
      try
        if GetTempFileName(sTempPath, pchar(sPrefix), uUnique, sFileName)<>0 then
        begin
          Result:=ChangeFileExt(string(sFileName),sExt);
        end;
      finally
        freeMem(sFileName);
      end;
    end;
  finally
    FreeMem(sTempPath);
  end;
end;

function SaveFileToField(sFileName: string;Field:TField):boolean;
var
  stream:TFileStream;
begin
  Result:=false;
  if not field.IsBlob then exit;
  try
    stream:=TFileStream.Create(sFileName,fmOpenRead); //TStream不行，TMemoryStream可以
    try
      (field as TBlobField).LoadFromStream(stream);
    finally
      stream.Free;
    end;
    Result:=true;
  except
    Result:=false;
  end;
end;

function SaveFieldToFile(sFileName: string;Field:TField):boolean;
var
  stream:TStream;
  ms: TMemoryStream;
  fs: TFileStream;
begin
  Result:=false;
  if not field.IsBlob then exit;
  try
    stream:=field.DataSet.CreateBlobStream(field,bmRead);
    try
      ms:=TMemoryStream.Create;
      try
        ms.LoadFromStream(stream);
        fs:=TFileStream.Create(sFileName,fmCreate); //TStream不行，TMemoryStream可以
        try
          ms.SaveToStream(fs);
        finally
          fs.free;
        end;
      finally
        ms.Free;
      end;
    finally
      stream.Free;
    end;
    Result:=true;
  except
    Result:=false;
  end;
end;

function SmalltoBig(numberformat:string):string;
var
  bigformat:string;
  wei1,qianwei1:string[2];
  qianwei,dianweizhi,qian:integer;
begin
  dianweizhi:=pos('.',numberformat);//小数点的位置
  if dianweizhi=0 then
    qianwei:=0
  else
    qianwei:=dianweizhi-length(numberformat);
  //循环小写贷币的每一位，从小写的右边位置到左边
  for qian:=length(numberformat) downto 1 do begin
    if qian<>dianweizhi then begin//如果读到的不是小数点就继续
      case strtoint(copy(numberformat,qian,1)) of //位置上的数转换成大写
        1:wei1:='壹';
        2:wei1:='贰';
        3:wei1:='叁';
        4:wei1:='肆';
        5:wei1:='伍';
        6:wei1:='陆';
        7:wei1:='柒';
        8:wei1:='捌';
        9:wei1:='玖';
        0:wei1:='零';
      end;
      case qianwei of //判断大写位置，可以继续增大到real类型的最大值
        -3:qianwei1:='厘';
        -2:qianwei1:='分';
        -1:qianwei1:='角';
        0:qianwei1:='元';
        1:qianwei1:='拾';
        2:qianwei1:='佰';
        3:qianwei1:='千';
        4:qianwei1:='万';
        5:qianwei1:='拾';
        6:qianwei1:='佰';
        7:qianwei1:='千';
        8:qianwei1:='亿';
        9:qianwei1:='十';
        10:qianwei1:='佰';
        11:qianwei1:='千';
      end;
      inc(qianwei);
      bigformat:=wei1+qianwei1+bigformat;//组合成大写金额
    end;
    smalltobig:=bigformat;
  end;
end;

//返回值表示是否成功替换
function ReplaceRtfText(rtf: TRichEdit; old,new:string):boolean;
var
	inti:integer;
begin
  Result:=false;
  with Rtf do begin
    inti:=FindText(old,1,length(text),[]);
	  if inti<>-1 then begin
      SelStart:=inti;
      SelLength:=length(old);
      SelText:=new;
      Result:=true;
    end;
  end;
end;

//设置房屋的限制颜色



function GetRandPwd(nLen: Integer): string;
var
  i: Integer;
  pwd: string;
begin
  pwd:='';
  Randomize;
  for i:=1 to nLen do
    pwd:=pwd+IntToStr(trunc(10*random));
  Result:=pwd;
end;

procedure copyfile(Sfname,Dfname:string);//带路径的文件名；
Var
Sourcef,Destinef:file;
NumRead,NumWritten:Integer;
Buf:array[1..4096] of char;//定义缓冲区；
Begin
  {$I-}
  AssignFile(Sourcef,Sfname);
  Reset(Sourcef,1);
  AssignFile(Destinef,Dfname);
  Rewrite(Destinef,1);
  {$I+}
  Repeat
    BlockRead(Sourcef,Buf,SizeOf(Buf),Numread);//读源文件
    BlockWrite(destinef,buf,NumRead,NumWritten);//写目标文件；
  Until (Numread=0) or (Numwritten<>numread);
  closeFile(sourcef);
  Closefile(destinef);
end;

function HaveExistProc(AFileName: string): Boolean ;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapShotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result :=false ;
  FSnapShotHandle := CreateToolhelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(AFileName)) or
        (UpperCase(FProcessEntry32.szExeFile ) =UpperCase(AFileName))) then
    begin
      Result :=True ;
      Break ;
    end
    else
      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);

  end;

end;

procedure KillProcess(AFileName: string);
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapShotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapShotHandle := CreateToolhelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(AFileName)) or
        (UpperCase(FProcessEntry32.szExeFile ) =UpperCase(AFileName))) then
      TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),FProcessEntry32.th32ProcessID), 0);

      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

end;

//删除文件夹(包含里面的文件页一起删除)
function deleteFileDirToRecyle(filePath_Name: string):boolean ;
var
  Tfos:TSHFileOpStruct;
  P:String;
begin
   P:=filePath_Name;
   fillchar(Tfos,Sizeof(Tfos),0);
   with Tfos do
   begin
      wnd:=0;
      wFunc:=FO_Delete;
      pFrom:=Pchar(p+#0);
      pTo:=Pchar(p+#0);
      fFlags:=FOF_ALLOWUNDO+FOF_NOERRORUI+FOF_NOCONFIRMATION;
      hNameMappings:=nil;
     // lpszProgressTitle:='正在删除文件夹';
       fAnyOperationsAborted:=false;
   end;
   Result:=(SHFileOperation(Tfos)=0) ;  //成功的话返回0,否则表示失败

end;

function EmptyRecycle:boolean ;
const
   SHERB_NOCONFIRMATION = $00000001;
   SHERB_NOPROGRESSUI = $00000002;
   SHERB_NOSOUND = $00000004;
   type
      TSHEmptyRecycleBin = function (Wnd: HWND;LPCTSTR: PChar;DWORD: Word): integer; stdcall;
var
   SHEmptyRecycleBin: TSHEmptyRecycleBin;
   LibHandle: THandle;
begin
   LibHandle := LoadLibrary(PChar('Shell32.dll'));
   if LibHandle <> 0 then
      @SHEmptyRecycleBin := GetProcAddress(LibHandle, 'SHEmptyRecycleBinA')
   else
   begin
      MessageDlg('Failed to load Shell32.dll.', mtError, [mbOK], 0);
      Exit;
   end;
   if @SHEmptyRecycleBin <> nil then
      SHEmptyRecycleBin(Application.Handle,'',
      SHERB_NOCONFIRMATION or
      SHERB_NOPROGRESSUI or
      SHERB_NOSOUND);

   FreeLibrary(LibHandle);
   @SHEmptyRecycleBin := nil;
end;

function BuildSendFile(ASL:TStringList; AFileName: string): boolean;
var
  F:TextFile;
  i:integer ;
  s : string ;
begin
{  result:=false ;
  AssignFile(F,AFileName);
  Rewrite(F);
  writeLn(f,AContent);
  Closefile(f);
  Result:=true ; }
  result:=false ;
  AssignFile(F,AFileName);
  Rewrite(F);
  try
    for i:=0 to Asl.Count-1 do
    begin 
       s:=Asl.Strings[i];
     //  while length(s)<17 do
      //  s:=s+' ';
      // showmessage('writeFile_'+s);
       writeLn(f,s);
    end;
  finally
    Closefile(f);
  end;
end;

function getChanelOX(chNo: integer): integer ; //获取16进制通道号
begin
  result:=$30+chno ;
 // result:=$31 ;

end;

function DataCheckJy(data:array of byte ;len: integer): integer ;
var
  i,j,c: integer ;
  cc: byte ;
begin
  c:=0 ;
  for i:=0 to len-1 do
  begin
    c:=c xor data[i];
    for j:=0 to 7 do
    begin
       c:=c*2;
       if c<256 then
         continue;
       c:=c-256;
       c:=c xor $31;
    end
  end ;
  cc := c;
  result:= cc;

end;

function ReplaceContentInFile(AFilename: string ;AQuantity: integer ): boolean;
var
  loadts : TstringList;
  s1,s  : string ;
begin
  Result:=true ;
  loadts:=TstringList.Create;

  s1:=inttostr(AQuantity);

  while length(s1)<4 do
    s1:='0'+s1 ;

  loadts.LoadFromFile(AFileName);
  if loadts.Count>=2 then
  begin
     s:=loadts.Strings[1];
     delete(s,length(s)-4,maxint);
     s:=s+s1 ;
     loadts.Strings[1]:=s+' ' ;
  end;
  loadts.SaveToFile(AFileName);
  loadts.Free ;
end;

function RefStringAll_Car(srcStr :string): string ;
var
  s : string ;
begin
  s:= stringreplace(srcStr,'-','',[rfReplaceAll]) ;
  s:= stringreplace(s,'.','',[rfReplaceAll]) ;
  while  length(s)<8 do     //如果小于8则补空
    s:=s+' ' ;
  result:=s ;
end;

function RefStringAll_Snpz(srcStr :string): string ;
var
  s : string ;
begin
  s:=srcStr ;//水泥品种
 { s:=stringreplace(s,'(','',[rfReplaceAll]);
  s:=stringreplace(s,'（','',[rfReplaceAll]);
  s:=stringreplace(s,')','',[rfReplaceAll]);
  s:=stringreplace(s,'）','',[rfReplaceAll]);
  s:=stringreplace(s,'袋装','',[rfReplaceAll]);
  s:=stringreplace(s,'散装','',[rfReplaceAll]);
  s:=stringreplace(s,'贡江PC','贡 ',[rfReplaceAll]) ;
  s:=stringreplace(s,'贡江PO','贡 ',[rfReplaceAll]) ;
  s:=stringreplace(s,'P.','P',[rfIgnoreCase]) ;
  }
  if pos('P·C_32.5R_',s )>0 then
     s:='PC32.5R'
  else if pos('P·O_42.5_',s )>0 then
     s:='PO42.5'
  else if pos('P·C_32.5_',s )>0 then
     s:='PC32.5' ;
  s:=stringreplace(s,'.','',[rfIgnoreCase]) ;
  result:=s ;

end;

function buildPmContent(Asnpz,ACustomCode,ACph,APhNo: string ): string ;
var
   yyy,mm,dd : word ;
   syyy,smm,sdd,ssnpz,sCph,sNo: string ;
begin
   decodedate(now,yyy,mm,dd);
   syyy:=inttostr(yyy);
   smm:=inttostr(mm);
   sdd:=inttostr(dd);
   if length(syyy)=4 then
     syyy:=copy(syyy,3,2);
   if length(smm)>2 then
     smm:='0'+smm ;
   ssnpz:=uppercase(Asnpz) ;
   ssnpz:=RefStringAll_Snpz(ssnpz);
   if ssnpz='PC32.5R' then
     ssnpz:='FRD'
   else if ssnpz='PO42.5' then
     ssnpz:='PO'
   else if ssnpz='PC32.5' then
     ssnpz:='FD';
   sCph:=trim(copy(ACph,length(ACph)-3,4)) ;

   //原先是  13FRD12258 只有 最后的258需要输入
   //result:=syyy+ssnpz+smm+APhNo+' '+ACustomCode+' '+sCph  ;
   //现在是 整个就是输入的批号
   result:=APhNo+' '+ACustomCode+' '+sCph  ;
end;

//根据车牌的长度决定 货号可以显示的长度
function getHhLen(CarStr: string ): integer;
begin
  //16是液晶屏一行显示的字符串最长长度
  result := 16-Length(CarStr);
end;

end.
