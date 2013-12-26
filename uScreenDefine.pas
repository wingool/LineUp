//管理权限的描述:权限共32位，

unit uScreenDefine;

interface
  uses Jpeg,Graphics,windows,Classes ;

var
    hDll              : THandle;

{-------------------------------------------------------------------------------
  过程名:    AddScreen
  向动态库中添加显示屏信息；该函数不与显示屏通讯。
  参数:
    nControlType:显示屏的控制器型号，目前该动态区域动态库只支持BX-5E1、BX-5E2、BX-5E3等BX-5E系列控制器。
    nScreenNo：显示屏屏号；该参数与LedshowTW 2013软件中"设置屏参"模块的"屏号"参数一致。
    nSendMode：通讯模式；目前动态库中支持0:串口通讯；2：网络通讯(只支持固定IP模式)；5：保存到文件等三种通讯模式。
    nWidth：显示屏宽度；单位：像素。
    nHeight：显示屏高度；单位：像素。
    nScreenType：显示屏类型；1：单基色；2：双基色。
    nPixelMode：点阵类型，只有显示屏类型为双基色时有效；1：R+G；2：G+R。
    pCom：通讯串口，只有在串口通讯时该参数有效；例："COM1"
    nBaud：通讯串口波特率，只有在串口通讯时该参数有效；目前只支持9600、57600两种波特率。
    pSocketIP：控制器的IP地址；只有在网络通讯(固定IP模式)模式下该参数有效，例："192.168.0.199"
    nSocketPort：控制器的端口地址；只有在网络通讯(固定IP模式)模式下该参数有效，例：5005
    pCommandDataFile：保存到文件方式时，命令保存命令文件名称。只有在保存到文件模式下该参数有效，例："curCommandData.dat"
  返回值:    详见返回状态代码定义。
-------------------------------------------------------------------------------}
  AddScreen: array [0..2] of
    function(nControlType, nScreenNo, nSendMode, nWidth, nHeight, nScreenType, nPixelMode: Integer;
    pCom: PChar; nBaud: Integer; pSocketIP: PChar; nSocketPort: Integer;
    pCommandDataFile: pChar): integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    AddScreenDynamicArea
  向动态库中指定显示屏添加动态区域；该函数不与显示屏通讯。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；目前系统中最多5个动态区域；该值取值范围为0~4;
    nRunMode：动态区域运行模式：
              0:动态区数据循环显示；
              1:动态区数据显示完成后静止显示最后一页数据；
              2:动态区数据循环显示，超过设定时间后数据仍未更新时不再显示；
              3:动态区数据循环显示，超过设定时间后数据仍未更新时显示Logo信息,Logo 信息即为动态区域的最后一页信息
              4:动态区数据顺序显示，显示完最后一页后就不再显示
    nTimeOut：动态区数据超时时间；单位：秒 
    nAllProRelate：节目关联标志；
              1：所有节目都显示该动态区域；
              0：在指定节目中显示该动态区域，如果动态区域要独立于节目显示，则下一个参数为空。
    pProRelateList：节目关联列表，用节目编号表示；节目编号间用","隔开,节目编号定义为LedshowTW 2013软件中"P***"中的"***"
    nPlayImmediately：动态区域是否立即播放0：该动态区域与异步节目一起播放；1：异步节目停止播放，仅播放该动态区域
    nAreaX：动态区域起始横坐标；单位：像素
    nAreaY：动态区域起始纵坐标；单位：像素
    nAreaWidth：动态区域宽度；单位：像素
    nAreaHeight：动态区域高度；单位：像素
    nAreaFMode：动态区域边框显示标志；0：纯色；1：花色；255：无边框
    nAreaFLine：动态区域边框类型, 纯色最大取值为FRAME_SINGLE_COLOR_COUNT；花色最大取值为：FRAME_MULI_COLOR_COUNT
    nAreaFColor：边框显示颜色；选择为纯色边框类型时该参数有效；
    nAreaFStunt：边框运行特技；
              0：闪烁；1：顺时针转动；2：逆时针转动；3：闪烁加顺时针转动；
              4:闪烁加逆时针转动；5：红绿交替闪烁；6：红绿交替转动；7：静止打出
    nAreaFRunSpeed：边框运行速度；
    nAreaFMoveStep：边框移动步长；该值取值范围：1~8；
  返回值:    详见返回状态代码定义。
-------------------------------------------------------------------------------}
  AddScreenDynamicArea : array [0..2] of
    function(nScreenNo, nDYAreaID: Integer; nRunMode: Integer;
    nTimeOut, nAllProRelate: Integer; pProRelateList: PChar; nPlayImmediately: Integer;
    nAreaX, nAreaY, nAreaWidth, nAreaHeight: Integer; nAreaFMode, nAreaFLine, nAreaFColor,
    nAreaFStunt, nAreaFRunSpeed, nAreaFMoveStep: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    AddScreenDynamicAreaFile
  向动态库中指定显示屏的指定动态区域添加信息文件；该函数不与显示屏通讯。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；该参数与AddScreenDynamicArea函数中的nDYAreaID参数对应
    pFileName：添加的信息文件名称；目前只支持txt(支持ANSI、UTF-8、Unicode等格式编码)、bmp的文件格式
    nShowSingle：文字信息是否单行显示；0：多行显示；1：单行显示；显示该参数只有szFileName为txt格式文档时才有效；
    pFontName：文字信息显示字体；该参数只有szFileName为txt格式文档时才有效；
    nFontSize：文字信息显示字体的字号；该参数只有szFileName为txt格式文档时才有效；
    nBold：文字信息是否粗体显示；0：正常；1：粗体显示；该参数只有szFileName为txt格式文档时才有效；
    nFontColor：文字信息显示颜色；该参数只有szFileName为txt格式文档时才有效；
    nStunt：动态区域信息运行特技；

    nRunSpeed：动态区域信息运行速度
    nShowTime：动态区域信息显示时间；单位：10ms
  返回值:    详见返回状态代码定义。
-------------------------------------------------------------------------------}
  AddScreenDynamicAreaFile :array [0..2] of
    function(nScreenNo, nDYAreaID: Integer;
    pFileName: PChar; nShowSingle: integer; pFontName: PChar; nFontSize, nBold, nFontColor: Integer;
    nStunt, nRunSpeed, nShowTime: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    DeleteScreen
  删除动态库中指定显示屏的所有信息；该函数不与显示屏通讯。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
  返回值:    详见返回状态代码定义
-------------------------------------------------------------------------------}
  DeleteScreen : array [0..2] of
    function(nScreenNo: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    DeleteScreenDynamicAreaFile
  删除动态库中指定显示屏指定的动态区域指定文件信息；该函数不与显示屏通讯。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；该参数与AddScreenDynamicArea函数中的nDYAreaID参数对应
    nFileOrd：动态区域的指定文件的文件序号；该序号按照文件添加顺序，从0顺序递增，如删除中间的文件，后面的文件序号自动填充。
  返回值:    详见返回状态代码定义
-------------------------------------------------------------------------------}
  DeleteScreenDynamicAreaFile: array [0..2] of
    function(nScreenNo, nDYAreaID, nFileOrd: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    SendDynamicAreaInfoCommand
  发送动态库中指定显示屏指定的动态区域信息到显示屏；该函数与显示屏通讯。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；该参数与AddScreenDynamicArea函数中的nDYAreaID参数对应
  返回值:    详见返回状态代码定义
-------------------------------------------------------------------------------}
  SendDynamicAreaInfoCommand: array [0..2] of
    function(nScreenNo, nDYAreaID: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    SendDeleteDynamicAreasCommand
  删除动态库中指定显示屏指定的动态区域信息；同时向显示屏通讯删除指定的动态区域信息。该函数与显示屏通讯
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；该参数与AddScreenDynamicArea函数中的nDYAreaID参数对应
    pDYAreaIDList：动态区域编号列表；如果同时删除多个动态区域，动态区域编号间用","隔开。如"0,1"
  返回值:    详见返回状态代码定义
-------------------------------------------------------------------------------}
  SendDeleteDynamicAreasCommand:array [0..2] of
    function(nScreenNo, nDelAllDYArea: Integer; pDYAreaIDList: PChar): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    SendUpdateDynamicAreaPageInfoCommand
  向动态库中指定显示屏指定的动态区域单独更新指定的数据页信息；该函数与显示屏通讯
  该函数使用时，必须能明确好当前预更新信息在显示屏中的显示页码，否则可能更新出错。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；该参数与AddScreenDynamicArea函数中的nDYAreaID参数对应
    nFileOrd：动态区域的指定文件的文件序号；该序号按照文件添加顺序，从0顺序递增，如删除中间的文件，后面的文件序号自动填充。
    nPageOrd：预更新数据页的页序号。从0开始顺序递增。
  返回值:    详见返回状态代码定义
-------------------------------------------------------------------------------}
  SendUpdateDynamicAreaPageInfoCommand: array [0..2] of
    function(nScreenNo, nDYAreaID, nFileOrd, nPageOrd: Integer): Integer; stdcall;

{-------------------------------------------------------------------------------
  过程名:    SendDeleteDynamicAreaPageCommand
  删除动态库中指定显示屏的指定动态区域指定的数据页信息；该函数与显示屏通讯
  该函数使用时，必须能明确好当前预删除数据页信息在显示屏中的显示页码，否则可能删除出错。
  参数:
    nScreenNo：显示屏屏号；该参数与AddScreen函数中的nScreenNo参数对应。
    nDYAreaID：动态区域编号；该参数与AddScreenDynamicArea函数中的nDYAreaID参数对应
    pDYAreaPageOrdList：预删除动态区域数据页序号列表；如果同时删除多个数据页信息，数据页序号间用","隔开。如"0,1"；
              删除数据页信息执行成功后，后面的数据页信息的数据页序号自动向前对齐。
  返回值:    详见返回状态代码定义
-------------------------------------------------------------------------------}
  SendDeleteDynamicAreaPageCommand :array [0..2] of
    function(nScreenNo, nDYAreaID: Integer; pDYAreaPageOrdList: PChar): Integer; stdcall;
implementation

end.

