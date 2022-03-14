unit uDmLibGeral;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TdmLibGeral = class(TDataModule)
    sqlPesquisaCidade: TSQLQuery;
    sqlPesquisaCidadeCIDADE: TStringField;
    sqlPesquisaCidadeNOME: TStringField;
    sqlPesquisaEstado: TSQLQuery;
    sqlPesquisaEstadoESTADO: TStringField;
    sqlPesquisaEstadoNOME: TStringField;
    sqlPesquisaPais: TSQLQuery;
    sqlPesquisaPaisPAIS: TStringField;
    sqlPesquisaPaisNOME: TStringField;
  private
    { Private declarations }
  public
    function PesquisaDadosTabela(pColunas: TStringList; pTabela: string; pPKTabela: string; pCodigoTabela: string): TStringList;
    function PesquisarPais(pCidade: string): TStringList;
    function PesquisarEstado(pCidade: string): TStringList;
    function PesquisarCidade(pCidade: string): TStringList;
    { Public declarations }
  end;

var
  dmLibGeral: TdmLibGeral;

implementation

uses
  uDmConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmLibGeral }

function TdmLibGeral.PesquisaDadosTabela(pColunas: TStringList; pTabela: string;
  pPKTabela: string; pCodigoTabela: string): TStringList;
var
  sqlPesqTabela : TSQLDataSet;
  sColunas : TStringList;
  sColunasSql : TStringList;
  sColunasResultado : TStringList;
  nI : Integer;
begin
  sqlPesqTabela := TSQLDataSet.Create(nil);
  sColunas := TStringList.Create;
  sColunas.Clear;
  sColunas := pColunas;
  sColunasSql := TStringList.Create;
  sColunasSql.Clear;
  sColunasResultado := TStringList.Create;
  sColunasResultado.Clear;

  try
    for nI := 0 to sColunas.Count-1 do
    begin
      if nI <> sColunas.Count-1 then
        sColunasSql.Add(sColunas[nI]+',')
      else
        sColunasSql.Add(sColunas[nI]);
    end;

    with sqlPesqTabela do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'SELECT '+
                        sColunasSql.Text+
                     'FROM '+
                        pTabela+
                      'WHERE '+
                        pPKTabela+' = '+pCodigoTabela;
      Close;
      Open;

      if (not sqlPesqTabela.IsEmpty) then
      begin
        for nI := 0 to sqlPesqTabela.Fields.Count-1 do
        begin
          Case sqlPesqTabela.Fields[nI].DataType of
            ftString: sColunasResultado.Add(sqlPesqTabela.Fields[nI].AsString);
            ftInteger: sColunasResultado.Add(IntToStr(sqlPesqTabela.Fields[nI].AsInteger));
          End;
        end;

        Result := sColunasResultado;
      end
      else
      begin
        Result := sColunasResultado;
      end

    end;
  finally
    FreeAndNil(sqlPesqTabela);
    FreeAndNil(sColunas);
    FreeAndNil(sColunasSql);
    FreeAndNil(sColunasResultado);
  end;
end;

function TdmLibGeral.PesquisarCidade(pCidade: string): TStringList;
var
  sCidade : TStringList;
begin
  with sqlPesquisaCidade do
  begin
    sCidade := TStringList.Create;
    sCidade.Clear;
    Close;
    ParamByName('PCIDADE').AsString := pCidade;
    Open;
    First;

    if (not sqlPesquisaCidade.IsEmpty) then
    begin
      sCidade.Add(sqlPesquisaCidade.FieldByName('CIDADE').AsString);
      sCidade.Add(sqlPesquisaCidade.FieldByName('NOME').AsString);
      Result := sCidade;
    end
    else
    begin
      Result := sCidade;
    end

  end;
end;

function TdmLibGeral.PesquisarEstado(pCidade: string): TStringList;
var
  sEstado : TStringList;
begin
  with sqlPesquisaEstado do
  begin
    sEstado := TStringList.Create;
    sEstado.Clear;
    Close;
    ParamByName('PCIDADE').AsString := pCidade;
    Open;
    First;

    if (not sqlPesquisaEstado.IsEmpty) then
    begin
      sEstado.Add(sqlPesquisaEstado.FieldByName('ESTADO').AsString);
      sEstado.Add(sqlPesquisaEstado.FieldByName('NOME').AsString);
      Result := sEstado;
    end
    else
    begin
      Result := sEstado;
    end

  end;
end;

function TdmLibGeral.PesquisarPais(pCidade: string): TStringList;
var
  sPais : TStringList;
begin
  with sqlPesquisaPais do
  begin
    sPais := TStringList.Create;
    sPais.Clear;
    Close;
    ParamByName('PCIDADE').AsString := pCidade;
    Open;
    First;

    if (not sqlPesquisaPais.IsEmpty) then
    begin
      sPais.Add(sqlPesquisaPais.FieldByName('PAIS').AsString);
      sPais.Add(sqlPesquisaPais.FieldByName('NOME').AsString);
      Result := sPais;
    end
    else
    begin
      Result := sPais;
    end

  end;
end;

end.
