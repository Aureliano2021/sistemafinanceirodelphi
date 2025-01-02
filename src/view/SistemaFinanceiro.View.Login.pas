unit SistemaFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Mask, SistemaFinanceiro.Model.Usuarios;

type
  TfrmLogin = class(TForm)
    pnlEsquerda: TPanel;
    imgLogo: TImage;
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    edtSenha: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    edtLogin: TEdit;
    btnEntrar: TButton;
    Panel4: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  SistemaFinanceiro.Model.Sistema;

{$R *.dfm}



procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('Informe o seu Usuário', 'Atenção!', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('Informe a sua Senha', 'Atenção!', MB_OK + MB_ICONWARNING);
    abort;
  end;



  try
  dmUsuarios.EfetuarLogin(Trim(edtLogin.Text), Trim(edtSenha.Text));
  dmSistema.DataUltimoAcesso(Now);
  dmSistema.UsuarioUltimoAcesso(dmUsuarios.LoginUsuarioLogado);
  ModalResult := mrOK;
  except
    on Erro:Exception do
    begin
      Application.MessageBox(PwideChar(Erro.Message), 'Atenção', MB_OK + MB_ICONWARNING);
      edtLogin.SetFocus;
    end;
  end;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  edtLogin.Text := dmSistema.UsuarioUltimoAcesso;
end;

end.
