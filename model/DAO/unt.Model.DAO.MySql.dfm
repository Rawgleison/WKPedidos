object dmConnection: TdmConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 355
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Password=30121055'
      'Server=localhost'
      'User_Name=wktechnology'
      'UseSSL=False'
      'MonitorBy=Remote')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 112
    Top = 120
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'D:\Projetos\Delphi\WKPedidos\Win32\Debug\app\libmysql.dll'
    Left = 224
    Top = 96
  end
  object FDMoniRemoteClientLink1: TFDMoniRemoteClientLink
    Tracing = True
    Left = 208
    Top = 160
  end
end
