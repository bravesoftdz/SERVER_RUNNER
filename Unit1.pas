unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, psAPI, FileCtrl, IniFiles, Unit2,
  Sockets;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Timer1: TTimer;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Timer2: TTimer;
    Label3: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button9: TButton;
    Timer3: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button10: TButton;
    Button11: TButton;
    Timer4: TTimer;
    Timer5: TTimer;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button19: TButton;
    Button18: TButton;
    Button20: TButton;
    TcpClient1: TTcpClient;
    Button21: TButton;
    Button22: TButton;
    TabSheet4: TTabSheet;
    Pinger: TTimer;
    Button23: TButton;
    Button24: TButton;
    Label4: TLabel;
    Edit5: TEdit;
    Button25: TButton;
    Button26: TButton;
    procedure Button1Click(Sender: TObject);
    function ExecAndWait(const FileName, Params: ShortString;
      const WinState: Word): TProcessInformation; export;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    function Find(s: string): hWnd;
    procedure Button13Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure PingerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ProcInfoKF, ProcInfoAC, ProcInfoLG, ProcInfoZO, Pinge: TProcessInformation;
  ACWindow, LGWindow, ZOWindow, KFWindow, PinWin: THandle;

implementation

{$R *.dfm}

function TForm1.Find(s: string): hWnd;
var
  Wnd: hWnd;
  buff: array [0 .. 127] of Char;
begin
  Find := 0;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do
  begin
    if (Wnd <> Application.Handle) and IsWindowVisible(Wnd) and
      (GetWindow(Wnd, gw_Owner) = 0) and
      (GetWindowText(Wnd, buff, sizeof(buff)) <> 0) then
    begin
      GetWindowText(Wnd, buff, sizeof(buff));
      if pos(s, StrPas(buff)) > 0 then
      begin
        Find := Wnd;
        Break;
      end;
    end;
    Wnd := GetWindow(Wnd, gw_hWndNext);
  end;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button21Click(Sender: TObject);
var
  packetStr: string;
  pack: Tpacket;
begin
  TcpClient1.Connect;
  if TcpClient1.Connected then
  begin
    packetStr := '14003201630455466915B9618B2FB020857BD8450500650100';
    pack := Form2.Formpacket(packetStr);
    TcpClient1.SendBuf(pack.data, pack.size);
    sleep(100);
    packetStr := '0700320B010000';
    pack := Form2.Formpacket(packetStr);
    TcpClient1.SendBuf(pack.data, pack.size);
    ShowMessage('Внешний коннект открыт');
  end;
  TcpClient1.Disconnect;
end;

procedure TForm1.Button22Click(Sender: TObject);
var
  packetStr: string;
  pack: Tpacket;
begin
  TcpClient1.Connect;
  if TcpClient1.Connected then
  begin
    packetStr := '14003201630455466915B9618B2FB020857BD8450500650100';
    pack := Form2.Formpacket(packetStr);
    TcpClient1.SendBuf(pack.data, pack.size);
    sleep(100);
    packetStr := '0700320B020000';
    pack := Form2.Formpacket(packetStr);
    TcpClient1.SendBuf(pack.data, pack.size);
    ShowMessage('Внешний коннект закрыт');
  end;
  TcpClient1.Disconnect;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  Button23.Enabled := False;
  Button24.Enabled := True;
  Pinge := ExecAndWait('C:\Program Files (x86)\NodeJS\node.exe',
    ' "' + Edit5.Text + '"', SW_MINIMIZE);
  Pinger.Enabled := True;
  Label4.Caption := 'Pinging...';
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  Button24.Enabled := False;
  Button23.Enabled := True;
  Pinger.Enabled := False;
  TerminateProcess(Pinge.hProcess, 0);
  Label4.Caption := 'Ping is OFF';
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  PinWin := Find('node.exe');
  if PinWin <> 0 then
    Showwindow(PinWin, SW_HIDE);
  Button25.Enabled := False;
  Button26.Enabled := True;
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  Showwindow(PinWin, SW_RESTORE);
  Button26.Enabled := False;
  Button25.Enabled := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  PostMessage(KFWindow, WM_QUIT, 0, 0);
  Button1.Enabled := True;
  Button2.Enabled := False;
  Label1.Caption := 'Stoped..';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ProcInfoAC := ExecAndWait(Edit3.Text + '\AccountServerSD.exe', '',
    SW_MINIMIZE);
  Timer5.Enabled := True;
  Button3.Enabled := False;
  Button6.Enabled := True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ProcInfoLG := ExecAndWait(Edit3.Text + '\LoginServerSD.exe', '', SW_MINIMIZE);
  Timer4.Enabled := True;
  Button4.Enabled := False;
  Button7.Enabled := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ProcInfoZO := ExecAndWait(Edit4.Text + '\Inter_NOHX.exe', '', SW_MINIMIZE);
  Timer3.Enabled := True;
  Button5.Enabled := False;
  Button8.Enabled := True;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if ACWindow <> 0 then
  begin
    Timer5.Enabled := False;
    // TerminateProcess(ProcInfoAC.hProcess, 0);
    PostMessage(ACWindow, WM_QUIT, 0, 0);
    Button3.Enabled := True;
    Button6.Enabled := False;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if LGWindow <> 0 then
  begin
    Timer4.Enabled := False;
    PostMessage(LGWindow, WM_QUIT, 0, 0);
    Button4.Enabled := True;
    Button7.Enabled := False;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if ZOWindow <> 0 then
  begin
    Timer3.Enabled := False;
    PostMessage(ZOWindow, WM_QUIT, 0, 0);
    Button5.Enabled := True;
    Button8.Enabled := False;
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Выберите каталог', '', Dir) then
    Edit1.Text := Dir + '\system\ucc.exe';
end;

function TForm1.ExecAndWait(const FileName, Params: ShortString;
  const WinState: Word): TProcessInformation; export;
var
  StartInfo: TStartupInfo;
  CmdLine: ShortString;
  ProcInfo: TProcessInformation;
begin
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x }
  CmdLine := '"' + FileName + '" ' + Params;
  FillChar(StartInfo, sizeof(StartInfo), #0);
  with StartInfo do
  begin
    cb := sizeof(StartInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WinState;
  end;
  CreateProcess(nil, PCHAR(String(CmdLine)), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PCHAR(ExtractFilePath(FileName)), StartInfo, ProcInfo);
  Result := ProcInfo;
  ZeroMemory(@StartInfo, sizeof(StartInfo));
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Выберите каталог AC+LG', '', Dir) then
    Edit3.Text := Dir;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Выберите каталог Zone', '', Dir) then
    Edit4.Text := Dir;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  ACWindow := Find('AccountServer');
  if ACWindow <> 0 then
    Showwindow(ACWindow, SW_HIDE);
  Button12.Enabled := False;
  Button13.Enabled := True;
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Showwindow(ACWindow, SW_RESTORE);
  Button13.Enabled := False;
  Button12.Enabled := True;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Showwindow(LGWindow, SW_RESTORE);
  Button14.Enabled := False;
  Button15.Enabled := True;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  LGWindow := Find('LoginServer');
  if LGWindow <> 0 then
    Showwindow(LGWindow, SW_HIDE);
  Button15.Enabled := False;
  Button14.Enabled := True;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Showwindow(ZOWindow, SW_RESTORE);
  Button16.Enabled := False;
  Button17.Enabled := True;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  ZOWindow := Find('RF Online');
  if ZOWindow <> 0 then
    Showwindow(ZOWindow, SW_HIDE);
  Button17.Enabled := False;
  Button16.Enabled := True;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  KFWindow := Find('ucc.exe');
  if KFWindow <> 0 then
    Showwindow(KFWindow, SW_HIDE);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Showwindow(KFWindow, SW_RESTORE);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ProcInfoKF := ExecAndWait(Edit1.Text, Edit2.Text, SW_MINIMIZE);
  Timer1.Enabled := True;
  Button1.Enabled := False;
  Button2.Enabled := True;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  Ini: TIniFile;
Begin
  Ini := TIniFile.Create('SettingsSR.ini');
  Ini.WriteString('KF', 'Path', Edit1.Text);
  Ini.WriteString('KF', 'Params', Edit2.Text);
  Ini.WriteString('RF', 'Path_ACC+LG', Edit3.Text);
  Ini.WriteString('RF', 'Path_Zone', Edit4.Text);
  Ini.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
Var
  Ini: TIniFile;
begin
  ProgressBar1.Max := 100;
  Ini := TIniFile.Create('SettingsSR.ini');
  Edit1.Text := Ini.ReadString('KF', 'Path', '');
  Edit2.Text := Ini.ReadString('KF', 'Params', '');
  Edit3.Text := Ini.ReadString('RF', 'Path_ACC+LG', '');
  Edit4.Text := Ini.ReadString('RF', 'Path_Zone', '');
  Ini.Free;
end;

procedure TForm1.PingerTimer(Sender: TObject);
begin
  if WaitforSingleObject(Pinge.hProcess, 100) = 0 then
  begin
    CloseHandle(Pinge.hProcess);
    Pinge := ExecAndWait('C:\Program Files (x86)\NodeJS\node.exe',
      ' "' + Edit5.Text + '"', SW_MINIMIZE);
      Sleep(200);
    PinWin := Find('node.exe');
    if PinWin <> 0 then
      Showwindow(PinWin, SW_HIDE);
    Button25.Enabled := False;
    Button26.Enabled := True;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoKF.hProcess, pmc, cb);
  Label2.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoKF.hProcess, 100) = 0 then
  begin
    CloseHandle(ProcInfoKF.hProcess);
    CloseHandle(ProcInfoKF.hThread);
    ProcInfoKF := ExecAndWait(Edit1.Text, Edit2.Text, SW_MINIMIZE);
  end
  else
    Label1.Caption := 'Server is Running..';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  MS: TMemoryStatus;
begin
  MS.dwLength := sizeof(MS);
  GlobalMemoryStatus(MS);
  ProgressBar1.Position := MS.dwMemoryLoad;
  Label3.Caption := IntToStr(MS.dwMemoryLoad) + '%';
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoZO.hProcess, pmc, cb);
  Label7.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoZO.hProcess, 100) = 0 then
  begin
    CloseHandle(ProcInfoZO.hProcess);
    CloseHandle(ProcInfoZO.hThread);
    ProcInfoZO := ExecAndWait
      ('D:\GU_SERV\ZoneServer\RF_Bin\ZoneServerUD_x64.exe', 'cjdrnrwkd',
      SW_MINIMIZE);
  end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoLG.hProcess, pmc, cb);
  Label8.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoLG.hProcess, 100) = 0 then
  begin
    CloseHandle(ProcInfoAC.hProcess);
    CloseHandle(ProcInfoAC.hThread);
    ProcInfoAC := ExecAndWait(Edit3.Text + '\LoginServerSD.exe', '',
      SW_MINIMIZE);
  end;
end;

procedure TForm1.Timer5Timer(Sender: TObject);
var
  pmc: PPROCESS_MEMORY_COUNTERS;
  cb: Integer;
begin
  cb := sizeof(_PROCESS_MEMORY_COUNTERS);
  GetMem(pmc, cb);
  pmc^.cb := cb;
  GetProcessMemoryInfo(ProcInfoAC.hProcess, pmc, cb);
  Label9.Caption := 'RAM: ' +
    IntToStr(pmc^.WorkingSetSize div 1024 div 1024) + 'Mb';
  FreeMem(pmc);
  if WaitforSingleObject(ProcInfoAC.hProcess, 100) = 0 then
  begin
    CloseHandle(ProcInfoAC.hProcess);
    CloseHandle(ProcInfoAC.hThread);
    ProcInfoAC := ExecAndWait(Edit3.Text + '\AccountServerSD.exe', '',
      SW_MINIMIZE);
  end;
end;

end.
