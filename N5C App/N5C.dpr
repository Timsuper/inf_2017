program N5C;

uses
  System.StartUpCopy,
  FMX.Forms,
  Haupt in 'Haupt.pas' {HauptForm},
  Common in 'Common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THauptForm, HauptForm);
  Application.Run;
end.
