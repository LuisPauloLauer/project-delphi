unit uLibGeralModel;

interface
  uses
    SysUtils;

  type
    TLibGeralModel = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    function PadL(cTxt:string;nTam:integer;cCar:char = ' '):string;
    { public declarations }
  published
    { published declarations }
  end;

implementation

{ TLibGeralModel }

function TLibGeralModel.PadL(cTxt: string; nTam: integer; cCar: char): string;
var cAux:string;
begin
  cAux := stringofchar(cCar,nTam)+cTxt;
  result := copy(cAux,length(cAux)-nTam+1,nTam);
end;

end.
