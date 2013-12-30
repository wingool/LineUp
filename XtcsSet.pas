unit XtcsSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzSpnEdt, RzButton, RzGroupBar, RzPanel,
  RzSplit, ExtCtrls, DB,inifiles, RzCmboBx, RzRadChk;

type
  TfrmXtcsSet = class(TForm)
    gb_Xtcs: TGroupBox;
    Label3: TLabel;
    gb_PkgLine: TGroupBox;
    Panel3: TPanel;
    RzSplitter1: TRzSplitter;
    RzGroupBar1: TRzGroupBar;
    group_PackLine: TRzGroup;
    btnSave: TRzBitBtn;
    btnClose: TRzBitBtn;
    DataSource1: TDataSource;
    RzGroupBox1: TRzGroupBox;
    Panel1: TPanel;
    gb_pzxz: TGroupBox;
    Panel5: TPanel;
    gb_pmjpz: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    pmj_edt_ccqh: TRzEdit;
    pmj_ccqnrS: TRzEdit;
    pmj_cb_ckxz: TRzComboBox;
    gb_bzxcs: TGroupBox;
    pnl_bzxcs: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    bzx_sedt_zdybdjg: TRzSpinEdit;
    bzx_cb_qydk: TRzComboBox;
    gb_pmcs: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox2: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    dkq_ck: TRzComboBox;
    dkq_btl: TRzComboBox;
    pmj_Code: TRzComboBox;
    pmj_ccqnrE: TRzEdit;
    pmjSfqy: TCheckBox;
    ckb_qz_qypzxz: TRzCheckBox;
    bzx_ckb_sfqy: TRzCheckBox;
    Label15: TLabel;
    AutoRefresh: TRzSpinEdit;
    Label19: TLabel;
    edtAutoRefreshNum: TRzSpinEdit;
    Label7: TLabel;
    cb_jsq_ckxz: TRzComboBox;
    Label21: TLabel;
    pmcs1_kzkxh: TRzComboBox;
    Label22: TLabel;
    pmcs1_txms: TRzComboBox;
    GroupBox1: TGroupBox;
    Label33: TLabel;
    Label35: TLabel;
    pmcs1_duank: TRzNumericEdit;
    pmcs1_ip: TRzEdit;
    GroupBox10: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    pmcs1_ck: TRzComboBox;
    pmcs1_btl: TRzComboBox;
    Label27: TLabel;
    pmcs1_w: TRzNumericEdit;
    Label28: TLabel;
    pmcs1_h: TRzNumericEdit;
    Label29: TLabel;
    pmcs1_pm: TRzComboBox;
    Label1: TLabel;
    sedtPreYjNumber: TRzSpinEdit;
    cb_pz_pzxz: TRzComboBox;
    Label34: TLabel;
    Label4: TLabel;
    dkq_cssksj: TRzNumericEdit;
    Label2: TLabel;
    edtSnph: TRzEdit;
    edtSnph_Num: TRzNumericEdit;
    Label5: TLabel;
    edtShengNum: TRzNumericEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckb_qz_qypzxzClick(Sender: TObject);
    procedure ContentChange(Sender:TObject);
    procedure pmcs1_txmsChange(Sender: TObject);
    procedure pmcs2_txmsChange(Sender: TObject);
    procedure bzx_ckb_sfqyClick(Sender: TObject);
  private
    { Private declarations }
    iTag : integer ;
    cs_PackName : string ;//几号包装线名称
    isEdit: boolean ;//是否已经修改了
    procedure initSysparam ;
    procedure InitLeftPackLine ;//初始话包装线参数
    procedure ItemClick(Sender: TObject);
    procedure saveSysParam ;//保存系统参数
    

  public
    { Public declarations }
  end;

var
  frmXtcsSet: TfrmXtcsSet;

implementation

uses DBPackage,FuncPackage,unitDefine;

{$R *.dfm}

procedure TfrmXtcsSet.FormCreate(Sender: TObject);
begin
  InitUserOption ;
end;

procedure TfrmXtcsSet.btnCloseClick(Sender: TObject);
begin
  close ;
end;

procedure TfrmXtcsSet.FormShow(Sender: TObject);
begin
 //读配置文件，这里就 不要 数据库取数了
  DM.OpenChannel(self.handle,datasource1,'select * from cux_9_om_wx_item_v order by item_number ');
  with datasource1.dataset do
  begin
     // ckb_qz_qypzxz.Checked :=true ;
    //  bzx_ckb_sfqy.Checked := vartostr(FieldValues['PCC_status'])='1' ;
      First;
      while not EOF do
      begin
        cb_pz_pzxz.Items.Add(trim(vartostr(FieldValues['item_name'])) );
        cb_pz_pzxz.Values.Add(trim(vartostr(FieldValues['item_name']))) ;
        next ;
      end;
  end;
  DM.FreeChannel(self.handle,datasource1 );
  cb_pz_pzxz.ItemIndex:=0 ;
  initSysparam;
  InitLeftPackLine ;
  isEdit:=false ;
end;

procedure TfrmXtcsSet.btnSaveClick(Sender: TObject);
begin
//先保存系统参数
{  //保存在配置文件，这里就不用了，预留着 ，以后开发参考
  for initi :=0 to self.ComponentCount-1 do
  begin
    if (self.Components[initi].ClassType=TRzSpinEdit) and
       ( (self.Components[initi] as TRzSpinEdit).Hint<>'') and
       (pos(','+(self.Components[initi] as TRzSpinEdit).Hint+',',c_SaveParam)>0) then
    begin
      cs_Code:=trim((self.Components[initi] as TRzSpinEdit).Hint) ;
      cs_Value:=vartostr((self.Components[initi] as TRzSpinEdit).Value) ;
      UpParam:='update tsys_xtcs set Cs_Value='+cs_Value +
                        ' where Cs_Code='+quotedstr(cs_Code) ;
      DM.ADOCnn.Execute('update tsys_xtcs set Cs_Value='+cs_Value +
                        ' where Cs_Code='+quotedstr(cs_Code))
    end;
  end ;
  }
  saveSysParam ;
  isEdit:=false ;
 // 下去设置包装线参数

end;

//初始化包装线参数  c_PackLineName
procedure TfrmXtcsSet.InitLeftPackLine;
var
  initi : integer ;
begin
  group_PackLine.Items.Clear;
  for initi :=0 to cstUsePkgLine-1 do
  begin
    group_PackLine.Items.Add  ;
    group_PackLine.Items[initi].Caption :='  '+inttostr(initi+1)+c_PackLineName ;
    group_PackLine.Items[initi].Tag :=initi ;
    group_PackLine.Items[initi].OnClick :=ItemClick ;
  end ;
  isEdit:=false ;
  group_PackLine.Items[0].Click;
end;


//动态创建Item的 Click事件
procedure TfrmXtcsSet.ItemClick(Sender: TObject);
var
  inifile:TIniFile;
begin
   //showmessage((sender as TRzgroupItem).Caption);
  if isEdit then
  begin
    if MessageBox(0,'当前数据已经修改，是否需要保存','数据变动',MB_YESNO+MB_DEFBUTTON2)=IDYES then
      btnSaveClick(sender);
  end;
  iTag:=(sender as TRzgroupItem).Tag  ;
  cs_PackName:=inttostr(iTag+1)+c_PackLineName ;
   //设置显示文字
  RzGroupBox1.Caption :=cs_PackName ;

   // 从配置文件中读取包装线的初始值
  {
  DM.OpenChannel(self.handle,datasource1,'select * from cux_9_om_wx_item_v where PCC_NAME='+inttostr(iTag+1));
  with datasource1.dataset do
  begin
      ckb_qz_qypzxz.Checked :=true ;
      bzx_ckb_sfqy.Checked := vartostr(FieldValues['PCC_status'])='1' ;
      cb_pz_pzxz.Text := trim(vartostr(FieldValues['PCC_CementName'])) ;
      bzx_cb_qydk.Text :=trim(vartostr(FieldValues['PCC_RoadNo'])) ;

  end;
  DM.FreeChannel(self.handle,datasource1 );
   //因为有初始值，所以还是 直接写具体名称算了    }

  inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename );
  try
    ckb_qz_qypzxz.Checked :=true ;//inifile.ReadBool(cs_PackName,'ckb_qz_qypzxz',false);
    cb_pz_pzxz.Text  :=inifile.ReadString(cs_PackName,'cb_pz_pzxz','P.C 32.5');
    cb_jsq_ckxz.Value :=inifile.ReadString(cs_PackName,'cb_jsq_ckxz',inttostr(iTag*4+1));
    bzx_ckb_sfqy.Checked :=inifile.ReadBool(cs_PackName,'bzx_ckb_sfqy',true);
    bzx_sedt_zdybdjg.Value :=inifile.ReadInteger(cs_PackName,'bzx_sedt_zdybdjg',30);
    bzx_cb_qydk.Value :=inifile.ReadString(cs_PackName,'bzx_cb_qydk','1#2#');
    pmj_cb_ckxz.Value :=inifile.ReadString(cs_PackName,'pmj_cb_ckxz',inttostr(iTag*4+2));
    pmj_edt_ccqh.Text :=inifile.ReadString(cs_PackName,'pmj_edt_ccqh',inttostr(iTag));

    edtSnph.Text:=inifile.ReadString(cs_PackName,'edtSnph','');
    edtSnph_Num.IntValue:=inifile.ReadInteger(cs_PackName,'edtSnph_Num',2300);
    edtShengNum.IntValue :=inifile.ReadInteger(cs_PackName,'Snph_ShengNum',2300);

    pmj_ccqnrS.Text:=inifile.ReadString(cs_PackName,'pmj_ccqnrS','');
    pmj_Code.Value:=inifile.ReadString(cs_PackName,'pmj_Code','0');
    pmj_ccqnrE.Text:=inifile.ReadString(cs_PackName,'pmj_ccqnrE','');
    pmjSfqy.Checked:=inifile.ReadBool(cs_PackName,'pmjSfqy',true);

    pmcs1_kzkxh.Value :=inifile.ReadString(cs_PackName,'pmcs1_kzkxh','BX-5E2');
    pmcs1_txms.Value :=inifile.ReadString(cs_PackName,'pmcs1_txms','串口');
    pmcs1_ck.Value :=inifile.ReadString(cs_PackName,'pmcs1_ck',inttostr(iTag*4+3));
    pmcs1_btl.Value :=inifile.ReadString(cs_PackName,'pmcs1_btl','57600');
    pmcs1_w.Value :=inifile.ReadInteger(cs_PackName,'pmcs1_w',128);
    pmcs1_h.Value :=inifile.ReadInteger(cs_PackName,'pmcs1_h',64);
    pmcs1_pm.Value :=inifile.ReadString(cs_PackName,'pmcs1_pm','单基色');
    pmcs1_ip.text:=inifile.ReadString(cs_PackName,'pmcs1_ip','192.168.2.199');
    pmcs1_duank.text:=inifile.ReadString(cs_PackName,'pmcs1_duank','5005');
    pmcs1_txmsChange(sender);
   {
    pmcs_2_kzkxh.Value :=inifile.ReadString(cs_PackName,'pmcs_2_kzkxh','BX-5E2');
    pmcs_2_txms.Value :=inifile.ReadString(cs_PackName,'pmcs_2_txms','串口');
    pmcs_2_ck.Value :=inifile.ReadString(cs_PackName,'pmcs_2_ck',inttostr(iTag*4+4));
    pmcs_2_btl.Value :=inifile.ReadString(cs_PackName,'pmcs_2_btl','57600');
    pmcs_2_w.Value :=inifile.ReadInteger(cs_PackName,'pmcs_2_w',128);
    pmcs_2_h.Value :=inifile.ReadInteger(cs_PackName,'pmcs_2_h',64);
    pmcs_2_pm.Value :=inifile.ReadString(cs_PackName,'pmcs_2_pm','单基色');
    pmcs_2_ip.text:=inifile.ReadString(cs_PackName,'pmcs_2_ip','192.168.2.199');
    pmcs_2_duank.text:=inifile.ReadString(cs_PackName,'pmcs_2_duank','5006');
          }
  finally
    inifile.Free;
  end;
  isEdit:=false ;

end;

procedure TfrmXtcsSet.initSysparam;
var
  initi : integer ;
begin
  //初始化串口 ,暂时不做 已选择的 不能选择，下次再做了
  cb_jsq_ckxz.Items.Clear ;
  cb_jsq_ckxz.Values.Clear ;
  pmj_cb_ckxz.Items.Clear ;
  pmj_cb_ckxz.Values.Clear ;
  pmcs1_ck.Items.Clear ;
  pmcs1_ck.Values.Clear ;
 // pmcs_2_ck.Items.Clear ;
 // pmcs_2_ck.Values.Clear ;
  dkq_ck.Items.Clear ;
  dkq_ck.Values.Clear ;
  for initi:=0 to ((cstUsePkgLine+1)*4)  do
  begin
    cb_jsq_ckxz.Items.Add('COM'+inttostr(initi+1))  ;
    cb_jsq_ckxz.Values.Add(inttostr(initi)) ;
    pmj_cb_ckxz.Items.Add('COM'+inttostr(initi+1)) ;
    pmj_cb_ckxz.Values.Add(inttostr(initi)) ;
    pmcs1_ck.Items.Add('COM'+inttostr(initi+1)) ;
    pmcs1_ck.Values.Add(inttostr(initi)) ;
   // pmcs_2_ck.Items.Add('COM'+inttostr(initi+1)) ;
   // pmcs_2_ck.Values.Add(inttostr(initi)) ;
    dkq_ck.Items.Add('COM'+inttostr(initi+1)) ;
    dkq_ck.Values.Add(inttostr(initi)) ;

  end ;

  sedtPreYjNumber.Value := cstPreYjNumber ;

  dkq_ck.Value :=cstDkqCk;
  dkq_btl.Value :=cstDkqBtl;
  dkq_cssksj.IntValue:=cstDkqCssksj ;

  AutoRefresh.IntValue:=cstAutoRefresh ;
  edtAutoRefreshNum.IntValue:= cstTimerNum ;
end;

procedure TfrmXtcsSet.saveSysParam;
var
  inifile:TIniFile;
  supsql,sfqy  : string ;
begin
  try
    inifile:=Tinifile.Create(extractfilepath(application.ExeName) + c_filename);
    with inifile do
    begin
      WriteInteger('Sys_Param','cstPreYjNumber',strtoint(floattostr(sedtPreYjNumber.Value)));
    //  WriteInteger('Sys_Param','cstWaitTime',strtoint(floattostr(sedtWaitTime.Value)));
    //  WriteInteger('Sys_Param','cstBackNumber',strtoint(floattostr(sedtBackNumber.Value)));
    //  WriteInteger('Sys_Param','cstPageViewpkgLine',strtoint(floattostr(sedtPageViewpkgLine.Value)));
      WriteString('Sys_Param','dkq_ck',dkq_ck.Value );
      WriteString('Sys_Param','dkq_btl',dkq_btl.Value );
      WriteInteger('Sys_Param','dkq_cssksj',strtoint(floattostr(dkq_cssksj.Value)));
   //   WriteString('Sys_Param','cstJsyPm',xtcsJSYPM.Value );
      WriteInteger('Sys_Param','AutoRefresh',AutoRefresh.IntValue) ;
      WriteInteger('Sys_Param','cstTimerNum',edtAutoRefreshNum.IntValue) ;

  //保存包装线参数
      WriteBool(cs_PackName,'ckb_qz_qypzxz',ckb_qz_qypzxz.Checked);
      WriteString(cs_PackName,'cb_pz_pzxz',cb_pz_pzxz.Text );
      WriteString(cs_PackName,'cb_jsq_ckxz',cb_jsq_ckxz.Value);
      WriteBool(cs_PackName,'bzx_ckb_sfqy',bzx_ckb_sfqy.Checked);
      WriteInteger(cs_PackName,'bzx_sedt_zdybdjg',strtoint(floattostr(bzx_sedt_zdybdjg.Value)));
      WriteString(cs_PackName,'bzx_cb_qydk',bzx_cb_qydk.Value);
      WriteString(cs_PackName,'edtSnph',trim(edtSnph.Text) );
      WriteInteger(cs_PackName,'edtSnph_Num',edtSnph_Num.IntValue );
      if edtShengNum.intValue=0 then
         WriteInteger(cs_PackName,'Snph_ShengNum',edtSnph_Num.IntValue )
      else
         WriteInteger(cs_PackName,'Snph_ShengNum',edtShengNum.IntValue );

      WriteString(cs_PackName,'pmj_cb_ckxz',pmj_cb_ckxz.Value);
      WriteString(cs_PackName,'pmj_edt_ccqh',trim(pmj_edt_ccqh.Text));
      WriteBool(cs_packname,'pmjSfqy',pmjsfqy.Checked );
      WriteString(cs_PackName,'pmj_ccqnrS',trim(pmj_ccqnrS.Text));
      WriteString(cs_PackName,'pmj_Code',pmj_Code.Value);
      WriteString(cs_PackName,'pmj_ccqnrE',trim(pmj_ccqnrE.Text));
      WriteString(cs_PackName,'pmcs1_kzkxh',pmcs1_kzkxh.Value);
      WriteString(cs_PackName,'pmcs1_txms',pmcs1_txms.Value);
      WriteString(cs_PackName,'pmcs1_ck',pmcs1_ck.Value);
      WriteString(cs_PackName,'pmcs1_btl',pmcs1_btl.Value);
      WriteInteger(cs_PackName,'pmcs1_w',pmcs1_w.IntValue);
      WriteInteger(cs_PackName,'pmcs1_h',pmcs1_h.IntValue);
      WriteString(cs_PackName,'pmcs1_pm',pmcs1_pm.Value);
      WriteString(cs_PackName,'pmcs1_ip',pmcs1_ip.text);
      WriteString(cs_PackName,'pmcs1_duank',pmcs1_duank.text);
     { WriteString(cs_PackName,'pmcs2_kzkxh',pmcs2_kzkxh.Value);
      WriteString(cs_PackName,'pmcs2_txms',pmcs2_txms.Value);
      WriteString(cs_PackName,'pmcs2_ck',pmcs2_ck.Value);
      WriteString(cs_PackName,'pmcs2_btl',pmcs2_btl.Value);
      WriteInteger(cs_PackName,'pmcs2_w',strtoint(floattostr(pmcs2_w.Value)));
      WriteInteger(cs_PackName,'pmcs2_h',strtoint(floattostr(pmcs2_h.Value)));
      WriteString(cs_PackName,'pmcs2_pm',pmcs2_pm.Value);
      WriteString(cs_PackName,'pmcs2_ip',pmcs2_ip.text);
      WriteString(cs_PackName,'pmcs2_duank',pmcs2_duank.text); }
      if bzx_ckb_sfqy.Checked then
        sfqy:='0'
      else
        sfqy:='1' ; //0启用，1不启用
      supsql:='update tsys_PackLineCement set item_name='+quotedstr(trim(cb_pz_pzxz.Text) )+
              ' ,sfQy='+sfqy +' where PackNo='+inttostr(iTag+1);
      Dm.ADOCnn.Execute(supsql) ;          
    end;
  finally
    inifile.Free;
  end;
end;

procedure TfrmXtcsSet.ckb_qz_qypzxzClick(Sender: TObject);
begin
  cb_pz_pzxz.Visible := ckb_qz_qypzxz.Checked ;
  isedit:=true ;
end;

procedure TfrmXtcsSet.ContentChange(Sender:TObject);
begin
  isEdit:=true ;
end;



procedure TfrmXtcsSet.pmcs1_txmsChange(Sender: TObject);
begin

  GroupBox10.Visible :=pmcs1_txms.ItemIndex=0 ;
  GroupBox1.Visible :=pmcs1_txms.ItemIndex=1 ;
end;

procedure TfrmXtcsSet.pmcs2_txmsChange(Sender: TObject);
begin
 { isEdit:=true ;
  GroupBox7.Visible :=pmcs2_txms.ItemIndex=0 ;
  GroupBox3.Visible :=pmcs2_txms.ItemIndex=1 ;
  }
end;

procedure TfrmXtcsSet.bzx_ckb_sfqyClick(Sender: TObject);
begin
  isEdit:=true;
  if bzx_ckb_sfqy.Checked then
  begin
    ckb_qz_qypzxz.Enabled :=true;
    ckb_qz_qypzxz.ReadOnly :=false ;
    cb_pz_pzxz.ReadOnly :=false ;
  end
  else
  begin
    ckb_qz_qypzxz.Checked :=false ;
    ckb_qz_qypzxz.ReadOnly :=true ;
    cb_pz_pzxz.ReadOnly :=true;

  end;
end;

end.
