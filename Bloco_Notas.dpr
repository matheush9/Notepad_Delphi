program Bloco_Notas;

uses
  Vcl.Forms,
  Notepad in 'Notepad.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
