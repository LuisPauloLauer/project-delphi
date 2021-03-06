inherited frmCliente: TfrmCliente
  Caption = 'Cliente'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCadastroBase: TPanel
    inherited pgcBase: TPageControl
      ActivePage = tbsDadosBase
      inherited tbsPesquisaBase: TTabSheet
        inherited dbgPesquisaBase: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Title.Caption = 'Cidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNPJ'
              Visible = True
            end>
        end
      end
      inherited tbsDadosBase: TTabSheet
        inherited pgcDadosBase: TPageControl
          inherited tbsCapaDadosBase: TTabSheet
            object lblNome: TLabel
              Left = 43
              Top = 18
              Width = 37
              Height = 16
              Caption = 'Nome'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblEndereco: TLabel
              Left = 21
              Top = 44
              Width = 59
              Height = 16
              Caption = 'Endere'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblNumero: TLabel
              Left = 32
              Top = 72
              Width = 48
              Height = 16
              Caption = 'N'#250'mero'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblPais: TLabel
              Left = 53
              Top = 190
              Width = 27
              Height = 16
              Caption = 'Pa'#237's'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblCNPJ: TLabel
              Left = 45
              Top = 303
              Width = 35
              Height = 16
              Caption = 'CNPJ'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblCPF: TLabel
              Left = 54
              Top = 275
              Width = 26
              Height = 16
              Caption = 'CPF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblEmail: TLabel
              Left = 42
              Top = 249
              Width = 38
              Height = 16
              Caption = 'E-mail'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblTel2: TLabel
              Left = 208
              Top = 222
              Width = 64
              Height = 16
              Caption = 'Telefone 2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblTel1: TLabel
              Left = 16
              Top = 222
              Width = 64
              Height = 16
              Caption = 'Telefone 1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblEstado: TLabel
              Left = 37
              Top = 157
              Width = 43
              Height = 16
              Caption = 'Estado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblCidade: TLabel
              Left = 36
              Top = 126
              Width = 44
              Height = 16
              Caption = 'Cidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblCep: TLabel
              Left = 367
              Top = 99
              Width = 25
              Height = 16
              Caption = 'Cep'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblBairro: TLabel
              Left = 44
              Top = 99
              Width = 36
              Height = 16
              Caption = 'Bairro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblComplemento: TLabel
              Left = 208
              Top = 71
              Width = 84
              Height = 16
              Caption = 'Complemento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object edNome: TMaskEdit
              Left = 86
              Top = 17
              Width = 400
              Height = 21
              TabOrder = 0
              Text = ''
            end
            object edEndereco: TMaskEdit
              Left = 86
              Top = 44
              Width = 400
              Height = 21
              TabOrder = 1
              Text = ''
            end
            object edNumero: TMaskEdit
              Left = 86
              Top = 71
              Width = 100
              Height = 21
              TabOrder = 2
              Text = ''
            end
            object edComplemento: TMaskEdit
              Left = 298
              Top = 71
              Width = 188
              Height = 21
              TabOrder = 3
              Text = ''
            end
            object edBairro: TMaskEdit
              Left = 86
              Top = 98
              Width = 267
              Height = 21
              TabOrder = 4
              Text = ''
            end
            object edCep: TMaskEdit
              Left = 398
              Top = 98
              Width = 88
              Height = 21
              TabOrder = 5
              Text = ''
            end
            object edCidade: TMaskEdit
              Left = 86
              Top = 125
              Width = 68
              Height = 21
              EditMask = '9999999999;0;'
              MaxLength = 10
              TabOrder = 6
              Text = ''
              OnChange = edCidadeChange
              OnKeyDown = edCidadeKeyDown
            end
            object edNomeCidade: TMaskEdit
              Left = 167
              Top = 125
              Width = 319
              Height = 26
              Color = clYellow
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              Text = ''
            end
            object edEstado: TMaskEdit
              Left = 86
              Top = 157
              Width = 75
              Height = 26
              Color = clYellow
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
              Text = ''
            end
            object edNomeEstado: TMaskEdit
              Left = 167
              Top = 157
              Width = 319
              Height = 26
              Color = clYellow
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
              Text = ''
            end
            object edPais: TMaskEdit
              Left = 86
              Top = 189
              Width = 75
              Height = 26
              Color = clYellow
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
              Text = ''
            end
            object edNomePais: TMaskEdit
              Left = 167
              Top = 189
              Width = 319
              Height = 26
              Color = clYellow
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
              Text = ''
            end
            object edTel1: TMaskEdit
              Left = 86
              Top = 221
              Width = 100
              Height = 21
              TabOrder = 12
              Text = ''
            end
            object edTel2: TMaskEdit
              Left = 278
              Top = 221
              Width = 100
              Height = 21
              TabOrder = 13
              Text = ''
            end
            object edEmail: TMaskEdit
              Left = 86
              Top = 248
              Width = 400
              Height = 21
              TabOrder = 14
              Text = ''
            end
            object edCPF: TMaskEdit
              Left = 86
              Top = 275
              Width = 100
              Height = 21
              TabOrder = 15
              Text = ''
            end
            object edCNPJ: TMaskEdit
              Left = 86
              Top = 302
              Width = 100
              Height = 21
              TabOrder = 16
              Text = ''
            end
          end
        end
        inherited pnlCabecalhoDadosBase: TPanel
          inherited edNomeCodigoDadosBase: TMaskEdit
            Left = 335
            Color = clYellow
            Font.Color = clBlack
            ExplicitLeft = 335
          end
          object cbTipo: TComboBox
            Left = 184
            Top = 6
            Width = 145
            Height = 25
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            Text = 'Cliente'
            Items.Strings = (
              'Cliente'
              'Fornecedor')
          end
        end
      end
    end
  end
  inherited cdsPesquisaBase: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'PID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end>
    object cdsPesquisaBaseID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 10
    end
    object cdsPesquisaBaseTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 2
    end
    object cdsPesquisaBaseNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 300
    end
    object cdsPesquisaBaseCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 10
    end
    object cdsPesquisaBaseESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 2
    end
    object cdsPesquisaBaseTELEFONE1: TIntegerField
      FieldName = 'TELEFONE1'
    end
    object cdsPesquisaBaseTELEFONE2: TIntegerField
      FieldName = 'TELEFONE2'
    end
    object cdsPesquisaBaseEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 300
    end
    object cdsPesquisaBaseCPF: TIntegerField
      FieldName = 'CPF'
    end
    object cdsPesquisaBaseCNPJ: TIntegerField
      FieldName = 'CNPJ'
    end
  end
  inherited sqlPesquisaBase: TSQLQuery
    Params = <
      item
        DataType = ftString
        Name = 'PID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CLI.ID,'
      '  CLI.TIPO,'
      '  CLI.NOME,'
      '  CLI.CIDADE,'
      '  CLI.ESTADO,'
      '  COALESCE(CLI.TELEFONE1,0) AS TELEFONE1,'
      '  COALESCE(CLI.TELEFONE1,0) AS TELEFONE2,'
      '  COALESCE(CLI.EMAIL,"@") AS EMAIL,'
      '  CPF,'
      '  CNPJ'
      'FROM'
      #9'CLIENTE_EMPRESA CLI'
      'INNER JOIN'
      #9'PAIS PS ON CLI.PAIS = PS.ID'
      'INNER JOIN'
      #9'ESTADO UF ON CLI.ESTADO = UF.ID'
      'INNER JOIN'
      #9'CIDADE CD ON CLI.CIDADE = CD.ID'
      '  AND ((CLI.ID = :PID) OR (:PID = '#39'0000000000'#39'))'
      '  AND ((UPPER(CLI.NOME) LIKE :PNOME) OR (:PNOME IS NULL))')
    object sqlPesquisaBaseID: TStringField
      FieldName = 'ID'
      Required = True
      Size = 10
    end
    object sqlPesquisaBaseTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 2
    end
    object sqlPesquisaBaseNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 300
    end
    object sqlPesquisaBaseCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 10
    end
    object sqlPesquisaBaseESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 2
    end
    object sqlPesquisaBaseTELEFONE1: TIntegerField
      FieldName = 'TELEFONE1'
    end
    object sqlPesquisaBaseTELEFONE2: TIntegerField
      FieldName = 'TELEFONE2'
    end
    object sqlPesquisaBaseEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 300
    end
    object sqlPesquisaBaseCPF: TIntegerField
      FieldName = 'CPF'
    end
    object sqlPesquisaBaseCNPJ: TIntegerField
      FieldName = 'CNPJ'
    end
  end
  inherited sqlExcluiBase: TSQLQuery
    Params = <
      item
        DataType = ftString
        Name = 'PID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'DELETE FROM'
      '  CLIENTE_EMPRESA'
      'WHERE'
      '  ID = :PID')
  end
end
