object Form2: TForm2
  Left = 677
  Top = 94
  Caption = 'Form2'
  ClientHeight = 192
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 35
    Width = 113
    Height = 25
    Caption = #1042#1099#1074#1086#1076' '#1087#1077#1088#1089#1086#1085#1072#1078#1077#1081
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 90
    Height = 21
    TabOrder = 1
    Text = #1040#1082#1082#1072#1091#1085#1090
  end
  object StringGrid1: TStringGrid
    Left = 127
    Top = 8
    Width = 346
    Height = 120
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssVertical
    TabOrder = 2
    ColWidths = (
      48
      68
      85
      73
      39)
  end
  object Button2: TButton
    Left = 8
    Top = 159
    Width = 75
    Height = 25
    Caption = #1053#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 134
    Width = 464
    Height = 21
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'Message..'
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=199105;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=RF_UserGU;Data Source=WIN-M91ALDIAS0L\' +
      'SERV'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 48
    Top = 72
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 72
  end
  object TcpClient1: TTcpClient
    RemoteHost = '127.0.0.1'
    RemotePort = '28000'
    OnReceive = TcpClient1Receive
    Left = 104
    Top = 160
  end
end
