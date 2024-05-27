unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Shellapi, registry, ThreadCheckNewVersion;

type
  TFormMain = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    PanelBottom: TPanel;
    LabelCopy: TLabel;
    LabelVer: TLabel;
    LabelCopyLink: TLabel;
    LabelIssetNewVirsion: TLabel;
    TimerUpdate: TTimer;
    Label2: TLabel;
    function GetVerProg: string;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure LabelCopyLinkClick(Sender: TObject);
    procedure LabelIssetNewVirsionClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    Thread1: CheckNewVersion;
    { Private declarations }
    procedure SaveProgPosition;
    procedure LoadProgPosition;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitGonki;

{$R *.dfm}

{ ------------------- ����������/�������������� ������� begin ------------------ }
procedure TFormMain.SaveProgPosition;
var
  FIniFile: TRegIniFile;
begin
  FIniFile := TRegIniFile.Create('wottv_ru-score'); // ������������� ������
  FIniFile.OpenKey('wottv_ru-score', true); // �������� ������
  FIniFile.OpenKey('wottv_ru-score-PositionMain', true);
  // �������� ��� ���� ������
  if WindowState = wsNormal then
  begin
    FIniFile.WriteInteger('Option', 'Left', Left);
    FIniFile.WriteInteger('Option', 'Top', Top);
  end;
  FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
  FIniFile.Free;
end;

procedure TFormMain.LabelCopyLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('http://wottv.ru/'), nil, nil, SW_SHOW);
end;

procedure TFormMain.LabelIssetNewVirsionClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('http://wottv.ru/'), nil, nil, SW_SHOW);
end;

procedure TFormMain.LoadProgPosition;
var
  FIniFile: TRegIniFile;
begin
  FIniFile := TRegIniFile.Create('wottv_ru-score');
  FIniFile.OpenKey('wottv_ru-score', true);
  FIniFile.OpenKey('wottv_ru-score-PositionMain', true);
  Left := FIniFile.ReadInteger('Option', 'Left', 100);
  Top := FIniFile.ReadInteger('Option', 'Top', 100);
  WindowState := TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
  FIniFile.Free;
end;

{ ------------------- ����������/�������������� ������� end-- ------------------ }

procedure TFormMain.ComboBox1Change(Sender: TObject);
begin
FormGonki.Show;
end;

function TFormMain.GetVerProg: string;
type
  TVerInfo = packed record
    Nevazhno: array [0 .. 47] of byte; // �������� ��� 48 ����
    Minor, Major, Build, Release: word; // � ��� ������
  end;
var
  s: TResourceStream;
  v: TVerInfo;
begin
  result := '';
  try
    s := TResourceStream.Create(HInstance, '#1', RT_VERSION); // ������ ������
    if s.Size > 0 then
    begin
      s.Read(v, SizeOf(v)); // ������ ������ ��� �����
      result := IntToStr(v.Major) + '.' + IntToStr(v.Minor) + '.' +
      // ��� � ������...
        IntToStr(v.Release) + '.' + IntToStr(v.Build);
    end;
    s.Free;
  except
    ;
  end;
end;

procedure TFormMain.Button1Click(Sender: TObject);
begin
FormGonki.Show;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
begin
FormGonki.Show;
end;

procedure TFormMain.TimerUpdateTimer(Sender: TObject);
begin
  TimerUpdate.Enabled := false;
  Thread1 := CheckNewVersion.Create(true);
  Thread1.FreeOnTerminate := true;
  Thread1.Priority := tplower;
  Thread1.Resume;
end;

end.
