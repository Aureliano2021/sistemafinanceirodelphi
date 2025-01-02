unit SistemaFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  SistemaFinanceiro.View.Cadastro, SistemaFinanceiro.View.Splash,
  SistemaFinanceiro.View.Login, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastros: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuUsuarios: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure mnuCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuUsuariosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  SistemaFinanceiro.View.Usuarios, SistemaFinanceiro.Model.Usuarios;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmSplash := TfrmSplash.Create(nil);
  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;
  frmLogin := TfrmLogin.Create(nil);
  try
    frmLogin.ShowModal;
    if frmLogin.ModalResult <> mrOk then
      Application.Terminate;

  finally
    FreeAndNil(frmLogin);
  end;

  StatusBar1.Panels.Items[1].Text := 'Usuário: ' + dmUsuarios.NomeUsuarioLogado;

end;

procedure TfrmPrincipal.mnuCadastroClick(Sender: TObject);
begin
  frmCadastro.Show;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
  frmUsuarios.Show;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels.Items[0].Text := DateTimeToStr(Now);
end;

end.
