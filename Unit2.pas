unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Sockets, Character, IdGlobal, IdGlobalProtocols;

type
  TpData = array [0 .. 65336] of Byte;

  Tpacket = record
    data: TpData;
    size: Word;
    ptype: Word;
  end;

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Edit1: TEdit;
    StringGrid1: TStringGrid;
    Button2: TButton;
    TcpClient1: TTcpClient;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    function formpacket(packet: string): Tpacket;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('USE RF_WorldGU SELECT Serial,DCK,Name,DeleteName,Lv');
  ADOQuery1.SQL.Add('FROM tbl_base where Account=''' + Edit1.Text + '''');
  ADOQuery1.Open;
  StringGrid1.RowCount := ADOQuery1.RecordCount;
  StringGrid1.Cells[0, 0] := 'Serial';
  StringGrid1.Cells[1, 0] := 'DCK';
  StringGrid1.Cells[2, 0] := 'Name';
  StringGrid1.Cells[3, 0] := 'DeleteName';
  StringGrid1.Cells[4, 0] := 'Lv';
  for i := 1 to ADOQuery1.RecordCount do
  begin
    StringGrid1.Cells[0, i] := ADOQuery1.Fields[0].Text;
    StringGrid1.Cells[1, i] := ADOQuery1.Fields[1].Text;
    StringGrid1.Cells[2, i] := ADOQuery1.Fields[2].Text;
    StringGrid1.Cells[3, i] := ADOQuery1.Fields[3].Text;
    StringGrid1.Cells[4, i] := ADOQuery1.Fields[4].Text;
    ADOQuery1.Next;
  end;
  ADOQuery1.Close;
end;

function TForm2.formpacket(packet: string): Tpacket;
var
  i, j: Integer;
begin
  Result.size := round(length(packet) / 2);
  i := 0;
  j := 0;
  while i < length(packet) do
  begin
    Result.data[j] := StrToInt('$' + packet[i + 1] + packet[i + 2]);
    i := i + 2;
    j := j + 1;
  end;
  Result.ptype := StrToInt('$' + IntToHex(Result.data[3], 2) +
    IntToHex(Result.data[2], 2));
end;

{ function StrToHex(source: string): string;
  var
  i: Integer;
  c: Char;
  s: string;
  begin
  s := '';
  for i := 1 to length(source) do
  begin
  c := source[i];
  s := s + IntToHex(Ord(source[i]), 2);
  end;
  Result := s;
  end; }
{ function StrToHex(Const Source: String): String;
  var
  c: Char;
  begin
  Result := '';
  for c in Source do
  Result := Result + IntToHex(Ord(c), 2);
  end; }
function StrToHex(Source: string): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to length(Source) do
    Result := Result + IntToHex(Ord(Source[1]), 2);
end;

{ function UniToUTF8(Sourse: WideChar): string;
  var
  s: string;
  begin
  SetLength(s, length(Sourse));
  UnicodeToUtf8(PChar(s), @Sourse, length(Sourse));
  end; }

procedure TForm2.Button2Click(Sender: TObject);
Var
  str, bl: string[255];
  packetStr: string;
  pack, pk: Tpacket;
  i: Integer;
begin
  TcpClient1.Connect;
  if TcpClient1.Connected then
  begin
    packetStr := '14003201630455466915B9618B2FB020857BD8450500650100';
    pack := formpacket(packetStr);
    TcpClient1.SendBuf(pack.data, pack.size);
    // Подключились как Control
    str := Edit2.Text;
    packetStr := '0032070000FFFFFFFF00';
    packetStr := packetStr + IntToHex(length(str), 2);
    packetStr := packetStr + '00';
    packetStr := packetStr + StrToHex(str);
    packetStr := packetStr + '0000';
    packetStr := IntToHex(length(packetStr) div 2 + 1, 2) + packetStr;
    pack := formpacket(packetStr);
    TcpClient1.SendBuf(pack.data, pack.size);
  end;
  TcpClient1.Disconnect;
end;

procedure TForm2.TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  ShowMessage(Buf);
end;

end.
