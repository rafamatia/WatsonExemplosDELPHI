program AppWatsonTone;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {frmWatsonSample},
  Recognize in 'Recognize.pas',
  Unit2 in 'Unit2.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles,
  FacesUnit in 'FacesUnit.pas',
  ToneUnit in 'ToneUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metropolis UI Blue');
  Application.CreateForm(TfrmWatsonSample, frmWatsonSample);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
