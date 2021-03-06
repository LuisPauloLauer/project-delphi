unit uFrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  uNovosComponentes;

type
  TfrmCliente = class(TfrmBase)
    lblNome: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblPais: TLabel;
    lblCNPJ: TLabel;
    lblCPF: TLabel;
    lblEmail: TLabel;
    lblTel2: TLabel;
    lblTel1: TLabel;
    lblEstado: TLabel;
    lblCidade: TLabel;
    lblCep: TLabel;
    lblBairro: TLabel;
    lblComplemento: TLabel;
    edNome: TMaskEdit;
    edEndereco: TMaskEdit;
    edNumero: TMaskEdit;
    edComplemento: TMaskEdit;
    edBairro: TMaskEdit;
    edCep: TMaskEdit;
    edCidade: TMaskEdit;
    edNomeCidade: TMaskEdit;
    edEstado: TMaskEdit;
    edNomeEstado: TMaskEdit;
    edPais: TMaskEdit;
    edNomePais: TMaskEdit;
    edTel1: TMaskEdit;
    edTel2: TMaskEdit;
    edEmail: TMaskEdit;
    edCPF: TMaskEdit;
    edCNPJ: TMaskEdit;
    cbTipo: TComboBox;
    sqlPesquisaBaseID: TStringField;
    sqlPesquisaBaseTIPO: TStringField;
    sqlPesquisaBaseNOME: TStringField;
    sqlPesquisaBaseCIDADE: TStringField;
    sqlPesquisaBaseESTADO: TStringField;
    sqlPesquisaBaseTELEFONE1: TIntegerField;
    sqlPesquisaBaseTELEFONE2: TIntegerField;
    sqlPesquisaBaseEMAIL: TStringField;
    sqlPesquisaBaseCPF: TIntegerField;
    sqlPesquisaBaseCNPJ: TIntegerField;
    cdsPesquisaBaseID: TStringField;
    cdsPesquisaBaseTIPO: TStringField;
    cdsPesquisaBaseNOME: TStringField;
    cdsPesquisaBaseCIDADE: TStringField;
    cdsPesquisaBaseESTADO: TStringField;
    cdsPesquisaBaseTELEFONE1: TIntegerField;
    cdsPesquisaBaseTELEFONE2: TIntegerField;
    cdsPesquisaBaseEMAIL: TStringField;
    cdsPesquisaBaseCPF: TIntegerField;
    cdsPesquisaBaseCNPJ: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDetalharPesquisaBaseClick(Sender: TObject);
    procedure dbgPesquisaBaseDblClick(Sender: TObject);
    procedure edCidadeChange(Sender: TObject);
    procedure btnSalvarDadosBaseClick(Sender: TObject);
    procedure edCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CarregarCliente;
    procedure InserirCliente;
    procedure AlterarCliente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation
uses
  uClienteController, uClienteModel, uDmCliente, uLibGeralController;

{$R *.dfm}

procedure TfrmCliente.AlterarCliente;
var
  oClienteModel : TClienteModel;
  oClienteController : TClienteController;
  sErro : string;
begin
  oClienteModel := TClienteModel.Create;
  oClienteController := TClienteController.Create;

  try
    with oClienteModel do
    begin
      Id := edCodigoDadosBase.Text;
      Tipo := cbTipo.Text;
      Nome := edNome.Text;
      Endereco := edEndereco.Text;
      Numero := StrToInt(edNumero.Text);
      Complemento := edComplemento.Text;
      Bairro := edBairro.Text;
      Cep := StrToInt(edCep.Text);
      Cidade := edCidade.Text;
      Estado := edEstado.Text;
      Pais  := edPais.Text;
      Telefone1 := StrToInt(edTel1.Text);
      Telefone2 := StrToInt(edTel2.Text);
      Email := edEmail.Text;
      Cpf := StrToInt(edCPF.Text);
      Cnpj := StrToInt(edCNPJ.Text);
    end;

    if (oClienteController.AlterarCliente(oClienteModel,sErro) = False) then
      raise Exception.Create(sErro)
    else
      ShowMessage('Cliente Alterado');

  finally
    FreeAndNil(oClienteModel);
    FreeAndNil(oClienteController)
  end;
end;

procedure TfrmCliente.btnDetalharPesquisaBaseClick(Sender: TObject);
begin
  CarregarCliente;
  inherited;
end;

procedure TfrmCliente.btnSalvarDadosBaseClick(Sender: TObject);
begin

  case Foperacao of
    opIncluir: InserirCliente;
    opAlterar: AlterarCliente;
  end;

  inherited;
end;

procedure TfrmCliente.CarregarCliente;
var
  oClienteModel : TClienteModel;
  oClienteController : TClienteController;
begin
  oClienteModel := TClienteModel.Create;
  oClienteController := TClienteController.Create;

  try
    oClienteController.CarregarCliente(oClienteModel, dsPesquisaBase.DataSet.FieldByName('ID').AsString);

    with oClienteModel do
    begin
      edCodigoDadosBase.Text := Id;
      edNomeCodigoDadosBase.Text := Nome;
      //Dados
      cbTipo.Text := Tipo;
      edNome.Text := Nome;
      edEndereco.Text := Endereco;
      edNumero.Text := IntToStr(Numero);
      edComplemento.Text := Complemento;
      edBairro.Text := Bairro;
      edCep.Text := IntToStr(Cep);
      edCidade.Text := Cidade;
      edEstado.Text:= Estado;
      edPais.Text := Pais;
      edTel1.Text := IntToStr(Telefone1);
      edTel2.Text := IntToStr(Telefone2);
      edEmail.Text := Email;
      edCPF.Text := IntToStr(Cpf);
      edCNPJ.Text := IntToStr(Cnpj);
    end;
  finally
     FreeAndNil(oClienteModel);
     FreeAndNil(oClienteController);
  end;
end;

procedure TfrmCliente.dbgPesquisaBaseDblClick(Sender: TObject);
begin
  CarregarCliente;
  inherited;
end;

procedure TfrmCliente.edCidadeChange(Sender: TObject);
var
  oLibGeralController : TLibGeralController;
  sPais : TStringList;
  sEstado : TStringList;
  sCidade : TStringList;
begin
  inherited;
  if (Trim(edCidade.Text) <> EmptyStr) then
  begin
    try
      oLibGeralController := TLibGeralController.Create;
      sPais := TStringList.Create;
      sEstado := TStringList.Create;
      sCidade := TStringList.Create;
      sPais.Clear;
      sEstado.Clear;
      sCidade.Clear;

      sPais := oLibGeralController.PesquisarPais(Trim(edCidade.Text));

      if sPais.Count > 0 then
      begin
        edPais.Text := sPais[0];
        edNomePais.Text := sPais[1];
      end
      else
      begin
        edPais.Text := EmptyStr;
        edNomePais.Text := EmptyStr;
      end;

      sEstado := oLibGeralController.PesquisarEstado(Trim(edCidade.Text));

      if sEstado.Count > 0 then
      begin
        edEstado.Text := sEstado[0];
        edNomeEstado.Text := sEstado[1];
      end
      else
      begin
        edEstado.Text := EmptyStr;
        edNomeEstado.Text := EmptyStr;
      end;

      sCidade := oLibGeralController.PesquisarCidade(Trim(edCidade.Text));

      if sCidade.Count > 0 then
      begin
        edNomeCidade.Text := sCidade[1];
      end
      else
      begin
        edNomeCidade.Text := EmptyStr;
      end;

    finally
      FreeAndNil(oLibGeralController);
      FreeAndNil(sPais);
      FreeAndNil(sEstado);
      FreeAndNil(sCidade);
    end;
  end;
end;

procedure TfrmCliente.edCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  oLibGeralController : TLibGeralController;
begin
  inherited;
  try
    oLibGeralController := TLibGeralController.Create;

    if key = VK_RETURN then
      edCidade.Text := oLibGeralController.PadL(Trim(edCidade.Text),10,'0');
  finally
    FreeAndNil(oLibGeralController);
  end;
end;

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  dmCliente := TdmCliente.Create(nil);
  inherited;
end;

procedure TfrmCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmCliente);
  inherited;
end;

procedure TfrmCliente.InserirCliente;
var
  oClienteModel : TClienteModel;
  oClienteController : TClienteController;
  sErro : string;
begin
  oClienteModel :=  TClienteModel.Create;
  oClienteController := TClienteController.Create;

  try
     with oClienteModel do
     begin
        Id := '0';
        Tipo := cbTipo.Text;
        Nome := edNome.Text;
        Endereco := edEndereco.Text;
        Numero := StrToInt(edNumero.Text);
        Complemento := edComplemento.Text;
        Bairro := edBairro.Text;
        Cep := StrToInt(edCep.Text);
        Cidade := edCidade.Text;
        Estado := edEstado.Text;
        Pais  := edPais.Text;
        Telefone1 :=  StrToInt(edTel1.Text);
        Telefone2 := StrToInt(edTel2.Text);
        Email := edEmail.Text;
        Cpf := StrToInt(edCPF.Text);
        Cnpj := StrToInt(edCNPJ.Text);
     end;

     if (oClienteController.InserirCliente(oClienteModel,sErro) = False) then
        raise Exception.Create(sErro)
     else
        ShowMessage('Cliente inserido com sucesso!');

  finally
    FreeAndNil(oClienteModel);
    FreeAndNil(oClienteController);
  end;
end;

end.
