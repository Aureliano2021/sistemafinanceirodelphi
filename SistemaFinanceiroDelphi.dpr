program SistemaFinanceiroDelphi;

uses
  Vcl.Forms,
  SistemaFinanceiro.View.Principal in 'src\view\SistemaFinanceiro.View.Principal.pas' {frmPrincipal},
  SistemaFinanceiro.View.Cadastro in 'src\view\SistemaFinanceiro.View.Cadastro.pas' {frmCadastro},
  SistemaFinanceiro.View.Splash in 'src\view\SistemaFinanceiro.View.Splash.pas' {frmSplash},
  SistemaFinanceiro.Model.Conexao in 'src\model\SistemaFinanceiro.Model.Conexao.pas' {dmConexao: TDataModule},
  SistemaFinanceiro.View.Usuarios in 'src\view\SistemaFinanceiro.View.Usuarios.pas' {frmUsuarios},
  SistemaFinanceiro.Model.Usuarios in 'src\model\SistemaFinanceiro.Model.Usuarios.pas' {dmUsuarios: TDataModule},
  SistemaFinanceiro.Utiliarios in 'src\util\SistemaFinanceiro.Utiliarios.pas',
  SistemaFinanceiro.View.Login in 'src\view\SistemaFinanceiro.View.Login.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TfrmUsuarios, frmUsuarios);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.Run;
end.
