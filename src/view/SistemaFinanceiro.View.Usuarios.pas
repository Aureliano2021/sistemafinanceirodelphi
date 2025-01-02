unit SistemaFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.Cadastro,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, SistemaFinanceiro.Model.Usuarios, Vcl.WinXCtrls;

type
  TfrmUsuarios = class(TfrmCadastro)
    DataSource1: TDataSource;
    edtNome: TEdit;
    edtLogin: TEdit;
    edtSenha: TEdit;
    lblNome: TLabel;
    lblLogin: TLabel;
    Label2: TLabel;
    tgsStatus: TToggleSwitch;
    lblStatus: TLabel;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

uses
  SistemaFinanceiro.Utiliarios;

{$R *.dfm}

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Edit;
  edtNome.Text := dmUsuarios.cdsUsuariosnome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuarioslogin.AsString;
  edtSenha.Text := dmUsuarios.cdsUsuariossenha.AsString;

  tgsStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosstatus.AsString = 'B' then
    tgsStatus.State := tssOff;
end;

procedure TfrmUsuarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Cancel;
end;

procedure TfrmUsuarios.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente excluir o registro?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) <> mrYes then
    exit;

  try
    dmUsuarios.cdsUsuarios.Delete;
    dmUsuarios.cdsUsuarios.ApplyUpdates(0);
    Application.MessageBox('Registro excluído com sucesso!', 'Atenção', MB_OK + MB_ICONWARNING);
  except on E: Exception do
    Application.MessageBox(PWideChar(E.Message), 'Erro ao excluir registro', MB_OK + MB_ICONERROR);

  end;
end;

procedure TfrmUsuarios.btnIncluirClick(Sender: TObject);
begin
  inherited;

  LimparCampos;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM usuarios';
  dmUsuarios.cdsUsuarios.Open;

end;

procedure TfrmUsuarios.btnSalvarClick(Sender: TObject);
var
  lStatus: String;
  Mensagem : String;
begin
  inherited;

  if Trim(edtNome.Text) = '' then
  begin
    edtNome.SetFocus;
    Application.MessageBox('O campo nome não pode ser vazio', 'Atenção!',
    MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    edtLogin.SetFocus;
    Application.MessageBox('O campo login não pode ser vazio', 'Atenção!',
    MB_OK + MB_ICONWARNING);
    abort;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    Application.MessageBox('O campo senha não pode ser vazio', 'Atenção!',
    MB_OK + MB_ICONWARNING);
    abort;
  end;

  if dmUsuarios.TemLoginCadastrado(Trim(edtLogin.Text), dmUsuarios.cdsUsuarios.FieldByName('ID').AsString) then
    begin
      edtSenha.SetFocus;
      Application.MessageBox(PWideChar(Format('O login %s já se encontra cadastrado.', [edtLogin.Text])),
      'Atenção!', MB_OK + MB_ICONWARNING);
      abort;
    end;


  lStatus := 'A';

  if tgsStatus.State = tssOff then
    lStatus := 'B';

  Mensagem := 'Registro alterado com sucesso!';

  if dmUsuarios.cdsUsuarios.State in [dsInsert] then
  begin
    Mensagem := 'Registro incluído com sucesso!';
    dmUsuarios.cdsUsuariosid.AsString := TUtilitarios.GetID;
    dmUsuarios.cdsUsuariosdata_cadastro.AsDateTime := now;
  end;

  dmUsuarios.cdsUsuariosnome.AsString := Trim(edtNome.Text);
  dmUsuarios.cdsUsuarioslogin.AsString := Trim(edtLogin.Text);
  dmUsuarios.cdsUsuariossenha.AsString := Trim(edtSenha.Text);
  dmUsuarios.cdsUsuariosstatus.AsString := lStatus;

  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);

  Application.MessageBox(PWideChar(Mensagem), 'Sucesso',
  MB_OK + MB_ICONINFORMATION);

  pnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmUsuarios.LimparCampos;
var
  Contador: Integer;
begin

  for Contador := 0 to Pred(ComponentCount) do
    begin
      if Components[Contador] is TCustomEdit then
        TCustomEdit(Components[Contador]).Clear
      else if Components[Contador] is TToggleSwitch then
        TToggleSwitch(Components[Contador]).State := tssOn;
    end;

end;

end.
