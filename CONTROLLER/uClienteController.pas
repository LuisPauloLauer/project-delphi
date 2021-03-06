unit uClienteController;

interface
uses
  uClienteModel, System.SysUtils, System.Classes;

  type
    TClienteController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    procedure CarregarCliente(oCliente: TClienteModel; pCodigo: string);
    function InserirCliente(oCliente: TClienteModel; var sErro: string): Boolean;
    function AlterarCliente(oCliente: TClienteModel; var sErro: string): Boolean;
    { public declarations }
  published
    { published declarations }
  end;

implementation
uses
  uDmCliente;

{ TClienteController }

function TClienteController.AlterarCliente(oCliente: TClienteModel;
  var sErro: string): Boolean;
begin
  Result := dmCliente.AlterarCliente(oCliente,sErro);
end;

procedure TClienteController.CarregarCliente(oCliente: TClienteModel;
  pCodigo: string);
begin
  dmCliente.CarregarCliente(oCliente,pCodigo);
end;

function TClienteController.InserirCliente(oCliente: TClienteModel;
  var sErro: string): Boolean;
begin
  Result := dmCliente.InserirCliente(oCliente,sErro);
end;

end.
