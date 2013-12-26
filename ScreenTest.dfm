object frmScreenTest: TfrmScreenTest
  Left = 190
  Top = 225
  Width = 415
  Height = 295
  Caption = 'frmScreenTest'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AddScrn: TButton
    Left = 296
    Top = 32
    Width = 75
    Height = 25
    Caption = 'AddScrn'
    TabOrder = 0
    OnClick = AddScrnClick
  end
  object AddDynamic: TButton
    Left = 296
    Top = 104
    Width = 75
    Height = 25
    Caption = 'AddDynamic'
    TabOrder = 1
    OnClick = AddDynamicClick
  end
  object OutPut: TButton
    Left = 296
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OutPut'
    TabOrder = 2
    OnClick = OutPutClick
  end
  object Button1: TButton
    Left = 40
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Open: TButton
    Left = 40
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 4
    OnClick = OpenClick
  end
end
