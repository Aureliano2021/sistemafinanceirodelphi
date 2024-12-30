unit SistemaFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  SistemaFinanceiro.View.Cadastro, SistemaFinanceiro.View.Splash;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastros: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    mnuCadastro: TMenuItem;
    mnuUsuarios: TMenuItem;
    procedure mnuCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnuUsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  SistemaFinanceiro.View.Usuarios;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmSplash := TfrmSplash.Create(nil);
  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;
end;

procedure TfrmPrincipal.mnuCadastroClick(Sender: TObject);
begin
  frmCadastro.Show;
end;

procedure TfrmPrincipal.mnuUsuariosClick(Sender: TObject);
begin
  frmUsuarios.Show;
end;

end.
