//����Ȩ�޵�����:Ȩ�޹�32λ��

unit uScreenDefine;

interface
  uses Jpeg,Graphics,windows,Classes ;

var
    hDll              : THandle;

{-------------------------------------------------------------------------------
  ������:    AddScreen
  ��̬���������ʾ����Ϣ���ú���������ʾ��ͨѶ��
  ����:
    nControlType:��ʾ���Ŀ������ͺţ�Ŀǰ�ö�̬����̬��ֻ֧��BX-5E1��BX-5E2��BX-5E3��BX-5Eϵ�п�������
    nScreenNo����ʾ�����ţ��ò�����LedshowTW 2013�����"��������"ģ���"����"����һ�¡�
    nSendMode��ͨѶģʽ��Ŀǰ��̬����֧��0:����ͨѶ��2������ͨѶ(ֻ֧�̶ֹ�IPģʽ)��5�����浽�ļ�������ͨѶģʽ��
    nWidth����ʾ����ȣ���λ�����ء�
    nHeight����ʾ���߶ȣ���λ�����ء�
    nScreenType����ʾ�����ͣ�1������ɫ��2��˫��ɫ��
    nPixelMode���������ͣ�ֻ����ʾ������Ϊ˫��ɫʱ��Ч��1��R+G��2��G+R��
    pCom��ͨѶ���ڣ�ֻ���ڴ���ͨѶʱ�ò�����Ч������"COM1"
    nBaud��ͨѶ���ڲ����ʣ�ֻ���ڴ���ͨѶʱ�ò�����Ч��Ŀǰֻ֧��9600��57600���ֲ����ʡ�
    pSocketIP����������IP��ַ��ֻ��������ͨѶ(�̶�IPģʽ)ģʽ�¸ò�����Ч������"192.168.0.199"
    nSocketPort���������Ķ˿ڵ�ַ��ֻ��������ͨѶ(�̶�IPģʽ)ģʽ�¸ò�����Ч������5005
    pCommandDataFile�����浽�ļ���ʽʱ������������ļ����ơ�ֻ���ڱ��浽�ļ�ģʽ�¸ò�����Ч������"curCommandData.dat"
  ����ֵ:    �������״̬���붨�塣
-------------------------------------------------------------------------------}
  AddScreen: array [0..2] of
    function(nControlType, nScreenNo, nSendMode, nWidth, nHeight, nScreenType, nPixelMode: Integer;
    pCom: PChar; nBaud: Integer; pSocketIP: PChar; nSocketPort: Integer;
    pCommandDataFile: pChar): integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    AddScreenDynamicArea
  ��̬����ָ����ʾ����Ӷ�̬���򣻸ú���������ʾ��ͨѶ��
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ�Ŀǰϵͳ�����5����̬���򣻸�ֵȡֵ��ΧΪ0~4;
    nRunMode����̬��������ģʽ��
              0:��̬������ѭ����ʾ��
              1:��̬��������ʾ��ɺ�ֹ��ʾ���һҳ���ݣ�
              2:��̬������ѭ����ʾ�������趨ʱ���������δ����ʱ������ʾ��
              3:��̬������ѭ����ʾ�������趨ʱ���������δ����ʱ��ʾLogo��Ϣ,Logo ��Ϣ��Ϊ��̬��������һҳ��Ϣ
              4:��̬������˳����ʾ����ʾ�����һҳ��Ͳ�����ʾ
    nTimeOut����̬�����ݳ�ʱʱ�䣻��λ���� 
    nAllProRelate����Ŀ������־��
              1�����н�Ŀ����ʾ�ö�̬����
              0����ָ����Ŀ����ʾ�ö�̬���������̬����Ҫ�����ڽ�Ŀ��ʾ������һ������Ϊ�ա�
    pProRelateList����Ŀ�����б��ý�Ŀ��ű�ʾ����Ŀ��ż���","����,��Ŀ��Ŷ���ΪLedshowTW 2013�����"P***"�е�"***"
    nPlayImmediately����̬�����Ƿ���������0���ö�̬�������첽��Ŀһ�𲥷ţ�1���첽��Ŀֹͣ���ţ������Ÿö�̬����
    nAreaX����̬������ʼ�����ꣻ��λ������
    nAreaY����̬������ʼ�����ꣻ��λ������
    nAreaWidth����̬�����ȣ���λ������
    nAreaHeight����̬����߶ȣ���λ������
    nAreaFMode����̬����߿���ʾ��־��0����ɫ��1����ɫ��255���ޱ߿�
    nAreaFLine����̬����߿�����, ��ɫ���ȡֵΪFRAME_SINGLE_COLOR_COUNT����ɫ���ȡֵΪ��FRAME_MULI_COLOR_COUNT
    nAreaFColor���߿���ʾ��ɫ��ѡ��Ϊ��ɫ�߿�����ʱ�ò�����Ч��
    nAreaFStunt���߿������ؼ���
              0����˸��1��˳ʱ��ת����2����ʱ��ת����3����˸��˳ʱ��ת����
              4:��˸����ʱ��ת����5�����̽�����˸��6�����̽���ת����7����ֹ���
    nAreaFRunSpeed���߿������ٶȣ�
    nAreaFMoveStep���߿��ƶ���������ֵȡֵ��Χ��1~8��
  ����ֵ:    �������״̬���붨�塣
-------------------------------------------------------------------------------}
  AddScreenDynamicArea : array [0..2] of
    function(nScreenNo, nDYAreaID: Integer; nRunMode: Integer;
    nTimeOut, nAllProRelate: Integer; pProRelateList: PChar; nPlayImmediately: Integer;
    nAreaX, nAreaY, nAreaWidth, nAreaHeight: Integer; nAreaFMode, nAreaFLine, nAreaFColor,
    nAreaFStunt, nAreaFRunSpeed, nAreaFMoveStep: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    AddScreenDynamicAreaFile
  ��̬����ָ����ʾ����ָ����̬���������Ϣ�ļ����ú���������ʾ��ͨѶ��
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ��ò�����AddScreenDynamicArea�����е�nDYAreaID������Ӧ
    pFileName����ӵ���Ϣ�ļ����ƣ�Ŀǰֻ֧��txt(֧��ANSI��UTF-8��Unicode�ȸ�ʽ����)��bmp���ļ���ʽ
    nShowSingle��������Ϣ�Ƿ�����ʾ��0��������ʾ��1��������ʾ����ʾ�ò���ֻ��szFileNameΪtxt��ʽ�ĵ�ʱ����Ч��
    pFontName��������Ϣ��ʾ���壻�ò���ֻ��szFileNameΪtxt��ʽ�ĵ�ʱ����Ч��
    nFontSize��������Ϣ��ʾ������ֺţ��ò���ֻ��szFileNameΪtxt��ʽ�ĵ�ʱ����Ч��
    nBold��������Ϣ�Ƿ������ʾ��0��������1��������ʾ���ò���ֻ��szFileNameΪtxt��ʽ�ĵ�ʱ����Ч��
    nFontColor��������Ϣ��ʾ��ɫ���ò���ֻ��szFileNameΪtxt��ʽ�ĵ�ʱ����Ч��
    nStunt����̬������Ϣ�����ؼ���

    nRunSpeed����̬������Ϣ�����ٶ�
    nShowTime����̬������Ϣ��ʾʱ�䣻��λ��10ms
  ����ֵ:    �������״̬���붨�塣
-------------------------------------------------------------------------------}
  AddScreenDynamicAreaFile :array [0..2] of
    function(nScreenNo, nDYAreaID: Integer;
    pFileName: PChar; nShowSingle: integer; pFontName: PChar; nFontSize, nBold, nFontColor: Integer;
    nStunt, nRunSpeed, nShowTime: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    DeleteScreen
  ɾ����̬����ָ����ʾ����������Ϣ���ú���������ʾ��ͨѶ��
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
  ����ֵ:    �������״̬���붨��
-------------------------------------------------------------------------------}
  DeleteScreen : array [0..2] of
    function(nScreenNo: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    DeleteScreenDynamicAreaFile
  ɾ����̬����ָ����ʾ��ָ���Ķ�̬����ָ���ļ���Ϣ���ú���������ʾ��ͨѶ��
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ��ò�����AddScreenDynamicArea�����е�nDYAreaID������Ӧ
    nFileOrd����̬�����ָ���ļ����ļ���ţ�����Ű����ļ����˳�򣬴�0˳���������ɾ���м���ļ���������ļ�����Զ���䡣
  ����ֵ:    �������״̬���붨��
-------------------------------------------------------------------------------}
  DeleteScreenDynamicAreaFile: array [0..2] of
    function(nScreenNo, nDYAreaID, nFileOrd: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    SendDynamicAreaInfoCommand
  ���Ͷ�̬����ָ����ʾ��ָ���Ķ�̬������Ϣ����ʾ�����ú�������ʾ��ͨѶ��
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ��ò�����AddScreenDynamicArea�����е�nDYAreaID������Ӧ
  ����ֵ:    �������״̬���붨��
-------------------------------------------------------------------------------}
  SendDynamicAreaInfoCommand: array [0..2] of
    function(nScreenNo, nDYAreaID: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    SendDeleteDynamicAreasCommand
  ɾ����̬����ָ����ʾ��ָ���Ķ�̬������Ϣ��ͬʱ����ʾ��ͨѶɾ��ָ���Ķ�̬������Ϣ���ú�������ʾ��ͨѶ
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ��ò�����AddScreenDynamicArea�����е�nDYAreaID������Ӧ
    pDYAreaIDList����̬�������б����ͬʱɾ�������̬���򣬶�̬�����ż���","��������"0,1"
  ����ֵ:    �������״̬���붨��
-------------------------------------------------------------------------------}
  SendDeleteDynamicAreasCommand:array [0..2] of
    function(nScreenNo, nDelAllDYArea: Integer; pDYAreaIDList: PChar): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    SendUpdateDynamicAreaPageInfoCommand
  ��̬����ָ����ʾ��ָ���Ķ�̬���򵥶�����ָ��������ҳ��Ϣ���ú�������ʾ��ͨѶ
  �ú���ʹ��ʱ����������ȷ�õ�ǰԤ������Ϣ����ʾ���е���ʾҳ�룬������ܸ��³���
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ��ò�����AddScreenDynamicArea�����е�nDYAreaID������Ӧ
    nFileOrd����̬�����ָ���ļ����ļ���ţ�����Ű����ļ����˳�򣬴�0˳���������ɾ���м���ļ���������ļ�����Զ���䡣
    nPageOrd��Ԥ��������ҳ��ҳ��š���0��ʼ˳�������
  ����ֵ:    �������״̬���붨��
-------------------------------------------------------------------------------}
  SendUpdateDynamicAreaPageInfoCommand: array [0..2] of
    function(nScreenNo, nDYAreaID, nFileOrd, nPageOrd: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  ������:    SendDeleteDynamicAreaPageCommand
  ɾ����̬����ָ����ʾ����ָ����̬����ָ��������ҳ��Ϣ���ú�������ʾ��ͨѶ
  �ú���ʹ��ʱ����������ȷ�õ�ǰԤɾ������ҳ��Ϣ����ʾ���е���ʾҳ�룬�������ɾ������
  ����:
    nScreenNo����ʾ�����ţ��ò�����AddScreen�����е�nScreenNo������Ӧ��
    nDYAreaID����̬�����ţ��ò�����AddScreenDynamicArea�����е�nDYAreaID������Ӧ
    pDYAreaPageOrdList��Ԥɾ����̬��������ҳ����б����ͬʱɾ���������ҳ��Ϣ������ҳ��ż���","��������"0,1"��
              ɾ������ҳ��Ϣִ�гɹ��󣬺��������ҳ��Ϣ������ҳ����Զ���ǰ���롣
  ����ֵ:    �������״̬���붨��
-------------------------------------------------------------------------------}
  SendDeleteDynamicAreaPageCommand :array [0..2] of
    function(nScreenNo, nDYAreaID: Integer; pDYAreaPageOrdList: PChar): Integer; stdcall;
implementation

end.

