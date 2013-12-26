object frmConnect: TfrmConnect
  Left = 473
  Top = 346
  Cursor = crHourGlass
  BorderStyle = bsNone
  Caption = #26381#21153#22120#36830#25509
  ClientHeight = 48
  ClientWidth = 238
  Color = 10856811
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
  object Label1: TLabel
    Left = 60
    Top = 18
    Width = 177
    Height = 17
    AutoSize = False
    Caption = #27491#22312#36830#25509#25968#25454#24211','#35831#31245#20505'......'
    Color = 10856811
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 136
    Top = 0
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Label3: TLabel
    Left = 144
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label3'
    Visible = False
  end
  object Animate1: TAnimate
    Left = 2
    Top = 3
    Width = 41
    Height = 41
    Repetitions = 4000
    StopFrame = 8
  end
  object ListBox1: TListBox
    Left = 176
    Top = 0
    Width = 57
    Height = 17
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
end
