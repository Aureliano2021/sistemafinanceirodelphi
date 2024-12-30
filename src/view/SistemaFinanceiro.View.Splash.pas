unit SistemaFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSplash = class(TForm)
    pnlPrincipal: TPanel;
    imgLogo: TImage;
    ProgressBar1: TProgressBar;
    lblProgressBar: TLabel;
    Label2: TLabel;
    tmrSplash: TTimer;
    imgDll: TImage;
    imgBancoDados: TImage;
    imgConfiguracoes: TImage;
    imgIniciando: TImage;
    procedure tmrSplashTimer(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarImagens(Value: String; Value2 : TImage);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.AtualizarImagens(Value: String; Value2: TImage);
begin
  lblProgressBar.Caption := Value;
  Value2.Visible := True;
end;

procedure TfrmSplash.tmrSplashTimer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100 then
  begin
    ProgressBar1.StepIt;
    case ProgressBar1.Position of

    10 : AtualizarImagens('Carregando dependências...', imgDll);
    25 : AtualizarImagens('Conectando ao banco de dados...', imgBancoDados);
    45 : AtualizarImagens('Carregando as configurações...', imgConfiguracoes);
    75 : AtualizarImagens('Iniciando o Sistema', imgIniciando);

    end;

  if ProgressBar1.Position = 100 then
  Close;
  end;
end;

end.
