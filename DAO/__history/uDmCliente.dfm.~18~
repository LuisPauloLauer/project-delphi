object dmCliente: TdmCliente
  OldCreateOrder = False
  Height = 234
  Width = 348
  object sqlAlterar: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PBAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESTADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPAIS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PTELEFONE1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PTELEFONE2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCPF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCNPJ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'UPDATE'
      '  CLIENTE_EMPRESA'
      'SET'
      '  NOME = :PNOME,'
      '  ENDERECO = :PENDERECO,'
      '  NUMERO = :PNUMERO,'
      '  COMPLEMENTO = :PCOMPLEMENTO,'
      '  BAIRRO = :PBAIRRO,'
      '  CEP = :PCEP,'
      '  CIDADE = :PCIDADE,'
      '  ESTADO = :PESTADO,'
      '  PAIS = :PPAIS,'
      '  TELEFONE1 = :PTELEFONE1,'
      '  TELEFONE2 = :PTELEFONE2,'
      '  EMAIL = :PEMAIL,'
      '  CPF = :PCPF,'
      '  CNPJ = :PCNPJ'
      'WHERE'
      '  ID = :PID')
    SQLConnection = dmConexao.sqlConexao
    Left = 80
    Top = 16
  end
  object sqlInserir: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PTIPO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCOMPLEMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PBAIRRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCEP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESTADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PPAIS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PTELEFONE1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PTELEFONE2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PEMAIL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCPF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCNPJ'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'INSERT INTO'
      '  CLIENTE_EMPRESA'
      
        '  (ID,TIPO,NOME,ENDERECO,NUMERO,COMPLEMENTO,BAIRRO,CEP,CIDADE,ES' +
        'TADO,PAIS,TELEFONE1,TELEFONE2,EMAIL,CPF,CNPJ)'
      'VALUES'
      
        '  (:PID,:PTIPO,:PNOME,:PENDERECO,:PNUMERO,:PCOMPLEMENTO,:PBAIRRO' +
        ',:PCEP,:PCIDADE,:PESTADO,:PPAIS,:PTELEFONE1,:PTELEFONE2,:PEMAIL,' +
        ':PCPF,:PCNPJ)')
    SQLConnection = dmConexao.sqlConexao
    Left = 24
    Top = 16
  end
end
