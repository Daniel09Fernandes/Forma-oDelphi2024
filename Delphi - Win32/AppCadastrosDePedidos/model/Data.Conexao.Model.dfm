object DmConexaoModel: TDmConexaoModel
  OnDestroy = DataModuleDestroy
  Height = 192
  Width = 269
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=D:\Fontes\Forma'#231#227'oDelphi2024-git\Delphi - Win32\AppCada' +
        'strosDePedidos\assets\db\AppDb.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 168
    Top = 56
  end
end
