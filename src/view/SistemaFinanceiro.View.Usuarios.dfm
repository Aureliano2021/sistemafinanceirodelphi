inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlPrincipal: TCardPanel
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 624
    ExplicitHeight = 441
    inherited CardCadastro: TCard
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 2
      ExplicitTop = 1
      ExplicitWidth = 622
      ExplicitHeight = 439
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
        ExplicitTop = 360
        inherited Button5: TButton
          ExplicitLeft = 472
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
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 622
      ExplicitHeight = 439
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
          ExplicitTop = 0
        end
      end
      inherited pnlBotoes: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitTop = 360
        inherited btnFechar: TButton
          ExplicitTop = 0
          ExplicitHeight = 79
        end
        inherited btnImprimir: TButton
          ExplicitLeft = 225
        end
        inherited btnExcluir: TButton
          ExplicitLeft = 150
          ExplicitTop = 0
        end
        inherited btnAlterar: TButton
          ExplicitLeft = 75
        end
        inherited btnIncluir: TButton
          ExplicitLeft = 0
        end
      end
      inherited pnlPesquisaGrid: TPanel
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 0
        ExplicitTop = 65
        ExplicitWidth = 622
        ExplicitHeight = 295
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
