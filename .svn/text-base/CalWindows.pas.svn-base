unit CalWindows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Torrybtn, RzPanel, StdCtrls, Mask,unitDefine,
  RzEdit, OleCtrls, MSCommLib_TLB, DBCtrls,inifiles, Buttons, DB, DBClient,math,
  ComCtrls, ETSListView, RzSpnEdt, RzCmboBx;


type
  TDkqThread=class(TThread)
  private

    FhDk : integer ;
    FhCardID : string ;
  protected
     procedure Execute;override ;
  public
    constructor Create(ADk :integer;ACardID: string  );
  end;

type
  TInitScreenThread=class(TThread)
  private
    { Private declarations }
    FhScreenNo : integer ;
  protected
     procedure Execute;override ;
  public
    constructor Create(AScreenNo :integer );
  end;


type
  TRefreshLedThread=class(TThread)
  private
    { Private declarations }
    TFPackLine: integer ;
    TFDk : integer ;
  protected
     procedure Execute;override ;
  public
    constructor Create(TAPackLine,TADk :integer );
  end;


  //读取车辆排队信息
type
  TAutoRefreshThread=class(TThread)
  private
    { Private declarations }
    TFPackLine : integer ;
    TFScreenNo : integer ;
  protected
     procedure Execute;override ;
  public
    constructor Create(APkNo,ASNo : integer) ;
  end;

//自动获取下一装车车辆信息
type
  TAutoGetNextCar=class(TThread)
  private
    { Private declarations }
    TFPackLine : integer ;
    TFdk : integer ;
  protected
     procedure Execute;override ;
  public
    constructor Create(APkNo,Adk : integer) ;
  end;

type
  TfrmCalWindows = class(TForm)
    pl1: TPanel;
    Panel4: TPanel;
    pnl_pzph1: TPanel;
    Label1: TLabel;
    pzph1: TRzEdit;
    RzGroupBox1: TRzGroupBox;
    tx1: TTorryButton;
    Panel6: TPanel;
    jsqck1: TRzEdit;
    RzGroupBox2: TRzGroupBox;
    Label2: TLabel;
    ybzsl1: TRzEdit;
    RzGroupBox3: TRzGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RzGroupBox4: TRzGroupBox;
    RzGroupBox5: TRzGroupBox;
    pmj1_h: TTorryButton;
    pmj1_l: TTorryButton;
    pmj1ck: TRzEdit;
    Label6: TLabel;
    pmj1ccq: TRzEdit;
    pmj1pmnr: TRzEdit;
    Label7: TLabel;
    pl2: TPanel;
    Panel3: TPanel;
    pnl_pzph2: TPanel;
    Label8: TLabel;
    pzph2: TRzEdit;
    RzGroupBox6: TRzGroupBox;
    Panel8: TPanel;
    jsqck2: TRzEdit;
    RzGroupBox7: TRzGroupBox;
    Label9: TLabel;
    ybzsl2: TRzEdit;
    RzGroupBox10: TRzGroupBox;
    pmj2_h: TTorryButton;
    pmj2_l: TTorryButton;
    Label13: TLabel;
    Label14: TLabel;
    pmj2ck: TRzEdit;
    pmj2ccq: TRzEdit;
    pmj2pmnr: TRzEdit;
    DataSource1: TDataSource;
    cph1: TRzEdit;
    snpz1: TRzEdit;
    jsq1: TMSComm;
    Label15: TLabel;
    Label16: TLabel;
    Card1: TRzEdit;
    RzGroupBox8: TRzGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cph2: TRzEdit;
    snpz2: TRzEdit;
    Card2: TRzEdit;
    Num1: TRzNumericEdit;
    Num2: TRzNumericEdit;
    DKQ_MSComm: TMSComm;
    fpbh1: TRzEdit;
    fpbh2: TRzEdit;
    Label17: TLabel;
    Js1: TTorryButton;
    Label20: TLabel;
    dk1: TRzNumericEdit;
    dk2: TRzNumericEdit;
    tx2: TTorryButton;
    js2: TTorryButton;
    ds_getNextV: TDataSource;
    RzGroupBox9: TRzGroupBox;
    ds_getNextV2: TDataSource;
    ds_AutoRefresh: TDataSource;
    Memo1: TMemo;
    Memo2: TMemo;
    pmj1: TMSComm;
    pmj2: TMSComm;
    plist2: TETSListView;
    plist1: TETSListView;
    ds_Check: TDataSource;
    tXhSf1: TTimer;
    tXhSf2: TTimer;
    jsq2: TMSComm;
    but1Start: TButton;
    but1Stop: TButton;
    but2Stop: TButton;
    but2Start: TButton;
    pl3: TPanel;
    Panel7: TPanel;
    but3Stop: TButton;
    but3Start: TButton;
    pnl_pzph3: TPanel;
    Label21: TLabel;
    pzph3: TRzEdit;
    RzGroupBox11: TRzGroupBox;
    tx3: TTorryButton;
    js3: TTorryButton;
    Panel10: TPanel;
    jsqck3: TRzEdit;
    RzGroupBox12: TRzGroupBox;
    Label22: TLabel;
    ybzsl3: TRzEdit;
    RzGroupBox13: TRzGroupBox;
    pmj3_h: TTorryButton;
    pmj3_l: TTorryButton;
    Label23: TLabel;
    Label24: TLabel;
    pmj3ck: TRzEdit;
    pmj3ccq: TRzEdit;
    pmj3pmnr: TRzEdit;
    RzGroupBox14: TRzGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    cph3: TRzEdit;
    snpz3: TRzEdit;
    Card3: TRzEdit;
    Num3: TRzNumericEdit;
    fpbh3: TRzEdit;
    dk3: TRzNumericEdit;
    RzGroupBox15: TRzGroupBox;
    plist3: TETSListView;
    Memo3: TMemo;
    pmj3: TMSComm;
    jsq3: TMSComm;
    tXhSf3: TTimer;
    tStartTimer: TTimer;
    tAutorRefresh: TTimer;
    ds_auto: TDataSource;
    pnlXtcs: TPanel;
    gb_pzxz: TGroupBox;
    cb_pz_pzxz: TRzComboBox;
    gb_bzxcs: TGroupBox;
    gb_pmjpz: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    pmj_edt_ccqh: TRzEdit;
    pmj_ccqnrS: TRzEdit;
    pmj_cb_ckxz: TRzComboBox;
    pmj_Code: TRzComboBox;
    pmj_ccqnrE: TRzEdit;
    pmjSfqy: TCheckBox;
    Label31: TLabel;
    bzx_sedt_zdybdjg: TRzSpinEdit;
    Label32: TLabel;
    bzx_cb_qydk: TRzComboBox;
    Label33: TLabel;
    cb_jsq_ckxz: TRzComboBox;
    butbxzOK: TButton;
    butbxzCancel: TButton;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure DKQ_MSCommComm(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure jsq1Comm(Sender: TObject);
    procedure jsq2Comm(Sender: TObject);
    procedure jsq3Comm(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tXhSf1Timer(Sender: TObject);
    procedure tXhSf2Timer(Sender: TObject);
    procedure tXhSf3Timer(Sender: TObject);
    procedure but1StopClick(Sender: TObject);
    procedure but1StartClick(Sender: TObject);
    procedure but2StartClick(Sender: TObject);
    procedure but2StopClick(Sender: TObject);
    procedure but3StopClick(Sender: TObject);
    procedure but3StartClick(Sender: TObject);
    procedure TDeleverTimer(Sender: TObject);

    procedure tStartTimerTimer(Sender: TObject);
    procedure tAutorRefreshTimer(Sender: TObject);
    procedure butStopClick(ApackLineNo: integer );
    procedure butStartClick(ApackLineNo: integer );
    procedure butbxzCancelClick(Sender: TObject);
    procedure butbxzOKClick(Sender: TObject);

  private
    { Private declarations }
    initScreenT : TInitScreenThread;
    ReFreshT    : TAutoRefreshThread ;
    RefreshLedT : TRefreshLedThread ;
    dkqT        : TDkqThread ;
    TGetNextCar  : TAutoGetNextCar ;
    iCommState ,m_lFrameLen : array [0..2] of integer ;
    m_lFrameBuf : array [0..511] of BYTE ;
    m_lFrameBuf2 : array [0..511] of BYTE ;
    m_lFrameBuf3 : array [0..511] of BYTE ;
    lastcount : array [0..2] of integer ;
    ledstate  : array [0..2] of integer ;
    jsqcurcount: array [0..2] of integer ;
    nResult : Cardinal ;
    XhDk : array [0..2] of integer ;
    AutoRefreshNum : array [0..2] of integer ;
    ladeID : array [0..2] of string ;
    sfPreShuaka :array [0..2] of boolean ;

    procedure initpackLine(isAll: boolean ;iPk : integer  );//初始化包装线数据

    procedure initDkqParam;//初始化读卡器参数
    procedure initJSQ_PMJ_Param;//初始化计数器喷码机参数
    function GetCarId(data : array of byte ):cardinal ;//16进制转换成10进制的卡号
    procedure InitScreenInfo(isAll: boolean ;iPk : integer  );//初始话屏幕信息

    procedure SendJsqInfo(ApackLine,AJsqNo,ASendQuantity,res: integer ); //包装线，通道号 ,发送数量
    procedure comSend(data: array of byte;len,ApackLine : integer );
    procedure pmjcomSend(data: array of byte;len,ApackLine : integer );
    procedure JsqClear(ApackLine: integer );
    procedure JsqLjClear(ApackLine: integer );
    procedure JsqAlarm(APackLine: integer ); //计数器报警
    procedure ClearJsqAlarm(APackLine: integer ); //计数器报警
    procedure Openzadao(ApackLine : integer);
    procedure CloseZadao(ApackLine : integer);
    procedure PackLine_Jsq_XhSf(APackLine ,Aop : integer );//包装线计数器 吸合释放  //Aop: 0吸合 ，1释放
    procedure RefreshListInfo(APackLine,AFirstDk : integer ); //刷新列表显示内容

    procedure resetCurRegister(APackLine: integer) ;
    procedure setCurRegister(APackLine: integer) ;
    procedure setCurRegisterVal(APackLine :integer; ASendContent: AnsiString ) ;
    procedure jsqProc1(Amsg : array of BYTE ; APackLine,Alen : integer);
    procedure jsqProc2(Amsg : array of BYTE ; APackLine,Alen : integer);
    procedure jsqProc3(Amsg : array of BYTE ; APackLine,Alen : integer);
    function getNextDaokou(APackLineNo,AcurDaoKou : integer): integer ;
    procedure initTimer;//初始化定时器事件

    procedure getCurRunPackLine() ;//获取本机运行的是包装线，本次运行的是 道口号列表
    function getNextRunTimer(ACurPDkNo: integer  ): integer ; //获取下一运行定时器，从1开始的下标
    procedure AutoRefreshPackLineLed(APackLine, AScreenNo: integer;isPack : boolean=false); //自动刷新包装线的2个LED及plist
    procedure saveBzxConfig(ABzxNo : integer);

  public
    { Public declarations }
     d_haveGetDate: TDateTime ;//当前已经取到车牌号的时间
     ASysInfo :TSysInfoPoint;    //系统信息
     AScreenInfo:array [0..2] of TScreenTypePoint ;  //3个屏幕信息
     APackLineInfo:array [0..2] of TPackLinePoint; //3条包装线信息
     LedInitFlag : array [0..2] of integer ;
     JsqStatus : array [0..2] of integer ; //计数器状态
     TDelever : array [0..2] of TTimer ;   //超时刷卡定时器
     //iCount: integer ;
  end;




var
  frmCalWindows: TfrmCalWindows;

  hDll  : array [0..2] of  THandle;

implementation

uses
   FuncPackage, DBPackage,uScreenDefine;

{$R *.dfm}

{ TInitScreenThread }

// 初始化屏幕线程
constructor TInitScreenThread.Create(AScreenNo: integer);
begin
   inherited Create(true);
   FhScreenNo:=AScreenNo ;
end;

procedure TInitScreenThread.Execute;
var
  sViewName,sCk : string ;
  AScreen: integer ;
  nControlType, nSendMode: Cardinal;
  sName:AnsiString;
begin
  FreeOnTerminate:=true ;
  try
     sName :=  'LedDynamicArea'+InttoStr(FhScreenNo)+'.dll';
     hDll[FhScreenNo-1] := LoadLibrary(PAnsiChar(sName));
     if hDll[FhScreenNo-1] < 32 then
       Exit; //如果Dll无法加载则跳出

     AddScreen[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'AddScreen');
     AddScreenDynamicArea[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'AddScreenDynamicArea');
     AddScreenDynamicAreaFile[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'AddScreenDynamicAreaFile');

     DeleteScreen[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'DeleteScreen');
     DeleteScreenDynamicAreaFile[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'DeleteScreenDynamicAreaFile');
     SendDynamicAreaInfoCommand[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'SendDynamicAreaInfoCommand');
     SendDeleteDynamicAreasCommand[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'SendDeleteDynamicAreasCommand');
     SendUpdateDynamicAreaPageInfoCommand[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'SendUpdateDynamicAreaPageInfoCommand');
     SendDeleteDynamicAreaPageCommand[FhScreenNo-1] := GetProcAddress(hDll[FhScreenNo-1], 'SendDeleteDynamicAreaPageCommand');
  except
  end;
 // for i:=0 to 1 do
  with frmCalWindows do
  begin

   AScreen:=FhScreenNo ;     //LED显示屏 从1开始，所以有个错位 ,+1 ,但是数组下标从0开始
   nControlType:=$0254 ;
   nSendMode:=0 ;
   if AScreenInfo[AScreen-1].sfQy then //道口启用时才要显示更新
   begin
      try
        if AScreenInfo[AScreen-1].Pm_Kzkxh='BX-5E1' then
           nControlType:=$0154
        else if AScreenInfo[AScreen-1].Pm_Kzkxh='BX-5E2' then
           nControlType:=$0254
        else if AScreenInfo[AScreen-1].Pm_Kzkxh='BX-5E3' then
           nControlType:=$0354 ;

        if AScreenInfo[AScreen-1].Pm_Txms='串口' then
           nSendMode:=0
        else if AScreenInfo[AScreen-1].Pm_Txms='网口' then
           nSendMode:=2 ;

        sCk:='COM'+inttostr(strtoint(AScreenInfo[AScreen-1].Pm_Ck)+1);
        nResult := AddScreen[AScreen-1](nControlType, 1, nSendMode, AScreenInfo[AScreen-1].Pm_Wide,
           AScreenInfo[AScreen-1].Pm_Height , 1, 1 , pchar(sCk), StrToInt(AScreenInfo[AScreen-1].Pm_Btl) ,
             pchar(AScreenInfo[AScreen-1].ipdz), AScreenInfo[AScreen-1].duank, '');
        nResult := AddScreenDynamicArea[AScreen-1](1, 0, 0 , 1, 0, PChar(''), 1,
                              0, 0, 128, 64 , 255, 0, 255 , 0, 0, 1);

      //这里开始生成文件输出 ,以显示屏标记+'_led'为文件名
        sViewName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(AScreen)+'_led.txt';
        AScreenInfo[AScreen-1].Pm_PdCar.savetofile(sViewName);

        nResult := AddScreenDynamicAreaFile[AScreen-1](1, 0 , PChar(sViewName), 0,
             PChar('宋体'), 12, 0, clRed, 1, 0, 5);
        nResult := SendDynamicAreaInfoCommand[AScreen-1](1, 0);
        LedInitFlag[AScreen-1] := 1;

      except
 
      end
    end ;//if AScreenInfo[sDkNo].sfQy then
 end;  //for i:=0 to 1

end;


procedure TfrmCalWindows.jsqProc1(Amsg : array of BYTE ; APackLine,Alen : integer);
var
  curcount , i : integer ;
  sSql ,sFileName : string ;
  NextDk: integer ;  
begin
 // FreeOnTerminate:=true ;
 // with frmCalWindows do
  begin
    inc(ledstate[0]) ;
    if (ledstate[0] mod 2) =0 then
       Js1.color:=clLime
    else
       Js1.color:=clgray ;

    if Amsg[0]=$22 then
    begin
         //实时计数
        if((Amsg[2] and  $F) =$A) then         //接近开关故障报警
        begin
            Memo1.Lines.Add('接近开关故障报警');
        end;
        if (Amsg[4]=$B4) and  (Amsg[5]=$41) then
          exit ;
        for i:=6 to 12 do
        begin
          if(Amsg[i]=$20) then
             Amsg[i]:=$30;
        end;

        //22,32,30,32,B4,41,30,30,30,30,30,20,20,32,32,20,BC
        //对设置的确认

        curcount:=(Amsg[10]-$30)*1000+(Amsg[11]-$30)*100+(Amsg[12]-$30)*10+(Amsg[13]-$30);
       // ljcount:=Amsg[6]*$ffffff+Amsg[7]*$ffff+Amsg[8]*$ff+Amsg[9];
        if (curcount<0) {or (curcount>Num1.IntValue)} then
           exit;

        if (lastcount[0]=curcount) and (lastcount[0]=0) then
          exit ;
        if  memo1.Lines.Count>500 then
           memo1.Lines.Clear ;
        Memo1.Lines.Add(inttostr(curcount)) ;

        jsqcurcount[0] :=  curcount;
        if lastcount[0]=curcount then
          exit ;

        //这里开始往 LED发送数据 start

         //2013-12-13  下发数量的变动了
        if (curcount>lastcount[0]) and (curcount>0) and (curcount<Num1.IntValue) and (Num1.IntValue>0) then
        begin
          RefreshLedT:= TRefreshLedThread.Create(0,dk1.IntValue);
          RefreshLedT.Resume;
        end;
        //这里开始往 LED发送数据 end
          
        if (Num1.IntValue>0) and ((Num1.IntValue-curcount)<=cstPreYjNumber) and (JsqStatus[0] =1)  then    //提前10告警
        begin
            JsqAlarm(0);
            JsqAlarm(0);
            JsqAlarm(0);
            JsqStatus[0]:=2;//报警状态
            lastcount[0]:= curcount ;
            ybzsl1.Text:= inttostr(curcount) ;
            exit;
        end ;
        Memo1.Lines.Add('JsqStatus[0]='+IntToStr(JsqStatus[0])) ;

        //剩余数量至少要多于30包，才会启动自动刷新 2013-09-20 start
       { if ((Num1.IntValue-curcount)<=cstStartAutoRefeshNum) and (Num1.IntValue>0 ) and (curcount>0) then
           AutoRefresh1.Enabled:=false ; }
        if ((Num1.IntValue-curcount)<=cstStartAutoRefeshNum) and (Num1.IntValue>curcount) then
        begin
          if tAutorRefresh.Tag=1 then   //装车数量少于一定量不允许再更新,把更新给下一条线
          begin
             tAutorRefresh.Enabled :=false ;
             tAutorRefresh.Tag :=getNextRunTimer(1);
             tAutorRefresh.Enabled :=true ;
          end;
        end;

        //剩余数量至少要多于30包，才会启动自动刷新 2013-09-20 end

        if (Num1.IntValue>0) and (Num1.IntValue<=curcount) and (curcount>0) and (JsqStatus[0]<>0) then
        begin
          ybzsl1.Text:= inttostr(curcount) ;
          JsqStatus[0]:=0;
          sleep(200) ;
          CloseZadao(0);
          CloseZadao(0);
          CloseZadao(0);
          ClearJsqAlarm(0);
          ClearJsqAlarm(0);
          JsqClear(0);
          JsqClear(0);
          JsqClear(0);
          JsqLjClear(0);
          JsqLjClear(0);
          JsqLjClear(0);

          sSql:='update pm_data set readok=1 '+
                ' where readok=170 and shipment_number='+quotedstr(trim(fpbh1.Text)) ;
          Dm.ADOCnn.Execute(sSql);

          APackLineInfo[0].PackIng:=false ;
          Num1.IntValue :=0 ;

          //这里需要判断是否正在 自动刷新 start ,
          //如果已经启动，那么需要等待自动刷新完成
          Application.ProcessMessages;

          while APackLineInfo[0].RefreshIng do
          begin
             sleep(100);
             application.ProcessMessages;
          end  ;
          //这里需要判断是否正在 自动刷新 end

          //装车完成后先把第一行删除，因为第二行有可能存在提前刷卡 start
          //那么在 RefreshListInfo中只要判断第一行是否已经刷卡 就可以
          plist1.Items.Delete(0);
          AScreenInfo[0].Pm_PdCar.delete(1) ;  //保留第一行，因为是包装机型号 ，不用维护
          AScreenInfo[0].AutoNum:=AScreenInfo[0].AutoNum-1 ;
          APackLineInfo[0].WaitVehicleNum:=APackLineInfo[0].WaitVehicleNum-1 ; //等待车辆少一辆
          //装车完成后先把第一行删除，因为第二行有可能存在提前刷卡 end

          //这里需要对分配包装重新分配车辆start  2013-12-21
             dm.FenPeiBzx(0);//目前参数暂时没有用上,预留着
          //这里需要对分配包装重新分配车辆 end   2013-12-21

          NextDk:=getNextDaokou(0,dk1.IntValue);
          RefreshListInfo(0,NextDk);  //这里启动刷新,因为要刷新状态的
          application.ProcessMessages ;
          if AScreenInfo[0].sfQy then
          begin
             sFileName:=Extractfilepath(Application.ExeName )+'SendFile\1_led.txt';
             AScreenInfo[0].Pm_PdCar.SaveToFile(sFileName);
             SendDynamicAreaInfoCommand[0](1, 0);
          end;

          XhDk[0]:=dk1.IntValue;
          tXhSf1.Enabled :=true ;  // 延时处理继电器吸合状态

          Memo1.Lines.Add('dk1.IntValue'+IntToStr(dk1.IntValue));

          AutoRefreshNum[0]:=0 ;
          ladeID[0]:='0' ;
          if plist1.Items.Count >0 then
            ladeID[0]:=trim(plist1.Items[0].SubItems[7] );
        end ; //if (Num1.IntValue>0) and (Num1.IntValue=curcount) and (curcount>0)

        ybzsl1.Text:= inttostr(curcount) ;

        Memo1.Lines.Add('curcount:'+IntToStr(curcount));
        Memo1.Lines.Add('JsqStatus[0] ='+IntToStr(JsqStatus[0])+';lastcount[0]:'+IntToStr(lastcount[0]));

        if (JsqStatus[0] = 0) and (lastcount[0]=0) then     //一定要等到计数器清零了开始计数
          JsqStatus[0]:=1
        else  if curcount=0 then
           JsqStatus[0]:=0 ;

          Memo1.Lines.Add('JsqStatus[0]:'+IntToStr(JsqStatus[0]));
         lastcount[0]:= curcount ;
         Memo1.Lines.Add('lastcount:'+IntToStr(lastcount[0]));

    end; //if TFmsg[0]=$22 then

  end; //with frmCalWindows do

end;

procedure TfrmCalWindows.jsqProc2(Amsg : array of BYTE ; APackLine,Alen : integer);
var
  curcount , i : integer ;
  sSql ,sFileName : string ;
  NextDk: integer ;  
begin
 // FreeOnTerminate:=true ;
 // with frmCalWindows do
  begin
    inc(ledstate[1]) ;
    if (ledstate[1] mod 2) =0 then
       Js2.color:=clLime
    else
       Js2.color:=clgray ;

    if Amsg[0]=$22 then
    begin
         //实时计数
        if((Amsg[2] and  $F) =$A) then         //接近开关故障报警
        begin
            Memo2.Lines.Add('接近开关故障报警');
        end;
        if (Amsg[4]=$B4) and  (Amsg[5]=$41) then
          exit ;
        for i:=6 to 12 do
        begin
          if(Amsg[i]=$20) then
             Amsg[i]:=$30;
        end;

        //22,32,30,32,B4,41,30,30,30,30,30,20,20,32,32,20,BC
        //对设置的确认

        curcount:=(Amsg[10]-$30)*1000+(Amsg[11]-$30)*100+(Amsg[12]-$30)*10+(Amsg[13]-$30);
       // ljcount:=Amsg[6]*$ffffff+Amsg[7]*$ffff+Amsg[8]*$ff+Amsg[9];
        if (curcount<0) {or (curcount>Num1.IntValue)} then
           exit;
        if (lastcount[1]=curcount) and (lastcount[1]=0) then
          exit ;
        if  memo2.Lines.Count>500 then
           memo2.Lines.Clear ;
        Memo2.Lines.Add(inttostr(curcount)) ;

        jsqcurcount[1] :=  curcount;
        if lastcount[1]=curcount then
          exit ;

        //这里开始往 LED发送数据 start

        //2013-12-13  下发数量的变动了
        if (curcount>lastcount[1]) and (curcount>0) and (curcount<Num2.IntValue) and (Num2.IntValue>0) then
        begin
          RefreshLedT:= TRefreshLedThread.Create(1,dk2.IntValue);
          RefreshLedT.Resume;
        end;
        //这里开始往 LED发送数据 end
        //这里开始往 LED发送数据 end
          
        if (Num2.IntValue>0) and ((Num2.IntValue-curcount)<=cstPreYjNumber) and (JsqStatus[1] =1)  then    //提前10告警
        begin
            JsqAlarm(1);
            JsqAlarm(1);
            JsqAlarm(1);
            JsqStatus[1]:=2;//报警状态
            lastcount[1]:= curcount ;
            ybzsl2.Text:= inttostr(curcount) ;
            exit;
        end ;
        Memo2.Lines.Add('JsqStatus[1]='+IntToStr(JsqStatus[1])) ;

        //剩余数量至少要多于30包，才会启动自动刷新 2013-09-20 start
       { if ((Num2.IntValue-curcount)<=cstStartAutoRefeshNum) and (Num2.IntValue>0 ) and (curcount>0) then
           AutoRefresh2.Enabled:=false ; }
        if ((Num2.IntValue-curcount)<=cstStartAutoRefeshNum) and (Num2.IntValue>curcount) then
        begin
          if tAutorRefresh.Tag=2 then   //装车数量少于一定量不允许再更新,把更新给下一条线
          begin
             tAutorRefresh.Enabled :=false ;
             tAutorRefresh.Tag :=getNextRunTimer(2);
             tAutorRefresh.Enabled :=true ;
          end;
        end;

        //剩余数量至少要多于30包，才会启动自动刷新 2013-09-20 end

        if (Num2.IntValue>0) and (Num2.IntValue<=curcount) and (curcount>0) and (JsqStatus[1]<>0) then
        begin
          ybzsl2.Text:= inttostr(curcount) ;
          JsqStatus[1]:=0;
          sleep(200) ;
          CloseZadao(1);
          CloseZadao(1);
          CloseZadao(1);
          ClearJsqAlarm(1);
          ClearJsqAlarm(1);
          JsqClear(1);
          JsqClear(1);
          JsqClear(1);
          JsqLjClear(1);
          JsqLjClear(1);
          JsqLjClear(1);

          XhDk[1]:=dk2.IntValue;
          tXhSf2.Enabled :=true ;  // 延时处理继电器吸合状态

        //  AScreenInfo[dk1.IntValue-1].Pm_PdCar.Delete(1); //装车完需要删除一条记录

         // APackLineInfo[0].WaitVehicleNum:=APackLineInfo[0].WaitVehicleNum-1 ;//等待车辆-1

          sSql:='update pm_data set readok=1 '+
                ' where readok=170 and shipment_number='+quotedstr(trim(fpbh2.Text)) ;
          Dm.ADOCnn.Execute(sSql);

          APackLineInfo[1].PackIng:=false ;
          Num2.IntValue :=0 ;
         // TAutoBack1.Enabled :=true ;  //把刷卡超时打开

          //这里需要判断是否正在 自动刷新 start ,
          //如果已经启动，那么需要等待自动刷新完成
          Application.ProcessMessages;

          while APackLineInfo[1].RefreshIng do
          begin
             sleep(100);
             application.ProcessMessages;
          end  ;
          //这里需要判断是否正在 自动刷新 end

          //装车完成后先把第一行删除，因为第二行有可能存在提前刷卡 start
          //那么在 RefreshListInfo中只要判断第一行是否已经刷卡 就可以
          plist2.Items.Delete(0);
          AScreenInfo[1].Pm_PdCar.delete(1) ;  //保留第一行，因为是包装机型号 ，不用维护
          AScreenInfo[1].AutoNum:=AScreenInfo[1].AutoNum-1 ;
          APackLineInfo[1].WaitVehicleNum:=APackLineInfo[1].WaitVehicleNum-1 ; //等待车辆少一辆
          //装车完成后先把第一行删除，因为第二行有可能存在提前刷卡 end

          //这里需要对分配包装重新分配车辆start  2013-12-21
             dm.FenPeiBzx(1);//目前参数暂时没有用上,预留着
          //这里需要对分配包装重新分配车辆 end   2013-12-21

          NextDk:=getNextDaokou(1,dk2.IntValue);
          RefreshListInfo(1,NextDk);  //这里启动刷新,因为要刷新状态的
          application.ProcessMessages ;
          if AScreenInfo[1].sfQy then
          begin
           sFileName:=Extractfilepath(Application.ExeName )+'SendFile\2_led.txt';
           AScreenInfo[1].Pm_PdCar.SaveToFile(sFileName);
           SendDynamicAreaInfoCommand[1](1, 0);
          end;
          XhDk[1]:=dk2.IntValue;
          tXhSf2.Enabled :=true ;  // 延时处理继电器吸合状态
          Memo2.Lines.Add('dk2.IntValue'+IntToStr(dk2.IntValue));

          AutoRefreshNum[1]:=0 ;
          ladeID[1]:='0' ;
          if plist2.Items.Count >0 then
            ladeID[1]:=trim(plist2.Items[0].SubItems[7] );
        end ; //if (Num2.IntValue>0) and (Num2.IntValue=curcount) and (curcount>0)

        ybzsl2.Text:= inttostr(curcount) ;

        Memo2.Lines.Add('curcount:'+IntToStr(curcount));
        Memo2.Lines.Add('JsqStatus[1] ='+IntToStr(JsqStatus[1])+';lastcount[1]:'+IntToStr(lastcount[1]));

        if (JsqStatus[1] = 0) and (lastcount[1]=0) then     //一定要等到计数器清零了开始计数
          JsqStatus[1]:=1
        else  if curcount=0 then
           JsqStatus[1]:=0 ;

          Memo2.Lines.Add('JsqStatus[1]:'+IntToStr(JsqStatus[1]));
         lastcount[1]:= curcount ;
         Memo2.Lines.Add('lastcount[1]:'+IntToStr(lastcount[1]));

    end; //if TFmsg[0]=$22 then

  end; //with frmCalWindows do

end;

procedure TfrmCalWindows.jsqProc3(Amsg : array of BYTE ; APackLine,Alen : integer);
var
  curcount , i : integer ;
  sSql ,sFileName : string ;
  NextDk: integer ;  
begin
 // FreeOnTerminate:=true ;
 // with frmCalWindows do
  begin
    inc(ledstate[2]) ;
    if (ledstate[2] mod 2) =0 then
       Js3.color:=clLime
    else
       Js3.color:=clgray ;

    if Amsg[0]=$22 then
    begin
         //实时计数
        if((Amsg[2] and  $F) =$A) then         //接近开关故障报警
        begin
            Memo3.Lines.Add('接近开关故障报警');
        end;
        if (Amsg[4]=$B4) and  (Amsg[5]=$41) then
          exit ;
        for i:=6 to 12 do
        begin
          if(Amsg[i]=$20) then
             Amsg[i]:=$30;
        end;

        //22,32,30,32,B4,41,30,30,30,30,30,20,20,32,32,20,BC
        //对设置的确认

        curcount:=(Amsg[10]-$30)*1000+(Amsg[11]-$30)*100+(Amsg[12]-$30)*10+(Amsg[13]-$30);
       // ljcount:=Amsg[6]*$ffffff+Amsg[7]*$ffff+Amsg[8]*$ff+Amsg[9];
        if (curcount<0) {or (curcount>Num1.IntValue)} then
           exit;
        if (lastcount[2]=curcount) and (lastcount[2]=0) then
          exit ;
        if  memo3.Lines.Count>500 then
           memo3.Lines.Clear ;
        Memo3.Lines.Add(inttostr(curcount)) ;

        jsqcurcount[2] :=  curcount;
        if lastcount[2]=curcount then
          exit ;
        //这里开始往 LED发送数据 start

        //2013-12-13  下发数量的变动了
        if (curcount>lastcount[2]) and (curcount>0) and (curcount<Num3.IntValue) and (Num3.IntValue>0) then
        begin
          RefreshLedT:= TRefreshLedThread.Create(2,dk3.IntValue);
          RefreshLedT.Resume;
        end;
        //这里开始往 LED发送数据 end
        //这里开始往 LED发送数据 end
          
        if (Num3.IntValue>0) and ((Num3.IntValue-curcount)<=cstPreYjNumber) and (JsqStatus[2] =1)  then    //提前10告警
        begin
            JsqAlarm(2);
            JsqAlarm(2);
            JsqAlarm(2);
            JsqStatus[2]:=2;//报警状态
            lastcount[2]:= curcount ;
            ybzsl3.Text:= inttostr(curcount) ;
            exit;
        end ;
        Memo3.Lines.Add('JsqStatus[2]='+IntToStr(JsqStatus[2])) ;

        //剩余数量至少要多于30包，才会启动自动刷新 2013-09-20 start
       { if ((Num3.IntValue-curcount)<=cstStartAutoRefeshNum) and (Num3.IntValue>0 ) and (curcount>0) then
           AutoRefresh1.Enabled:=false ; }
        if ((Num3.IntValue-curcount)<=cstStartAutoRefeshNum) and (Num3.IntValue>curcount) then
        begin
          if tAutorRefresh.Tag=3 then   //装车数量少于一定量不允许再更新,把更新给下一条线
          begin
             tAutorRefresh.Enabled :=false ;
             tAutorRefresh.Tag :=getNextRunTimer(3);
             tAutorRefresh.Enabled :=true ;
          end;
        end;

        //剩余数量至少要多于30包，才会启动自动刷新 2013-09-20 end

        if (Num3.IntValue>0) and (Num3.IntValue<=curcount) and (curcount>0) and (JsqStatus[2]<>0) then
        begin
          ybzsl3.Text:= inttostr(curcount) ;
          JsqStatus[2]:=0;
          sleep(200) ;
          CloseZadao(2);
          CloseZadao(2);
          CloseZadao(2);
          ClearJsqAlarm(2);
          ClearJsqAlarm(2);
          JsqClear(2);
          JsqClear(2);
          JsqClear(2);
          JsqLjClear(2);
          JsqLjClear(2);
          JsqLjClear(2);

          XhDk[2]:=dk3.IntValue;
          tXhSf3.Enabled :=true ;  // 延时处理继电器吸合状态

        //  AScreenInfo[dk3.IntValue-1].Pm_PdCar.Delete(1); //装车完需要删除一条记录

         // APackLineInfo[2].WaitVehicleNum:=APackLineInfo[2].WaitVehicleNum-1 ;//等待车辆-1

          sSql:='update pm_data set readok=1 '+
                ' where readok=170 and shipment_number='+quotedstr(trim(fpbh3.Text)) ;
          Dm.ADOCnn.Execute(sSql);

          APackLineInfo[2].PackIng:=false ;
          Num2.IntValue :=0 ;
         // TAutoBack1.Enabled :=true ;  //把刷卡超时打开

          //这里需要判断是否正在 自动刷新 start ,
          //如果已经启动，那么需要等待自动刷新完成
          Application.ProcessMessages;

          while APackLineInfo[2].RefreshIng do
          begin
             sleep(100);
             application.ProcessMessages;
          end  ;
          //这里需要判断是否正在 自动刷新 end
          //装车完成后先把第一行删除，因为第二行有可能存在提前刷卡 start
          //那么在 RefreshListInfo中只要判断第一行是否已经刷卡 就可以
          plist3.Items.Delete(0);
          AScreenInfo[2].Pm_PdCar.delete(1) ;  //保留第一行，因为是包装机型号 ，不用维护
          AScreenInfo[2].AutoNum:=AScreenInfo[2].AutoNum-1 ;
          APackLineInfo[2].WaitVehicleNum:=APackLineInfo[2].WaitVehicleNum-1 ; //等待车辆少一辆
          //装车完成后先把第一行删除，因为第二行有可能存在提前刷卡 end
          
          //这里需要对分配包装重新分配车辆start  2013-12-21
             dm.FenPeiBzx(2);//目前参数暂时没有用上,预留着
          //这里需要对分配包装重新分配车辆 end   2013-12-21

          NextDk:=getNextDaokou(2,dk3.IntValue);
          RefreshListInfo(2,NextDk);  //这里启动刷新,因为要刷新状态的
          application.ProcessMessages ;
          if AScreenInfo[2].sfQy then
          begin
           sFileName:=Extractfilepath(Application.ExeName )+'SendFile\3_led.txt';
           AScreenInfo[2].Pm_PdCar.SaveToFile(sFileName);
           SendDynamicAreaInfoCommand[2](1, 0);
          end;
          XhDk[2]:=dk3.IntValue;
          tXhSf3.Enabled :=true ;  // 延时处理继电器吸合状态
          Memo3.Lines.Add('dk3.IntValue'+IntToStr(dk3.IntValue));

          AutoRefreshNum[2]:=0 ;
          ladeID[2]:='0' ;
          if plist3.Items.Count >0 then
            ladeID[2]:=trim(plist3.Items[0].SubItems[7] );
        end ; //if (Num3.IntValue>0) and (Num3.IntValue=curcount) and (curcount>0)

        ybzsl3.Text:= inttostr(curcount) ;

        Memo3.Lines.Add('curcount:'+IntToStr(curcount));
        Memo3.Lines.Add('JsqStatus[2] ='+IntToStr(JsqStatus[2])+';lastcount[2]:'+IntToStr(lastcount[2]));

        if (JsqStatus[2] = 0) and (lastcount[2]=0) then     //一定要等到计数器清零了开始计数
          JsqStatus[2]:=1
        else  if curcount=0 then
           JsqStatus[2]:=0 ;

          Memo3.Lines.Add('JsqStatus[2]:'+IntToStr(JsqStatus[2]));
         lastcount[2]:= curcount ;
         Memo3.Lines.Add('lastcount[2]:'+IntToStr(lastcount[2]));

    end; //if TFmsg[0]=$22 then

  end; //with frmCalWindows do

end;


procedure TfrmCalWindows.FormShow(Sender: TObject);
var
 i ,j : integer ;
begin
  Caption:= Caption+'V1.6 '+DateTimeToStr(Now());
  memo1.Lines.Clear ;
  memo2.Lines.Clear ;
  memo3.Lines.Clear;
 // jsq1.OnComm:=nil ;  //2013-10-27 moved
 // jsq2.OnComm:=nil ;
 // jsq3.OnComm:=nil ;


  Dm.ADOCnn.Execute('update pm_data set readok=0 where readok=169 or readok=170 ');
  InitUserOption ;
  initPackLine(true,0) ;

  cstCurRunlist:=TStringList.Create; //把要运行的包装线放在list中 ，以便后面分配扫面间隔时间
  getCurRunPackLine() ;

  //用来记录超时刷卡的道口的定时器,
  //定时器以包装线为单位，但是具体运行哪个道口放在Tag中
  for i:=0 to cstUsePkgLine-1 do
  begin
    AutoRefreshNum[i]:=0 ;
    ladeID[i]:='0';
    sfPreShuaka[i]:=false ;

    TDelever[i] :=TTimer.Create(nil);  //超时刷卡定时器
    TDelever[i].Enabled :=false ;
    TDelever[i].Tag :=i ;//用来表示包装线
    TDelever[i].Interval :=(cstDkqCssksj+i*6) *1000 ;  //设置的是秒数 ,每个延时定时器稍微错开点
    TDelever[i].OnTimer:=TDeleverTimer ;
  end;

  initDkqParam; //初始化读卡器参数
  initJSQ_PMJ_Param;   //初始化计数器喷码机 参数
  InitScreenInfo(true,0) ;
  ybzsl1.Text:='0';
  ybzsl2.Text:='0';
  ybzsl3.Text:='0';

  initTimer; //初始化定时器

  for i:=0 to cstUsePkgLine-1 do  //初始化继电器吸合状态 ,默认都是1号道口吸合,2号道口释放
  begin
    JsqStatus[i]:=0;
    if  APackLineInfo[i].Sfqybzx then
    begin
       if (APackLineInfo[i].Qydk=cstQydk1) or (APackLineInfo[i].Qydk=cstQydk12) then
          j:=0
       else
          j:=1 ;

       sleep(200);
       PackLine_Jsq_XhSf(i,j) ;
       PackLine_Jsq_XhSf(i,j) ;
       PackLine_Jsq_XhSf(i,j) ;
       CloseZadao(i);
       CloseZadao(i);
       CloseZadao(i);
       sleep(300);
       JsqClear(i);
       JsqClear(i);
       JsqClear(i);
       try
          sleep(300);
          JsqLjClear(i);
          JsqLjClear(i);
          JsqLjClear(i);
       except
       end ;
       ClearJsqAlarm(i);
       ClearJsqAlarm(i);
       ClearJsqAlarm(i);

    end;
  end;  

  //初始化3个屏幕
  for i:=1 to cstUsePkgLine  do
  begin
    LedInitFlag[i-1]:=0;
    if  AScreenInfo[i-1].sfQy then
    begin
      initScreenT:= TInitScreenThread.Create(i);
      initScreenT.Resume;
    end ;
  end ;


end;


//iPk : 1号包装线 传入参数 是1；2号传入是2
//如果isAll=true ， 那么iPk值没有用了
procedure TfrmCalWindows.initpackLine(isAll: boolean ;iPk : integer  );
var
  inifile : Tinifile ;
  v ,vs,objname: string ;
  iCicle ,jend,kstart: integer ;
  TdkCom ,TpzCom,TJsqCom,TpmjCkCom,TpmjccqCom: Tcomponent ;
begin
  if isAll then
  begin
    kstart:=0 ;
    jend:= cstUsePkgLine-1 ;
  end
  else
  begin
    kstart:=iPk-1 ;
    jend:=iPk-1 ;
  end;
  inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
  try
   // for iCicle:=0 to cstUsePkgLine-1 do
    for iCicle:=kstart to jend do
    begin
      APackLineInfo[iCicle] :=new(TPackLinePoint) ;
      vs:=inttostr(iCicle+1)+c_PackLineName ;

      APackLineInfo[iCicle].Sfqybzx:=inifile.ReadBool(vs,'bzx_ckb_sfqy',true);

      if APackLineInfo[iCicle].Sfqybzx then
      begin
        APackLineInfo[iCicle].Sfqypzxz :=true;//inifile.ReadBool(vs,'ckb_qz_qypzxz',false);
        APackLineInfo[iCicle].Qydk:=inifile.ReadString(vs,'bzx_cb_qydk','');
        APackLineInfo[iCicle].SnPz:=inifile.ReadString(vs,'cb_pz_pzxz',''); ;
        APackLineInfo[iCicle].Yi_DyBdzt:=inifile.ReadString(vs,'bzx_cb_dkbdzt','');
        APackLineInfo[iCicle].ZdybdSjjg :=inifile.ReadInteger(vs,'bzx_sedt_zdybdjg',2);

        APackLineInfo[iCicle].Jsq_SelectCk :=inifile.ReadInteger(vs,'cb_jsq_ckxz',0) ;

        APackLineInfo[iCicle].Pmj_SelectCk:=inifile.ReadInteger(vs,'pmj_cb_ckxz',0) ;

        APackLineInfo[iCicle].Memory_No:=inifile.ReadString(vs,'pmj_edt_ccqh','') ;

        APackLineInfo[iCicle].pmjSfqy:=inifile.ReadBool(vs,'pmjSfqy',false);
        APackLineInfo[iCicle].ccqnrS:=inifile.ReadString(vs,'pmj_ccqnrS','');
        APackLineInfo[iCicle].ccqnrCode:=inifile.ReadString(vs,'pmj_Code','');
        APackLineInfo[iCicle].ccqnrE:=inifile.ReadString(vs,'pmj_ccqnrE','');
        APackLineInfo[iCicle].PackIng :=false ;//开始肯定没有在装车 的状态
        APackLineInfo[iCicle].RefreshIng :=false ;// 是否正在刷新数据

        v:=APackLineInfo[iCicle].Qydk;
        objname:='dk'+inttostr(iCicle+1);
        TdkCom:=self.FindComponent(objname) ;
        if (v=cstQydk1) or (v=cstQydk12) then
        begin
          (TdkCom as TRzNumericEdit).IntValue:=iCicle*2+1 ;
          APackLineInfo[iCicle].InitDk:=iCicle*2+1 ;
        end
        else if v=cstQydk2 then
        begin
          (TdkCom as TRzNumericEdit).IntValue:=iCicle*2+2 ;
          APackLineInfo[iCicle].InitDk:=iCicle*2+2 ; //当前被分配使用道口
        end;
        APackLineInfo[iCicle].WaitVehicleNum:=0 ; //初始 有0辆车在等待

        APackLineInfo[iCicle].totalNum:=0 ; //累计有几辆车

        objname:='pzph'+inttostr(iCicle+1);
        TpzCom:=self.FindComponent(objname) ;
        if APackLineInfo[iCicle].Sfqypzxz then
          (TpzCom as TRzEdit).Text :=uppercase(APackLineInfo[iCicle].SnPz)
        else
          (TpzCom as TRzEdit).Text:='不区分品种';

        objname:='jsqck'+inttostr(iCicle+1);
        TJsqCom:=self.FindComponent(objname) ;
        (TJsqCom as TRzEdit).Text := 'COM'+inttostr(APackLineInfo[iCicle].Jsq_SelectCk+1);

        objname:='pmj'+inttostr(iCicle+1)+'ck';
        TpmjCkCom:=self.FindComponent(objname) ;
        (TpmjCkCom as TRzEdit).Text :='COM'+inttostr(APackLineInfo[iCicle].Pmj_SelectCk+1) ;

        objname:='pmj'+inttostr(iCicle+1)+'ccq';
        TpmjccqCom:=self.FindComponent(objname) ;
        (TpmjccqCom as TRzEdit).Text :=APackLineInfo[iCicle].Memory_No ;

      end ;
    end;

  finally
    inifile.Free;
  end;
end;

//初始化屏幕信息

procedure TfrmCalWindows.InitScreenInfo(isAll: boolean ;iPk : integer  );
var
  sPackLine : string ;
  inifile   : Tinifile ;
  i ,packID ,kstart,jend , k : integer ;
  sReadStr ,s  : string;
begin
  if isAll then
  begin
    kstart:=0 ;
    jend:= cstUsePkgLine-1 ;
  end
  else
  begin
    kstart:=iPk-1  ;
    jend:=iPk-1 ;

  end;
  inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
  try
    // for i:=0 to cstUsePkgLine*2-1 do  //以道口为循环标志 ,道口需要初始化的
     for i:=kstart to jend do  //以道口为循环标志 ,道口需要初始化的
     begin
        packID:= i + 1 ;
        sPackLine:=inttostr( packID )+c_PackLineName;
        AScreenInfo[i] :=new(TScreenTypePoint) ;
        AScreenInfo[i].Pm_PdCar:=TstringList.Create ;
        {if ( (i+1) mod 2) =0 then
           k:=2
        else }
           k:=1 ;
        sReadStr:= 'pmcs'+inttostr(k)+'_kzkxh' ;
        AScreenInfo[i].Pm_Kzkxh:=inifile.ReadString(sPackLine,sReadStr,'5E2') ;
        sReadStr:= 'pmcs'+inttostr(k)+'_txms' ;
        AScreenInfo[i].Pm_Txms:=inifile.ReadString(sPackLine,sReadStr,'串口');
        sReadStr:= 'pmcs'+inttostr(k)+'_ck' ;
        AScreenInfo[i].Pm_Ck:= inifile.ReadString(sPackLine,sReadStr,'0');
        sReadStr:= 'pmcs'+inttostr(k)+'_btl' ;
        AScreenInfo[i].Pm_Btl:= inifile.ReadString(sPackLine,sReadStr,'57600');
        sReadStr:= 'pmcs'+inttostr(k)+'_w' ;
        AScreenInfo[i].Pm_Wide:= inifile.ReadInteger(sPackLine,sReadStr,128);
        sReadStr:= 'pmcs'+inttostr(k)+'_h' ;
        AScreenInfo[i].Pm_Height:= inifile.ReadInteger(sPackLine,sReadStr,64);
        sReadStr:= 'pmcs'+inttostr(k)+'_pm' ;
        AScreenInfo[i].Pm_Color:= inifile.ReadString(sPackLine,sReadStr,'单基色');
        sReadStr:= 'pmcs'+inttostr(k)+'_tlsj' ;
        AScreenInfo[i].Pm_StopTime:=inifile.ReadInteger(sPackLine,sReadStr,5);
        sReadStr:= 'pmcs'+inttostr(k)+'_ip' ;
        AScreenInfo[i].Ipdz:=inifile.ReadString(sPackLine,sReadStr,'192.168.2.199');
        sReadStr:= 'pmcs'+inttostr(k)+'_duank' ;
        AScreenInfo[i].duank:=inifile.ReadInteger(sPackLine,sReadStr,5005);
        AScreenInfo[i].ReRead:=false ;
        s:=uppercase(APackLineInfo[packID-1].Snpz); //把原来的 "袋装"等字样删除,否则第一行排不下
        s:=stringreplace(s,'(','',[rfReplaceAll]);
        s:=stringreplace(s,'（','',[rfReplaceAll]);
        s:=stringreplace(s,')','',[rfReplaceAll]);
        s:=stringreplace(s,'）','',[rfReplaceAll]);
        s:=stringreplace(s,'袋装','',[rfReplaceAll]);
        s:=stringreplace(s,'散装','',[rfReplaceAll]);
        s:=stringreplace(s,'贡江PC','贡 ',[rfReplaceAll]) ;
        s:=stringreplace(s,'贡江PO','贡 ',[rfReplaceAll]) ;
        s:=stringreplace(s,'P.','P',[rfIgnoreCase]) ;

        s:= inttostr(packID)+'号包机 '+s ; //因为现在1条包装线 的两个道口使用同样的显示内容
        while length(s)<cstlength do
          s:=s+' ';

        AScreenInfo[i].Pm_PdCar.clear ;
        AScreenInfo[i].Pm_PdCar.add(s);
        AScreenInfo[i].AutoNum:=0 ;
        if (APackLineInfo[packID-1].Sfqybzx ) then  //因为一条包装线只有一个LED屏
        begin
         { if ((i=0) or (i=2)) and
             ((APackLineInfo[packID-1].Qydk=cstQydk12) or (APackLineInfo[packID-1].Qydk=cstQydk1) ) then
             AScreenInfo[i].sfQy:=true
          else if ((i=1) or (i=3)) and
             ((APackLineInfo[packID-1].Qydk=cstQydk12) or (APackLineInfo[packID-1].Qydk=cstQydk2) ) then
             AScreenInfo[i].sfQy:=true
          else  }
             AScreenInfo[i].sfQy:=true ;
        end
        else
          AScreenInfo[i].sfQy:=false ;
     end;
  finally
     inifile.Free ;
  end;

  // 接下去给道口分配车辆
  if isAll then
  begin
    kstart:=0 ;
    jend:= cstUsePkgLine-1 ;
  end
  else
  begin
    kstart:=iPk-1 ;
    jend:=iPk-1 ;
  end;

 // for i:=0 to cstUsePkgLine-1 do
  for i:=kstart to jend do
  begin
   //  APackLineInfo[i].RefreshIng :=true;
     try
       if APackLineInfo[i].Sfqybzx then
       begin
          if (APackLineInfo[i].Qydk=cstQydk12)  or (APackLineInfo[i].Qydk=cstQydk1) then
            RefreshListInfo(i, i*2+1)
          else
            RefreshListInfo(i, i*2+2); //包装线，第一个起始道口
          //tDelever[i].Enabled :=true ;
       end;
     finally
      // APackLineInfo[i].RefreshIng :=false ;
     end;

  end;

end;



procedure TfrmCalWindows.FormCreate(Sender: TObject);
var
  i: integer ;
begin
  for i:=0 to 2 do
  begin
    iCommState[i]:= 0 ;
    m_lFrameLen[i] :=0 ;
    lastcount[i] :=0 ;
    ledstate[i]:=0 ;
    dm.BlankBzxWichel(i)  ;//先把包装线清空
  end;

  fillchar(m_lFrameBuf,0,512);
  fillchar(m_lFrameBuf2,0,512);
  fillchar(m_lFrameBuf3,0,512);
  d_haveGetDate:=strtodate('2013-01-01');
  pnlXtcs.Visible :=false ;
  dm.FenPeiBzx(0)  ;//先把包装线清空
end;


//设置读卡器参数
procedure TfrmCalWindows.initDkqParam;
begin
  with dkq_MSCOMM do
  begin
     CommPort:=strtoint(cstDkqCk)+1;
     Settings :=cstDkqBtl+',N,8,1';

     InputLen:=0 ;//读取整个缓冲区内容  ;=1  一次从接收缓冲区读取字节数为1
     RThreshold:=13;//设置接收一个字节产生OnComm事件
     InputMode:=comInputModeBinary ;//ComInputModeText;//设置接受数据模式为二进制方式

     OutBufferCount;//清除发送缓冲区
     InBufferSize:=50;//设置接收缓冲区为50字节
     OutBufferSize:=2 ;//设置发送缓冲区为2字节
     InBufferCount:=0 ;//清空接收缓冲区
     try
        PortOpen:=true ;
     except
        MessageBox(Handle,pchar('打开读卡器串口(COM'+inttostr(strtoint(cstDkqCk)+1)+')端口失败"'),'重要提示', MB_OK+MB_ICONWARNING);
     end; 

  end;

end;

//初始化计数器参数
procedure TfrmCalWindows.initJSQ_PMJ_Param;
var
  i : integer ;
  sName,sTx,objname : string ;
  TCOM,TTXCom,TMCom : Tcomponent ;
begin
  for i:=0 to cstUsePkgLine-1 do
  begin
     if APackLineInfo[i].Sfqybzx then
     begin
        //这里是jsq
        sName:='jsq'+inttostr(i+1) ;
        TCOM:=self.FindComponent(sName) ;
        sTx:='tx'+inttostr(i+1) ;
        TTXCom:=self.FindComponent(sTx) ;
        objname:='Memo'+inttostr(i+1) ;
        TMCom:=self.FindComponent(objname) ;

        with (TCOM as TMSComm ) do
        begin
           CommPort:=APackLineInfo[i].Jsq_SelectCk+1 ;
           Settings :='9600,N,8,1';
           InputLen:=0 ;//读取整个缓冲区内容  ;=1  一次从接收缓冲区读取字节数为1
           RThreshold:=1;//设置接收几 个字节产生OnComm事件
           InputMode:=comInputModeBinary ;//ComInputModeText;//设置接受数据模式为二进制方式
           try
             if not PortOpen then
                PortOpen:=true ;
             (TTXCom as TTorryButton ).color:=clRed ;
           except
             (TTXCom as TTorryButton ).color:=clGray ;
             (TMCom as TMemo).Lines.Add('打开'+inttostr(i+1)+'#包装线jsq串口(COM'+inttostr(CommPort)+')失败"') ;
             MessageBox(Handle,pchar('打开'+inttostr(i+1)+'#包装线jsq串口(COM'+inttostr(CommPort)+')失败"'),'重要提示', MB_OK+MB_ICONWARNING);
           end;
        end;

        //下面是初始化pmj
        if APackLineInfo[i].pmjSfqy then
        begin
          sName:='pmj'+inttostr(i+1) ;
          TCOM:=self.FindComponent(sName) ;
          sTx:='pmj'+inttostr(i+1)+'_h' ;
          TTXCom:=self.FindComponent(sTx) ;
          with (TCOM as TMSComm ) do
          begin
             CommPort:=APackLineInfo[i].Pmj_SelectCk+1 ;
             Settings :='9600,N,8,1';
             InputLen:=0 ;//读取整个缓冲区内容  ;=1  一次从接收缓冲区读取字节数为1
             RThreshold:=1;//设置接收几 个字节产生OnComm事件
             InputMode:=comInputModeBinary ;//ComInputModeText;//设置接受数据模式为二进制方式
             try
                if not PortOpen then
                  PortOpen:=true ;
                (TTXCom as TTorryButton ).color:=clRed ;
             except
                (TTXCom as TTorryButton ).color:=clGray ;
                (TMCom as TMemo).Lines.Add('打开'+inttostr(i+1)+'#包装线pmj串口(COM'+inttostr(CommPort)+')失败"');
                MessageBox(Handle,pchar('打开'+inttostr(i+1)+'#包装线pmj串口(COM'+inttostr(CommPort)+')失败"'),'重要提示', MB_OK+MB_ICONWARNING);
             end;
          end;
        end;

     end;

  end;

  
end;

//读卡器读数
procedure TfrmCalWindows.DKQ_MSCommComm(Sender: TObject);
var
 vBuffer: Olevariant;
 sTemp,sMemoName ,objname,sfBrushCard: string ;
 cReceive,i,CheckData: integer ;
 sAy : array [0..12] of byte ; //读卡器规定是13个字节
 dkq_Ch,iPNo: integer ; //读卡器通道号
 cardID,loadCard: AnsiString ;  //卡号
 TmemoCom,TTimeCom,TListCom  : Tcomponent ;
begin
//接收
   if dkq_MSComm.CommEvent=comEvReceive then
   begin
      if dkq_MSComm.InBufferCount=0 then
        exit ;
      try
        DKQ_MSComm.OnComm:=nil ;
        cReceive:=dkq_MSComm.InBufferCount ;
        vBuffer:=dkq_MSComm.Input;
        sTemp:=vBuffer;
        CheckData:=0 ;
        dkq_MSComm.InBufferCount:=0 ;
        if cReceive>12 then
        begin
           for  i:=0 to 12 do
             sAy[i]:= vBuffer[i];
           for i:=0 to 11 do
             CheckData:=CheckData xor sAy[i] ;
        end;

        if (sAy[0]=$BB) and (sAy[1]=$FF) and (CheckData=byte(sAy[12])) and  //这行都一样
           (byte(sAy[3])=4) then //万年读卡器命令
       //   (byte(sAy[4])=6) and (byte(sAy[3])=5)  then  //石城读卡器命令
        begin
            //有效数据
            // 读卡器接收到的1号地址对应1号道口
           dkq_Ch:=sAy[2];

           iPNo:=(dkq_Ch-1) div 2 ;

           objname:='plist'+inttostr(iPNo+1);
           TListCom:=self.FindComponent(objname) ;
           if (TListCom as TETSListView).Items.Count=0 then //当前道口没有记录
              exit ;

           loadCard:= trim((TListCom as TETSListView).Items[0].SubItems[1]) ; //取第一行记录的值
           sfBrushCard:= trim((TListCom as TETSListView).Items[0].SubItems[8]) ; //是否刷卡

           cardID:=Format('%.10u',[GetCarId(sAy)]); //卡号
           ////当前道口正在装车 or 已经刷卡了  ,不允许再刷卡
           if (cardID=loadCard) and ((APacklineInfo[iPNo].Packing ) or (sfBrushCard='1')) then
             exit ;

           if cardID=loadCard then
           begin
               // 控制 刷卡 2013-09-6 start
                //如果不允许提前刷卡;0 不允许；1允许 ;同时该包装线正在装车的
               if (cstPreShuaKa=0) and (APackLineInfo[iPNo].PackIng) then
               begin
                  exit ;
               end ;
               //控制刷卡 2013-09-6  end

               //cardID:=inttostr(GetCarId(sAy)); //卡号
               cardID:=Format('%.10u',[GetCarId(sAy)]); //卡号
               if (dkq_Ch>0) and (dkq_Ch<=cstUsePkgLine*2) then   //读卡器通道号从1开始
               begin //刷卡成功;  需要判断当前卡号是否和当前轮到的车牌号一致

                 sMemoName:='Memo'+ inttostr( iPNo+1 );
                 TmemoCom:=self.FindComponent(sMemoName) ;
                 (TmemoCom as TMemo).Lines.Add('dkq_Ch:'+inttostr(dkq_Ch)) ;
                 (TmemoCom as TMemo).Lines.Add('cardId:'+cardId) ;
                 tDelever[iPNo].Enabled :=false ;
                 (TListCom as TETSListView).Items[0].SubItems[8]:='1';
                 dkqT:= TDkqThread.Create(dkq_Ch,cardId);
                 dkqT.Resume ;
               end;
           end
           else //if cardID=loadCard then
           begin
              if ((TListCom as TETSListView).Items.Count>1) and
                 (trim((TListCom as TETSListView).Items[1].SubItems[8])='0') and
                 (inttostr(dkq_Ch)=trim((TListCom as TETSListView).Items[1].SubItems[2]) ) and
                 (cardID=trim((TListCom as TETSListView).Items[1].SubItems[1]) ) then
              begin
                // loadCard:= trim((TListCom as TETSListView).Items[1].SubItems[1]) ;
                 (TListCom as TETSListView).Items[1].SubItems[8]:='1';  //置刷卡标志
                 //把 当前信息下发到LED屏start
                 //需要提示已经刷卡，但是又要和装车数量下发不能冲突，只能放在数量下发的位置
                 //这里置提前标志 标志 ,因为刷卡了，LED屏要显示,在下发数据时一起显示，免得冲突
                 sfPreShuaka[iPNo]:=true ;
                 //把 当前信息下发到LED屏end
              end
           end;
        end
        else
           Memo1.Lines.Add('Card_Error:'+cardId);
      finally
        DKQ_MSComm.OnComm:=DKQ_MSCommComm ;
      end;
   end;
 
end;

function TfrmCalWindows.GetCarId(data : array of byte): cardinal;
begin
  // result:=(data[5])*$1000000+data[6]*$10000+data[7]*$100+data[8]; //for yt
   result:=(data[7])*$1000000+data[6]*$10000+data[5]*$100+data[4]; //for wn

end;



procedure TfrmCalWindows.FormDestroy(Sender: TObject);
var
  i: integer ;
begin
  Dm.ADOCnn.Execute('update pm_data set readok=0 where readok=169');
  for i:=0 to cstUsePkgLine-1  do
  begin
     try
       if (LedInitFlag[i]=1) and (AScreenInfo[i].sfQy ) then
       begin
         nResult := DeleteScreenDynamicAreaFile[i](1, 0 , 0);
         nResult := SendDeleteDynamicAreasCommand[i](1, 1, '');
         nResult := DeleteScreen[i](1);
       end;
     except
     end;
  end ;
   
  cstCurRunlist.Free;
  
end;



//参数1_包装线号; 参数2 _通道号 ;参数3 _发送数量(有可能是报警数量最后10包)
//JsqNo=ApackLine+1
////res=0  装车   res=1 等待 装车
procedure TfrmCalWindows.SendJsqInfo(ApackLine, AJsqNo,ASendQuantity,res: integer);
var
  cmd : array [0..17] of byte;
  i,ret : integer ;
  b:boolean ;
  objname : string ;
  TmCom : TComponent ;
begin
 b:=false ;
 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;

  if res=0 then
    cmd[0]:=$30
  else
    cmd[0]:=$31;  //等待

  cmd[1]:=getChanelOX(AJsqNo);
   ///车牌
  cmd[2]:=$B4;
  cmd[3]:=$41;
  cmd[4]:=$30;
  cmd[5]:=$30;
  cmd[6]:=$30;
  cmd[7]:=$30;
  cmd[8]:=$30;
      //数量
   ret:= ASendQuantity div 1000;
   if ret>0 then
   begin
     cmd[9]:=$30+ret ;
     b:=true;
   end;

   ret:=(ASendQuantity mod 1000) div 100;
   if (ret>0)  or b then
   begin
     b:=true ;
     cmd[10]:=$30+ret ;
   end;

   ret:=(ASendQuantity mod 100) div 10;
   if (ret>0) or b  then
     cmd[11]:=$30+ret ;

   ret:=ASendQuantity mod 10 ;
   cmd[12]:=$30+ret ;


 cmd[16]:=DataCheckJy(cmd,16);

 comSend(cmd,17,ApackLine);
 objname:='Memo'+inttostr(APackLine+1);
 TmCom:= self.FindComponent(objname) ;
 (TmCom as TMemo).Lines.Add('SendJsqInfo');
end;

procedure TfrmCalWindows.comSend(data: array of byte; len,ApackLine: integer);
var
  i,sendlen: integer ;
  sendbuf: array [0..511] of BYTE;
  v: Olevariant ;
  objname : string ;
  TjsqCom :Tcomponent ;
begin
  sendbuf[0]:=$1B;
  sendbuf[1]:=$41;
  copymemory(@sendbuf[2],@data,len);
  sendbuf[len+2]:=$0D;
  sendlen := len+3;
  v:=VarArrayCreate([0,sendlen-1],varbyte);

  for i:=0 to sendlen -1 do
    v[i]:=sendbuf[i] ;

  try
    objname:='jsq'+inttostr(APackLine+1);
    TJsqcom:=self.FindComponent(objname) ;
    (TjsqCom as TMSComm).Output:=v ;

  except
  end;

end;

procedure TfrmCalWindows.pmjcomSend(data: array of byte; len,ApackLine: integer);
var
  i,sendlen: integer ;
  sendbuf: array [0..511] of BYTE;
  v: Olevariant ;
  objname : string ;
  TpmjCom :Tcomponent ;
begin
 // sendbuf[0]:=$1B;
//  sendbuf[1]:=$41;
  copymemory(@sendbuf,@data,len);
//  sendbuf[len+2]:=$0D;
  sendlen := len;
  v:=VarArrayCreate([0,sendlen-1],varbyte);

  for i:=0 to sendlen -1 do
    v[i]:=sendbuf[i] ;

  try
    objname:='pmj'+inttostr(APackLine+1);
    TpmjCom:=self.FindComponent(objname) ;
    (TpmjCom as TMSComm).Output:=v ;
  except
  end;

end;

procedure TfrmCalWindows.JsqClear(ApackLine: integer);
var
  cmd : array [0..17] of byte;
  i  : integer ;
  objname : string ;
  TmCom : Tcomponent ;
begin
 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;

 cmd[1]:=getChanelOX(ApackLine+1);
 cmd[2]:=$4B;
 cmd[3]:=$4C;
 cmd[14]:=$5A ;
 cmd[16]:=DataCheckJy(cmd,16);

 comSend(cmd,17,ApackLine);

 objname:='Memo'+inttostr(ApackLine+1);
 TmCom:=self.FindComponent(objname) ;
 (TmCom as TMemo).Lines.Add('JsqClear') ;


end;



procedure TfrmCalWindows.PackLine_Jsq_XhSf(APackLine ,Aop : integer );//包装线计数器 吸合释放  //0吸合 ，1释放
var
  cmd : array [0..17] of byte;
  i  : integer ;
  objname : string ;
  TmCom: TComponent ;
begin
 for i:=0 to 15 do
   cmd[i]:=$20;

 cmd[0]:=$32;
 cmd[1]:=getChanelOX(ApackLine+1);

 objname:='Memo'+inttostr(ApackLine+1);
 TmCom:=self.FindComponent(objname) ;

 if Aop=0 then//0吸合 ，1释放
 begin
   /// cmd[15]:=$A5;
   cmd[13]:=$A5;
   cmd[16]:=DataCheckJy(cmd,16);  //$68

   (TmCom as TMemo).Lines.Add('PackLine_Jsq_XhSf A5') ;

 end
 else
 begin
 ///  cmd[15]:=$5A;
   cmd[13]:=$5A;
   cmd[16]:=DataCheckJy(cmd,16);;    //$C4
   (TmCom as TMemo).Lines.Add('PackLine_Jsq_XhSf 5A') ;
 end;

 comSend(cmd,17,ApackLine);
 comSend(cmd,17,ApackLine);
 comSend(cmd,17,ApackLine);

end;

//计数器收到信息
procedure TfrmCalWindows.jsq1Comm(Sender: TObject);
var
  j, cReceive : integer ;
  nTemp : BYTE ;
  vTempCom: Olevariant ;
begin
//接收
   if jsq1.CommEvent=comEvReceive then
   begin
      while true do
      begin
        if jsq1.InBufferCount=0 then
          exit ;
        cReceive:=jsq1.InBufferCount ;
        jsq1.InputLen:=cReceive ;
        vTempCom:=jsq1.Input;
        for j:=0 to cReceive-1 do
        begin
          nTemp:=vTempCom[j];
          case iCommState[0] of
            0: if(nTemp = $1B) then
              begin
                iCommState[0]:=1;
               // break ;
              end;
            1: if(nTemp = $41) then
               begin
                 iCommState[0] := 2;
                 m_lFrameLen[0] :=0;
               end
               else if(nTemp <> $1B) then
                 iCommState[0] := 0;
            2: if(nTemp=$0D) then
               begin
                 iCommState[0] :=0;
                 if(m_lFrameLen[0] >=255) then
                   break;
                  jsqProc1(m_lFrameBuf,m_lFrameLen[0],0);

                  fillchar(m_lFrameBuf,0,sizeof(m_lFrameBuf)) ;

               end
               else
               begin
                  if (m_lFrameLen[0] >=255) then
                     iCommState[0]:=0
                  else
                  begin
                    m_lFrameBuf[m_lFrameLen[0]]:=nTemp;
                    inc(m_lFrameLen[0]) ;
                  end ;
               end;
            else
              iCommState[0] :=0;
          end; //case
        end;  //for j:=0 to cReceive-1 do
      end; //while true do

   end;

end;

procedure TfrmCalWindows.jsq2Comm(Sender: TObject);
var
  j, cReceive : integer ;
  nTemp : BYTE ;
  vTempCom: Olevariant ;
begin
//接收
   if jsq2.CommEvent=comEvReceive then
   begin
      while true do
      begin
        if jsq2.InBufferCount=0 then
          exit ;
        cReceive:=jsq2.InBufferCount ;
        jsq2.InputLen:=cReceive ;
        vTempCom:=jsq2.Input;
        for j:=0 to cReceive-1 do
        begin
          nTemp:=vTempCom[j];
          case iCommState[1] of
            0: if(nTemp = $1B) then
              begin
                iCommState[1]:=1;
               // break ;
              end;
            1: if(nTemp = $41) then
               begin
                 iCommState[1] := 2;
                 m_lFrameLen[1] :=0;
               end
               else if(nTemp <> $1B) then
                 iCommState[1] := 0;
            2: if(nTemp=$0D) then
               begin
                 iCommState[1] :=0;
                 if(m_lFrameLen[1] >=255) then
                   break;
                  jsqProc2(m_lFrameBuf2,m_lFrameLen[1],0);

                  fillchar(m_lFrameBuf2,0,sizeof(m_lFrameBuf2)) ;

               end
               else
               begin
                  if (m_lFrameLen[1] >=255) then
                     iCommState[1]:=0
                  else
                  begin
                    m_lFrameBuf2[m_lFrameLen[1]]:=nTemp;
                    inc(m_lFrameLen[1]) ;
                  end ;
               end;
            else
              iCommState[1] :=0;
          end; //case
        end;  //for j:=0 to cReceive-1 do
      end; //while true do

   end;

end;

procedure TfrmCalWindows.jsq3Comm(Sender: TObject);
var
  j, cReceive : integer ;
  nTemp : BYTE ;
  vTempCom: Olevariant ;
begin
//接收
   if jsq3.CommEvent=comEvReceive then
   begin
      while true do
      begin
        if jsq3.InBufferCount=0 then
          exit ;
        cReceive:=jsq3.InBufferCount ;
        jsq3.InputLen:=cReceive ;
        vTempCom:=jsq3.Input;
        for j:=0 to cReceive-1 do
        begin
          nTemp:=vTempCom[j];
          case iCommState[2] of
            0: if(nTemp = $1B) then
              begin
                iCommState[2]:=1;
               // break ;
              end;
            1: if(nTemp = $41) then
               begin
                 iCommState[2] := 2;
                 m_lFrameLen[2] :=0;
               end
               else if(nTemp <> $1B) then
                 iCommState[2] := 0;
            2: if(nTemp=$0D) then
               begin
                 iCommState[2] :=0;
                 if(m_lFrameLen[2] >=255) then
                   break;
                  jsqProc3(m_lFrameBuf3,m_lFrameLen[2],0);

                  fillchar(m_lFrameBuf3,0,sizeof(m_lFrameBuf3)) ;

               end
               else
               begin
                  if (m_lFrameLen[2] >=255) then
                     iCommState[2]:=0
                  else
                  begin
                    m_lFrameBuf3[m_lFrameLen[2]]:=nTemp;
                    inc(m_lFrameLen[2]) ;
                  end ;
               end;
            else
              iCommState[2] :=0;
          end; //case
        end;  //for j:=0 to cReceive-1 do
      end; //while true do

   end;

end;

procedure TfrmCalWindows.JsqAlarm(APackLine: integer);
var
  cmd : array [0..17] of byte;
  i  : integer ;
  objname : string ;
  TmCom : TComponent ;
begin
 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;

 cmd[1]:=getChanelOX(ApackLine+1);
 ///cmd[2]:=$B4;
 ///cmd[4]:=$4D;  //发给显示屏的报警
 cmd[14]:=$A5 ; //计数器报警
 cmd[16]:=DataCheckJy(cmd,16);

 comSend(cmd,17,ApackLine);
  for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;

 cmd[1]:=getChanelOX(ApackLine+1);
  cmd[2]:=$B4;
  cmd[4]:=$4D;  //发给显示屏的报警显示
 cmd[16]:=DataCheckJy(cmd,16);
 comSend(cmd,17,ApackLine);

  objname :='Memo'+inttostr(APackLine+1);
  TmCom :=self.FindComponent(objname) ;
  (TmCom as TMemo).Lines.Add('JsqAlarm') ;

end;
procedure TfrmCalWindows.ClearJsqAlarm(APackLine: integer);
var
  cmd : array [0..17] of byte;
  i  : integer ;
  objname : string ;
  TmCom : TComponent ;
begin
 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;

 cmd[1]:=getChanelOX(ApackLine+1);
 ///cmd[2]:=$B4;
 ///cmd[4]:=$4D;  //发给显示屏的报警
 cmd[14]:=$5A ; //计数器报警
 cmd[16]:=DataCheckJy(cmd,16);
 comSend(cmd,17,ApackLine);

 objname :='Memo'+inttostr(APackLine+1);
 TmCom :=self.FindComponent(objname) ;
 (TmCom as TMemo).Lines.Add('ClearJsqAlarm') ;

end;




procedure TfrmCalWindows.CloseZadao(ApackLine: integer);
var
  cmd : array [0..17] of byte;
  i  : integer ;
  objname : string ;
  TmCom : TComponent ;
begin
 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;
 cmd[1]:=getChanelOX(ApackLine+1);

 cmd[15]:=$5A ;
 cmd[16]:=DataCheckJy(cmd,16);
 comSend(cmd,17,ApackLine);

 objname :='Memo'+inttostr(APackLine+1);
 TmCom :=self.FindComponent(objname) ;
 (TmCom as TMemo).Lines.Add('CloseZadao') ;

end;

procedure TfrmCalWindows.OpenZadao(ApackLine: integer);
var
  cmd : array [0..17] of byte;
  i  : integer ;
  objname : string ;
  TmCom : TComponent ;
begin
 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;
 cmd[1]:=getChanelOX(ApackLine+1);

 ///cmd[2]:=$B4;
// cmd[5]:=$4F;
// cmd[6]:=$51;
// cmd[5]:=$4E ;
  cmd[15]:=$A5 ;
 cmd[16]:=DataCheckJy(cmd,16);
 comSend(cmd,17,ApackLine);

 objname :='Memo'+inttostr(APackLine+1);
 TmCom :=self.FindComponent(objname) ;
 (TmCom as TMemo).Lines.Add('OpenZadao') ;

end;


procedure TfrmCalWindows.resetCurRegister(APackLine: integer);
var
  buf : array [0..6] of BYTE ;
  objname : string ;
  TmCom : TComponent ;
begin
 // BYTE buf[]={0x1B,0x41,0x2E,0x22,0xFF,0,0x0D};
  buf[0]:=$1B ;
  buf[1]:=$41 ;
  buf[2]:=$2E ;
  buf[3]:=$22 ;
  buf[4]:=$FF ;
  buf[5]:=0 ;
  buf[6]:=$0D ;
  pmjcomSend(buf,7,ApackLine);
  objname :='Memo'+inttostr(APackLine+1);
  TmCom :=self.FindComponent(objname) ;
  (TmCom as TMemo).Lines.Add('resetCurRegister') ;
end;

procedure TfrmCalWindows.setCurRegister(APackLine: integer);
var
  buf : array [0..5] of BYTE ;
  objname : string ;
  TmCom : TComponent ;
begin
 // BYTE buf[]={0x1B,0x41,0x2C,0x22,0x20,0x0D};
  buf[0]:=$1B ;
  buf[1]:=$41 ;
  buf[2]:=$2C ;
  buf[3]:=$22 ;
  buf[4]:=$20 ;
  buf[5]:=$0D ;
  buf[4]:=$20+strtoint(APackLineInfo[ApackLine].Memory_No)-1;
  pmjcomSend(buf,6,ApackLine);
  objname :='Memo'+inttostr(APackLine+1);
  TmCom :=self.FindComponent(objname) ;
  (TmCom as TMemo).Lines.Add('setCurRegister') ;
end;

procedure TfrmCalWindows.setCurRegisterVal(APackLine: integer;
  ASendContent: AnsiString);
var
  buf: array [0..254] of BYTE ;
  len : integer  ;
  objname : string ;
  TmCom : TComponent ;
begin
 // len:=0 ;
  buf[0]:=$1B;
  buf[1]:=$41;
  buf[2]:=$29;
  buf[3]:=$22+length(ASendContent);
  buf[4]:=$20+strtoint(APackLineInfo[ApackLine].Memory_No)-1;
  copymemory(@buf[5],PAnsiChar(ASendContent), Length(ASendContent)); ///转换内容有问题
  len:=length(ASendContent)+5;
  buf[len]:=$D;
  pmjcomSend(buf,len+1,APackLine);
  objname :='Memo'+inttostr(APackLine+1);
  TmCom :=self.FindComponent(objname) ;
  (TmCom as TMemo).Lines.Add('setCurRegisterVal') ;

end;

{ TRefreshLedThread }

constructor TRefreshLedThread.Create(TAPackLine, TADk: integer);
begin
  inherited Create(true);
   TFPackLine:=TAPackLine ;
   TFDk :=TADk ;
end;


procedure TRefreshLedThread.Execute;
var
  sViewName ,sNum ,sUpValue : string ;
begin
   FreeOnTerminate:=true ;
  with frmCalWindows do
  begin

     sNum:=inttostr(jsqcurcount[TFPackLine]);
     while length(sNum)<4 do
       sNum:='0'+sNum ;

    sUpValue:= trim(AScreenInfo[TFPackLine].Pm_PdCar.strings[1]);  //第0行是装车车牌和水泥型号
    sUpValue:='已装'+sNum +copy(sUpValue,9,8);   //已装0000待装9999
    while length(sUpValue)<cstLength do
        sUpValue:=sUpValue+' ' ;

    AScreenInfo[TFPackLine].Pm_PdCar.delete(1);
    AScreenInfo[TFPackLine].Pm_PdCar.Insert(1,sUpValue);

    if sfPreShuaKa[TFPackLine] then
    begin
      sUpValue:=AScreenInfo[TFPackLine].Pm_PdCar.Strings[2] ;
      sUpValue :=stringReplace(sUpValue,'等待','已刷',[rfReplaceAll]) ;
      AScreenInfo[TFPackLine].Pm_PdCar.delete(2);
      AScreenInfo[TFPackLine].Pm_PdCar.Insert(2,sUpValue);
      sfPreShuaKa[TFPackLine]:=false ;//把已经刷卡的标志重新置回去
    end;
    sViewName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(TFPackLine+1)+'_led.txt';

    AScreenInfo[TFPackLine].Pm_PdCar.SaveToFile(sViewName);
    SendDynamicAreaInfoCommand[TFPackLine](1, 0);
  end;
end;

{ TDkqThread }

constructor TDkqThread.Create(ADk: integer; ACardID: string);
begin
  inherited Create(true);
   FhDk :=ADk ;
   FhCardID :=ACardID ;

end;

procedure TDkqThread.Execute;
var
  sUpSql,ACardID,objname : string ;
  sCarLedUp,sFileName ,objlistName : string ;
  DkChanel,iPackNo ,NextDk ,RuningDK: integer ;
  TListCom , TimerCom : TComponent ;
  sSql,sCarNo ,sLadeID  : string ;
  TcphCom,TNumCom,TSnpzCom,TCardCom,TfpbhCom,TpmjpmnrCom ,TjsqCom,TmemoCom : Tcomponent ;
begin
  FreeOnTerminate:=true ;
  with frmCalWindows do
  begin

    Memo1.Lines.Add('sDk:'+inttostr(FhDk));
    DkChanel:= FhDk ;   // (DkChanel=1,2,3,4 )
   // NextDk:= DkChanel ;
    ACardID:= FhCardID ;

    iPackNo:= ((DkChanel-1) div 2) + 1 ;  //转换成包装线
    objname:='Memo'+inttostr(iPackNo) ;
    TmemoCom:=FindComponent(objname);
    objlistName :='plist'+inttostr(iPackNo);
    TListCom :=FindComponent(objlistName);

   { dkObj:= 'dk'+inttostr(iPackNo) ;
    TdkCom :=FindComponent(dkObj) ;  }

    if (TListCom as TETSListView).Items.Count=0 then
     exit ;

    //caption序号 |0车牌号|1卡号|2道口|3数量|4客户编码|5水泥编号|6开票时间|7 LadeID|8是否刷卡
    //如果第一条记录的卡号和当前刷卡的卡号不同，那么表示不是当前记录
    if pos(ACardID,(TListCom as TETSListView).Items[0].SubItems[1])>0 then //卡号前面是0的没有读出来
   // if strtoint(ACardID)=strtoint((TListCom as TETSListView).Items[0].SubItems[1]) then //卡号前面是0的没有读出来
    begin
       AutoRefreshNum[iPackNo-1]:=0;
       ladeID[iPackNo-1]:='0' ;
       tDelever[iPackNo-1].Enabled :=false ;

       sCarNo:= trim((TListCom as TETSListView).Items[0].SubItems[0]); //车牌号
       sLadeID :=trim((TListCom as TETSListView).Items[0].SubItems[7]); //发货单号
     //需要重新判断当前刷卡信息是否正确，防止数据库已经 修改了,比如包装线，水泥品种等信息
       if ApacklineInfo[iPackNo-1].Sfqypzxz then //启用品种选择
          sSql:=' select a.Card_no,a.tool_number ,a.customer_number ,a.item_name ,'+
                ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                ' from pm_data a '+
                ' where a.readok<>1 and isnull(a.packlineno,0)='+inttostr(iPackNo)+
                ' and upper(a.status)=''TARE'' and a.item_name='+quotedstr(APackLineInfo[iPackNo-1].SnPz)+
                ' and a.shipment_number='+quotedstr(sLadeID) +
                ' order by readok desc ,a.bill_date '
       else
          sSql:=' select a.Card_no,a.tool_number ,a.customer_number ,a.item_name,'+
                ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                ' from pm_data a '+
                ' where a.readok<>1 and isnull(a.packlineno,0)='+inttostr(iPackNo)+
                ' and upper(a.status)=''TARE''  '+
                ' and a.shipment_number='+quotedstr(sLadeID) +
                ' order by readok desc ,a.bill_date ';

       DM.OpenChannel(self.handle,ds_Check,sSql);
       if  ds_Check.DataSet.IsEmpty then //如果为空，那么表示原来数据已经被修改了
       begin
          //如果轮到该车刷卡，但是找不到信息 ，表示已被修改，且是2分钟之内的（上次刷新后操作的）
          //那么直接 切换道对方道口，数据重新刷新
           JsqStatus[iPackNo-1]:=0;
           JsqClear(iPackNo-1);
           JsqClear(iPackNo-1);
           JsqClear(iPackNo-1);

           JsqLjClear(iPackNo-1);
           JsqLjClear(iPackNo-1);
           JsqLjClear(iPackNo-1);

           CloseZadao(iPackNo-1);
           CloseZadao(iPackNo-1);
           CloseZadao(iPackNo-1);
           ClearJsqAlarm(iPackNo-1);
           ClearJsqAlarm(iPackNo-1);
           NextDk:=getNextDaokou(iPackNo-1,DkChanel);
           RefreshListInfo(iPackNo-1,NextDk);
           try
             if AScreenInfo[iPackNo-1].sfQy then
             begin
               sFileName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(iPackNo )+'_led.txt';
               AScreenInfo[iPackNo-1].Pm_PdCar.SaveToFile(sFileName);
               SendDynamicAreaInfoCommand[iPackNo-1](1, 0);
             end;

           except
           end;
           APackLineInfo[iPackNo-1].PackIng:=false ;
           //处理 扳道 动作start

           PackLine_Jsq_XhSf(iPackNo-1,(DkChanel mod 2) )  ;
           sUpSql:='update pm_data set readok=0 '+
                   ' where  shipment_number='+quotedstr(sLadeID) ;
           Dm.ADOCnn.Execute(sUpSql);

           //处理 扳道 动作end

       end
       else   //if  ds_Check.DataSet.IsEmpty then
       begin  //执行刷卡成功操作
          sUpSql:='update pm_data set readok=170 '+
                  ' where  shipment_number='+quotedstr(sLadeID) ;
          Dm.ADOCnn.Execute(sUpSql);

          try
            sleep(200);
            PackLine_Jsq_XhSf(iPackNo-1,((DkChanel+1) mod 2) )  ;
            PackLine_Jsq_XhSf(iPackNo-1,((DkChanel+1) mod 2) )  ;
           { sleep(300);
            Openzadao(iPackNo-1);
            Openzadao(iPackNo-1);   }
          except
          end;

          //重新读取数量，防止数量被改变了
          try
            (TListCom as TETSListView).Items[0].SubItems[3]:=trim(vartostr(ds_Check.DataSet.FieldValues['schedule_count'])) ;
          except
           // memo1.Lines.Add('-1001') ;
            (TmemoCom as TMemo).Lines.Add('-1001') ;
          end;
          //接下去需要把数据放在具体Edit编辑框中

            objname:='cph'+inttostr(iPackNo);
            TcphCom:=FindComponent(objName);

            objname:='num'+inttostr(iPackNo);
            TNumCom:=FindComponent(objName);

            objname:='snpz'+inttostr(iPackNo);
            TSnpzCom:=FindComponent(objName);

            objname:='Card'+inttostr(iPackNo);
            TCardCom:=FindComponent(objName);

            objname:='fpbh'+inttostr(iPackNo);
            TfpbhCom:=FindComponent(objName);

            objname:='pmj'+inttostr(iPackNo)+'pmnr';
            TpmjpmnrCom:=FindComponent(objName);

            //caption序号 |0车牌号|1卡号|2道口|3数量|4客户编码|5水泥编号|6开票时间|7 LadeID
            (TcphCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[0]);
            (TNumCom as TRzNumericEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[3]);
            (TSnpzCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[5]);
            (TCardCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[1]);
            (TfpbhCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[7]);
            if (APackLineInfo[iPackNo-1].pmjsfqy) and (APackLineInfo[iPackNo-1].ccqnrCode='1') then
              (TpmjpmnrCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[4])
            else if (APackLineInfo[iPackNo-1].pmjsfqy) and (APackLineInfo[iPackNo-1].ccqnrCode='2') then
              (TpmjpmnrCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[5])
            else if (APackLineInfo[iPackNo-1].pmjsfqy) and (APackLineInfo[iPackNo-1].ccqnrCode='3') then
              (TpmjpmnrCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[5])+
                             trim((TListCom as TETSListView).Items[0].SubItems[4])
            else
              (TpmjpmnrCom as TRzEdit).Text :='' ;

            //接下去更新 待发送的列表

          //   sCarLedUp:=sCarNo+'  '+'装车中 '; //刷卡成功， 显示 "已装0000待装9999"  2013-12-14
             sCarLedUp:=trim((TListCom as TETSListView).Items[0].SubItems[3]) ;//数量
             while length(sCarLedUp)<4 do
               sCarLedUp:='0'+sCarLedUp ;

             sCarLedUp:='已装0000'+'待装'+ sCarLedUp ;
             while length(sCarLedUp)<cstLength do
              sCarLedUp:=sCarLedUp+' ' ;
              
             try
               if AScreenInfo[iPackNo-1].sfQy then
               begin
                 AScreenInfo[iPackNo-1].Pm_PdCar.Delete(1);
                 AScreenInfo[iPackNo-1].Pm_PdCar.Insert(1,sCarLedUp);
                 sFileName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(iPackNo)+'_led.txt';
                 AScreenInfo[iPackNo-1].Pm_PdCar.SaveToFile(sFileName);
                 SendDynamicAreaInfoCommand[iPackNo-1](1, 0);
               end;

             except

               (TmemoCom as TMemo).Lines.Add('-1002') ;
             end;
             APackLineInfo[iPackNo-1].PackIng:=true ;
             tDelever[ipackNo-1].Enabled :=false ;
  //====================
  //之前的计数值保留下来，刷卡后,如果之前的值>本次的装车，
  // 那么会把这次的装车直接认为已装完 ，放在读取计数之前
  //====================
             try
               if iPackNo=1 then
                 jsq1.OnComm:=jsq1Comm
               else if iPackNo=2 then
                 jsq2.OnComm:=jsq2Comm
               else if iPackNo=3 then
                 jsq3.OnComm:=jsq3Comm ;
             except
              // memo1.Lines.Add('jsqOnComm') ;
               (TmemoCom as TMemo).Lines.Add('-1003') ;
             end;

             sleep(200);

             JsqClear(iPackNo-1)  ;//计数器先清零
             JsqClear(iPackNo-1)  ;//计数器先清零
             JsqClear(iPackNo-1)  ;//计数器先清零
             sleep(200);
             JsqLjClear(iPackNo-1) ;
             JsqLjClear(iPackNo-1) ;
             JsqLjClear(iPackNo-1) ;
             sleep(200);
             ClearJsqAlarm(iPackNo-1);
             ClearJsqAlarm(iPackNo-1);

          //   (TmemoCom as TMemo).Lines.Add('8011') ;
             try
               if APackLineInfo[ipackNo-1].pmjSfqy then
               begin
                 setCurRegisterVal(iPackNo-1,APackLineInfo[iPackNo-1].ccqnrS+(TpmjpmnrCom as TRzEdit).Text+ APackLineInfo[iPackNo-1].ccqnrE);

                 sleep(100);
                 setCurRegister(iPackNo-1);
                 sleep(300);
                 resetCurRegister(iPackNo-1) ;
                 sleep(200);
                 resetCurRegister(iPackNo-1) ;
                 sleep(100);
                 resetCurRegister(iPackNo-1) ;
               //  sleep(200);
               end;
             except
               (TmemoCom as TMemo).Lines.Add('-1004') ;
             end;
          //接下去把数据传给计数器

             try
               sleep(200) ;
              // objname:='num'+inttostr(iPackNo);
              // TNumCom:=FindComponent(objName);
               SendJsqInfo(iPackNo-1,iPackNo,(TNumCom as TRzNumericEdit).IntValue,0 ); //包装线，通道号 ,发送数量
               sleep(200) ;
               SendJsqInfo(iPackNo-1,iPackNo,(TNumCom as TRzNumericEdit).IntValue,0 );
               sleep(600) ;
               SendJsqInfo(iPackNo-1,iPackNo,(TNumCom as TRzNumericEdit).IntValue,0 );
             except
               (TmemoCom as TMemo).Lines.Add('-1005') ;
             end;

           //  (TmemoCom as TMemo).Lines.Add('8013') ;
             try
              // sleep(300);
              // PackLine_Jsq_XhSf(iPackNo-1,((DkChanel+1) mod 2) )  ;
               sleep(300) ;
               Openzadao(iPackNo-1);
               sleep(200) ;
               Openzadao(iPackNo-1);
             except
               (TmemoCom as TMemo).Lines.Add('-1006') ;
             end ;

       end;
       dm.FreeChannel(self.Handle,ds_Check);
    end;    //if pos(ACardID,(TListCom


  end ;      
end;

function TfrmCalWindows.getNextDaokou(APackLineNo,AcurDaoKou : integer): integer ;
begin
   result:=AcurDaoKou ;
   if APackLineInfo[APackLineNo].Qydk=cstQydk12 then
   begin //启用2道口的，那么需要切换
     if (AcurDaoKou mod 2) =0 then  //这个原则就是要求道口按1，2，3，4的顺序编排
       result:=AcurDaoKou-1
     else
       result:=AcurDaoKou+1 ;
   end;

end;

procedure TfrmCalWindows.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=false ;
  if messagebox(self.Handle,pchar('确定需要退出监控界面吗?'),pchar('确定'),MB_YESNO+MB_DEFBUTTON2)=IDYES then
    CanClose:=true ;
end;

{ TReadCarListThread }

constructor TAutoRefreshThread.Create(APkNo,ASNo : integer );
begin
  inherited Create(true);
   TFPackLine :=APkNo ;
   TFScreenNo :=ASNo ;
end;

{
自动刷新车辆时，
 如果在装车过程中，那么第一行车即正在装车的不能再校验
第2辆车需要判断是否已经改变品种等信息(如果存在)
第3辆车肯定要刷新的(如果存在，先直接删除)
如果在自动刷新过程中，有车子装完了，那么那边等待，需要等到自动刷新完成(已经考虑了)
}
procedure TAutoRefreshThread.Execute;
var
  waitCar,sValue ,upsql,sFileName ,lsnpz ,sNum : string ;
  sObjName,objName,sLadeID ,qrySql,dkObj: string ;
  TListCom,TdkCom ,TListNextCom: TComponent ;
  iPNO,idk : integer ;
  curdk,nextRow ,i ,nextdk,Firstdk ,j,delrow,dkValue: integer ;
  isChanged : boolean ;
begin
  FreeOnTerminate:=true ;
  iPNO:=TFPackLine  ;
  idk:=  TFScreenNo ;
  Firstdk:=-1 ;
  with frmCalWindows do
  begin
     objName:='plist'+inttostr(iPNO+1) ;
     TListCom:=FindComponent(objName) ;
     if ((TListCom as TETSListView).Items.Count =0) then  //没有记录，那么取初始道口
       Firstdk:=APackLineInfo[iPno].InitDk;
     try
       Application.ProcessMessages;
       objName:='dk'+inttostr(iPNO+1) ;
       TdkCom:=FindComponent(objname);
       if Firstdk<>-1 then
       begin
         (TdkCom as TRzNumericEdit).IntValue:=Firstdk  ;
         curdk:=Firstdk ;
       end
       else
         curdk:= (TdkCom as TRzNumericEdit).IntValue;  //=-1：表示有记录,那么取dki的值

       APackLineInfo[iPno].RefreshIng :=true ;
       objName:='plist'+inttostr(iPno+1) ;
       TListCom:=FindComponent(objName) ;
       //如果正在装车or正 等待刷卡，那么第一行不操作
       if (TDelever[iPNO].Enabled) or (APackLineInfo[iPNO].PackIng) then
          delrow:=1
        else
          delrow:=0 ;
        for j:=(TListCom as TETSListView ).Items.Count -1 downto delrow do
        begin
           if trim((TListCom as TETSListView).Items[j].SubItems[8])='0' then
           begin  //没有刷卡的才要删除,因为允许提前刷卡
             sLadeID :=trim((TListCom as TETSListView).Items[j].SubItems[7]);
             qrySql:=' update pm_data  set readok=0 '+
                     ' where readok<>1 and shipment_number='+quotedstr(sLadeID)  ;
             DM.ADOCnn.Execute(qrySql);
             (TListCom as TETSListView ).Items.Delete(j);
             AScreenInfo[iPNO].Pm_PdCar.delete(j+1) ;  //保留第一行，因为是包装机型号 ，不用维护
             AScreenInfo[iPNO].AutoNum:=AScreenInfo[iPNO].AutoNum-1 ;
             APackLineInfo[iPNO].WaitVehicleNum:=APackLineInfo[iPNO].WaitVehicleNum-1 ;
           end
           else if (trim((TListCom as TETSListView).Items[j].SubItems[8])='1') and (j=0) then
           begin //已经提前刷卡,并且是第一条记录的，需要把已刷卡的车辆和水泥品种放第一行
              waitCar:=RefStringAll_Car(trim((TListCom as TETSListView).Items[j].SubItems[0]));


              lsnpz:= trim((TListCom as TETSListView).Items[j].SubItems[5]);
              lsnpz:=RefStringAll_Wlpz(lsnpz);

              waitCar:=waitCar+lsnpz  ; // 车牌号+水泥品种

              while length(waitCar)<(cstlength-1) do
                waitCar:=waitCar+' ';

              AScreenInfo[iPNO].Pm_PdCar.delete(0) ;
              AScreenInfo[iPNO].Pm_PdCar.Insert(0,waitCar);

              sNum:=trim((TListCom as TETSListView).Items[j].SubItems[3]);
              while length(sNum)<4 do
                sNum:='0'+sNum ;
              sValue:='已装0000'+'待装'+sNum ;

              while length(sValue)<cstlength do
                sValue:=sValue+' ' ;
              AScreenInfo[iPNO].Pm_PdCar.delete(1) ;
              AScreenInfo[iPNO].Pm_PdCar.Insert(1,sValue);
              //AScreenInfo[i].Pm_PdCar.Insert(0,waitCar);

           end;
        end;


        if ApacklineInfo[iPNO].Sfqypzxz then //启用品种选择
            qrySql:=' select top 3 a.Card_no,a.tool_number ,a.customer_number ,a.item_name ,'+
                    ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                    ' from pm_data a (nolock) '+
                    ' where a.readok=0 and isnull(a.packlineno,0)='+inttostr(iPNO+1)+
                    ' and upper(a.status)=''TARE'' and a.item_name='+quotedstr(APackLineInfo[iPNO].SnPz)+
                    ' order by readok desc ,a.bill_date '
        else
            qrySql:=' select top 3 a.Card_no,a.tool_number ,a.customer_number ,a.item_name,'+
                    ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                    ' from pm_data a (nolock)'+
                    ' where a.readok=0 and isnull(a.packlineno,0)='+inttostr(iPNO+1)+
                    ' and upper(a.status)=''TARE''  '+
                    ' order by readok desc ,a.bill_date ';

         DM.OpenChannel(self.handle,ds_AutoRefresh,qrySql);
         if not ds_AutoRefresh.DataSet.IsEmpty then
         begin
            sObjName:='plist'+inttostr(iPNO+1) ;
            TListCom:=FindComponent(sObjName) ;
            dkObj:= 'dk'+inttostr(iPNO+1) ;
            TdkCom :=FindComponent(dkObj) ;
            dkValue:= (TdkCom as TRzNumericEdit).IntValue ; //提取初始道口的值
            with ds_AutoRefresh.DataSet do
            begin
               First ;
               while (not eof) and ((TListCom as TETSListView ).Items.Count<3) do
               begin
                  waitCar:=RefStringAll_Car(trim(vartostr(fieldvalues['tool_number']))) ; //车牌号

                  lsnpz:=trim(vartostr(fieldvalues['item_name']))  ;
                  sNum:=trim(vartostr(fieldvalues['schedule_count'])) ;  //  数量

                  if (TListCom as TETSListView ).Items.Count=0 then //表示第一行
                  begin
                     lsnpz:=RefStringAll_Wlpz(lsnpz);
                     waitCar:=waitCar+lsnpz  ; // 车牌号+水泥品种

                     while length(waitCar)<cstLength do
                        waitCar:=waitCar+' ' ;
                     AScreenInfo[iPNO].Pm_PdCar.Delete(0);
                     AScreenInfo[iPNO].Pm_PdCar.Insert(0,waitCar);
                  // 第一行 ，装车车牌＋水泥型号  end

                     while length(sNum)<4 do
                        sNum:='0'+sNum ;
                      sValue:=inttostr(dkValue )+'#刷卡  '+'待装'+sNum ;
                      waitCar:=sValue ;

                     tDelever[iPNO].Enabled :=true ;

                  end
                  else if (TListCom as TETSListView ).Items.Count=1 then //已经有一行了
                  begin
                     while length(waitCar)<c_CarPos-2 do
                       waitCar:=waitCar+' ';
                     if APackLineInfo[iPNO].Qydk=cstQydk12 then //启用两个道口的，需要用另一个道口
                     begin
                         dkValue:=getNextDaokou(iPNO,dkvalue); //包装线从0开始，道口从1开始

                     end  ; //否则表示的时只用了一条道口，那么不用转换
                     waitCar:=waitCar+inttostr(dkValue )+'#等待';

                  end
                  else if (TListCom as TETSListView ).Items.Count=2 then //已经有2行了
                  begin
                     while length(waitCar)<c_CarPos do
                      waitCar:=waitCar+' ';
                     waitCar:=waitCar+ '等待';
                     if APackLineInfo[iPNO].Qydk=cstQydk12 then //启用两个道口的，需要用另一个道口
                     begin
                        dkValue:=getNextDaokou(iPNO,dkvalue);

                     end  ; //否则表示的时只用了一条道口，那么不用转换

                  end;

                  while length(waitCar)<cstLength do
                      waitCar:=waitCar+' ' ;
                  AScreenInfo[iPNO].Pm_PdCar.add(waitCar) ;  //1号道口 ,保存文件,下发LED有用

                  APackLineInfo[iPNO].TotalNum:=APackLineInfo[iPNO].TotalNum+1 ;
                  APackLineInfo[iPNO].WaitVehicleNum:=APackLineInfo[iPNO].WaitVehicleNum+1;
                  AScreenInfo[iPNO].AutoNum:=AScreenInfo[iPNO].AutoNum+1 ;
                  (TListCom as TETSListView ).Items.Add;
                  nextRow:=(TListCom as TETSListView ).Items.Count-1 ;

                  sValue:= inttostr(APackLineInfo[iPNO].TotalNum) ;  //序号
                  (TListCom as TETSListView ).Items[nextRow].Caption :=sValue ;

                  sValue:= trim(vartostr(fieldvalues['tool_number'])) ;  //车牌号
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['Card_no'])) ;  //卡号
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                   sValue:= inttostr(dkValue) ;  // 道口
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                   sValue:= trim(vartostr(fieldvalues['schedule_count'])) ;  //  数量
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['customer_number'])) ;  //  客户编码
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['item_name'])) ;   //  水泥编号
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['bill_date'])) ;   //  开票时间
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['shipment_number'])) ;
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add('0');

                  //接下去更新 当前记录状态
                  upsql:='update pm_data set readok=169 '+
                        ' where shipment_number=' +quotedstr(sValue) ;
                  Dm.ADOCnn.Execute(upsql);

                  next ;
               end;  //while not eof do

            end;  //with datasource1.DataSet do

         end;  //if not datasource1.DataSet.IsEmpty then
         dm.FreeChannel(self.Handle,ds_AutoRefresh);
       // if isChanged then
        begin
          //更新LED  start
          try
            if AScreenInfo[iPNO].sfQy then
            begin
              sFileName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(iPNO +1 )+'_led.txt';
              AScreenInfo[iPNO].Pm_PdCar.SaveToFile(sFileName);
            //  AddScreenDynamicAreaFile[idk](1, 0 , PChar(sFileName), 0, PChar('宋体'), 12, 0, clRed, 1, 0, 5);
              SendDynamicAreaInfoCommand[iPNO ](1, 0);
            end;
          except
          end;
          //更新LED  end
        end;
        //接下去判断数据库是否有新的行,因为这个时候list 最多只有2行（第3行已经删除）end

        //====================end   2013-10-25
       
     
     finally
        APackLineInfo[iPNO].Refreshing:=false ;  //释放锁定状态
     end ;


  end; //with frmCalWindows do

end;

procedure TfrmCalWindows.RefreshListInfo(APackLine, AFirstDk: integer);
var
  waitCar,lsnpz ,sNum: string ;
  qrySql , upsql : string ;
  nextRow ,i ,dkValue ,j ,delrow: integer ;
  TListCom ,TdkCom: TComponent ;
  sObjName,dkObj ,sValue,sLadeID: string ;
begin
  i:= APackLine ;
  sObjName:='plist'+inttostr(i+1) ;
  TListCom:=self.FindComponent(sObjName) ;
  dkObj:= 'dk'+inttostr(i+1) ;
  TdkCom :=self.FindComponent(dkObj) ;
  dkValue:=AFirstDk;
  (TdkCom as TRzNumericEdit).IntValue:=AFirstDk ;
  APackLineInfo[i].RefreshIng :=true;
  try
   //如果正在等待延时，那么等待延时的不能删除;正在装车的，也不能删除
      if (TDelever[i].Enabled) or (APackLineInfo[i].PackIng) then
        delrow:=1
      else
        delrow:=0 ;
      for j:=(TListCom as TETSListView ).Items.Count -1 downto delrow do
      begin //从最下一行开始 往上
         if trim((TListCom as TETSListView).Items[j].SubItems[8])='0' then
         begin  //没有刷卡的才要删除,因为允许提前刷卡
           sLadeID :=trim((TListCom as TETSListView).Items[j].SubItems[7]);
           qrySql:=' update pm_data  set readok=0 '+
                   ' where readok<>1 and shipment_number='+quotedstr(sLadeID)  ;
           DM.ADOCnn.Execute(qrySql);
           (TListCom as TETSListView ).Items.Delete(j);
           AScreenInfo[i].Pm_PdCar.delete(j+1) ;  //保留第一行，因为是包装机型号 ，不用维护
           AScreenInfo[i].AutoNum:=AScreenInfo[i].AutoNum-1 ;
           APackLineInfo[i].WaitVehicleNum:=APackLineInfo[i].WaitVehicleNum-1 ;
         end
         else  //if trim((TListCom as TETSListView).Items[j].SubItems[8])='0' then
         begin //表示已经提前刷卡 ,需要把已刷卡的车辆和水泥品种放第一行
            waitCar:=trim((TListCom as TETSListView).Items[j].SubItems[0]);
            waitCar:=RefStringAll_Car(waitCar) ;
            lsnpz:=RefStringAll_Wlpz(lsnpz);
            waitCar:=waitCar+lsnpz  ; // 车牌号+水泥品种

            while length(waitCar)<cstlength do
              waitCar:=waitCar+' ' ;
            AScreenInfo[i].Pm_PdCar.delete(0) ;
            AScreenInfo[i].Pm_PdCar.Insert(0,waitCar);

            sNum:=trim((TListCom as TETSListView).Items[j].SubItems[3]);
            while length(sNum)<4 do
              sNum:='0'+sNum ;
            sValue:='已装0000'+'待装'+sNum ;

            while length(sValue)<cstlength do
              sValue:=sValue+' ' ;
            AScreenInfo[i].Pm_PdCar.delete(1) ;
            AScreenInfo[i].Pm_PdCar.Insert(1,sValue);
            //AScreenInfo[i].Pm_PdCar.Insert(0,waitCar);

         end;
      end;

      if ApacklineInfo[i].Sfqypzxz then //启用品种选择
          qrySql:=' select top 3 a.Card_no,a.tool_number ,a.customer_number ,a.item_name,'+
                  ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                  ' from pm_data a '+
                  ' where a.readok=0 and isnull(a.packlineno,0)='+inttostr(i+1)+
                  ' and upper(a.status)=''TARE'' and a.item_name='+quotedstr(APackLineInfo[i].SnPz)+
                  ' order by readok desc ,a.bill_date '
      else
          qrySql:=' select top 3 a.Card_no,a.tool_number ,a.customer_number ,a.item_name,'+
                  ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                  ' from pm_data a '+
                  ' where a.readok=0 and isnull(a.packlineno,0)='+inttostr(i+1)+
                  ' and upper(a.status)=''TARE''  '+
                  ' order by readok desc ,a.bill_date ';

       DM.OpenChannel(self.handle,datasource1,qrySql);
       if not datasource1.DataSet.IsEmpty then
       begin
          sObjName:='plist'+inttostr(i+1) ;
          TListCom:=self.FindComponent(sObjName) ;
          dkObj:= 'dk'+inttostr(i+1) ;
          TdkCom :=self.FindComponent(dkObj) ;
          dkValue:= (TdkCom as TRzNumericEdit).IntValue ; //提取初始道口的值
          with datasource1.DataSet do
          begin
             First ;
             while (not eof) and ((TListCom as TETSListView ).Items.Count<3) do
             begin
                waitCar:=trim(vartostr(fieldvalues['tool_number'])) ; //车牌号
                waitCar:=RefStringAll_Car(waitCar) ;
                

                lsnpz:=trim(vartostr(fieldvalues['item_name']))  ;
                sNum:=trim(vartostr(fieldvalues['schedule_count'])) ;  //  数量
                if (TListCom as TETSListView ).Items.Count=0 then //表示第一行
                begin
                // 第一行 ，装车车牌＋水泥型号  start
                   lsnpz:=RefStringAll_Wlpz(lsnpz);
                   waitCar:=waitCar+lsnpz  ; // 车牌号+水泥品种

                   while length(waitCar)<cstLength do
                      waitCar:=waitCar+' ' ;
                   AScreenInfo[i].Pm_PdCar.Delete(0);
                   AScreenInfo[i].Pm_PdCar.Insert(0,waitCar);
                // 第一行 ，装车车牌＋水泥型号  end

                   while length(sNum)<4 do
                      sNum:='0'+sNum ;
                    sValue:=inttostr(dkValue )+'#刷卡  '+'待装'+sNum ;
                    waitCar:=sValue ;

                   tDelever[i].Enabled :=true ;
                end
                else if (TListCom as TETSListView ).Items.Count=1 then //已经有一行了
                begin
                   while length(waitCar)<c_CarPos-2 do
                      waitCar:=waitCar+' ';
                   if APackLineInfo[i].Qydk=cstQydk12 then //启用两个道口的，需要用另一个道口
                   begin
                       dkValue:=getNextDaokou(i,dkvalue); //包装线从0开始，道口从1开始

                   end  ; //否则表示的时只用了一条道口，那么不用转换
                   waitCar:=waitCar+inttostr(dkValue )+'#等待';
                end
                else if (TListCom as TETSListView ).Items.Count=2 then //已经有2行了
                begin
                   while length(waitCar)<c_CarPos do
                      waitCar:=waitCar+' ';
                   waitCar:=waitCar+ '等待';
                   if APackLineInfo[i].Qydk=cstQydk12 then //启用两个道口的，需要用另一个道口
                   begin
                      dkValue:=getNextDaokou(i,dkvalue);

                   end  ; //否则表示的时只用了一条道口，那么不用转换

                end;

                while length(waitCar)<cstLength do
                      waitCar:=waitCar+' ' ;
                AScreenInfo[i].Pm_PdCar.add(waitCar) ;  //1号道口 ,保存文件,下发LED有用

                APackLineInfo[i].TotalNum:=APackLineInfo[i].TotalNum+1 ;
                APackLineInfo[i].WaitVehicleNum:=APackLineInfo[i].WaitVehicleNum+1;
                AScreenInfo[i].AutoNum:=AScreenInfo[i].AutoNum+1 ;
                (TListCom as TETSListView ).Items.Add;
                nextRow:=(TListCom as TETSListView ).Items.Count-1 ;

                sValue:= inttostr(APackLineInfo[i].TotalNum) ;  //序号
                (TListCom as TETSListView ).Items[nextRow].Caption :=sValue ;

                sValue:= trim(vartostr(fieldvalues['tool_number'])) ;  //车牌号
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                sValue:= trim(vartostr(fieldvalues['Card_no'])) ;  //卡号
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                 sValue:= inttostr(dkValue) ;  // 道口
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                 sValue:= trim(vartostr(fieldvalues['schedule_count'])) ;  //  数量
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                sValue:= trim(vartostr(fieldvalues['customer_number'])) ;  //  客户编码
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                sValue:= trim(vartostr(fieldvalues['item_name'])) ;   //  水泥编号
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                sValue:= trim(vartostr(fieldvalues['bill_date'])) ;   //  开票时间
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                sValue:= trim(vartostr(fieldvalues['shipment_number'])) ; //发货单号
                (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                (TListCom as TETSListView ).Items[nextRow].SubItems.Add('0'); //是否刷卡

                //接下去更新 当前记录状态
                upsql:='update pm_data set readok=169 '+
                      ' where shipment_number=' +quotedstr(sValue) ;
                Dm.ADOCnn.Execute(upsql);

                next ;
             end;  //while not eof do

          end;  //with datasource1.DataSet do

       end;  //if not datasource1.DataSet.IsEmpty then
       dm.FreeChannel(self.Handle,datasource1);
   finally
     APackLineInfo[i].RefreshIng :=false;
   end;
end;

//用来 定时对扳道的吸合释放操作 ,//0吸合 ，1释放
procedure TfrmCalWindows.tXhSf1Timer(Sender: TObject);
begin
 //
   if APackLineInfo[0].Qydk=cstQydk12 then
   begin
     PackLine_Jsq_XhSf(0,((XhDk[0]) mod 2) )  ;
     sleep(300) ;
     PackLine_Jsq_XhSf(0,((XhDk[0]) mod 2) )  ;
   end;
   tXhSf1.Enabled :=false ;

   TDelever[0].Enabled :=false ;
   TGetNextCar:=TAutoGetNextCar.Create(0,dk1.IntValue) ;
   TGetNextCar.Resume;

end;

procedure TfrmCalWindows.tXhSf2Timer(Sender: TObject);
begin
  if APackLineInfo[1].Qydk=cstQydk12 then
  begin
     PackLine_Jsq_XhSf(1,((XhDk[1]) mod 2 ) )  ;
     sleep(300) ;
     PackLine_Jsq_XhSf(1,((XhDk[1]) mod 2 ) )  ;

  end;
  tXhSf2.Enabled :=false ;
  TDelever[1].Enabled :=false ;
  TGetNextCar:=TAutoGetNextCar.Create(1,dk2.IntValue) ;
  TGetNextCar.Resume;
end;

procedure TfrmCalWindows.tXhSf3Timer(Sender: TObject);
begin
  if APackLineInfo[2].Qydk=cstQydk12 then
  begin
     PackLine_Jsq_XhSf(2,((XhDk[2]) mod 2 ) )  ;
     sleep(300) ;
     PackLine_Jsq_XhSf(2,((XhDk[2]) mod 2 ) )  ;

  end;
  tXhSf3.Enabled :=false ;
  TDelever[2].Enabled :=false ;
  TGetNextCar:=TAutoGetNextCar.Create(2,dk3.IntValue) ;
  TGetNextCar.Resume;
end;

procedure TfrmCalWindows.initTimer;
var
  TxhsfCom : TComponent ;
  objname : string ;
  i ,icount : integer ;
begin
  application.ProcessMessages ;

  try
    icount:=cstCurRunlist.Count;   //当前总共有多少条道口运行
  except
    icount:=1 ;
  end;
  if icount<=1 then
  begin
    tStartTimer.Enabled :=false ;
    tAutorRefresh.Enabled:=false ;
    tAutorRefresh.Interval:=cstAutoRefresh*60*1000;
    tAutorRefresh.Enabled :=true ;
  end
  else   //如果有多余一条线，那么需要扣除一个循环的
  begin
    tStartTimer.Enabled:=false ;
    tStartTimer.Interval:=cstAutoRefresh*60*1000-round(cstAutoRefresh*60*1000/icount);
    tStartTimer.Enabled :=true ;

    tAutorRefresh.Enabled:=false ;
    tAutorRefresh.Interval:=round(cstAutoRefresh*60*1000/icount);
   // tAutorRefresh.Enabled :=true ;
  end;


  for i:=0 to cstUsePkgLine-1 do  //扳道吸合释放状态的定时器
  begin
    objname:='tXhSf'+inttostr(i+1);

    if (ApackLineInfo[i].Sfqybzx) then
    begin
      TxhsfCom:=self.FindComponent(objname) ;
      (TxhsfCom as TTimer).Enabled :=false ;
      (TxhsfCom as TTimer).Interval :=APackLineInfo[i].ZdybdSjjg *1000 ;

    end;
  end;
  
end;

procedure TfrmCalWindows.but1StopClick(Sender: TObject);
begin
  application.ProcessMessages;
  butStopClick(0);
end;

procedure TfrmCalWindows.but2StopClick(Sender: TObject);
begin
  application.ProcessMessages;
  butStopClick(1);
end;

procedure TfrmCalWindows.but3StopClick(Sender: TObject);
begin
  application.ProcessMessages;
  butStopClick(2);
end;

// 包装线传入 值 ：ApackLineNo  0:1号线
procedure TfrmCalWindows.butStopClick(ApackLineNo: integer );
var
  sV ,sFileName,objname,sql: string ;
  j : integer ;
  TlistCom ,TjsqCom ,TplCom : TComponent ;
  inifile: Tinifile ;
begin
  if (APackLineInfo[ApackLineNo].Sfqybzx) then
  begin

    if application.MessageBox(pchar('确定要停止'+inttostr(ApackLineNo+1)+'号包装机吗？'),'确定停止！',MB_OKCANCEL+MB_ICONWARNING+MB_DEFBUTTON2)<>IDOK then
      exit ;

    sv:=trim(InputBox('密码输入','请输入停止包装机的密码','')) ;
    if sv<>'123' then
      exit ;

    //接下去处理清空数据的操作
    try
       APackLineInfo[ApackLineNo].WaitVehicleNum:=0 ;

      // if AScreenInfo[ApackLineNo].sfQy then
       begin
         objname:='plist'+inttostr(ApackLineNo+1);
         TlistCom:=self.FindComponent(objname) ;
         (TlistCom as TETSListView).Items.Clear ;
         for  j:=AScreenInfo[ApackLineNo].Pm_PdCar.count-1 downto 1 do
            AScreenInfo[ApackLineNo].Pm_PdCar.delete(j) ;  //第一行是包装机型号

          AScreenInfo[ApackLineNo].AutoNum:=0 ;
       end ;


       //更新LED  start
      //  if  AScreenInfo[ApackLineNo].sfQy then
        begin
          sFileName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(ApackLineNo+1)+'_led.txt';
          AScreenInfo[ApackLineNo].Pm_PdCar.SaveToFile(sFileName);
          SendDynamicAreaInfoCommand[ApackLineNo](1, 0);
        end;

      //更新LED  end
      //包装线停用了，需要把分配的车辆还原 ,2013-12-21
       dm.BlankBzxWichel(ApackLineNo);

       AScreenInfo[ApackLineNo].sfQy:=false ;

       APackLineInfo[ApackLineNo].PackIng:=false ;

       TDelever[ApackLineNo].Enabled:=false ;

       JsqStatus[ApackLineNo]:=0;
       JsqClear(ApackLineNo);
       JsqClear(ApackLineNo);
       JsqClear(ApackLineNo);
       JsqLjClear(APackLineNo) ;
       JsqLjClear(APackLineNo) ;
       JsqLjClear(APackLineNo) ;
      // sleep(100);

       CloseZadao(ApackLineNo);
       CloseZadao(ApackLineNo);
       CloseZadao(ApackLineNo);
       ClearJsqAlarm(ApackLineNo);
       ClearJsqAlarm(ApackLineNo);

       application.ProcessMessages;

       // jsq1.OnComm:=nil ;
       objname:='jsq'+inttostr(ApackLineNo+1);
       TjsqCom:=self.FindComponent(objname) ;
       (TjsqCom as TMSComm).OnComm:= nil ;

       objname:='pl'+inttostr(ApackLineNo+1);
       TplCom:=self.FindComponent(objname);
       (TplCom as TPanel).Color:=clred ;

       inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
       try
          inifile.WriteBool(inttostr(ApackLineNo+1)+c_PackLineName,'bzx_ckb_sfqy',false) ;
          cstCurRunlist.Delete(cstCurRunlist.IndexOf(inttostr(ApackLineNo+1)));
          cstCurRunlist.Sort;
       finally
          inifile.Free ;
       end;
       sql:='update tsys_PackLineCement sfQy=1 where PackNo='+inttostr(ApackLineNo+1);
       Dm.ADOCnn.Execute(sql) ;



       initTimer ;
    except

    end;
  end;

end;

procedure TfrmCalWindows.but1StartClick(Sender: TObject);
begin
  application.ProcessMessages;
  butStartClick(0);
end;

procedure TfrmCalWindows.but2StartClick(Sender: TObject);
begin
  application.ProcessMessages;
  butStartClick(1);
end;

procedure TfrmCalWindows.but3StartClick(Sender: TObject);
begin
  application.ProcessMessages;
  butStartClick(2);
end;

//
procedure TfrmCalWindows.butStartClick(ApackLineNo: integer);
var
  sv, objname: string ;
  i,j : integer ;
  TplCom : TComponent ;
  inifile:Tinifile ;
begin
  sv:=trim(InputBox('密码输入','请输入启用'+inttostr(ApackLineNo+1)+'号线密码','')) ;
  if sv<>'123' then
    exit ;

  objname:='pl'+inttostr(ApackLineNo+1);
  TplCom:=self.FindComponent(objname);

  pnlXtcs.Top:=2;
  pnlXtcs.Left :=(TplCom as TPanel).Left+2 ;
  pnlXtcs.Visible :=true ;
  butbxzOK.Tag:=ApackLineNo+1 ;//Tag 用来表示包装线
 {
  exit ;

  if application.MessageBox(pchar('确定要启用'+inttostr(ApackLineNo+1)+'号线吗？'),'确定启用！',MB_OKCANCEL+MB_ICONWARNING+MB_DEFBUTTON2)<>IDOK then
    exit ;

  sv:=trim(InputBox('密码输入','请输入启用'+inttostr(ApackLineNo+1)+'号线密码','')) ;
  if sv<>'123' then
    exit ;

  try
    initPackLine(false,ApackLineNo+1) ;
    InitScreenInfo(false,ApackLineNo+1) ;
    AutoRefreshNum[ApackLineNo]:=0 ;
    ladeID[ApackLineNo]:='0' ;

    //需要重新刷新继电器 吸合状态,防止启动前道口改变  start
    if (APackLineInfo[ApackLineNo].Qydk=cstQydk1) or (APackLineInfo[ApackLineNo].Qydk=cstQydk12) then
      j:=0
    else
      j:=1 ;

    PackLine_Jsq_XhSf(ApackLineNo,j) ;
    PackLine_Jsq_XhSf(ApackLineNo,j) ;
    JsqStatus[ApackLineNo]:=0;
    JsqClear(ApackLineNo);
    JsqClear(ApackLineNo);
    JsqClear(ApackLineNo);
  //  sleep(100) ;
    JsqLjClear(APackLineNo) ;
    JsqLjClear(APackLineNo) ;
    JsqLjClear(APackLineNo) ;
  //  sleep(100);

    CloseZadao(ApackLineNo);
    CloseZadao(ApackLineNo);
    CloseZadao(ApackLineNo);
    ClearJsqAlarm(ApackLineNo);
    ClearJsqAlarm(ApackLineNo);

    //初始化屏幕

      LedInitFlag[ApackLineNo]:=0;
      if  AScreenInfo[ApackLineNo].sfQy then
      begin
        initScreenT:= TInitScreenThread.Create(ApackLineNo+1);
        initScreenT.Resume;
      end ;

     objname:='pl'+inttostr(ApackLineNo+1);
     TplCom:=self.FindComponent(objname);
     (TplCom as TPanel).Color:=$0079FF79 ;

     inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
     try
        inifile.WriteBool(inttostr(ApackLineNo+1)+c_PackLineName,'bzx_ckb_sfqy',true) ;
        cstCurRunlist.Add(inttostr(ApackLineNo+1)) ;
        cstCurRunlist.Sort;
     finally
        inifile.Free ;
     end;
     initTimer ;
  except

  end ;
     }
end;

//累计清0
procedure TfrmCalWindows.JsqLjClear(ApackLine: integer);
var
  cmd : array [0..17] of byte;
  i  : integer ;
begin

 for i:=0 to 15 do
   cmd[i]:=$20;
 cmd[17]:=0;
 cmd[0]:=$32;
 cmd[1]:=getChanelOX(ApackLine+1);
 //cmd[2]:=$B4; //20131018 moved
 cmd[6]:=$4F;
 cmd[16]:=DataCheckJy(cmd,16);
 comSend(cmd,17,ApackLine);
 Memo1.Lines.Add('JsqLjClear');

end;



procedure TfrmCalWindows.getCurRunPackLine;
var
   inifile:Tinifile ;
   i : integer ;
   vs : string ;
begin
   inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename );
   try
      cstCurRunlist.Clear ;
      for i:=0 to cstUsePkgLine-1 do
      begin
         vs:=inttostr(i+1)+c_PackLineName ;
         if inifile.ReadBool(vs,'bzx_ckb_sfqy',false)=true then  //是否启用
           cstCurRunlist.Add(inttostr(i+1)) ;
      end;
      cstCurRunlist.Sort;
   finally
     inifile.Free;
   end;
end;



procedure TfrmCalWindows.tStartTimerTimer(Sender: TObject);
var
  iNextBzx,iLastBzx : integer ;
begin
 //传入最后一条包装线，那样返回的是第一个运行的包装线
  try
     iLastBzx:=strtoint(cstCurRunlist.Strings[cstCurRunlist.Count-1]) ;
     iNextBzx:=getNextRunTimer(iLastBzx);
     tAutorRefresh.Tag := iNextBzx ;  //表示下个要运行的刷新的定时器
     tAutorRefresh.Enabled :=true ;
     tStartTimer.Enabled :=false ;//启动后把自己关闭;把定时器打开
     Application.ProcessMessages ;
  except
  end;
  
end;

procedure TfrmCalWindows.tAutorRefreshTimer(Sender: TObject);
var
  idk,iPackNo ,itag,iNextBzx: integer ;
begin
  try
    tAutorRefresh.Enabled:=false ;

    itag:=tAutorRefresh.Tag ;//当前需要运行的包装线,不是数组的下标;

    iNextBzx:= getNextRunTimer(itag); //下次需要运行的Bzx
    tAutorRefresh.Tag :=iNextBzx ;
    iPackNo :=itag-1 ;  //转换成包装线 ,0表示1号线，1表示2号线
  //  if (not TDelever[iPackNo].Enabled)  then  //如果正在等待刷卡延时，那么不启用刷新
    begin
       APackLineInfo[iPackNo].RefreshIng :=true ;
       //AutoRefreshPackLineLed(iPackNo,itag-1);
       ReFreshT    :=TAutoRefreshThread.Create(iPackNo,itag-1);
       ReFreshT.Resume;
       APackLineInfo[iPackNo].RefreshIng:=false ;
    end  ;

  finally
     application.ProcessMessages ;
     tAutorRefresh.Enabled:=true ;
  end;
end;

function TfrmCalWindows.getNextRunTimer(ACurPDkNo: integer): integer;
var
  inputpos ,loopi : integer ;
begin
 // result:=-1 ;
  cstCurRunlist.Sort;
  inputpos:=cstCurRunlist.IndexOf(inttostr(ACurPDkNo)) ; //当前传入值的位置

  if inputpos=cstCurRunlist.Count-1 then //如果已经是最后一行了，那么取第一行记录
     loopi:=0
  else
     loopi:=inputpos+1 ;

  result:=strtoint(cstCurRunlist.Strings[loopi]);
end;

procedure TfrmCalWindows.AutoRefreshPackLineLed(APackLine,
  AScreenNo: integer; isPack: boolean);
var
  waitCar,sValue ,upsql,sFileName,lsnpz,sNum   : string ;
  sObjName,objName,sLadeID ,qrySql,dkObj: string ;
  TListCom,TdkCom ,TListNextCom: TComponent ;
  iPNO,idk : integer ;
  curdk,nextRow ,i ,nextdk,Firstdk ,j,delrow,dkValue: integer ;
  isChanged : boolean ;
begin
  //FreeOnTerminate:=true ;
  iPNO:=APackLine  ;
  idk:=  AScreenNo ;
  Firstdk:=-1 ;
  objName:='plist'+inttostr(iPNO+1) ;
  TListCom:=FindComponent(objName) ;

  if ((TListCom as TETSListView).Items.Count =0) then  //没有记录，那么取初始道口
     Firstdk:=APackLineInfo[iPno].InitDk;

  //with frmCalWindows do
  begin
     try
       Application.ProcessMessages;
       //isChanged:=false ;
       objName:='dk'+inttostr(iPNO+1) ;
       TdkCom:=FindComponent(objname);
       if Firstdk<>-1 then
       begin
         (TdkCom as TRzNumericEdit).IntValue:=Firstdk  ;
         curdk:=Firstdk ;
       end
       else
         curdk:= (TdkCom as TRzNumericEdit).IntValue;  //=-1：表示有记录,那么取dki的值

       APackLineInfo[iPno].RefreshIng :=true ;
       objName:='plist'+inttostr(iPno+1) ;
       TListCom:=FindComponent(objName) ;
       //如果正在装车or正 等待刷卡，那么第一行不操作
       if (TDelever[iPNO].Enabled) or (APackLineInfo[iPNO].PackIng) then
          delrow:=1
        else
          delrow:=0 ;
        for j:=(TListCom as TETSListView ).Items.Count -1 downto delrow do
        begin
           sLadeID :=trim((TListCom as TETSListView).Items[j].SubItems[7]);
           qrySql:=' update pm_data  set readok=0 '+
                   ' where readok<>1 and shipment_number='+quotedstr(sLadeID)  ;
           DM.ADOCnn.Execute(qrySql);
           (TListCom as TETSListView ).Items.Delete(j);
           AScreenInfo[iPNO].Pm_PdCar.delete(j+1) ;  //保留第一行，因为是包装机型号 ，不用维护
           AScreenInfo[iPNO].AutoNum:=AScreenInfo[iPNO].AutoNum-1 ;
           APackLineInfo[iPNO].WaitVehicleNum:=APackLineInfo[iPNO].WaitVehicleNum-1 ;
        end;


        if ApacklineInfo[iPNO].Sfqypzxz then //启用品种选择
            qrySql:=' select top 3 a.Card_no,a.tool_number ,a.customer_number ,a.item_name,'+
                    ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                    ' from pm_data a '+
                    ' where a.readok=0 and isnull(a.packlineno,0)='+inttostr(iPNO+1)+
                    ' and upper(a.status)=''TARE'' and a.item_name='+quotedstr(APackLineInfo[iPNO].SnPz)+
                    ' order by readok desc ,a.bill_date '
        else
            qrySql:=' select top 3 a.Card_no,a.tool_number ,a.customer_number ,a.item_name,'+
                    ' a.schedule_count,a.lot_number,a.bill_date,a.shipment_number,a.packlineno'+
                    ' from pm_data a '+
                    ' where a.readok=0 and isnull(a.packlineno,0)='+inttostr(iPNO+1)+
                    ' and upper(a.status)=''TARE''  '+
                    ' order by readok desc ,a.bill_date ';

         DM.OpenChannel(self.handle,ds_AutoRefresh,qrySql);
         if not ds_AutoRefresh.DataSet.IsEmpty then
         begin
            sObjName:='plist'+inttostr(iPNO+1) ;
            TListCom:=self.FindComponent(sObjName) ;
            dkObj:= 'dk'+inttostr(iPNO+1) ;
            TdkCom :=self.FindComponent(dkObj) ;
            dkValue:= (TdkCom as TRzNumericEdit).IntValue ; //提取初始道口的值
            with ds_AutoRefresh.DataSet do
            begin
               First ;
               while (not eof) and ((TListCom as TETSListView ).Items.Count<3) do
               begin
                  waitCar:=trim(vartostr(fieldvalues['tool_number'])) ;
                  waitCar:=RefStringAll_Car(waitCar) ;

                  lsnpz:=trim(vartostr(fieldvalues['item_name']))  ;
                  sNum:=trim(vartostr(fieldvalues['schedule_count'])) ;  //  数量

                  if (TListCom as TETSListView ).Items.Count=0 then //表示第一行
                  begin
                     lsnpz:=RefStringAll_Wlpz(lsnpz);
                     waitCar:=waitCar+lsnpz  ; // 车牌号+水泥品种

                     while length(waitCar)<cstLength do
                        waitCar:=waitCar+' ' ;
                     AScreenInfo[i].Pm_PdCar.Delete(0);
                     AScreenInfo[i].Pm_PdCar.Insert(0,waitCar);
                  // 第一行 ，装车车牌＋水泥型号  end

                     while length(sNum)<4 do
                        sNum:='0'+sNum ;
                      sValue:=inttostr(dkValue )+'#刷卡  '+'待装'+sNum ;
                      waitCar:=sValue ;

                     tDelever[i].Enabled :=true ;
                  end
                  else if (TListCom as TETSListView ).Items.Count=1 then //已经有一行了
                  begin
                     while length(waitCar)<c_CarPos-2 do
                        waitCar:=waitCar+' ';
                     if APackLineInfo[iPNO].Qydk=cstQydk12 then //启用两个道口的，需要用另一个道口
                         dkValue:=getNextDaokou(iPNO,dkvalue); //包装线从0开始，道口从1开始
                      //否则表示的时只用了一条道口，那么不用转换
                     waitCar:=waitCar+inttostr(dkValue )+'#等待';


                  end
                  else if (TListCom as TETSListView ).Items.Count=2 then //已经有2行了
                  begin
                     while length(waitCar)<c_CarPos do
                        waitCar:=waitCar+' ';
                     waitCar:=waitCar+ '等待';
                     if APackLineInfo[iPNO].Qydk=cstQydk12 then //启用两个道口的，需要用另一个道口
                     begin
                        dkValue:=getNextDaokou(iPNO,dkvalue);

                     end  ; //否则表示的时只用了一条道口，那么不用转换
                  end;

                  while length(waitCar)<cstLength do
                      waitCar:=waitCar+' ' ;

                  AScreenInfo[iPNO].Pm_PdCar.add(waitCar) ;  //1号道口 ,保存文件,下发LED有用

                  APackLineInfo[iPNO].TotalNum:=APackLineInfo[iPNO].TotalNum+1 ;
                  APackLineInfo[iPNO].WaitVehicleNum:=APackLineInfo[iPNO].WaitVehicleNum+1;
                  AScreenInfo[iPNO].AutoNum:=AScreenInfo[iPNO].AutoNum+1 ;
                  (TListCom as TETSListView ).Items.Add;
                  nextRow:=(TListCom as TETSListView ).Items.Count-1 ;

                  sValue:= inttostr(APackLineInfo[iPNO].TotalNum) ;  //序号
                  (TListCom as TETSListView ).Items[nextRow].Caption :=sValue ;

                  sValue:= trim(vartostr(fieldvalues['tool_number'])) ;  //车牌号
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['Card_no'])) ;  //卡号
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                   sValue:= inttostr(dkValue) ;  // 道口
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                   sValue:= trim(vartostr(fieldvalues['schedule_count'])) ;  //  数量
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['customer_number'])) ;  //  客户编码
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['item_name'])) ;   //  水泥编号
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['bill_date'])) ;   //  开票时间
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  sValue:= trim(vartostr(fieldvalues['shipment_number'])) ;
                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add(sValue);

                  (TListCom as TETSListView ).Items[nextRow].SubItems.Add('0');

                  //接下去更新 当前记录状态
                  upsql:='update pm_data set readok=169 '+
                        ' where shipment_number=' +quotedstr(sValue) ;
                  Dm.ADOCnn.Execute(upsql);

                  next ;
               end;  //while not eof do

            end;  //with datasource1.DataSet do

         end;  //if not datasource1.DataSet.IsEmpty then
         dm.FreeChannel(self.Handle,ds_AutoRefresh);
       // if isChanged then
        begin
          //更新LED  start
          try
            if AScreenInfo[iPNO].sfQy then
            begin
              sFileName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(iPNO +1 )+'_led.txt';
              AScreenInfo[iPNO].Pm_PdCar.SaveToFile(sFileName);
            //  AddScreenDynamicAreaFile[idk](1, 0 , PChar(sFileName), 0, PChar('宋体'), 12, 0, clRed, 1, 0, 5);
              SendDynamicAreaInfoCommand[iPNO ](1, 0);
            end;
          except
          end;
          //更新LED  end
        end;
        //接下去判断数据库是否有新的行,因为这个时候list 最多只有2行（第3行已经删除）end

        //====================end   2013-10-25
       
     
     finally
        APackLineInfo[iPNO].Refreshing:=false ;  //释放锁定状态
     end ;


  end; //with frmCalWindows do

end;


procedure TfrmCalWindows.TDeleverTimer(Sender: TObject);
var
  iTag,iPackNo,NextDk ,curDK: integer ;
  TListCom,TdkCom : TComponent ;
  objname,sLadeid,ssql : string ;
begin
  iTag:= (sender as TTimer).Tag ;   //包装线 ,Tag从0开始的
  iPackNo:=iTag ;    //获取当前的包装线 ,0表示1号线
  tDelever[iPackNo].Enabled :=false ;
  try
      objName :='plist'+inttostr(iTag+1) ;
      TListCom:=self.FindComponent(objName) ;
      sLadeid:=trim((TlistCom as TETSListView).Items[0].SubItems[7] );
   //   ssql:='update pm_data set readok=0 , bill_date=getdate() ' +
   //         ' where readok<>1 and shipment_number='+quotedstr(sLadeid);

   //延时刷卡，需要把车辆重新还原，再分配一辆 2013-12-21 
      ssql:=' begin tran '+
            ' insert into cux_9_om_wx_ship_v '+
            ' select shipment_number,schedule_qty,schedule_count,bill_date, '+
            ' customer_number,customer_name,item_no,item_name, '+
            ' status,card_no,tool_number,address,lot_number,0,0,0 '+
            ' from pm_data '+
            ' where  shipment_number='+quotedstr(sLadeid)+
            '  delete from pm_data '+
            ' where  shipment_number='+quotedstr(sLadeid)+
            ' exec sp_SetPackLineData '+
            ' if @@error=0  commit tran  else  rollback tran ';
      dm.ADOCnn.Execute(ssql) ;

  //接下去处理 刷新
      (TlistCom as TETSListView).Items.Delete(0);
      AScreenInfo[iPackNo].Pm_PdCar.delete(1) ;
      AScreenInfo[iPackNo].AutoNum := AScreenInfo[iPackNo].AutoNum-1 ;

      objname :='dk'+inttostr(iTag+1) ;
      TdkCom :=self.FindComponent(objname) ;
      curDK:=(TdkCom as TRzNumericEdit).IntValue;

      NextDk:=getNextDaokou(iPackNo,curDK);

      (TdkCom as TRzNumericEdit).IntValue:=NextDk ;

      JsqStatus[iPackNo]:=0;
      JsqClear(iPackNo);
      JsqClear(iPackNo);
      JsqClear(iPackNo);
    //  sleep(100);
      JsqLjClear(iPackNo) ;
      JsqLjClear(iPackNo) ;
      JsqLjClear(iPackNo) ;

      CloseZadao(iPackNo);
      CloseZadao(iPackNo);
      CloseZadao(iPackNo);

      ClearJsqAlarm(iPackNo);
      ClearJsqAlarm(iPackNo);

      try
        ApackLineInfo[iPackNo].RefreshIng :=true ;
      //  AutoRefreshPackLineLed(iPackNo,NextDk,false);  //刷新超时刷卡的包装线
        ReFreshT    :=TAutoRefreshThread.Create(iPackNo,NextDk);
        ReFreshT.Resume;
      finally
        ApackLineInfo[iPackNo].RefreshIng :=false  ;
      end;

  finally

  end;
end;



{ TAutoGetNextCar }

constructor TAutoGetNextCar.Create(APkNo, Adk: integer);
begin
   inherited Create(true);
   TFPackLine :=APkNo ;
   TFdk :=Adk ;
end;

//0表示1号包装线，1表示2号包装线
procedure TAutoGetNextCar.Execute;
var
  sUpSql: string ;
  sCarLedUp,sFileName ,objlistName,objname : string ;
  DkChanel,iPackNo ,idk: integer ;
  TListCom : TComponent ;
  sCarNo ,sLadeID,lsnpz  : string ;
  TcphCom,TNumCom,TSnpzCom,TCardCom,TfpbhCom,TpmjpmnrCom ,TmemoCom ,TdkCom: Tcomponent ;
begin
  FreeOnTerminate:=true ;
  with frmCalWindows do
  begin
    DkChanel:= TFdk ;
    iPackNo:= TFPackLine+1 ;//转换成包装线 入参：0表示1线

    objname:='Memo'+inttostr(iPackNo) ;
    TmemoCom:=FindComponent(objname);
    (TmemoCom as TMemo).Lines.Add('sDk:'+inttostr(DkChanel)) ;

    objlistName :='plist'+inttostr(iPackNo);
    TListCom :=FindComponent(objlistName);

    //caption序号 |0车牌号|1卡号|2道口|3数量|4客户编码|5水泥编号|6开票时间|7 LadeID|8 是否刷卡

    begin  //这里再判断下吧,前面已经判断了
       if (TListCom as TETSListView).Items.Count>0 then
       begin
           sCarLedUp:=trim((TListCom as TETSListView).Items[0].SubItems[0]);

           sCarLedUp:=sCarLedUp+' ';
           if trim((TListCom as TETSListView).Items[0].SubItems[8])='1' then
           begin
               AutoRefreshNum[iPackNo-1]:=0;
               ladeID[iPackNo-1]:='0' ;
               JsqStatus[iPackNo]:=0;

               //caption序号 |0车牌号|1卡号|2道口|3数量|4客户编码|5水泥编号|6开票时间|7 LadeID|8是否刷卡
               sCarNo:= RefStringAll_Car(trim((TListCom as TETSListView).Items[0].SubItems[0]) );

               sLadeID:= trim((TListCom as TETSListView).Items[0].SubItems[7]);
               begin  //执行刷卡成功操作 start
                  sUpSql:=' update pm_data set readok=170 '+
                          ' where  shipment_number='+quotedstr(sLadeID) ;
                  Dm.ADOCnn.Execute(sUpSql);

                  try
                    sleep(200);
                    PackLine_Jsq_XhSf(iPackNo-1,((DkChanel+1) mod 2) )  ;
                    PackLine_Jsq_XhSf(iPackNo-1,((DkChanel+1) mod 2) )  ;
                   { sleep(300);
                    Openzadao(iPackNo-1);
                    Openzadao(iPackNo-1);   }
                  except
                  end;

                 { //重新读取数量，防止数量被改变了
                  try
                    (TListCom as TETSListView).Items[0].SubItems[3]:=trim(vartostr(ds_Check.DataSet.FieldValues['schedule_count'])) ;
                  except
                   // memo1.Lines.Add('-1001') ;
                    (TmemoCom as TMemo).Lines.Add('-1001') ;
                  end;  }
                  //接下去需要把数据放在具体Edit编辑框中

                  objname:='cph'+inttostr(iPackNo);
                  TcphCom:=FindComponent(objName);

                  objname:='num'+inttostr(iPackNo);
                  TNumCom:=FindComponent(objName);

                  objname:='snpz'+inttostr(iPackNo);
                  TSnpzCom:=FindComponent(objName);

                  objname:='Card'+inttostr(iPackNo);
                  TCardCom:=FindComponent(objName);

                  objname:='fpbh'+inttostr(iPackNo);
                  TfpbhCom:=FindComponent(objName);

                  objname:='pmj'+inttostr(iPackNo)+'pmnr';
                  TpmjpmnrCom:=FindComponent(objName);

                  //caption序号 |0车牌号|1卡号|2道口|3数量|4客户编码|5水泥编号|6开票时间|7 LadeID
                  (TcphCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[0]);
                  (TNumCom as TRzNumericEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[3]);
                  (TSnpzCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[5]);
                  (TCardCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[1]);
                  (TfpbhCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[7]);
                  if (APackLineInfo[iPackNo-1].pmjsfqy) and (APackLineInfo[iPackNo-1].ccqnrCode='1') then
                    (TpmjpmnrCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[4])
                  else if (APackLineInfo[iPackNo-1].pmjsfqy) and (APackLineInfo[iPackNo-1].ccqnrCode='2') then
                    (TpmjpmnrCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[5])
                  else if (APackLineInfo[iPackNo-1].pmjsfqy) and (APackLineInfo[iPackNo-1].ccqnrCode='3') then
                    (TpmjpmnrCom as TRzEdit).Text :=trim((TListCom as TETSListView).Items[0].SubItems[5])+
                                   trim((TListCom as TETSListView).Items[0].SubItems[4])
                  else
                    (TpmjpmnrCom as TRzEdit).Text :='' ;

                  //接下去更新 待发送的列表

                //   sCarLedUp:=sCarNo+'  '+'装车中 '; //刷卡成功， 显示 "已装0000待装9999"  2013-12-14
                    lsnpz:=trim((TListCom as TETSListView).Items[0].SubItems[5]) ;//水泥品种
                    lsnpz:=RefStringAll_Wlpz(lsnpz);
                    lsnpz:=sCarNo+lsnpz  ; // 车牌号+水泥品种

                    while length(lsnpz)<cstlength do
                      lsnpz:=lsnpz+' ' ;


                   sCarLedUp:=trim((TListCom as TETSListView).Items[0].SubItems[3]) ;//数量
                   while length(sCarLedUp)<4 do
                     sCarLedUp:='0'+sCarLedUp ;

                   sCarLedUp:='已装0000'+'待装'+ sCarLedUp ;
                   while length(sCarLedUp)<cstLength do
                    sCarLedUp:=sCarLedUp+' ' ;

                   try
                     if AScreenInfo[iPackNo-1].sfQy then
                     begin
                       AScreenInfo[iPackNo-1].Pm_PdCar.delete(0) ;
                       AScreenInfo[iPackNo-1].Pm_PdCar.Insert(0,lsnpz);
                       AScreenInfo[iPackNo-1].Pm_PdCar.Delete(1);
                       AScreenInfo[iPackNo-1].Pm_PdCar.Insert(1,sCarLedUp);
                       sFileName:=Extractfilepath(Application.ExeName )+'SendFile\'+inttostr(iPackNo)+'_led.txt';
                       AScreenInfo[iPackNo-1].Pm_PdCar.SaveToFile(sFileName);
                       SendDynamicAreaInfoCommand[iPackNo-1](1, 0);
                     end;

                   except

                     (TmemoCom as TMemo).Lines.Add('-1002') ;
                   end;
                   APackLineInfo[iPackNo-1].PackIng:=true ;
                   tDelever[ipackNo-1].Enabled :=false ;
        //====================
        //之前的计数值保留下来，刷卡后,如果之前的值>本次的装车，
        // 那么会把这次的装车直接认为已装完 ，放在读取计数之前
        //====================
                   try
                     if iPackNo=1 then
                       jsq1.OnComm:=jsq1Comm
                     else if iPackNo=2 then
                       jsq2.OnComm:=jsq2Comm
                     else if iPackNo=3 then
                       jsq3.OnComm:=jsq3Comm ;
                   except
                    // memo1.Lines.Add('jsqOnComm') ;
                     (TmemoCom as TMemo).Lines.Add('-1003') ;
                   end;

                   sleep(200);

                   JsqClear(iPackNo-1)  ;//计数器先清零
                   JsqClear(iPackNo-1)  ;//计数器先清零
                   JsqClear(iPackNo-1)  ;//计数器先清零
                   sleep(200);
                   JsqLjClear(iPackNo-1) ;
                   JsqLjClear(iPackNo-1) ;
                   JsqLjClear(iPackNo-1) ;
                   sleep(200);
                   ClearJsqAlarm(iPackNo-1);
                   ClearJsqAlarm(iPackNo-1);

                //   (TmemoCom as TMemo).Lines.Add('8011') ;
                   try
                     if APackLineInfo[ipackNo-1].pmjSfqy then
                     begin
                       setCurRegisterVal(iPackNo-1,APackLineInfo[iPackNo-1].ccqnrS+(TpmjpmnrCom as TRzEdit).Text+ APackLineInfo[iPackNo-1].ccqnrE);

                       sleep(100);
                       setCurRegister(iPackNo-1);
                       sleep(300);
                       resetCurRegister(iPackNo-1) ;
                       sleep(200);
                       resetCurRegister(iPackNo-1) ;
                       sleep(100);
                       resetCurRegister(iPackNo-1) ;
                     //  sleep(200);
                     end;
                   except
                     (TmemoCom as TMemo).Lines.Add('-1004') ;
                   end;
                //接下去把数据传给计数器

                   try
                     sleep(200) ;
                    // objname:='num'+inttostr(iPackNo);
                    // TNumCom:=FindComponent(objName);
                     SendJsqInfo(iPackNo-1,iPackNo,(TNumCom as TRzNumericEdit).IntValue,0 ); //包装线，通道号 ,发送数量
                     sleep(200) ;
                     SendJsqInfo(iPackNo-1,iPackNo,(TNumCom as TRzNumericEdit).IntValue,0 );
                     sleep(600) ;
                     SendJsqInfo(iPackNo-1,iPackNo,(TNumCom as TRzNumericEdit).IntValue,0 );
                   except
                     (TmemoCom as TMemo).Lines.Add('-1005') ;
                   end;

                 //  (TmemoCom as TMemo).Lines.Add('8013') ;
                   try
                    // sleep(300);
                    // PackLine_Jsq_XhSf(iPackNo-1,((DkChanel+1) mod 2) )  ;
                     sleep(300) ;
                     Openzadao(iPackNo-1);
                     sleep(200) ;
                     Openzadao(iPackNo-1);
                   except
                     (TmemoCom as TMemo).Lines.Add('-1006') ;
                   end ;


               end;  //执行刷卡成功操作 end

           end
           else   //if trim((TListCom as TETSListView).Items[0].SubItems[8])='1' then
           begin
              objname:='dk'+inttostr(iPackNo) ;
              TdkCom:=FindComponent(objname);
              idk:=(TdkCom as TRzNumericEdit).IntValue ;
              AutoRefreshPackLineLed(iPackNo-1,idk-1);
           end;
       end ;  //if (TListCom as TETSListView).Items.Count>0 then
    end;


  end ;

end;

procedure TfrmCalWindows.butbxzCancelClick(Sender: TObject);
begin
  pnlXtcs.Visible :=false ;
end;

procedure TfrmCalWindows.butbxzOKClick(Sender: TObject);
var
  sv, objname: string ;
  i,j,ApackLineNo : integer ;
  TplCom : TComponent ;
  inifile:Tinifile ;
begin
  ApackLineNo:=butbxzOK.Tag-1 ; //Tag=1表示1号包装线；ApackLineNo 0表示1号包装线

  if application.MessageBox(pchar('确定要启用'+inttostr(ApackLineNo+1)+'号线吗？'),'确定启用！',MB_OKCANCEL+MB_ICONWARNING+MB_DEFBUTTON2)<>IDOK then
    exit ;

  saveBzxConfig(ApackLineNo+1);
  pnlXtcs.Visible :=false ;
  //这里需要对分配包装重新分配车辆start  2013-12-21
  dm.FenPeiBzx(ApackLineNo );//目前参数暂时没有用上,预留着
  //这里需要对分配包装重新分配车辆 end   2013-12-21
  try
    initPackLine(false,ApackLineNo+1) ;
    InitScreenInfo(false,ApackLineNo+1) ;
    AutoRefreshNum[ApackLineNo]:=0 ;
    ladeID[ApackLineNo]:='0' ;

    //需要重新刷新继电器 吸合状态,防止启动前道口改变  start
    if (APackLineInfo[ApackLineNo].Qydk=cstQydk1) or (APackLineInfo[ApackLineNo].Qydk=cstQydk12) then
      j:=0
    else
      j:=1 ;

    PackLine_Jsq_XhSf(ApackLineNo,j) ;
    PackLine_Jsq_XhSf(ApackLineNo,j) ;
    JsqStatus[ApackLineNo]:=0;
    JsqClear(ApackLineNo);
    JsqClear(ApackLineNo);
    JsqClear(ApackLineNo);
  //  sleep(100) ;
    JsqLjClear(APackLineNo) ;
    JsqLjClear(APackLineNo) ;
    JsqLjClear(APackLineNo) ;
  //  sleep(100);

    CloseZadao(ApackLineNo);
    CloseZadao(ApackLineNo);
    CloseZadao(ApackLineNo);
    ClearJsqAlarm(ApackLineNo);
    ClearJsqAlarm(ApackLineNo);

    //初始化屏幕

      LedInitFlag[ApackLineNo]:=0;
      if  AScreenInfo[ApackLineNo].sfQy then
      begin
        initScreenT:= TInitScreenThread.Create(ApackLineNo+1);
        initScreenT.Resume;
      end ;

     objname:='pl'+inttostr(ApackLineNo+1);
     TplCom:=self.FindComponent(objname);
     (TplCom as TPanel).Color:=$0079FF79 ;

     inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
     try
        inifile.WriteBool(inttostr(ApackLineNo+1)+c_PackLineName,'bzx_ckb_sfqy',true) ;
        cstCurRunlist.Add(inttostr(ApackLineNo+1)) ;
        cstCurRunlist.Sort;
     finally
        inifile.Free ;
     end;
     initTimer ;
  except

  end ;
end;

procedure TfrmCalWindows.saveBzxConfig(ABzxNo : integer);
var
  inifile:TIniFile;
  supsql,sfqy,cs_PackName  : string ;
begin
  cs_PackName:=inttostr(ABzxNo)+c_PackLineName ;
  try
    inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
    with inifile do
    begin
  //保存包装线参数
      WriteString(cs_PackName,'cb_pz_pzxz',cb_pz_pzxz.Text );
      WriteString(cs_PackName,'cb_jsq_ckxz',cb_jsq_ckxz.Value);
      WriteBool(cs_PackName,'bzx_ckb_sfqy',true);
      WriteInteger(cs_PackName,'bzx_sedt_zdybdjg',strtoint(floattostr(bzx_sedt_zdybdjg.Value)));
      WriteString(cs_PackName,'bzx_cb_qydk',bzx_cb_qydk.Value);
      WriteString(cs_PackName,'pmj_cb_ckxz',pmj_cb_ckxz.Value);
      WriteString(cs_PackName,'pmj_edt_ccqh',trim(pmj_edt_ccqh.Text));
      WriteBool(cs_packname,'pmjSfqy',pmjsfqy.Checked );
      WriteString(cs_PackName,'pmj_ccqnrS',trim(pmj_ccqnrS.Text));
      WriteString(cs_PackName,'pmj_Code',pmj_Code.Value);
      WriteString(cs_PackName,'pmj_ccqnrE',trim(pmj_ccqnrE.Text));
      //sfQy=0启用，1不启用
      supsql:='update tsys_PackLineCement set item_name='+quotedstr(trim(cb_pz_pzxz.Text) )+
              ' ,sfQy=0 where PackNo='+inttostr(ABzxNo);
      Dm.ADOCnn.Execute(supsql) ;
    end;
  finally
    inifile.Free;
  end;
end;

 

end.


