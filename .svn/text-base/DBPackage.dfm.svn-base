object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 202
  Top = 190
  Height = 439
  Width = 373
  object ADOCnn: TADOConnection
    CommandTimeout = 120
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password=BIRD_SYS;Data Source=E' +
      ':\DongRui_Soft\single_SendPrice\bird_s.mdb;Persist Security Info' +
      '=True'
    ConnectionTimeout = 60
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 60
    Top = 32
  end
  object ADOCmd: TADOCommand
    CommandType = cmdStoredProc
    Connection = ADOCnn
    ExecuteOptions = [eoExecuteNoRecords]
    Parameters = <>
    Left = 176
    Top = 96
  end
  object dqSequence: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 68
    Top = 308
  end
  object DataLinks: TDataLinks
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 176
    Top = 32
  end
  object ADOQueryBZX: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 220
    Top = 228
  end
  object aq_Temp: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 60
    Top = 236
  end
  object ADOQueryLoadData: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 156
    Top = 172
  end
end
