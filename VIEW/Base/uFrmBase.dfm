object frmBase: TfrmBase
  Left = 0
  Top = 0
  Caption = 'frmBase'
  ClientHeight = 611
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodapeBase: TPanel
    Left = 0
    Top = 536
    Width = 734
    Height = 75
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object stbRodapeBase: TStatusBar
      Left = 0
      Top = 50
      Width = 734
      Height = 25
      Panels = <
        item
          Text = 'Car Manager Software'
          Width = 200
        end
        item
          Width = 150
        end
        item
          Width = 100
        end>
    end
    object btnFecharBase: TBitBtn
      Left = 664
      Top = 2
      Width = 60
      Height = 45
      Caption = '&Fechar'
      TabOrder = 1
      OnClick = btnFecharBaseClick
    end
  end
  object pnlCadastroBase: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 536
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pgcBase: TPageControl
      Left = 0
      Top = 0
      Width = 734
      Height = 536
      ActivePage = tbsPesquisaBase
      Align = alClient
      TabOrder = 0
      object tbsPesquisaBase: TTabSheet
        Caption = 'Pesquisa'
        object pnlRodapePesquisaBase: TPanel
          Left = 0
          Top = 458
          Width = 726
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 1
          object btnIncluirPesquisaBase: TBitBtn
            Left = 541
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Incluir'
            TabOrder = 0
            OnClick = btnIncluirPesquisaBaseClick
          end
          object btnDetalharPesquisaBase: TBitBtn
            Left = 601
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Detalhar'
            TabOrder = 1
            OnClick = btnDetalharPesquisaBaseClick
          end
          object btnExcluirPesquisaBase: TBitBtn
            Left = 660
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Excluir'
            TabOrder = 2
            OnClick = btnExcluirPesquisaBaseClick
          end
        end
        object pnlCabecalhoPesquisaBase: TPanel
          Left = 0
          Top = 0
          Width = 726
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object lblOpcaoPesquisaBase: TLabel
            Left = 8
            Top = 8
            Width = 110
            Height = 20
            Caption = 'Pesquisar por'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblConteudoPesquisaBase: TLabel
            Left = 238
            Top = 8
            Width = 78
            Height = 20
            Caption = 'Conte'#250'do'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbOpcaoPesquisaBase: TComboBox
            Left = 124
            Top = 8
            Width = 100
            Height = 26
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = 'C'#243'digo'
            OnChange = cbOpcaoPesquisaBaseChange
            Items.Strings = (
              'C'#243'digo'
              'Nome')
          end
          object edConteudoPesquisaBase: TMaskEdit
            Left = 322
            Top = 8
            Width = 282
            Height = 26
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            Text = ''
            OnKeyDown = edConteudoPesquisaBaseKeyDown
          end
          object btnPesquisarPesquisaBase: TBitBtn
            Left = 620
            Top = 8
            Width = 100
            Height = 30
            Caption = '&Pesquisar'
            TabOrder = 2
            OnClick = btnPesquisarPesquisaBaseClick
          end
        end
        object dbgPesquisaBase: TDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 43
          Width = 720
          Height = 412
          Align = alClient
          DataSource = dsPesquisaBase
          DrawingStyle = gdsGradient
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgPesquisaBaseDblClick
        end
      end
      object tbsDadosBase: TTabSheet
        Caption = 'Dados'
        ImageIndex = 1
        object pnlRodapeDadosBase: TPanel
          Left = 0
          Top = 458
          Width = 726
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 2
          object btnAlterarDadosBase: TBitBtn
            Left = 540
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Alterar'
            TabOrder = 0
            OnClick = btnAlterarDadosBaseClick
          end
          object btnSalvarDadosBase: TBitBtn
            Left = 600
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Salvar'
            TabOrder = 1
            OnClick = btnSalvarDadosBaseClick
          end
          object btnCancelarDadosBase: TBitBtn
            Left = 660
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Cancelar'
            TabOrder = 2
            OnClick = btnCancelarDadosBaseClick
          end
          object btnListarDadosBase: TBitBtn
            Left = 480
            Top = 2
            Width = 60
            Height = 45
            Caption = '&Listar'
            TabOrder = 3
            OnClick = btnListarDadosBaseClick
          end
        end
        object pgcDadosBase: TPageControl
          Left = 0
          Top = 40
          Width = 726
          Height = 418
          ActivePage = tbsCapaDadosBase
          Align = alClient
          TabOrder = 1
          object tbsCapaDadosBase: TTabSheet
            Caption = '&1.Cadastro'
          end
        end
        object pnlCabecalhoDadosBase: TPanel
          Left = 0
          Top = 0
          Width = 726
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          Color = clSilver
          ParentBackground = False
          TabOrder = 0
          object lblCodigoDadosBase: TLabel
            Left = 16
            Top = 8
            Width = 56
            Height = 20
            Caption = 'C'#243'digo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edCodigoDadosBase: TMaskEdit
            Left = 78
            Top = 6
            Width = 100
            Height = 26
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = ''
          end
          object edNomeCodigoDadosBase: TMaskEdit
            Left = 184
            Top = 6
            Width = 200
            Height = 26
            Color = clNavy
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -15
            Font.Name = 'Microsoft Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            Text = ''
          end
        end
      end
    end
  end
  object dsPesquisaBase: TDataSource
    AutoEdit = False
    DataSet = cdsPesquisaBase
    Left = 164
    Top = 536
  end
  object dspPesquisaBase: TDataSetProvider
    DataSet = sqlPesquisaBase
    Left = 88
    Top = 536
  end
  object cdsPesquisaBase: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisaBase'
    Left = 128
    Top = 536
  end
  object sqlPesquisaBase: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.sqlConexao
    Left = 48
    Top = 536
  end
  object sqlExcluiBase: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.sqlConexao
    Left = 240
    Top = 536
  end
end
