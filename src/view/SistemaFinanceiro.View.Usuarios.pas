unit SistemaFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.Cadastro,
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

procedure TfrmUsuarios.btnAlterarClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := dmUsuarios.cdsUsuariosnome.AsString;
  edtLogin.Text := dmUsuarios.cdsUsuarioslogin.AsString;
  edtSenha.Text := dmUsuarios.cdsUsuariossenha.AsString;

  tgsStatus.State := tssOn;
  if dmUsuarios.cdsUsuariosstatus.AsString = 'B' then
    tgsStatus.State := tssOff;
end;

procedure TfrmUsuarios.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  dmUsuarios.cdsUsuarios.Close;
  dmUsuarios.cdsUsuarios.CommandText := 'SELECT * FROM usuarios';
  dmUsuarios.cdsUsuarios.Open;

  {dmUsuarios.sqlUsuarios.SQL.Clear;
    dmUsuarios.sqlUsuarios.SQL.Add('SELECT * FROM usuarios');
      dmUsuarios.sqlUsuarios.Open;}

end;

end.
