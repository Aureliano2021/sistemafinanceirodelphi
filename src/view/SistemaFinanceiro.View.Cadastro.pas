unit SistemaFinanceiro.View.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TfrmCadastro = class(TForm)
    pnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    pnlPesquisa: TPanel;
    pnlBotoes: TPanel;
    pnlPesquisaGrid: TPanel;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Label1: TLabel;
    btnPesquisar: TButton;
    ImageList1: TImageList;
    btnFechar: TButton;
    btnImprimir: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnIncluir: TButton;
    Panel1: TPanel;
    btnCancelar: TButton;
    Button5: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.btnAlterarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.btnIncluirClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := CardPesquisa;
end;

end.
