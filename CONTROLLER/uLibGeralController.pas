unit uLibGeralController;

interface
uses
  System.SysUtils, System.Classes;

type TLibGeralController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    function PesquisaDadosTabela(pColunas: TStringList; pTabela: string; pPKTabela: string; pCodigoTabela: string): TStringList;
    function PesquisarPais(pCidade: string): TStringList;
    function PesquisarEstado(pCidade: string): TStringList;
    function PesquisarCidade(pCidade: string): TStringList;
    function PadL(cTxt:string;nTam:integer;cCar:char = ' '):string;
    { public declarations }
  published
    { published declarations }
  end;

implementation

uses
  uDmLibGeral, uLibGeralModel;

{ TLibGeralController }

function TLibGeralController.PadL(cTxt: string; nTam: integer;
  cCar: char): string;
var
  oLibGeralModel : TLibGeralModel;
begin
  oLibGeralModel := TLibGeralModel.Create;

  Result := oLibGeralModel.PadL(cTxt, nTam, cCar);
end;

function TLibGeralController.PesquisaDadosTabela(pColunas: TStringList;pTabela: string;
  pPKTabela: string; pCodigoTabela: string): TStringList;
begin
  Result := dmLibGeral.PesquisaDadosTabela(pColunas,pTabela,pPKTabela,pCodigoTabela);
end;

function TLibGeralController.PesquisarCidade(pCidade: string): TStringList;
begin
  Result := dmLibGeral.PesquisarCidade(pCidade);
end;

function TLibGeralController.PesquisarEstado(pCidade: string): TStringList;
begin
  Result := dmLibGeral.PesquisarEstado(pCidade);
end;

function TLibGeralController.PesquisarPais(pCidade: string): TStringList;
begin
  Result := dmLibGeral.PesquisarPais(pCidade);
end;

end.
