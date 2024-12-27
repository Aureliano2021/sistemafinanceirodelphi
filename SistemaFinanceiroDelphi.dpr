program SistemaFinanceiroDelphi;

uses
  Vcl.Forms,
  SistemaFinanceiro.View.Principal in 'src\view\SistemaFinanceiro.View.Principal.pas' {frmPrincipal},
  SistemaFinanceiro.View.Cadastro in 'src\view\SistemaFinanceiro.View.Cadastro.pas' {frmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.Run;
end.
