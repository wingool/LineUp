object frmMain: TfrmMain
  Left = 285
  Top = 204
  Width = 696
  Height = 480
  Caption = #21326#28070#27494#23459#29289#27969#31649#25511#31995#32479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 688
    Height = 20
    Panels = <
      item
        Text = ' '#25805#20316#21592
        Width = 120
      end
      item
        Text = #25552#31034
        Width = 120
      end
      item
        Alignment = taCenter
        Text = #26477#24030#23041#22763#24503#21943#30721#25216#26415#26377#38480#20844#21496
        Width = 280
      end
      item
        Alignment = taCenter
        Width = 70
      end
      item
        Alignment = taCenter
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        Text = #26085#26399
        Width = 90
      end>
  end
  object pnlList: TPanel3D
    Left = 0
    Top = 0
    Width = 688
    Height = 414
    Style = pdNone
    LightColor = clBtnHighlight
    ShadowColor = clBtnShadow
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 220
    Top = 96
    object menuFile: TMenuItem
      Caption = #25991#20214'(&F)'
      object menuModifyPassword: TMenuItem
        Caption = #20462#25913#21475#20196
        GroupIndex = 21
        Visible = False
      end
      object Ns8: TMenuItem
        Caption = '-'
        Enabled = False
        GroupIndex = 23
      end
      object N6: TMenuItem
        Caption = #27880#38144'...'
        GroupIndex = 25
        ShortCut = 117
      end
      object menuExit: TMenuItem
        Caption = #36864#20986#31995#32479
        GroupIndex = 25
        ShortCut = 121
        OnClick = menuExitClick
      end
    end
    object N1: TMenuItem
      Caption = '|'
      GroupIndex = 11
    end
    object miImportsource: TMenuItem
      Caption = #21442#25968#35774#32622
      GroupIndex = 11
      object mXtcs: TMenuItem
        Caption = #21442#25968#35774#32622
        OnClick = mXtcsClick
      end
    end
    object N5: TMenuItem
      Caption = '|'
      GroupIndex = 11
    end
    object N12: TMenuItem
      Caption = #26174#31034#35745#25968#30028#38754
      GroupIndex = 11
      object CalWindow: TMenuItem
        Caption = #26174#31034#35745#25968#30028#38754
        OnClick = CalWindowClick
      end
      object est1: TMenuItem
        Caption = 'Test'
        Visible = False
      end
    end
    object menuHelp: TMenuItem
      Caption = #31995#32479#24110#21161'(&H)'
      GroupIndex = 11
      Visible = False
      object MenuRuleQuery: TMenuItem
        Caption = #27861#35268#26597#35810
        GroupIndex = 1
        ShortCut = 113
      end
      object menuUseSys: TMenuItem
        Caption = #20351#29992#24110#21161
        GroupIndex = 2
        ShortCut = 112
      end
      object N11: TMenuItem
        Caption = '-'
        GroupIndex = 3
      end
      object menuAbout: TMenuItem
        Caption = #20851#20110#31995#32479'...'
        GroupIndex = 4
      end
    end
  end
  object ds_1: TDataSource
    Left = 160
    Top = 112
  end
end
