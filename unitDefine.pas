//����Ȩ�޵�����:Ȩ�޹�32λ��

unit unitDefine;

interface
  uses Jpeg,Graphics,windows,Classes ;

const
  cstADOQueryNumber=10;  //Ҫ���ɵĿɹ���������õ�ADOQuery�ĸ���
  c_PackLineName='#��װ������';
  c_CarPos=12 ;
  c_earlyTime='2013-09-01';
  c_filename='HR_PARAM.ini';
//  c_PackLineNum=3 ;

type
  FeeDetailRowArray=array[0..3] of single;//��Ӧ�շѶ����е�һ����Ϣ
  ScreenType=record  //��Ļ��Ϣ
    Pm_Kzkxh:string;	     //���ƿ��ͺ�
    Pm_Txms:string;        //ͨѶģʽ
    Pm_Ck:string;          //����
    Pm_Btl:string;		     //������
    Pm_Wide:integer;	     //��Ļ���
    Pm_Height:integer;     //��Ļ�߶�
    Pm_Color:string;        //��Ļɫ����Ŀǰȫ������ɫ������ѡ��
    Pm_StopTime : integer ;//ͣ��ʱ��
    Pm_PdCar :TstringList ;//����Ŷ� ���� ��Ϣ
    AutoNum : integer ;
    sfQy : boolean ;//����Ļ�Ƿ�����
    Ipdz : string ;  //Ip��ַ
    duank : integer ; //�˿�
    ReRead: boolean ; //�Ƿ���Ҫ���¶�ȡ����
  end;
  TScreenTypePoint=^ScreenType;

  PackLineType=record    //��װ��
    Sfqybzx:boolean;	   //�Ƿ����ð�װ��
    Sfqypzxz:boolean;    //�Ƿ�����Ʒ��ѡ�� // �����ʱ�����ˣ������˰�װ�ߣ�����ͬʱҪ����Ʒ��ѡ��
    SnPz:string;         //ˮ��Ʒ��ѡ��
    Yi_DyBdzt:string;		 //1#���ڶ�Ӧ���״̬
    ZdybdSjjg:integer;	   //�ѵ�����ʱ����
    Qydk:string;	       //���õ���
    Jsq_SelectCk:integer; //����������ѡ��
    Pmj_SelectCk:integer;//���������ѡ��
    Memory_No:string;	   //�洢����
    ccqnrS:string;  //�洢�����ݿ�ʼ
    ccqnrCode:string;  //�洢�������м䲿��
    ccqnrE:string;  //�洢�����ݽ���
    pmjSfqy : boolean ;//������Ƿ�����
    WaitVehicleNum:integer ;   //��ǰ�м������ȴ�
    InitDk : integer ;//��ǰ������ʹ�õ�һ������
    totalNum : integer ;  //�ۼƶ�������(��Ϊ���ʹ��)
    PackIng : boolean ;//�Ƿ�����װ��
    RefreshIng : boolean ;//�Ƿ�����ˢ������
    SnPh:string ;//ˮ������
    Snph_Num: integer ;//������ˮ����������
    Snph_ShengNum: integer ;//������ˮ�໹�������(��������ʼ���¼�)
  end;
  TPackLinePoint=^PackLineType;

  UserInfoType=record
    EMPID:string;     //ְԱ_ID
    EMPCODE:string;   //ְԱ���
    DepID:string;	//����_ID
    EMPName:string;  //ְԱ����
    EMPPwd:string;	//ְԱ����
    EMPisSUPER:integer;//�Ƿ����ԱȨ��
    GrantRight:integer;//��ȨȨ��
    LogID:string;      //Log_ID
    ChargDetail:String; //�շ�ʱ������ϸ��Ϣ
  end;

  SysInfoType=record
    PreYjNumber:integer;  //װ����ʱ��ǰ��������
    JsyPm:string;        //����������
    WaitTime:integer;	   //���к�ȴ�ʱ��
    BackNumber:integer;  //���к������˼�λ,0=�˵����
    ReadCardCk:string;	// ����������
    Cssksj:integer;     // ��ʱˢ��ʱ��
    Btl:integer;        // ������
  end;
  TSysInfoPoint=^SysInfoType;

  //���ʵļ�¼����ʱ�ġ���ʷ�Ļ�����ʽ��
  TmyTableState=0..2;
  //�����Ǵ��ڲ�ѯ״̬���Ǵ����޸�״̬
  TmyFormState=(State_InputWithFlow,State_InputDirect,State_QueryNow,State_QueryHistory,State_ModifyNow,State_ModifyHistory,State_LogOut,State_LogIn);
  TFormInfo = record  //����״̬��Ϣ
    TableState:TmyTableState;
    FormState:TmyFormState;
  end;
  TJPEGDefaultsPoint=^TJPEGDefaults;
  UserLoginType = (LoginState_First,LoginState_ChangeUser); //����û����״ε�¼���Ǹĵ��û�
  myPrintPaper=(Paper_A4,Paper_B5,Paper_16k,Paper_Define,Paper_InPrint);
var
  g_intAfd:integer; //���ڼ�¼Sql���ִ��Ӱ�쵽�ļ�¼��
  cstRightDescribe:array[1..31] of string=('','','','','','','','',
    '','','','','','',
    '','','ϵͳ����','����ά��',
  	'','','','','','','','','','','','','');

  //�û��������INI�ļ���
  cstPreYjNumber:integer;       //װ����ʱ��ǰ��������
  cstStopAndTurnTime:integer ;  //ֹͣ�Ͱ��ʱ����
//  cstWaitTime:integer ;         //���к�Ⱥ򼸷���
  cstBackNumber:integer;        //���к�û�а�ʱ��λ���Ƽ�λ
  cstPageViewpkgLine  : integer ; //һҳ������ʾ������װ��
  cstUsePkgLine :integer ;        //������ǰ������װ��Ͷ��ʹ��(��Ϊ��̨������)
  cstDkqCk :string ;             //����������
  cstDkqBtl : string;            //������������
  cstDkqCssksj: integer ;         //��������ʱˢ��ʱ��
  cstlength : integer ;//LED���ֽڳ���
  cstPreShuaKa : integer ;//�Ƿ�������ǰˢ�� 1������0������
  cstAutoRefresh : integer ;//0��ʾ�������Զ�ˢ�£�ֵ��0-30����
  cstStartAutoRefeshNum :  integer ;//�����Զ�ˢ�µ����� ,Ҫ�����ٲ�������30��
  cstTimerNum: integer ;//���ü�����ʱ�����������ˢ�����ѵ�ǰ���������
  //��ݼ���Ϣ
  cstshortcut:array[1..14] of integer;
  cstCurRunlist: TStringList ; //���еİ�װ�߱���б�,��װ�ߴ�1�ſ�ʼ����
  cstCanModifyPacket: boolean ;//�Ƿ�������

  //��ѯ������Ϣ
  cstQueryRecordcount:integer;//��ѯ���صļ�¼��
  cstQuerySumArea:boolean;  //��ѯ�Ƿ�ͳ�����
  cstQueryShowGrid:boolean; //��ѯ�Ƿ���ʾ����
  

  //����״̬����ɫѡ��
  cstCFColor:integer=clred;
  cstDYColor:integer=clgreen;
  cstDJColor:integer=clblue;
  cstZLColor:integer=clAqua;
  cstBAColor:integer=clyellow;
  cstZYColor:integer=clred;
  cstZXColor:integer=clred;

  cstQydk1:string='1#' ;//'1��';
  cstQydk2:string='2#';
  cstQydk12:string='1#2#';

  WM_ClearForm:DWord;

  //�Ƿ�Ϊ�޸Ĵ���
  cstModifyform:boolean=false;
implementation

end.
 