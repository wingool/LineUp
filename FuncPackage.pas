//��ģ���ṩ���õĹ��õ�һЩ�����͹���
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
 
  procedure ShowMsg(sCaption:string='����ɹ���');
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
  //ɾ���ļ���(����������ļ�ҳһ��ɾ��)
  function deleteFileDirToRecyle(filePath_Name: string):boolean ;
  //��ջ���վ
  function EmptyRecycle:boolean ;

  function getTimetoInt(): integer ;
  function BuildSendFile(ASL:TStringList; AFileName: string): boolean; //�����ļ�
  function getChanelOX(chNo: integer): integer ; //��ȡ16����ͨ����
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
  Decimalpointright:=getfield(Originaldata,'.',2);                     //��������
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

  if pos=true then                                             //��׼��ʽ  ��232,095.00
  begin
    Decimalpointleft:=getfield(firstresult,'.',1);
    Decimalpointright:=getfield(firstresult,'.',2);
    if length(Decimalpointleft)>3 then           //���С�������λ��������λ�����ʾ��ʽ�ı�
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
      application.MessageBox('�����ǺϷ��û���ϵͳ���˳������빫˾��ϵ!','����',MB_OK+mb_iconwarning);
      Application.Terminate;
    end;
  end
  else begin
    application.MessageBox('�����ǺϷ��û���ϵͳ���˳������빫˾��ϵ!','����',MB_OK+mb_iconwarning);
    Application.Terminate;
  end;}
end;
//ȡ��Ӳ�̵����к�
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
  wstr:=text;//ת��Ϊwidestring����Ϊstring��lengthֵ���ֽ�ȡ��һ������ռ2λ
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

//��ʾ�Ի������û�ָ��ϵͳ·��
//Owner�Ǵ����Handle ,ָ���Ի�����ʾ���ĸ�������
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

//���ܺͽ���
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

//��ָ���ַ�����ȡ����ָ���ַ���Ϊ�ָ����ı��ָ��ɵķ���
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

//��ָ���ַ�����ȡ����ָ���ַ���Ϊ�ָ�����ָ������
Function GetField(const theStr,delimiter:string;whichField:Integer):String;
var
  p1,p2,P3,p4:pchar;
  inti:integer;
begin
  Result:='';
  If (Length(theStr) = 0) Or (whichField < 1) Then begin
    Exit;
  end;
  p4:=strNew(pchar(theStr));//����ռ�,���ַ������ƹ�������������Ĵ����ƻ�ԭ�ַ���
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
  strdispose(p4);//�ͷſռ�
End;

//blnLabel=false ,��strInput�в��������strLimit���е��ַ�
//blnLabel=true ,��strInput��ֻ�������strLimit���е��ַ�
//����true��ʾ������������false��ʾ�в�������ַ����ڣ����ѳ�����
//�������ReturnValue��
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

//���������ֵ����Ч�ԣ�dtype=0��ʾ������=1��ʾ������
//����true��ʾ������������false��ʾ�в�������ַ����ڣ����ѳ�����
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

//ֻ����������
function EximNumberText(strInput:string):string;
var ReturnValue:string;
begin
  EximNumber(strInput,ReturnValue,0);
  Result:=ReturnValue;
end;

//���ɵ���SQL����where�Ӿ䣬�ж���ֶ�ʱ��Ĭ���м��á�/������
//��Чʱ���ء���,���ݿ��ֶ����;�Ϊ�ַ���
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
      p2:=stralloc(length(sql)-4);//��Ϊp2�����ڴ�
      strlcopy(p2,p1,length(sql)-5);
      Result:=string(p2);
    finally
      strdispose(p2);
    end;
  end;
end;

//��������ڵ����пؼ�
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


//����DLL����ʾģʽ����
//ע��DLL�����ֲ����ִ�Сд����DLL�ڵĹ��̵ȵ��������ִ�Сд
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

//����DLL����DLL�ڲ�Ҫʹ��g_usrinfo
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

//�����н����̬���ӿ�ĵ���
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

//����DLL����DLL�ڲ�Ҫʹ�ô����Sender
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

//�����Ƭ
procedure ClearImageFromDB(Field:TField;Image:TImage);
begin
  if (not field.IsBlob) or field.isnull then exit;
  field.DataSet.Edit;
  field.setdata(nil);
  Image.Picture:=nil;
end;

//��Image����ʾ�����ݿ���ȡ����Jpgͼ��
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
      jpeg.Compress; //ѹ��
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
//���ļ��ж�ȡͼƬ�������������Ӧ���ֶ��У���Ϊ���棩
//blnCompress��ʾ�Ƿ�ѹ����CompressionQualityΪѹ��������
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
//blnCompress��ʾ�Ƿ�ѹ����CompressionQualityΪѹ��������
procedure LoadImageFromImage(Field:TField;pic:TPicture;Image:TImage);
begin
  if (not field.IsBlob) then exit;
  SaveImageToField(Field,pic,nil,true);
  Image.picture.Assign(pic);
end;
//ɾ����ָ��·���µ�ͼƬ�ļ��������������ģ�
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
//ɾ����ָ��·���µ�ͼƬ�ļ��������������ģ�
procedure DeleteAllImageFile();
var
  sPath:string;
begin
  sPath:=GetSetting(application.Title,'syspath','LoadPicPath');
  if sPath='' then
    exit;
  ClearImageFile(sPath,'Capture_','.jpg',5);
end;
//��ȡ���������ļ�����Ƭ��
//sPathΪ·������'\'����sPrevΪǰ׺��sExtΪ��չ������������������
//iLenΪ������󲿷ֵĳ���
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
    if iCount>50 then  //���һ�����������ɽ���ɾ��
    begin

    end;
  end;
  if length(sr.name)<10 then
   Result:=''
  else
   Result:=sPath+sr.Name;

end;

//ֱ�Ӵ�����������ͼƬ��λ������ͼƬ
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
    application.MessageBox('�Ҳ�����Ƭ�ļ�����鿴·���Ƿ�ָ����ȷ��','����',mb_Ok+mb_Iconwarning);
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
//����һ����������ctrlname��ֵ���磺pagea,pageb�ȣ���
//�������ڿؼ����ƵĲ��֣��Դ����ж��Ƿ����ɽ�InsertSql
function GetInsertSQl(Contain:TWinControl;const TableName,ctrlname:string):string;
var
  strSql,strValue:string;
  ctrl:TControl;
  inti:integer;
  blnHaveField:boolean; //����Ƿ�������Insert�����ֶ�
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

//�ѽ����ϵ���ʾ���һ�ַ�������ʽΪ���ֶ���|�ֶ�ֵ||��������
//����һ����������ctrlname��ֵ���磺pagea,pageb�ȣ���
//�������ڿؼ����ƵĲ��֣��Դ����ж��Ƿ����ɽ����ص��ַ���
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

//�Ѵ�����ַ�����ԭ�ɽ����ϵ���ʾ���ַ�����ʽΪ���ֶ���|�ֶ�ֵ||��������
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

//������Ҫ�������ݵ��ֶ���ϳ�һ�ַ������Ա���UnitConfirm��ʹ��
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

//RightNameΪ�������Ȩ�����֣�HaveRightΪ�û��Ĺ���Ȩ��ֵ��ReturnRight���ظ�Ȩ�޵�Integerֵ
//���û�Ȩ�ް�������Ȩ��ʱ����true,���򷵻�false
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

//RightNameΪ�������Ȩ�����֣�HaveRightΪ�û��Ĺ���Ȩ��ֵ
//���û�Ȩ�ް�������Ȩ��ʱ����true,���򷵻�false
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

//������Ȩ�û�Ȩ��
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
    rightint:=rightint shr 1; //����һλ
  end;
end;

//��ʼ��ϵͳѡ��
procedure InitSysOption(ADOCnn:TADOConnection);
begin

end;

//��ʼ���û�ѡ��
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
  cstUsePkgLine:=inifile.ReadInteger('Sys_Param','cstUsePkgLine',2); //�м�����װ��
  cstDkqCk :=inifile.ReadString('Sys_Param','dkq_ck','0');  //����������
  cstDkqBtl :=inifile.ReadString('Sys_Param','dkq_btl','288000'); //������������
  cstDkqCssksj:=inifile.ReadInteger('Sys_Param','dkq_cssksj',120);//��ʱˢ��ʱ�䣨�룩
  cstlength:=inifile.ReadInteger('Sys_Param','cstLength',16);
  cstPreShuaKa:=inifile.ReadInteger('Sys_Param','cstPreShuaKa',0);//�Ƿ�������ǰˢ����0������1����
  cstAutoRefresh:=inifile.ReadInteger('Sys_Param','AutoRefresh',0) ; //0������ ��1-30����
  cstStartAutoRefeshNum:=inifile.ReadInteger('Sys_Param','AutoRefresh',50) ;//Ҫ�����Զ�ˢ�±����ǵ�ǰ��װ�д��ڲ�����
  cstTimerNum:=inifile.ReadInteger('Sys_Param','cstTimerNum',3) ;//���ü�����ʱ�����������ˢ�����ѵ�ǰ���������
  cstCanModifyPacket:=inifile.readbool('Sys_Param','cstCanModifyPacket',false) ; //�Ƿ�������

  if cstTimerNum<=0 then
     cstTimerNum:=3;
  if cstStartAutoRefeshNum<40 then
    cstStartAutoRefeshNum:=40 ; //ֻҪ����40�������������������Զ�ˢ��
  inifile.Free;
end;

//���ø����尴ť����ʾ
procedure frmbutset(pnl:TPanel;var frmstate:Tforminfo;jobstepname:string);  //��ʼ�����尴ť
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

//�Ƿ���ʾ���崰�尴ť
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
//ParentDetail, ChildDetail������Ӧ�ӵ�text�ĸ�����ʾ
//��: ParentDetail='��?��',���ö�Ӧ���ֶ�ֵȡ�����γ����յ�text
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
  Application.MessageBox(pchar(sCaption),'��ʾ',mb_ok+mb_iconInformation);
end;

function SaveRichEdit(RichEdit:TRichEdit;Field:TField):boolean;
var
  stream:TMemoryStream;
begin
  Result:=false;
  if not field.IsBlob then exit;
  try
    stream:=TMemoryStream.Create; //TStream���У�TMemoryStream����
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
    stream:=TFileStream.Create(sFileName,fmOpenRead); //TStream���У�TMemoryStream����
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
        fs:=TFileStream.Create(sFileName,fmCreate); //TStream���У�TMemoryStream����
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
  dianweizhi:=pos('.',numberformat);//С�����λ��
  if dianweizhi=0 then
    qianwei:=0
  else
    qianwei:=dianweizhi-length(numberformat);
  //ѭ��Сд���ҵ�ÿһλ����Сд���ұ�λ�õ����
  for qian:=length(numberformat) downto 1 do begin
    if qian<>dianweizhi then begin//��������Ĳ���С����ͼ���
      case strtoint(copy(numberformat,qian,1)) of //λ���ϵ���ת���ɴ�д
        1:wei1:='Ҽ';
        2:wei1:='��';
        3:wei1:='��';
        4:wei1:='��';
        5:wei1:='��';
        6:wei1:='½';
        7:wei1:='��';
        8:wei1:='��';
        9:wei1:='��';
        0:wei1:='��';
      end;
      case qianwei of //�жϴ�дλ�ã����Լ�������real���͵����ֵ
        -3:qianwei1:='��';
        -2:qianwei1:='��';
        -1:qianwei1:='��';
        0:qianwei1:='Ԫ';
        1:qianwei1:='ʰ';
        2:qianwei1:='��';
        3:qianwei1:='ǧ';
        4:qianwei1:='��';
        5:qianwei1:='ʰ';
        6:qianwei1:='��';
        7:qianwei1:='ǧ';
        8:qianwei1:='��';
        9:qianwei1:='ʮ';
        10:qianwei1:='��';
        11:qianwei1:='ǧ';
      end;
      inc(qianwei);
      bigformat:=wei1+qianwei1+bigformat;//��ϳɴ�д���
    end;
    smalltobig:=bigformat;
  end;
end;

//����ֵ��ʾ�Ƿ�ɹ��滻
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

//���÷��ݵ�������ɫ



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

procedure copyfile(Sfname,Dfname:string);//��·�����ļ�����
Var
Sourcef,Destinef:file;
NumRead,NumWritten:Integer;
Buf:array[1..4096] of char;//���建������
Begin
  {$I-}
  AssignFile(Sourcef,Sfname);
  Reset(Sourcef,1);
  AssignFile(Destinef,Dfname);
  Rewrite(Destinef,1);
  {$I+}
  Repeat
    BlockRead(Sourcef,Buf,SizeOf(Buf),Numread);//��Դ�ļ�
    BlockWrite(destinef,buf,NumRead,NumWritten);//дĿ���ļ���
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

//ɾ���ļ���(����������ļ�ҳһ��ɾ��)
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
     // lpszProgressTitle:='����ɾ���ļ���';
       fAnyOperationsAborted:=false;
   end;
   Result:=(SHFileOperation(Tfos)=0) ;  //�ɹ��Ļ�����0,�����ʾʧ��

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

function getChanelOX(chNo: integer): integer ; //��ȡ16����ͨ����
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
  while  length(s)<8 do     //���С��8�򲹿�
    s:=s+' ' ;
  result:=s ;
end;

function RefStringAll_Snpz(srcStr :string): string ;
var
  s : string ;
begin
  s:=srcStr ;//ˮ��Ʒ��
 { s:=stringreplace(s,'(','',[rfReplaceAll]);
  s:=stringreplace(s,'��','',[rfReplaceAll]);
  s:=stringreplace(s,')','',[rfReplaceAll]);
  s:=stringreplace(s,'��','',[rfReplaceAll]);
  s:=stringreplace(s,'��װ','',[rfReplaceAll]);
  s:=stringreplace(s,'ɢװ','',[rfReplaceAll]);
  s:=stringreplace(s,'����PC','�� ',[rfReplaceAll]) ;
  s:=stringreplace(s,'����PO','�� ',[rfReplaceAll]) ;
  s:=stringreplace(s,'P.','P',[rfIgnoreCase]) ;
  }
  if pos('P��C_32.5R_',s )>0 then
     s:='PC32.5R'
  else if pos('P��O_42.5_',s )>0 then
     s:='PO42.5'
  else if pos('P��C_32.5_',s )>0 then
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

   //ԭ����  13FRD12258 ֻ�� ����258��Ҫ����
   //result:=syyy+ssnpz+smm+APhNo+' '+ACustomCode+' '+sCph  ;
   //������ �����������������
   result:=APhNo+' '+ACustomCode+' '+sCph  ;
end;

//���ݳ��Ƶĳ��Ⱦ��� ���ſ�����ʾ�ĳ���
function getHhLen(CarStr: string ): integer;
begin
  //16��Һ����һ����ʾ���ַ��������
  result := 16-Length(CarStr);
end;

end.
