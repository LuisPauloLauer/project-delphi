object frmClienteOld: TfrmClienteOld
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 461
  ClientWidth = 684
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
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 419
    Width = 684
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnFechar: TButton
      Left = 572
      Top = 6
      Width = 100
      Height = 45
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object pgcCliente: TPageControl
    Left = 0
    Top = 0
    Width = 684
    Height = 419
    ActivePage = tbsDados
    Align = alClient
    TabOrder = 0
    object tbsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 676
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object edPesquisar: TLabeledEdit
          Left = 16
          Top = 24
          Width = 353
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 568
          Top = 8
          Width = 100
          Height = 30
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnl: TPanel
        Left = 0
        Top = 350
        Width = 676
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 374
          Top = 5
          Width = 100
          Height = 30
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 472
          Top = 5
          Width = 100
          Height = 30
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 568
          Top = 5
          Width = 100
          Height = 30
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object dbgPesquisa: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 52
        Width = 670
        Height = 295
        Align = alClient
        DataSource = dsPesquisa
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = dbgPesquisaDblClick
      end
    end
    object tbsDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
      object pnlDadosCodigo: TPanel
        Left = 0
        Top = 0
        Width = 676
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object lblCodigo: TLabel
          Left = 37
          Top = 9
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTipo: TLabel
          Left = 209
          Top = 9
          Width = 25
          Height = 16
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNomeCodigo: TLabel
          Left = 392
          Top = 9
          Width = 123
          Height = 19
          Caption = 'lblNomeCodigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edCodigo: TEdit
          Left = 82
          Top = 9
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object cbTipo: TComboBox
          Left = 240
          Top = 9
          Width = 145
          Height = 21
          TabOrder = 1
          Items.Strings = (
            'CLIENTE'
            'FORNECEDOR')
        end
      end
      object pnlDadosCadastro: TPanel
        Left = 0
        Top = 41
        Width = 676
        Height = 305
        Align = alClient
        BevelOuter = bvNone
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 1
        object lblBairro: TLabel
          Left = 42
          Top = 87
          Width = 34
          Height = 16
          Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEndereco: TLabel
          Left = 23
          Top = 33
          Width = 53
          Height = 16
          Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNome: TLabel
          Left = 43
          Top = 6
          Width = 33
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNumero: TLabel
          Left = 31
          Top = 60
          Width = 45
          Height = 16
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblComplemento: TLabel
          Left = 204
          Top = 60
          Width = 79
          Height = 16
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCep: TLabel
          Left = 261
          Top = 87
          Width = 22
          Height = 16
          Caption = 'Cep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCidade: TLabel
          Left = 37
          Top = 114
          Width = 39
          Height = 16
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCidadeNome: TLabel
          Left = 195
          Top = 114
          Width = 85
          Height = 16
          Caption = 'lblCidadeNome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEstadoCodigo: TLabel
          Left = 82
          Top = 141
          Width = 100
          Height = 16
          AutoSize = False
          Caption = 'lblEstadoCodigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEstado: TLabel
          Left = 37
          Top = 141
          Width = 38
          Height = 16
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEstadoNome: TLabel
          Left = 195
          Top = 141
          Width = 287
          Height = 16
          AutoSize = False
          Caption = 'lblEstadoNome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPais: TLabel
          Left = 53
          Top = 163
          Width = 23
          Height = 16
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblPaisCodigo: TLabel
          Left = 82
          Top = 163
          Width = 100
          Height = 16
          AutoSize = False
          Caption = 'lblPaisCodigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPaisNome: TLabel
          Left = 195
          Top = 163
          Width = 287
          Height = 16
          AutoSize = False
          Caption = 'lblPaisNome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTel1: TLabel
          Left = 15
          Top = 185
          Width = 61
          Height = 16
          Caption = 'Telefone 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTel2: TLabel
          Left = 263
          Top = 185
          Width = 61
          Height = 16
          Caption = 'Telefone 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEmail: TLabel
          Left = 45
          Top = 212
          Width = 31
          Height = 16
          Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCPF: TLabel
          Left = 54
          Top = 239
          Width = 22
          Height = 16
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCNPJ: TLabel
          Left = 48
          Top = 266
          Width = 28
          Height = 16
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edComplemento: TEdit
          Left = 289
          Top = 60
          Width = 193
          Height = 21
          TabOrder = 3
        end
        object edEndereco: TEdit
          Left = 82
          Top = 33
          Width = 400
          Height = 21
          TabOrder = 1
        end
        object edBairro: TEdit
          Left = 82
          Top = 87
          Width = 152
          Height = 21
          TabOrder = 4
        end
        object edNome: TEdit
          Left = 82
          Top = 6
          Width = 400
          Height = 21
          TabOrder = 0
        end
        object edNumero: TEdit
          Left = 82
          Top = 60
          Width = 100
          Height = 21
          TabOrder = 2
        end
        object edCep: TEdit
          Left = 289
          Top = 87
          Width = 193
          Height = 21
          TabOrder = 5
        end
        object edCidade: TEdit
          Left = 82
          Top = 114
          Width = 100
          Height = 21
          TabOrder = 6
          OnChange = edCidadeChange
        end
        object edTel1: TEdit
          Left = 82
          Top = 185
          Width = 152
          Height = 21
          TabOrder = 7
        end
        object edTel2: TEdit
          Left = 330
          Top = 185
          Width = 152
          Height = 21
          TabOrder = 8
        end
        object edEmail: TEdit
          Left = 82
          Top = 212
          Width = 400
          Height = 21
          TabOrder = 9
        end
        object edCPF: TEdit
          Left = 82
          Top = 239
          Width = 400
          Height = 21
          TabOrder = 10
        end
        object edCNPJ: TEdit
          Left = 82
          Top = 266
          Width = 400
          Height = 21
          TabOrder = 11
        end
      end
      object pnlDadosAcao: TPanel
        Left = 0
        Top = 346
        Width = 676
        Height = 45
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 2
        object btnListar: TButton
          Left = 350
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 0
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 431
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnSalvar: TButton
          Left = 512
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 2
          OnClick = btnSalvarClick
        end
        object btnCancelar: TButton
          Left = 593
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsPesquisa: TDataSource
    DataSet = dmCliente.cdsPesquisar
    Left = 12
    Top = 424
  end
end
