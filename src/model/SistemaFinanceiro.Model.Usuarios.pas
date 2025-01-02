unit SistemaFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, SistemaFinanceiro.Model.Conexao;

type
  TdmUsuarios = class(TDataModule)
    sqlUsuarios: TFDQuery;
    cdsUsuarios: TClientDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuariosid: TStringField;
    cdsUsuariosnome: TStringField;
    cdsUsuarioslogin: TStringField;
    cdsUsuariossenha: TStringField;
    cdsUsuariosstatus: TStringField;
    cdsUsuariosdata_cadastro: TDateField;
  private
    FNomeUsuarioLogado: String;
    FIDUsuarioLogado: String;
    FLoginUsuarioLogado: String;
    { Private declarations }
  public
    { Public declarations }
    function TemLoginCadastrado(Login : String; ID : String) : Boolean;
    procedure EfetuarLogin(Login : String; Senha : String);
    property NomeUsuarioLogado: String read FNomeUsuarioLogado write FNomeUsuarioLogado;
    property IDUsuarioLogado: String read FIDUsuarioLogado write FIDUsuarioLogado;
    property LoginUsuarioLogado: String read FLoginUsuarioLogado write
    FLoginUsuarioLogado;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUsuarios }

procedure TdmUsuarios.EfetuarLogin(Login, Senha: String);
var
  SQLConsulta : TFDQuery;
begin
  SQLConsulta := TFDQuery.Create(nil);

  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT * FROM USUARIOS WHERE LOGIN = :LOGIN AND SENHA = :SENHA');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.ParamByName('SENHA').AsString := Senha;
    SQLConsulta.Open;

    if SQLConsulta.IsEmpty then
      raise Exception.Create('Usuário e/ou senha incorretos');

    if SQLConsulta.FieldByName('Status').AsString <> 'A' then
      raise Exception.Create('Usuário Bloqueado, favor entrar em contato com o ' +
      'administrador');

    FIDUsuarioLogado := SQLConsulta.FieldByName('ID').AsString;
    FNomeUsuarioLogado := SQLConsulta.FieldByName('NOME').AsString;
    FLoginUsuarioLogado := SQLConsulta.FieldByName('LOGIN').AsString;
  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

function TdmUsuarios.TemLoginCadastrado(Login, ID: String): Boolean;
var
  SQLConsulta : TFDQuery;
begin
  Result := false;
  SQLConsulta := TFDQuery.Create(nil);

  try
    SQLConsulta.Connection := dmConexao.SQLConexao;
    SQLConsulta.SQL.Clear;
    SQLConsulta.SQL.Add('SELECT ID FROM USUARIOS WHERE LOGIN = :LOGIN');
    SQLConsulta.ParamByName('LOGIN').AsString := Login;
    SQLConsulta.Open;

    if not SQLConsulta.IsEmpty then
      Result := SQLConsulta.FieldByName('ID').AsString <> ID;
  finally
    SQLConsulta.Close;
    SQLConsulta.Free;
  end;
end;

end.
