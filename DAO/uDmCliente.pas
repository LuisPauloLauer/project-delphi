unit uDmCliente;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, uClienteModel;

type
  TdmCliente = class(TDataModule)
    sqlAlterar: TSQLQuery;
    sqlInserir: TSQLQuery;
  private
    function GerarID: integer;
    { Private declarations }
  public
    procedure CarregarCliente(oCliente:TClienteModel;pCodigo: string);
    function InserirCliente(oCliente:TClienteModel; out sErro: String):Boolean;
    function AlterarCliente(oCliente:TClienteModel; out sErro: String):Boolean;
    { Public declarations }
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDmConexao;

{$R *.dfm}

{ TdmCliente }

function TdmCliente.AlterarCliente(oCliente: TClienteModel;
  out sErro: String): Boolean;
begin

  with sqlAlterar, oCliente do
  begin
    Params[0].AsString    := oCliente.Nome;
    Params[1].AsString    := oCliente.Endereco;
    Params[2].AsInteger   := oCliente.Numero;
    Params[3].AsString    := oCliente.Complemento;
    Params[4].AsString    := oCliente.Bairro;
    Params[5].AsInteger   := oCliente.Cep;
    Params[6].AsString   := oCliente.Cidade;
    Params[7].AsString    := oCliente.Estado;
    Params[8].AsString    := oCliente.Pais;
    Params[9].AsInteger   := oCliente.Telefone1;
    Params[10].AsInteger  := oCliente.Telefone2;
    Params[11].AsString   := oCliente.Email;
    Params[12].AsInteger  := oCliente.Cpf;
    Params[13].AsInteger  := oCliente.Cnpj;
    Params[14].AsString   := oCliente.Id;

    try
      ExecSQL();
      Result := True;

    except on E: Exception do
      begin
        sErro := 'Ocorreu erro ao alterar o clinte:'+ sLineBreak+E.Message;
        Result := False;
      end;
    end;

  end;

end;

procedure TdmCliente.CarregarCliente(oCliente: TClienteModel; pCodigo: String);
var
  sqlCliente : TSQLQuery;
begin
  sqlCliente := TSQLQuery.Create(nil);
  try
    with sqlCliente do
    begin
      SQLConnection := dmConexao.sqlConexao;
      SQL.Text := 'SELECT * FROM CLIENTE_EMPRESA WHERE ID = '+pCodigo;
      Close;
      Open;

      with oCliente do
      begin
        Id          :=  FieldByName('ID').AsString;

        if (UpperCase(FieldByName('TIPO').AsString) = 'CL') then
          Tipo      := 'Cliente'
        else if (UpperCase(FieldByName('TIPO').AsString) = 'FR') then
          Tipo      := 'Fornecedor';

        Nome        :=  FieldByName('NOME').AsString;
        Endereco    :=  FieldByName('ENDERECO').AsString;
        Numero      :=  FieldByName('NUMERO').AsInteger;
        Complemento :=  FieldByName('COMPLEMENTO').AsString;
        Bairro      :=  FieldByName('BAIRRO').AsString;
        Cep         :=  FieldByName('CEP').AsInteger;
        Cidade      :=  FieldByName('CIDADE').AsString;
        Estado      :=  FieldByName('ESTADO').AsString;
        Pais        :=  FieldByName('PAIS').AsString;
        Telefone1   :=  FieldByName('TELEFONE1').AsInteger;
        Telefone2   :=  FieldByName('TELEFONE2').AsInteger;
        Email       :=  FieldByName('EMAIL').AsString;
        Cpf         :=  FieldByName('CPF').AsInteger;
        Cnpj        :=  FieldByName('CNPJ').AsInteger;
      end;

    end;

  finally
    FreeAndNil(sqlCliente);
  end;

end;

function TdmCliente.GerarID: integer;
var
  sqlNextCodigoId : TSQLDataSet;
begin
  sqlNextCodigoId := TSQLDataSet.Create(nil);
  try
    with sqlNextCodigoId do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'SELECT COALESCE(MAX(ID),0)+1 AS CODIGO FROM CLIENTE_EMPRESA';
      Close;
      Open;

      Result := FieldByName('CODIGO').AsInteger;
    end;

  finally
    FreeAndNil(sqlNextCodigoId);
  end;

end;

function TdmCliente.InserirCliente(oCliente: TClienteModel;
  out sErro: String): Boolean;
begin

  with sqlInserir, oCliente do
  begin
    oCliente.Id             := IntToStr(gerarID);
    Params[0].AsString      := oCliente.Id;

    if (UpperCase(oCliente.Tipo) = 'CLIENTE') then
      Params[1].AsString    := 'CL'
    else if (UpperCase(oCliente.Tipo) = 'FORNECEDOR') then
      Params[1].AsString    := 'FR';

    Params[2].AsString      := oCliente.Nome;
    Params[3].AsString      := oCliente.Endereco;
    Params[4].AsInteger     := oCliente.Numero;
    Params[5].AsString      := oCliente.Complemento;
    Params[6].AsString      := oCliente.Bairro;
    Params[7].AsInteger     := oCliente.Cep;
    Params[8].AsString      := oCliente.Cidade;
    Params[9].AsString      := oCliente.Estado;
    Params[10].AsString     := oCliente.Pais;
    Params[11].AsInteger    := oCliente.Telefone1;
    Params[12].AsInteger    := oCliente.Telefone2;
    Params[13].AsString     := oCliente.Email;
    Params[14].AsInteger    := oCliente.Cpf;
    Params[15].AsInteger    := oCliente.Cnpj;

    try
      ExecSQL();
      Result := True;

    except on E: Exception do
      begin
        sErro := 'Ocorreu erro ao inserir o clinte: '+ sLineBreak+E.Message;
        Result := False;
      end;
    end;

  end;

end;

end.
