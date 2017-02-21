object Form1: TForm1
  Left = 301
  Top = 95
  Caption = 'Form1'
  ClientHeight = 234
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 356
    Top = 215
    Width = 12
    Height = 14
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 377
    Height = 213
    ActivePage = TabSheet4
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Killin Floor'
      object Label1: TLabel
        Left = 24
        Top = 23
        Width = 62
        Height = 19
        Caption = 'Status..'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 24
        Top = 56
        Width = 69
        Height = 16
        Caption = 'RAM USAGE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Button1: TButton
        Left = 209
        Top = 3
        Width = 121
        Height = 62
        Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' KF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 209
        Top = 79
        Width = 121
        Height = 26
        Caption = 'STOP Server'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button2Click
      end
      object Edit1: TEdit
        Left = 3
        Top = 112
        Width = 145
        Height = 21
        TabOrder = 2
        Text = 'C:\Users\'#1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088'\Desktop\KFS\KF\system\ucc.exe'
      end
      object Edit2: TEdit
        Left = 3
        Top = 139
        Width = 339
        Height = 21
        TabOrder = 3
        Text = 
          'server KF-EvilSantasLair.rom?game=KFmod.KFGameType?VACSecured=tr' +
          'ue?MaxPlayers=6'
      end
      object Button9: TButton
        Left = 154
        Top = 111
        Width = 55
        Height = 25
        Caption = #1055#1072#1087#1082#1072
        TabOrder = 4
        OnClick = Button9Click
      end
      object Button19: TButton
        Left = 275
        Top = 117
        Width = 54
        Height = 19
        Caption = 'Show'
        TabOrder = 5
        OnClick = Button19Click
      end
      object Button18: TButton
        Left = 215
        Top = 117
        Width = 54
        Height = 19
        Caption = 'Hide'
        TabOrder = 6
        OnClick = Button18Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'RF Online'
      ImageIndex = 1
      object Label7: TLabel
        Left = 135
        Top = 83
        Width = 31
        Height = 13
        Caption = 'Label7'
      end
      object Label8: TLabel
        Left = 135
        Top = 52
        Width = 31
        Height = 13
        Caption = 'Label8'
      end
      object Label9: TLabel
        Left = 135
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Label9'
      end
      object Button3: TButton
        Left = 0
        Top = 16
        Width = 73
        Height = 25
        Caption = 'Start Account'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 0
        Top = 47
        Width = 73
        Height = 25
        Caption = 'Start Login'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 0
        Top = 78
        Width = 73
        Height = 25
        Caption = 'Start Zone'
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 79
        Top = 16
        Width = 50
        Height = 25
        Caption = 'Stop A'
        TabOrder = 3
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 79
        Top = 47
        Width = 50
        Height = 25
        Caption = 'Stop L'
        TabOrder = 4
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 79
        Top = 78
        Width = 50
        Height = 25
        Caption = 'Stop Z'
        TabOrder = 5
        OnClick = Button8Click
      end
      object Edit3: TEdit
        Left = 0
        Top = 112
        Width = 287
        Height = 21
        TabOrder = 6
        Text = 'Edit3'
      end
      object Edit4: TEdit
        Left = 0
        Top = 139
        Width = 287
        Height = 21
        TabOrder = 7
        Text = 'Edit4'
      end
      object Button10: TButton
        Left = 291
        Top = 110
        Width = 51
        Height = 25
        Caption = 'Acc+LG'
        TabOrder = 8
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 291
        Top = 137
        Width = 51
        Height = 25
        Caption = 'Zone'
        TabOrder = 9
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 202
        Top = 16
        Width = 39
        Height = 25
        Caption = 'Hide'
        TabOrder = 10
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 247
        Top = 16
        Width = 38
        Height = 25
        Caption = 'Show'
        Enabled = False
        TabOrder = 11
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 247
        Top = 47
        Width = 38
        Height = 25
        Caption = 'Show'
        Enabled = False
        TabOrder = 12
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 202
        Top = 47
        Width = 39
        Height = 25
        Caption = 'Hide'
        TabOrder = 13
        OnClick = Button15Click
      end
      object Button16: TButton
        Left = 247
        Top = 78
        Width = 38
        Height = 25
        Caption = 'Show'
        Enabled = False
        TabOrder = 14
        OnClick = Button16Click
      end
      object Button17: TButton
        Left = 202
        Top = 78
        Width = 39
        Height = 25
        Caption = 'Hide'
        TabOrder = 15
        OnClick = Button17Click
      end
      object Button20: TButton
        Left = 96
        Top = 163
        Width = 145
        Height = 19
        Caption = 'Admin Panel'
        TabOrder = 16
        OnClick = Button20Click
      end
      object Button21: TButton
        Left = 292
        Top = 47
        Width = 37
        Height = 25
        Caption = 'Open'
        TabOrder = 17
        OnClick = Button21Click
      end
      object Button22: TButton
        Left = 329
        Top = 47
        Width = 37
        Height = 25
        Caption = 'Close'
        TabOrder = 18
        OnClick = Button22Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'AION'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'PING'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object Label4: TLabel
        Left = 112
        Top = 40
        Width = 6
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Button23: TButton
        Left = 16
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Start Ping'
        TabOrder = 0
        OnClick = Button23Click
      end
      object Button24: TButton
        Left = 16
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Stop'
        Enabled = False
        TabOrder = 1
        OnClick = Button24Click
      end
      object Edit5: TEdit
        Left = 16
        Top = 96
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'c:\Program Files (x86)\NodeJS\html\pinger\index.js'
      end
      object Button25: TButton
        Left = 232
        Top = 16
        Width = 57
        Height = 25
        Caption = 'HIDE'
        TabOrder = 3
        OnClick = Button25Click
      end
      object Button26: TButton
        Left = 232
        Top = 56
        Width = 57
        Height = 25
        Caption = 'SHOW'
        TabOrder = 4
        OnClick = Button26Click
      end
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 215
    Width = 333
    Height = 17
    Step = 1
    TabOrder = 1
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 4
    Top = 8
  end
  object Timer2: TTimer
    Interval = 3000
    OnTimer = Timer2Timer
    Top = 200
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer3Timer
    Left = 172
    Top = 104
  end
  object Timer4: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer4Timer
    Left = 172
    Top = 72
  end
  object Timer5: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer5Timer
    Left = 172
    Top = 40
  end
  object TcpClient1: TTcpClient
    RemoteHost = '127.0.0.1'
    RemotePort = '28000'
    Left = 320
    Top = 40
  end
  object Pinger: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = PingerTimer
    Left = 28
    Top = 156
  end
end
