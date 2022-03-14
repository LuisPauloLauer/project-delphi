unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr;

type
  TdmConexao = class(TDataModule)
    sqlConexao: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  if sqlConexao.Connected = False then
  begin
    //sqlConexao.ConnectionName := 'MySQLConnection';
    //sqlConexao.DriverName := 'MySQL';
    //sqlConexao.KeepConnection := True;
    //sqlConexao.LoadParamsOnConnect := False;
    //sqlConexao.LoginPrompt := False;
    //sqlConexao.Params[1] := 'localhost';
    //sqlConexao.Params[2] := 'delphi_aula';
    //sqlConexao.Params[3] := 'root';
    //sqlConexao.Params[4] := EmptyStr;
    sqlConexao.Connected := True;
  end;
end;

end.
