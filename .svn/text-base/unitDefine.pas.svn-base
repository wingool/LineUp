//管理权限的描述:权限共32位，

unit unitDefine;

interface
  uses Jpeg,Graphics,windows,Classes ;

const
  cstADOQueryNumber=10;  //要生成的可供各窗体调用的ADOQuery的个数
  c_PackLineName='#包装线设置';
  c_CarPos=12 ;
  c_earlyTime='2013-09-01';
  c_filename='HR_PARAM.ini';
//  c_PackLineNum=3 ;

type
  FeeDetailRowArray=array[0..3] of single;//对应收费定义中的一行信息
  ScreenType=record  //屏幕信息
    Pm_Kzkxh:string;	     //控制卡型号
    Pm_Txms:string;        //通讯模式
    Pm_Ck:string;          //串口
    Pm_Btl:string;		     //比特率
    Pm_Wide:integer;	     //屏幕宽度
    Pm_Height:integer;     //屏幕高度
    Pm_Color:string;        //屏幕色调（目前全部单基色，不能选择）
    Pm_StopTime : integer ;//停留时间
    Pm_PdCar :TstringList ;//存放排队 车辆 信息
    AutoNum : integer ;
    sfQy : boolean ;//该屏幕是否启用
    Ipdz : string ;  //Ip地址
    duank : integer ; //端口
    ReRead: boolean ; //是否需要重新读取数据
  end;
  TScreenTypePoint=^ScreenType;

  PackLineType=record    //包装线
    Sfqybzx:boolean;	   //是否启用包装线
    Sfqypzxz:boolean;    //是否启用品种选择 // 这个暂时不用了，启用了包装线，必须同时要启用品种选择
    SnPz:string;         //水泥品种选择
    Yi_DyBdzt:string;		 //1#道口对应扳道状态
    ZdybdSjjg:integer;	   //匝道与扳道时间间隔
    Qydk:string;	       //启用道口
    Jsq_SelectCk:integer; //计数器串口选择
    Pmj_SelectCk:integer;//喷码机串口选择
    Memory_No:string;	   //存储器号
    ccqnrS:string;  //存储器内容开始
    ccqnrCode:string;  //存储器内容中间部分
    ccqnrE:string;  //存储器内容结束
    pmjSfqy : boolean ;//喷码机是否启用
    WaitVehicleNum:integer ;   //当前有几辆车等待
    InitDk : integer ;//当前被分配使用第一个道口
    totalNum : integer ;  //累计多少辆车(做为序号使用)
    PackIng : boolean ;//是否正在装车
    RefreshIng : boolean ;//是否正在刷新数据
    SnPh:string ;//水泥批号
    Snph_Num: integer ;//该批次水泥批号数量
    Snph_ShengNum: integer ;//该批次水泥还余多少量(从总量开始往下减)
  end;
  TPackLinePoint=^PackLineType;

  UserInfoType=record
    EMPID:string;     //职员_ID
    EMPCODE:string;   //职员编号
    DepID:string;	//科室_ID
    EMPName:string;  //职员姓名
    EMPPwd:string;	//职员口令
    EMPisSUPER:integer;//是否管理员权限
    GrantRight:integer;//授权权限
    LogID:string;      //Log_ID
    ChargDetail:String; //收费时查阅详细信息
  end;

  SysInfoType=record
    PreYjNumber:integer;  //装量到时提前报警数量
    JsyPm:string;        //计数与喷码
    WaitTime:integer;	   //呼叫后等待时间
    BackNumber:integer;  //呼叫后往后退几位,0=退到最后
    ReadCardCk:string;	// 读卡器串口
    Cssksj:integer;     // 超时刷卡时间
    Btl:integer;        // 波特率
  end;
  TSysInfoPoint=^SysInfoType;

  //访问的记录是临时的、历史的还是正式的
  TmyTableState=0..2;
  //窗体是处于查询状态还是处于修改状态
  TmyFormState=(State_InputWithFlow,State_InputDirect,State_QueryNow,State_QueryHistory,State_ModifyNow,State_ModifyHistory,State_LogOut,State_LogIn);
  TFormInfo = record  //窗体状态信息
    TableState:TmyTableState;
    FormState:TmyFormState;
  end;
  TJPEGDefaultsPoint=^TJPEGDefaults;
  UserLoginType = (LoginState_First,LoginState_ChangeUser); //标记用户是首次登录还是改登用户
  myPrintPaper=(Paper_A4,Paper_B5,Paper_16k,Paper_Define,Paper_InPrint);
var
  g_intAfd:integer; //用于记录Sql语句执行影响到的记录束
  cstRightDescribe:array[1..31] of string=('','','','','','','','',
    '','','','','','',
    '','','系统管理','数据维护',
  	'','','','','','','','','','','','','');

  //用户，存放在INI文件中
  cstPreYjNumber:integer;       //装量到时提前报警数量
  cstStopAndTurnTime:integer ;  //停止和扳道时间间隔
//  cstWaitTime:integer ;         //呼叫后等候几分钟
  cstBackNumber:integer;        //呼叫后没有按时就位后移几位
  cstPageViewpkgLine  : integer ; //一页窗体显示几条包装线
  cstUsePkgLine :integer ;        //本厂当前几条包装线投入使用(做为后台配置项)
  cstDkqCk :string ;             //读卡器串口
  cstDkqBtl : string;            //读卡器比特率
  cstDkqCssksj: integer ;         //读卡器超时刷卡时间
  cstlength : integer ;//LED屏字节长度
  cstPreShuaKa : integer ;//是否允许提前刷卡 1：允许；0不允许
  cstAutoRefresh : integer ;//0表示不启用自动刷新，值在0-30分钟
  cstStartAutoRefeshNum :  integer ;//启动自动刷新的数量 ,要求最少不能少于30包
  cstTimerNum: integer ;//启用几个定时器后如果不来刷卡，把当前车排在最后
  //快捷键信息
  cstshortcut:array[1..14] of integer;
  cstCurRunlist: TStringList ; //运行的包装线编号列表,包装线从1号开始计数
  cstCanModifyPacket: boolean ;//是否允许补包

  //查询配置信息
  cstQueryRecordcount:integer;//查询返回的记录数
  cstQuerySumArea:boolean;  //查询是否统计面积
  cstQueryShowGrid:boolean; //查询是否显示网格
  

  //各中状态的颜色选择
  cstCFColor:integer=clred;
  cstDYColor:integer=clgreen;
  cstDJColor:integer=clblue;
  cstZLColor:integer=clAqua;
  cstBAColor:integer=clyellow;
  cstZYColor:integer=clred;
  cstZXColor:integer=clred;

  cstQydk1:string='1#' ;//'1＃';
  cstQydk2:string='2#';
  cstQydk12:string='1#2#';

  WM_ClearForm:DWord;

  //是否为修改窗体
  cstModifyform:boolean=false;
implementation

end.
 