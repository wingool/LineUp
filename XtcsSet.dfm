object frmXtcsSet: TfrmXtcsSet
  Left = 185
  Top = 119
  Width = 698
  Height = 631
  BorderIcons = [biSystemMenu]
  Caption = #31995#32479#21442#25968#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gb_Xtcs: TGroupBox
    Left = 0
    Top = 0
    Width = 690
    Height = 105
    Align = alTop
    Caption = #31995#32479#21442#25968
    TabOrder = 0
    object Label3: TLabel
      Left = 555
      Top = 80
      Width = 129
      Height = 13
      AutoSize = False
      Caption = #26410#21047#21345#31561#20505#20960#20010#21047#26032' '
      Visible = False
    end
    object Label15: TLabel
      Left = 366
      Top = 27
      Width = 114
      Height = 13
      AutoSize = False
      Caption = #23450#26102#33258#21160#21047#26032#25968#25454' '
    end
    object Label19: TLabel
      Left = 544
      Top = 27
      Width = 31
      Height = 13
      AutoSize = False
      Caption = #20998#38047
    end
    object Label1: TLabel
      Left = 396
      Top = 65
      Width = 87
      Height = 13
      AutoSize = False
      Caption = #25552#21069#25253#35686#25968#37327' '
    end
    object GroupBox2: TGroupBox
      Left = 45
      Top = 16
      Width = 295
      Height = 77
      Caption = #35835#21345#22120#35774#32622
      TabOrder = 0
      object Label30: TLabel
        Left = 55
        Top = 17
        Width = 27
        Height = 13
        AutoSize = False
        Caption = #20018#21475' '
      end
      object Label31: TLabel
        Left = 161
        Top = 17
        Width = 45
        Height = 13
        AutoSize = False
        Caption = #27874#29305#29575' '
      end
      object Label34: TLabel
        Left = 4
        Top = 49
        Width = 116
        Height = 13
        AutoSize = False
        Caption = #36229#26102#21047#21345#31561#20505#26102#38388'  '
      end
      object Label4: TLabel
        Left = 196
        Top = 49
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #31186
      end
      object dkq_ck: TRzComboBox
        Left = 87
        Top = 14
        Width = 70
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = ContentChange
      end
      object dkq_btl: TRzComboBox
        Left = 207
        Top = 14
        Width = 72
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = '288000'
        OnChange = ContentChange
        Items.Strings = (
          '115200'
          '288000')
        ItemIndex = 1
        Values.Strings = (
          '115200'
          '288000')
      end
      object dkq_cssksj: TRzNumericEdit
        Left = 123
        Top = 46
        Width = 65
        Height = 21
        TabOrder = 2
        Max = 600.000000000000000000
        Min = 120.000000000000000000
        Value = 120.000000000000000000
        DisplayFormat = ',0;(,0)'
      end
    end
    object AutoRefresh: TRzSpinEdit
      Tag = 1
      Left = 481
      Top = 23
      Width = 58
      Height = 21
      Hint = '0'#34920#31034#19981#21551#29992#33258#21160#21047#26032
      Max = 30.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = ContentChange
    end
    object edtAutoRefreshNum: TRzSpinEdit
      Tag = 3
      Left = 618
      Top = 52
      Width = 60
      Height = 21
      Hint = 'AutoRefreshNum'
      Max = 10.000000000000000000
      Min = 2.000000000000000000
      Value = 2.000000000000000000
      TabOrder = 2
      Visible = False
      OnChange = ContentChange
    end
    object sedtPreYjNumber: TRzSpinEdit
      Tag = 1
      Left = 482
      Top = 61
      Width = 61
      Height = 21
      Hint = 'PreYjNumber'
      Max = 50.000000000000000000
      Min = 10.000000000000000000
      Value = 10.000000000000000000
      TabOrder = 3
      OnChange = ContentChange
    end
  end
  object gb_PkgLine: TGroupBox
    Left = 0
    Top = 105
    Width = 690
    Height = 454
    Align = alClient
    TabOrder = 1
    object RzSplitter1: TRzSplitter
      Left = 2
      Top = 15
      Width = 686
      Height = 437
      Position = 141
      Percent = 21
      HotSpotVisible = True
      SplitterWidth = 7
      Align = alClient
      TabOrder = 0
      BarSize = (
        141
        0
        148
        437)
      UpperLeftControls = (
        RzGroupBar1)
      LowerRightControls = (
        RzGroupBox1)
      object RzGroupBar1: TRzGroupBar
        Left = 0
        Top = 0
        Width = 141
        Height = 437
        GradientColorStart = clBtnFace
        GradientColorStop = clBtnShadow
        GroupBorderSize = 8
        Align = alClient
        Color = clBtnShadow
        ParentColor = False
        TabOrder = 0
        object group_PackLine: TRzGroup
          Items = <
            item
              Caption = 'Item1'
            end
            item
              Caption = 'Item2'
            end>
          ItemHotColor = clGradientActiveCaption
          Opened = True
          OpenedHeight = 67
          SelectionColor = clRed
          Caption = #21253#35013#32447#21442#25968#35774#32622
          ParentColor = False
        end
      end
      object RzGroupBox1: TRzGroupBox
        Left = 0
        Top = 0
        Width = 538
        Height = 437
        Align = alClient
        Caption = #21253#35013#32447#35774#32622
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 14
          Width = 536
          Height = 51
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object gb_pzxz: TGroupBox
            Left = 24
            Top = 0
            Width = 480
            Height = 51
            Caption = #21697#31181#36873#25321
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            object ckb_qz_qypzxz: TRzCheckBox
              Left = 104
              Top = 24
              Width = 97
              Height = 17
              Caption = #21551#29992#21697#31181#36873#25321
              Checked = True
              ReadOnly = True
              State = cbChecked
              TabOrder = 0
              Visible = False
            end
            object cb_pz_pzxz: TRzComboBox
              Left = 48
              Top = 20
              Width = 201
              Height = 21
              ItemHeight = 13
              TabOrder = 1
            end
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 65
          Width = 536
          Height = 219
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object gb_pmjpz: TGroupBox
            Left = 24
            Top = 116
            Width = 480
            Height = 100
            Caption = #21943#30721#26426#37197#32622
            TabOrder = 0
            object Label12: TLabel
              Left = 39
              Top = 42
              Width = 61
              Height = 13
              AutoSize = False
              Caption = #20018#21475#36873#25321
            end
            object Label13: TLabel
              Left = 207
              Top = 41
              Width = 64
              Height = 13
              AutoSize = False
              Caption = #23384#20648#22120#21495' '
            end
            object Label14: TLabel
              Left = 27
              Top = 76
              Width = 76
              Height = 13
              AutoSize = False
              Caption = #23384#20648#22120#20869#23481' '
            end
            object pmj_edt_ccqh: TRzEdit
              Left = 267
              Top = 39
              Width = 121
              Height = 21
              TabOrder = 0
              OnChange = ContentChange
            end
            object pmj_ccqnrS: TRzEdit
              Left = 99
              Top = 73
              Width = 68
              Height = 21
              TabOrder = 1
              OnChange = ContentChange
            end
            object pmj_cb_ckxz: TRzComboBox
              Left = 100
              Top = 39
              Width = 101
              Height = 21
              ItemHeight = 13
              TabOrder = 2
              OnChange = ContentChange
            end
            object pmj_Code: TRzComboBox
              Left = 171
              Top = 72
              Width = 120
              Height = 21
              ItemHeight = 13
              TabOrder = 3
              Text = #25209#21495'+'#36816#33267#22320#20195#30721
              OnChange = ContentChange
              Items.Strings = (
                #26080
                #25209#21495
                #36816#33267#22320#20195#30721
                #25209#21495'+'#36816#33267#22320#20195#30721
                #36816#33267#22320#20195#30721'+'#25209#21495)
              ItemIndex = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4')
            end
            object pmj_ccqnrE: TRzEdit
              Left = 291
              Top = 72
              Width = 68
              Height = 21
              TabOrder = 4
              OnChange = ContentChange
            end
            object pmjSfqy: TCheckBox
              Left = 74
              Top = 10
              Width = 138
              Height = 17
              Caption = #26159#21542#38656#35201#21551#29992#21943#30721
              TabOrder = 5
              OnClick = ContentChange
            end
          end
          object gb_bzxcs: TGroupBox
            Left = 24
            Top = 0
            Width = 480
            Height = 113
            Caption = #21253#35013#32447#21442#25968
            TabOrder = 1
            object pnl_bzxcs: TPanel
              Left = 2
              Top = 26
              Width = 476
              Height = 85
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object Label16: TLabel
                Left = 13
                Top = 9
                Width = 155
                Height = 15
                AutoSize = False
                Caption = #21277#36947#19982#25203#36947#26102#38388#38388#38548'('#31186')'
              end
              object Label17: TLabel
                Left = 105
                Top = 37
                Width = 59
                Height = 15
                AutoSize = False
                Caption = #21551#29992#36947#21475
              end
              object Label7: TLabel
                Left = 65
                Top = 64
                Width = 100
                Height = 13
                AutoSize = False
                Caption = #35745#25968#22120#20018#21475#36873#25321
              end
              object Label2: TLabel
                Left = 310
                Top = 11
                Width = 57
                Height = 13
                AutoSize = False
                Caption = #27700#27877#25209#21495' '
              end
              object Label5: TLabel
                Left = 311
                Top = 36
                Width = 59
                Height = 13
                AutoSize = False
                Caption = #25209#21495#25968#37327' '
              end
              object Label6: TLabel
                Left = 311
                Top = 62
                Width = 59
                Height = 13
                AutoSize = False
                Caption = #20313#19979#25968#37327' '
              end
              object Label8: TLabel
                Left = 455
                Top = 36
                Width = 15
                Height = 13
                AutoSize = False
                Caption = #21253' '
              end
              object Label9: TLabel
                Left = 456
                Top = 62
                Width = 15
                Height = 13
                AutoSize = False
                Caption = #21253' '
              end
              object bzx_sedt_zdybdjg: TRzSpinEdit
                Tag = 2
                Left = 169
                Top = 7
                Width = 89
                Height = 21
                Hint = 'StopAndTurnTime'
                Min = 1.000000000000000000
                Value = 1.000000000000000000
                TabOrder = 0
                OnChange = ContentChange
              end
              object bzx_cb_qydk: TRzComboBox
                Left = 169
                Top = 33
                Width = 121
                Height = 21
                ItemHeight = 13
                TabOrder = 1
                Text = '1#2#'
                OnChange = ContentChange
                Items.Strings = (
                  '1#'
                  '2#'
                  '1#2#')
                ItemIndex = 2
                Values.Strings = (
                  '1#'
                  '2#'
                  '1#2#')
              end
              object cb_jsq_ckxz: TRzComboBox
                Left = 169
                Top = 60
                Width = 120
                Height = 21
                ItemHeight = 13
                TabOrder = 2
                OnChange = ContentChange
              end
              object edtSnph: TRzEdit
                Left = 371
                Top = 7
                Width = 101
                Height = 21
                TabOrder = 3
                OnChange = ContentChange
              end
              object edtSnph_Num: TRzNumericEdit
                Left = 371
                Top = 33
                Width = 81
                Height = 21
                TabOrder = 4
                OnChange = ContentChange
                DisplayFormat = ',0;(,0)'
              end
              object edtShengNum: TRzNumericEdit
                Left = 371
                Top = 59
                Width = 81
                Height = 21
                TabOrder = 5
                OnChange = ContentChange
                DisplayFormat = ',0;(,0)'
              end
            end
            object bzx_ckb_sfqy: TRzCheckBox
              Left = 152
              Top = 8
              Width = 137
              Height = 17
              Caption = #35813#21253#35013#32447#26159#21542#21551#29992
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = bzx_ckb_sfqyClick
            end
          end
        end
        object gb_pmcs: TGroupBox
          Left = 1
          Top = 284
          Width = 536
          Height = 152
          Align = alClient
          BiDiMode = bdLeftToRight
          Caption = 'LED'#23631#24149#21442#25968#35774#32622' '
          Color = clBtnFace
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          object Label21: TLabel
            Left = 96
            Top = 22
            Width = 74
            Height = 13
            AutoSize = False
            Caption = #25511#21046#21345#22411#21495' '
          end
          object Label22: TLabel
            Left = 269
            Top = 22
            Width = 61
            Height = 13
            AutoSize = False
            Caption = #36890#35759#27169#24335
          end
          object GroupBox9: TGroupBox
            Left = 26
            Top = 96
            Width = 431
            Height = 50
            TabOrder = 0
            object Label27: TLabel
              Left = 58
              Top = 21
              Width = 27
              Height = 13
              AutoSize = False
              Caption = #23485#24230' '
            end
            object Label28: TLabel
              Left = 162
              Top = 21
              Width = 27
              Height = 13
              AutoSize = False
              Caption = #39640#24230' '
            end
            object Label29: TLabel
              Left = 262
              Top = 21
              Width = 30
              Height = 13
              AutoSize = False
              Caption = #23631#24149'  '
              Visible = False
            end
            object pmcs1_w: TRzNumericEdit
              Left = 90
              Top = 18
              Width = 49
              Height = 21
              TabOrder = 0
              OnChange = ContentChange
              DisplayFormat = ',0;(,0)'
            end
            object pmcs1_h: TRzNumericEdit
              Left = 194
              Top = 19
              Width = 49
              Height = 21
              TabOrder = 1
              OnChange = ContentChange
              DisplayFormat = ',0;(,0)'
            end
            object pmcs1_pm: TRzComboBox
              Left = 290
              Top = 17
              Width = 95
              Height = 21
              ItemHeight = 13
              TabOrder = 2
              Text = #21333#22522#33394
              Visible = False
              Items.Strings = (
                #21333#22522#33394)
              ItemIndex = 0
              Values.Strings = (
                #21333#22522#33394)
            end
          end
          object pmcs1_kzkxh: TRzComboBox
            Left = 168
            Top = 18
            Width = 81
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            Text = 'BX-5E2'
            OnChange = ContentChange
            Items.Strings = (
              'BX-5E1'
              'BX-5E2'
              'BX-5E3')
            ItemIndex = 1
            Values.Strings = (
              'BX-5E1'
              'BX-5E2'
              'BX-5E3')
          end
          object pmcs1_txms: TRzComboBox
            Left = 326
            Top = 18
            Width = 85
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            Text = #20018#21475
            OnChange = pmcs1_txmsChange
            Items.Strings = (
              #20018#21475
              #32593#21475)
            ItemIndex = 0
            Values.Strings = (
              #20018#21475
              #32593#21475)
          end
          object GroupBox1: TGroupBox
            Left = 89
            Top = 48
            Width = 338
            Height = 46
            Caption = #32593#21475#35774#32622
            TabOrder = 3
            Visible = False
            object Label33: TLabel
              Left = 10
              Top = 20
              Width = 42
              Height = 13
              AutoSize = False
              Caption = 'IP'#22320#22336' '
            end
            object Label35: TLabel
              Left = 181
              Top = 20
              Width = 37
              Height = 13
              AutoSize = False
              Caption = #31471#21475' '
            end
            object pmcs1_duank: TRzNumericEdit
              Left = 217
              Top = 16
              Width = 73
              Height = 21
              TabOrder = 0
              OnChange = ContentChange
              DisplayFormat = ',0;(,0)'
            end
            object pmcs1_ip: TRzEdit
              Left = 51
              Top = 17
              Width = 121
              Height = 21
              Text = '192.168.2.199'
              TabOrder = 1
              OnChange = ContentChange
            end
          end
          object GroupBox10: TGroupBox
            Left = 89
            Top = 48
            Width = 338
            Height = 46
            Caption = #20018#21475#35774#32622
            TabOrder = 4
            object Label25: TLabel
              Left = 24
              Top = 20
              Width = 27
              Height = 13
              AutoSize = False
              Caption = #20018#21475' '
            end
            object Label26: TLabel
              Left = 164
              Top = 20
              Width = 46
              Height = 13
              AutoSize = False
              Caption = #27874#29305#29575' '
            end
            object pmcs1_ck: TRzComboBox
              Left = 50
              Top = 17
              Width = 105
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              OnChange = ContentChange
            end
            object pmcs1_btl: TRzComboBox
              Left = 208
              Top = 17
              Width = 95
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              Text = '57600'
              OnChange = ContentChange
              Items.Strings = (
                '9600'
                '19200'
                '57600')
              ItemIndex = 2
              Values.Strings = (
                '9600'
                '19200'
                '57600')
            end
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 559
    Width = 690
    Height = 38
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      690
      38)
    object btnSave: TRzBitBtn
      Left = 439
      Top = 4
      Width = 58
      Anchors = [akTop, akRight]
      Caption = #20445#23384
      HotTrack = True
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnClose: TRzBitBtn
      Left = 532
      Top = 4
      Width = 61
      Anchors = [akTop, akRight]
      Caption = #36820#22238' '
      HotTrack = True
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
  object DataSource1: TDataSource
    Left = 280
    Top = 64
  end
end
