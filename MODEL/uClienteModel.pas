unit uClienteModel;

interface
  uses
    SysUtils, uLibGeralController;

  type
    TClienteModel = class
  private
      oLibGeralController : TLibGeralController;
      FId: string;
      FTipo: String;
      FNome: String;
      FEndereco: String;
      FNumero: Integer;
      FComplemento: String;
      FBairro: String;
      FCep: Integer;
      FCidade: string;
      FEstado: String;
      FPais: String;
      FTelefone1: Integer;
      FTelefone2: Integer;
      FEmail: String;
      FCpf: Integer;
      FCnpj: Integer;
    procedure SetBairro(const Value: String);
    procedure SetCep(const Value: Integer);
    procedure SetCidade(const Value: string);
    procedure SetCnpj(const Value: Integer);
    procedure SetComplemento(const Value: String);
    procedure SetCpf(const Value: Integer);
    procedure SetEmail(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetEstado(const Value: String);
    procedure SetId(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetNumero(const Value: Integer);
    procedure SetPais(const Value: String);
    procedure SetTelefone1(const Value: Integer);
    procedure SetTelefone2(const Value: Integer);
    procedure SetTipo(const Value: String);
    function getBairro: String;
    function getcCnpj: Integer;
    function getCep: Integer;
    function getCidade: string;
    function getComplemento: String;
    function getCpf: Integer;
    function getEmail: String;
    function getEndereco: String;
    function getEstado: String;
    function getId: string;
    function getNome: String;
    function getNumero: Integer;
    function getPais: String;
    function getTelefone1: Integer;
    function getTelefone2: Integer;
    function getTipo: String;
    constructor Create;
    destructor Destroy;
  protected
    { protected declarations }
  public
    Property Id: String read getId write SetId;
    Property Tipo: String read getTipo write SetTipo;
    Property Nome: String read getNome write SetNome;
    Property Endereco: String read getEndereco write SetEndereco;
    Property Numero: Integer read getNumero write SetNumero;
    Property Complemento: String read getComplemento write SetComplemento;
    Property Bairro: String read getBairro write SetBairro;
    Property Cep: Integer read getCep write SetCep;
    Property Cidade: string read getCidade write SetCidade;
    Property Estado: String read getEstado write SetEstado;
    Property Pais: String read getPais write SetPais;
    Property Telefone1: Integer read getTelefone1 write SetTelefone1;
    Property Telefone2: Integer read getTelefone2 write SetTelefone2;
    Property Email: String read getEmail write SetEmail;
    Property Cpf: Integer read getCpf write SetCpf;
    Property Cnpj: Integer read getcCnpj write SetCnpj;
    { public declarations }
  published
    { published declarations }
  end;

implementation

{ TCliente }

constructor TClienteModel.Create;
begin
  oLibGeralController := TLibGeralController.Create;
end;

destructor TClienteModel.Destroy;
begin
  FreeAndNil(oLibGeralController);
end;

function TClienteModel.getBairro: String;
begin
  Result := FBairro;
end;

function TClienteModel.getcCnpj: Integer;
begin
  Result := FCnpj
end;

function TClienteModel.getCep: Integer;
begin
  Result := FCep
end;

function TClienteModel.getCidade: string;
begin
  Result := oLibGeralController.PadL(Trim(FCidade),10,'0');
end;

function TClienteModel.getComplemento: String;
begin
  Result := FComplemento
end;

function TClienteModel.getCpf: Integer;
begin
  Result := FCpf
end;

function TClienteModel.getEmail: String;
begin
  Result := FEmail
end;

function TClienteModel.getEndereco: String;
begin
  Result := FEndereco
end;

function TClienteModel.getEstado: String;
begin
  Result := FEstado
end;

function TClienteModel.getId: string;
begin
  Result := oLibGeralController.PadL(Trim(FId),10,'0');
end;

function TClienteModel.getNome: String;
begin
   Result := FNome
end;

function TClienteModel.getNumero: Integer;
begin
  Result := FNumero
end;

function TClienteModel.getPais: String;
begin
  Result := FPais
end;

function TClienteModel.getTelefone1: Integer;
begin
  Result := FTelefone1
end;

function TClienteModel.getTelefone2: Integer;
begin
  Result := FTelefone2
end;

function TClienteModel.getTipo: String;
begin
  if (UpperCase(FTipo) = 'CL') then
    Result := 'Cliente'
  else if (UpperCase(FTipo)  = 'FR') then
    Result := 'Fornecedor';
end;

procedure TClienteModel.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TClienteModel.SetCep(const Value: Integer);
begin
  FCep := Value;
end;

procedure TClienteModel.SetCidade(const Value: string);
begin
  FCidade := oLibGeralController.PadL(Trim(Value),10,'0');
end;

procedure TClienteModel.SetCnpj(const Value: Integer);
begin
  FCnpj := Value;
end;

procedure TClienteModel.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TClienteModel.SetCpf(const Value: Integer);
begin
  FCpf := Value;
end;

procedure TClienteModel.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TClienteModel.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TClienteModel.SetEstado(const Value: String);
begin
  FEstado := Value;
end;

procedure TClienteModel.SetId(const Value: String);
begin
  FId := oLibGeralController.PadL(Trim(Value),10,'0');
end;

procedure TClienteModel.SetNome(const Value: String);
begin
  //if Value = EmptyStr then
  //  raise EArgumentException.Create('Nome precisa ser preenchido!');
  FNome := Value;
end;

procedure TClienteModel.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TClienteModel.SetPais(const Value: String);
begin
  FPais := Value;
end;

procedure TClienteModel.SetTelefone1(const Value: Integer);
begin
  FTelefone1 := Value;
end;

procedure TClienteModel.SetTelefone2(const Value: Integer);
begin
  FTelefone2 := Value;
end;

procedure TClienteModel.SetTipo(const Value: String);
begin
  if (UpperCase(Value)  = 'CLIENTE') then
    FTipo := 'CL'
  else if (UpperCase(Value)  = 'FORNECEDOR') then
    FTipo := 'FR';
end;

end.
