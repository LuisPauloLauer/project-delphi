object dmLibGeral: TdmLibGeral
  OldCreateOrder = False
  Height = 254
  Width = 423
  object sqlPesquisaCidade: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  CID.ID AS CIDADE,'
      '  CID.NOME'
      'FROM'
      '  CIDADE CID'
      'WHERE'
      '  CID.ID = :PCIDADE')
    SQLConnection = dmConexao.sqlConexao
    Left = 40
    Top = 24
    object sqlPesquisaCidadeCIDADE: TStringField
      FieldName = 'CIDADE'
      Required = True
      Size = 10
    end
    object sqlPesquisaCidadeNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 300
    end
  end
  object sqlPesquisaEstado: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      #9'CID.ESTADO,'
      '  UF.NOME'
      'FROM'
      '  CIDADE CID'
      'INNER JOIN'
      #9'ESTADO UF ON CID.ESTADO = UF.ID'
      '  AND CID.ID = :PCIDADE')
    SQLConnection = dmConexao.sqlConexao
    Left = 136
    Top = 24
    object sqlPesquisaEstadoESTADO: TStringField
      FieldName = 'ESTADO'
      Required = True
      Size = 2
    end
    object sqlPesquisaEstadoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 200
    end
  end
  object sqlPesquisaPais: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      #9'CID.PAIS,'
      '  P.NOME'
      'FROM'
      #9'CIDADE CID'
      'INNER JOIN'
      #9'PAIS P ON CID.PAIS = P.ID'
      '  AND CID.ID = :PCIDADE')
    SQLConnection = dmConexao.sqlConexao
    Left = 224
    Top = 24
    object sqlPesquisaPaisPAIS: TStringField
      FieldName = 'PAIS'
      Required = True
      Size = 4
    end
    object sqlPesquisaPaisNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 200
    end
  end
end
