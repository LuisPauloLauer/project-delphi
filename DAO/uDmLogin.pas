unit uDmLogin;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TdmLogin = class(TDataModule)
  private
    { Private declarations }
  public
    function verificaAcessoLogin(pUsuario, pSenha:string):Boolean;
    { Public declarations }
  end;

var
  dmLogin: TdmLogin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDmConexao;

{$R *.dfm}

{ TdmLogin }

function TdmLogin.verificaAcessoLogin(pUsuario, pSenha : string): Boolean;
var
  sqlverificaAcessoLogin : TSQLDataSet;
begin
  sqlverificaAcessoLogin := TSQLDataSet.Create(nil);
  try
    with  sqlverificaAcessoLogin do
    begin
      SQLConnection := dmConexao.sqlConexao;
      CommandText := 'SELECT NOME FROM USUARIO WHERE ID = '+QuotedStr(pUsuario)+' AND SENHA = '+QuotedStr(pSenha)+'';
      if Active then
        Close;
      Open;
      if (sqlverificaAcessoLogin.IsEmpty = True) then
      begin
        Result := False;
      end
      else
      begin
        Result := True;
      end;

    end;
  finally
     FreeAndNil(sqlverificaAcessoLogin);
  end;

end;

end.
