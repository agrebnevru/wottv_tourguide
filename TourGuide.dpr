program TourGuide;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitGonki in 'UnitGonki.pas' {FormGonki},
  ThreadCheckNewVersion in 'ThreadCheckNewVersion.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormGonki, FormGonki);
  Application.Run;
end.
