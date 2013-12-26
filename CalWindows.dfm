object frmCalWindows: TfrmCalWindows
  Left = 135
  Top = 126
  Width = 1032
  Height = 746
  Caption = #27969#27700#32447#20135#21697#35745#25968#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pl1: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 719
    Align = alLeft
    Color = 8447623
    TabOrder = 0
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 333
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      Caption = '1# '#21253#35013#32447
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object but1Start: TButton
        Left = 248
        Top = 8
        Width = 73
        Height = 25
        Caption = '1'#21495#32447#21551#29992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = but1StartClick
      end
      object but1Stop: TButton
        Left = 24
        Top = 8
        Width = 73
        Height = 25
        Caption = '1'#21495#32447#20572#27490
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = but1StopClick
      end
    end
    object pnl_pzph1: TPanel
      Left = 1
      Top = 42
      Width = 333
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 46
        Top = 12
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #21697#31181#29260#21495' '
      end
      object pzph1: TRzEdit
        Left = 109
        Top = 6
        Width = 193
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object RzGroupBox1: TRzGroupBox
      Left = 4
      Top = 76
      Width = 327
      Height = 55
      Caption = #35745#25968#22120
      TabOrder = 2
      object tx1: TTorryButton
        Left = 265
        Top = 20
        Width = 19
        Height = 19
        BorderColor = clGray
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clGray
      end
      object Js1: TTorryButton
        Left = 298
        Top = 20
        Width = 19
        Height = 19
        BorderColor = clGray
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clLime
      end
      object Panel6: TPanel
        Left = 35
        Top = 17
        Width = 57
        Height = 25
        Caption = #36890#35759
        Color = 9763578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object jsqck1: TRzEdit
        Left = 99
        Top = 17
        Width = 153
        Height = 26
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object RzGroupBox2: TRzGroupBox
      Left = 4
      Top = 132
      Width = 327
      Height = 74
      TabOrder = 3
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 29
        Height = 39
        Caption = #24050#35013#25968#37327'('#21253') '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object ybzsl1: TRzEdit
        Left = 64
        Top = 7
        Width = 213
        Height = 66
        Text = '0'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -51
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object RzGroupBox3: TRzGroupBox
      Left = 4
      Top = 207
      Width = 327
      TabOrder = 4
      object Label3: TLabel
        Left = 6
        Top = 46
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #35013#36710#25968#37327' '
      end
      object Label4: TLabel
        Left = 6
        Top = 17
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #35013#36710#36710#29260' '
      end
      object Label5: TLabel
        Left = 128
        Top = 48
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #27700#27877#25209#21495' '
      end
      object Label15: TLabel
        Left = 28
        Top = 79
        Width = 30
        Height = 13
        AutoSize = False
        Caption = #36947#21475'  '
      end
      object Label16: TLabel
        Left = 152
        Top = 16
        Width = 32
        Height = 13
        AutoSize = False
        Caption = #21345#21495' '
      end
      object Label17: TLabel
        Left = 128
        Top = 80
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #21457#31080#32534#21495
      end
      object cph1: TRzEdit
        Left = 62
        Top = 12
        Width = 85
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object snpz1: TRzEdit
        Left = 185
        Top = 42
        Width = 138
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object Card1: TRzEdit
        Left = 185
        Top = 10
        Width = 138
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Num1: TRzNumericEdit
        Left = 62
        Top = 43
        Width = 48
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        DisplayFormat = ',0;(,0)'
      end
      object fpbh1: TRzEdit
        Left = 185
        Top = 75
        Width = 138
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dk1: TRzNumericEdit
        Left = 62
        Top = 74
        Width = 48
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Value = 1.000000000000000000
        DisplayFormat = ',0;(,0)'
      end
    end
    object RzGroupBox4: TRzGroupBox
      Left = 4
      Top = 313
      Width = 327
      Height = 120
      Caption = '1'#21495#21253#35013#32447#35013#36710#20449#24687
      Color = clSkyBlue
      TabOrder = 5
      object plist1: TETSListView
        Left = 5
        Top = 17
        Width = 319
        Height = 94
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Locked = False
        BorderNeed = False
        Columns = <
          item
            Caption = #24207#21495
          end
          item
            Alignment = taCenter
            Caption = #36710#29260#21495
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #21345#21495
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #36947#21475
            Width = 40
          end
          item
            Alignment = taCenter
            Caption = #21253#25968
          end
          item
            Alignment = taCenter
            Caption = #23458#25143#32534#30721
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = #27700#27877#25209#21495
            Width = 100
          end
          item
            Alignment = taCenter
            Caption = #24320#31080#26102#38388
            Width = 80
          end
          item
            Caption = #21457#36135#21333#21495
            Width = 60
          end
          item
            Alignment = taCenter
            Caption = #26159#21542#21047#21345
            Width = 80
          end>
      end
    end
    object RzGroupBox5: TRzGroupBox
      Left = 4
      Top = 435
      Width = 327
      Height = 110
      Caption = '1# '#21943#30721#26426
      Color = 15521237
      TabOrder = 6
      object pmj1_h: TTorryButton
        Left = 83
        Top = 16
        Width = 19
        Height = 19
        BorderColor = clRed
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clRed
      end
      object pmj1_l: TTorryButton
        Left = 124
        Top = 16
        Width = 19
        Height = 19
        BorderColor = clLime
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clLime
      end
      object Label6: TLabel
        Left = 30
        Top = 50
        Width = 72
        Height = 13
        AutoSize = False
        Caption = #24403#21069#23384#20648#22120' '
      end
      object Label7: TLabel
        Left = 41
        Top = 84
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #21943#30721#20869#23481' '
      end
      object pmj1ck: TRzEdit
        Left = 165
        Top = 14
        Width = 100
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object pmj1ccq: TRzEdit
        Left = 110
        Top = 44
        Width = 212
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object pmj1pmnr: TRzEdit
        Left = 110
        Top = 78
        Width = 212
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object jsq1: TMSComm
      Left = 120
      Top = 8
      Width = 32
      Height = 32
      OnComm = jsq1Comm
      ControlData = {
        2143341208000000ED030000ED03000001568A64000006000000010000040000
        00020000802500000000080000000000000000003F00000001000000}
    end
    object Memo1: TMemo
      Left = 3
      Top = 547
      Width = 328
      Height = 113
      Lines.Strings = (
        'Memo1')
      TabOrder = 8
    end
    object pmj1: TMSComm
      Left = 264
      Top = 445
      Width = 32
      Height = 32
      ControlData = {
        2143341208000000ED030000ED03000001568A64000006000000010000040000
        00020000802500000000080000000000000000003F00000001000000}
    end
  end
  object pl2: TPanel
    Left = 334
    Top = 0
    Width = 341
    Height = 712
    Color = 8447623
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 339
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      Caption = '2# '#21253#35013#32447
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object but2Stop: TButton
        Left = 32
        Top = 10
        Width = 69
        Height = 25
        Caption = '2'#21495#32447#20572#27490
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = but2StopClick
      end
      object but2Start: TButton
        Left = 248
        Top = 8
        Width = 71
        Height = 25
        Caption = '2'#21495#32447#21551#29992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = but2StartClick
      end
    end
    object pnl_pzph2: TPanel
      Left = 1
      Top = 42
      Width = 339
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label8: TLabel
        Left = 43
        Top = 12
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #21697#31181#29260#21495' '
      end
      object pzph2: TRzEdit
        Left = 107
        Top = 5
        Width = 193
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object RzGroupBox6: TRzGroupBox
      Left = 4
      Top = 76
      Width = 334
      Height = 54
      Caption = #35745#25968#22120
      TabOrder = 2
      object tx2: TTorryButton
        Left = 270
        Top = 20
        Width = 19
        Height = 19
        BorderColor = clGray
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clGray
      end
      object js2: TTorryButton
        Left = 303
        Top = 20
        Width = 19
        Height = 19
        BorderColor = clGray
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clLime
      end
      object Panel8: TPanel
        Left = 38
        Top = 16
        Width = 57
        Height = 25
        Caption = #36890#35759
        Color = 9763578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object jsqck2: TRzEdit
        Left = 102
        Top = 16
        Width = 153
        Height = 26
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object RzGroupBox7: TRzGroupBox
      Left = 4
      Top = 131
      Width = 334
      Height = 74
      TabOrder = 3
      object Label9: TLabel
        Left = 16
        Top = 24
        Width = 29
        Height = 39
        Caption = #24050#35013#25968#37327'('#21253') '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object ybzsl2: TRzEdit
        Left = 64
        Top = 7
        Width = 213
        Height = 66
        Text = '0'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -51
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object RzGroupBox10: TRzGroupBox
      Left = 3
      Top = 436
      Width = 334
      Height = 111
      Caption = '2# '#21943#30721#26426
      Color = 15521237
      TabOrder = 4
      object pmj2_h: TTorryButton
        Left = 94
        Top = 17
        Width = 19
        Height = 19
        BorderColor = clRed
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clRed
      end
      object pmj2_l: TTorryButton
        Left = 142
        Top = 17
        Width = 19
        Height = 19
        BorderColor = clLime
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clLime
      end
      object Label13: TLabel
        Left = 42
        Top = 50
        Width = 72
        Height = 13
        AutoSize = False
        Caption = #24403#21069#23384#20648#22120' '
      end
      object Label14: TLabel
        Left = 53
        Top = 84
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #21943#30721#20869#23481' '
      end
      object pmj2ck: TRzEdit
        Left = 184
        Top = 14
        Width = 100
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object pmj2ccq: TRzEdit
        Left = 122
        Top = 44
        Width = 208
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object pmj2pmnr: TRzEdit
        Left = 122
        Top = 78
        Width = 209
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object RzGroupBox8: TRzGroupBox
      Left = 4
      Top = 206
      Width = 334
      TabOrder = 5
      object Label10: TLabel
        Left = 8
        Top = 50
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #35013#36710#25968#37327' '
      end
      object Label11: TLabel
        Left = 8
        Top = 18
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #35013#36710#36710#29260' '
      end
      object Label12: TLabel
        Left = 142
        Top = 48
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #27700#27877#25209#21495
      end
      object Label18: TLabel
        Left = 7
        Top = 82
        Width = 43
        Height = 13
        AutoSize = False
        Caption = #36947#21475'  '
      end
      object Label19: TLabel
        Left = 164
        Top = 16
        Width = 33
        Height = 13
        AutoSize = False
        Caption = #21345#21495' '
      end
      object Label20: TLabel
        Left = 142
        Top = 80
        Width = 58
        Height = 13
        AutoSize = False
        Caption = #21457#31080#32534#21495' '
      end
      object cph2: TRzEdit
        Left = 67
        Top = 11
        Width = 92
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object snpz2: TRzEdit
        Left = 202
        Top = 42
        Width = 130
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object Card2: TRzEdit
        Left = 202
        Top = 10
        Width = 130
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Num2: TRzNumericEdit
        Left = 66
        Top = 43
        Width = 58
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        DisplayFormat = ',0;(,0)'
      end
      object fpbh2: TRzEdit
        Left = 202
        Top = 75
        Width = 130
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dk2: TRzNumericEdit
        Left = 66
        Top = 74
        Width = 59
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Value = 3.000000000000000000
        DisplayFormat = ',0;(,0)'
      end
    end
    object RzGroupBox9: TRzGroupBox
      Left = 4
      Top = 312
      Width = 334
      Height = 122
      Caption = '2'#21495#21253#35013#32447#35013#36710#20449#24687
      Color = clSkyBlue
      TabOrder = 6
      object plist2: TETSListView
        Left = 2
        Top = 17
        Width = 331
        Height = 94
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Locked = False
        BorderNeed = False
        Columns = <
          item
            Caption = #24207#21495
          end
          item
            Alignment = taCenter
            Caption = #36710#29260#21495
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #21345#21495
            Width = 88
          end
          item
            Alignment = taCenter
            Caption = #36947#21475
            Width = 40
          end
          item
            Caption = #21253#25968
          end
          item
            Alignment = taCenter
            Caption = #23458#25143#32534#30721
            Width = 70
          end
          item
            Alignment = taCenter
            Caption = #27700#27877#25209#21495
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #24320#31080#26102#38388
            Width = 70
          end
          item
            Caption = #21457#36135#21333#21495
            Width = 60
          end
          item
            Alignment = taCenter
            Caption = #26159#21542#21047#21345
            Width = 80
          end>
      end
    end
    object Memo2: TMemo
      Left = 3
      Top = 549
      Width = 334
      Height = 112
      Lines.Strings = (
        'Memo2')
      TabOrder = 7
    end
    object pmj2: TMSComm
      Left = 24
      Top = 472
      Width = 32
      Height = 32
      ControlData = {
        2143341208000000ED030000ED03000001568A64000006000000010000040000
        00020000802500000000080000000000000000003F00000001000000}
    end
    object jsq2: TMSComm
      Left = 80
      Top = 8
      Width = 32
      Height = 32
      OnComm = jsq2Comm
      ControlData = {
        2143341208000000ED030000ED03000001568A64000006000000010000040000
        00020000802500000000080000000000000000003F00000001000000}
    end
  end
  object DKQ_MSComm: TMSComm
    Left = 544
    Top = 8
    Width = 32
    Height = 32
    OnComm = DKQ_MSCommComm
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010000040000
      00020000802500000000080000000000000000003F00000001000000}
  end
  object pl3: TPanel
    Left = 676
    Top = 0
    Width = 338
    Height = 712
    Color = 8447623
    TabOrder = 3
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 336
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      Caption = '3# '#21253#35013#32447
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object but3Stop: TButton
        Left = 24
        Top = 10
        Width = 69
        Height = 25
        Caption = '3'#21495#32447#20572#27490
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = but3StopClick
      end
      object but3Start: TButton
        Left = 240
        Top = 8
        Width = 71
        Height = 25
        Caption = '3'#21495#32447#21551#29992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = but3StartClick
      end
    end
    object pnl_pzph3: TPanel
      Left = 1
      Top = 42
      Width = 336
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label21: TLabel
        Left = 43
        Top = 12
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #21697#31181#29260#21495' '
      end
      object pzph3: TRzEdit
        Left = 107
        Top = 5
        Width = 193
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object RzGroupBox11: TRzGroupBox
      Left = 4
      Top = 76
      Width = 331
      Height = 54
      Caption = #35745#25968#22120
      TabOrder = 2
      object tx3: TTorryButton
        Left = 270
        Top = 20
        Width = 19
        Height = 19
        BorderColor = clGray
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clGray
      end
      object js3: TTorryButton
        Left = 303
        Top = 20
        Width = 19
        Height = 19
        BorderColor = clGray
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clLime
      end
      object Panel10: TPanel
        Left = 38
        Top = 16
        Width = 57
        Height = 25
        Caption = #36890#35759
        Color = 9763578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object jsqck3: TRzEdit
        Left = 102
        Top = 16
        Width = 153
        Height = 26
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object RzGroupBox12: TRzGroupBox
      Left = 4
      Top = 131
      Width = 331
      Height = 74
      TabOrder = 3
      object Label22: TLabel
        Left = 16
        Top = 24
        Width = 29
        Height = 39
        Caption = #24050#35013#25968#37327'('#21253') '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object ybzsl3: TRzEdit
        Left = 64
        Top = 7
        Width = 213
        Height = 66
        Text = '0'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -51
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object RzGroupBox13: TRzGroupBox
      Left = 3
      Top = 436
      Width = 331
      Height = 111
      Caption = '3# '#21943#30721#26426
      Color = 15521237
      TabOrder = 4
      object pmj3_h: TTorryButton
        Left = 94
        Top = 17
        Width = 19
        Height = 19
        BorderColor = clRed
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clRed
      end
      object pmj3_l: TTorryButton
        Left = 142
        Top = 17
        Width = 19
        Height = 19
        BorderColor = clLime
        Space = 0
        Caption = ' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReflectionSize = 0
        color = clLime
      end
      object Label23: TLabel
        Left = 48
        Top = 50
        Width = 72
        Height = 13
        AutoSize = False
        Caption = #24403#21069#23384#20648#22120' '
      end
      object Label24: TLabel
        Left = 59
        Top = 84
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #21943#30721#20869#23481' '
      end
      object pmj3ck: TRzEdit
        Left = 184
        Top = 14
        Width = 100
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object pmj3ccq: TRzEdit
        Left = 128
        Top = 44
        Width = 200
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object pmj3pmnr: TRzEdit
        Left = 128
        Top = 78
        Width = 201
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object RzGroupBox14: TRzGroupBox
      Left = 4
      Top = 206
      Width = 331
      TabOrder = 5
      object Label25: TLabel
        Left = 8
        Top = 50
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #35013#36710#25968#37327' '
      end
      object Label26: TLabel
        Left = 8
        Top = 18
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #35013#36710#36710#29260' '
      end
      object Label27: TLabel
        Left = 139
        Top = 48
        Width = 57
        Height = 13
        AutoSize = False
        Caption = #27700#27877#25209#21495
      end
      object Label28: TLabel
        Left = 7
        Top = 82
        Width = 43
        Height = 13
        AutoSize = False
        Caption = #36947#21475'  '
      end
      object Label29: TLabel
        Left = 161
        Top = 16
        Width = 33
        Height = 13
        AutoSize = False
        Caption = #21345#21495' '
      end
      object Label30: TLabel
        Left = 139
        Top = 80
        Width = 58
        Height = 13
        AutoSize = False
        Caption = #21457#31080#32534#21495' '
      end
      object cph3: TRzEdit
        Left = 67
        Top = 11
        Width = 87
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object snpz3: TRzEdit
        Left = 199
        Top = 42
        Width = 130
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object Card3: TRzEdit
        Left = 199
        Top = 10
        Width = 130
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object Num3: TRzNumericEdit
        Left = 66
        Top = 43
        Width = 58
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        DisplayFormat = ',0;(,0)'
      end
      object fpbh3: TRzEdit
        Left = 199
        Top = 75
        Width = 130
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FocusColor = 11205113
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object dk3: TRzNumericEdit
        Left = 66
        Top = 74
        Width = 59
        Height = 22
        Color = clInfoBk
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Value = 5.000000000000000000
        DisplayFormat = ',0;(,0)'
      end
    end
    object RzGroupBox15: TRzGroupBox
      Left = 4
      Top = 312
      Width = 331
      Height = 122
      Caption = '3'#21495#21253#35013#32447#35013#36710#20449#24687
      Color = clSkyBlue
      TabOrder = 6
      object plist3: TETSListView
        Left = 2
        Top = 17
        Width = 327
        Height = 94
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Locked = False
        BorderNeed = False
        Columns = <
          item
            Caption = #24207#21495
          end
          item
            Alignment = taCenter
            Caption = #36710#29260#21495
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #21345#21495
            Width = 88
          end
          item
            Alignment = taCenter
            Caption = #36947#21475
            Width = 40
          end
          item
            Caption = #21253#25968
          end
          item
            Alignment = taCenter
            Caption = #23458#25143#32534#30721
            Width = 70
          end
          item
            Alignment = taCenter
            Caption = #27700#27877#25209#21495
            Width = 80
          end
          item
            Alignment = taCenter
            Caption = #24320#31080#26102#38388
            Width = 70
          end
          item
            Caption = #21457#36135#21333#21495
            Width = 60
          end
          item
            Alignment = taCenter
            Caption = #26159#21542#21047#21345
            Width = 80
          end>
      end
    end
    object Memo3: TMemo
      Left = 3
      Top = 549
      Width = 331
      Height = 112
      Lines.Strings = (
        'Memo3')
      TabOrder = 7
    end
    object pmj3: TMSComm
      Left = 24
      Top = 472
      Width = 32
      Height = 32
      ControlData = {
        2143341208000000ED030000ED03000001568A64000006000000010000040000
        00020000802500000000080000000000000000003F00000001000000}
    end
    object jsq3: TMSComm
      Left = 40
      Top = 32
      Width = 32
      Height = 32
      OnComm = jsq3Comm
      ControlData = {
        2143341208000000ED030000ED03000001568A64000006000000010000040000
        00020000802500000000080000000000000000003F00000001000000}
    end
  end
  object pnlXtcs: TPanel
    Left = 336
    Top = 40
    Width = 336
    Height = 351
    Color = 33023
    TabOrder = 4
    object gb_pzxz: TGroupBox
      Left = 3
      Top = 42
      Width = 330
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
      object cb_pz_pzxz: TRzComboBox
        Left = 64
        Top = 20
        Width = 201
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object gb_bzxcs: TGroupBox
      Left = 3
      Top = 94
      Width = 330
      Height = 113
      Caption = #21253#35013#32447#21442#25968
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      object Label31: TLabel
        Left = 14
        Top = 25
        Width = 155
        Height = 15
        AutoSize = False
        Caption = #21277#36947#19982#25203#36947#26102#38388#38388#38548'('#31186')'
      end
      object Label32: TLabel
        Left = 106
        Top = 53
        Width = 59
        Height = 15
        AutoSize = False
        Caption = #21551#29992#36947#21475
      end
      object Label33: TLabel
        Left = 66
        Top = 80
        Width = 100
        Height = 13
        AutoSize = False
        Caption = #35745#25968#22120#20018#21475#36873#25321
      end
      object bzx_sedt_zdybdjg: TRzSpinEdit
        Tag = 2
        Left = 170
        Top = 23
        Width = 89
        Height = 21
        Hint = 'StopAndTurnTime'
        Min = 1.000000000000000000
        Value = 1.000000000000000000
        TabOrder = 0
      end
      object bzx_cb_qydk: TRzComboBox
        Left = 170
        Top = 49
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = '1#2#'
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
        Left = 170
        Top = 76
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
    end
    object gb_pmjpz: TGroupBox
      Left = 3
      Top = 208
      Width = 330
      Height = 100
      Caption = #21943#30721#26426#37197#32622
      Color = clBtnFace
      ParentColor = False
      TabOrder = 2
      object Label34: TLabel
        Left = 15
        Top = 42
        Width = 61
        Height = 13
        AutoSize = False
        Caption = #20018#21475#36873#25321
      end
      object Label35: TLabel
        Left = 168
        Top = 41
        Width = 64
        Height = 13
        AutoSize = False
        Caption = #23384#20648#22120#21495' '
      end
      object Label36: TLabel
        Left = 5
        Top = 76
        Width = 60
        Height = 13
        AutoSize = False
        Caption = #21943#30721#20869#23481' '
      end
      object pmj_edt_ccqh: TRzEdit
        Left = 231
        Top = 39
        Width = 82
        Height = 21
        TabOrder = 0
      end
      object pmj_ccqnrS: TRzEdit
        Left = 62
        Top = 73
        Width = 69
        Height = 21
        TabOrder = 1
      end
      object pmj_cb_ckxz: TRzComboBox
        Left = 76
        Top = 39
        Width = 88
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
      object pmj_Code: TRzComboBox
        Left = 133
        Top = 72
        Width = 125
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = #23458#25143#20195#30721
        Items.Strings = (
          #26080
          #23458#25143#20195#30721
          #27700#27877#32534#21495
          #23458#25143#20195#30721'+'#27700#27877#32534#21495)
        ItemIndex = 1
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
      object pmj_ccqnrE: TRzEdit
        Left = 258
        Top = 72
        Width = 65
        Height = 21
        TabOrder = 4
      end
      object pmjSfqy: TCheckBox
        Left = 74
        Top = 10
        Width = 138
        Height = 17
        Caption = #26159#21542#38656#35201#21551#29992#21943#30721
        TabOrder = 5
      end
    end
    object butbxzOK: TButton
      Left = 216
      Top = 315
      Width = 71
      Height = 25
      Caption = #30830#23450#21551#29992
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = butbxzOKClick
    end
    object butbxzCancel: TButton
      Left = 88
      Top = 315
      Width = 71
      Height = 25
      Caption = #21462#28040
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = butbxzCancelClick
    end
    object Panel1: TPanel
      Left = 1
      Top = 4
      Width = 334
      Height = 33
      BevelOuter = bvNone
      Caption = 'X'#21495#21253#35013#32447#21442#25968#35774#32622
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object DataSource1: TDataSource
    Left = 152
    Top = 552
  end
  object ds_getNextV: TDataSource
    Left = 240
    Top = 552
  end
  object ds_getNextV2: TDataSource
    Left = 408
    Top = 552
  end
  object ds_AutoRefresh: TDataSource
    Left = 72
    Top = 552
  end
  object ds_Check: TDataSource
    Left = 72
    Top = 600
  end
  object tXhSf1: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tXhSf1Timer
    Left = 64
    Top = 352
  end
  object tXhSf2: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tXhSf2Timer
    Left = 120
    Top = 352
  end
  object tXhSf3: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tXhSf3Timer
    Left = 184
    Top = 352
  end
  object tStartTimer: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tStartTimerTimer
    Left = 565
    Top = 576
  end
  object tAutorRefresh: TTimer
    Enabled = False
    Interval = 120000
    OnTimer = tAutorRefreshTimer
    Left = 493
    Top = 568
  end
  object ds_auto: TDataSource
    Left = 152
    Top = 608
  end
end
