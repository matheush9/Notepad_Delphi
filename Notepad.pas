unit Notepad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    Arquivo1: TMenuItem;
    Novo1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure Novo1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure SobreClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure SalvarComo1Click(Sender: TObject);
    // procedure Teste1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    Alterado: Boolean;

    procedure Save();
    procedure SaveToDirectory();
    procedure SaveOption();
    procedure VerifyEmpty();
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Abrir1Click(Sender: TObject);
begin
  VerifyEmpty();
  SaveOption();
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    Alterado := False;
  end;
end;

procedure TForm1.SobreClick(Sender: TObject);
begin
  ShowMessage('Criado por Matheus');
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Alterado := true;
end;

procedure TForm1.Novo1Click(Sender: TObject);
begin
  VerifyEmpty();
  SaveOption();
  Memo1.Lines.Clear
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  SaveOption();
  Application.Terminate;
end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin
  Save();
end;

procedure TForm1.SalvarComo1Click(Sender: TObject);
begin
  SaveToDirectory();
end;



// Procedures Funcionais

procedure TForm1.VerifyEmpty();
begin
  if (Memo1.Lines.Count > 0) then
end;

procedure TForm1.Save();
begin
  if SaveDialog1.FileName = EmptyStr then
  begin
    SaveToDirectory();
  end;
end;

procedure TForm1.SaveToDirectory();
begin
  if SaveDialog1.Execute then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.SaveOption();
begin
  if Alterado then
  begin
    if Application.MessageBox('Arquivo alterado, Deseja salvar?', 'Confirme',
      MB_YESNO) = IDYES then
      Save();
  end;
    ShowMessage('Beleza! Perde o arquivo aí então');
end;

end.
