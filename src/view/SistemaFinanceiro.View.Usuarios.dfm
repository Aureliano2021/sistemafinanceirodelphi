inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlPrincipal: TCardPanel
    ActiveCard = CardPesquisa
    StyleElements = [seFont, seClient, seBorder]
    inherited CardCadastro: TCard
      StyleElements = [seFont, seClient, seBorder]
      object lblNome: TLabel [0]
        Left = 16
        Top = 27
        Width = 36
        Height = 15
        Caption = 'Nome:'
      end
      object lblLogin: TLabel [1]
        Left = 16
        Top = 56
        Width = 33
        Height = 15
        Caption = 'Login:'
      end
      object Label2: TLabel [2]
        Left = 16
        Top = 85
        Width = 35
        Height = 15
        Caption = 'Senha:'
      end
      object lblStatus: TLabel [3]
        Left = 17
        Top = 116
        Width = 35
        Height = 15
        Caption = 'Status:'
      end
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited btnSalvar: TButton
          OnClick = btnSalvarClick
        end
      end
      object edtNome: TEdit
        Left = 80
        Top = 24
        Width = 385
        Height = 23
        TabOrder = 1
      end
      object edtLogin: TEdit
        Left = 80
        Top = 53
        Width = 385
        Height = 23
        TabOrder = 2
      end
      object edtSenha: TEdit
        Left = 80
        Top = 82
        Width = 385
        Height = 23
        TabOrder = 3
      end
      object tgsStatus: TToggleSwitch
        Left = 80
        Top = 111
        Width = 113
        Height = 20
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 4
      end
    end
    inherited CardPesquisa: TCard
      StyleElements = [seFont, seClient, seBorder]
      inherited pnlPesquisa: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited Label1: TLabel
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited edtPesquisa: TEdit
          StyleElements = [seFont, seClient, seBorder]
        end
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited pnlBotoes: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited btnExcluir: TButton
          OnClick = btnExcluirClick
          ExplicitLeft = 144
          ExplicitTop = 6
        end
      end
      inherited pnlPesquisaGrid: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited DBGrid1: TDBGrid
          DataSource = DataSource1
          Columns = <
            item
              Expanded = False
              FieldName = 'nome'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'login'
              Title.Caption = 'Login'
              Width = 265
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'status'
              Title.Caption = 'Status'
              Width = 64
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 545
    Top = 266
  end
end
