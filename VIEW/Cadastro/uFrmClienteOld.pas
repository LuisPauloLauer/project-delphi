unit uFrmClienteOld;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  Toperacao = (opIncluir, opAlterar, opNavegar);

  TfrmClienteOld = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pgcCliente: TPageControl;
    tbsPesquisa: TTabSheet;
    tbsDados: TTabSheet;
    pnlFiltro: TPanel;
    edPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnl: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    lblEndereco: TLabel;
    lblTipo: TLabel;
    lblCodigo: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblNome: TLabel;
    lblNumero: TLabel;
    edCodigo: TEdit;
    pnlDadosCodigo: TPanel;
    cbTipo: TComboBox;
    lblNomeCodigo: TLabel;
    edNome: TEdit;
    edEndereco: TEdit;
    edNumero: TEdit;
    edComplemento: TEdit;
    edBairro: TEdit;
    pnlDadosCadastro: TPanel;
    lblCep: TLabel;
    edCep: TEdit;
    lblCidade: TLabel;
    edCidade: TEdit;
    lblCidadeNome: TLabel;
    lblEstadoCodigo: TLabel;
    lblEstado: TLabel;
    lblEstadoNome: TLabel;
    lblPais: TLabel;
    lblPaisCodigo: TLabel;
    lblPaisNome: TLabel;
    lblTel1: TLabel;
    edTel1: TEdit;
    lblTel2: TLabel;
    edTel2: TEdit;
    lblEmail: TLabel;
    edEmail: TEdit;
    lblCPF: TLabel;
    edCPF: TEdit;
    lblCNPJ: TLabel;
    edCNPJ: TEdit;
    pnlDadosAcao: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure edCidadeChange(Sender: TObject);
  private
    Foperacao: Toperacao;
    procedure DadosPadrao;
    procedure Incluir;
    procedure Detalhar;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(pOperacao : Toperacao; pNovo: Boolean = False);
    procedure PesquisarEstado;
    procedure PesquisarPais;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteOld: TfrmClienteOld;

implementation
uses
  uClienteController, uClienteModel, uDmCliente;

{$R *.dfm}

procedure TfrmClienteOld.Alterar;
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
      Id := StrToIntDef(edCodigo.Text,0);
      Tipo := cbTipo.Text;
      Nome := edNome.Text;
      Endereco := edEndereco.Text;
      Numero := StrToInt(edNumero.Text);
      Complemento := edComplemento.Text;
      Bairro := edBairro.Text;
      Cep := StrToInt(edCep.Text);
      Cidade := StrToInt(edCidade.Text);
      Estado := lblEstadoCodigo.Caption;
      Pais  := lblPaisCodigo.Caption;
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

procedure TfrmClienteOld.btnAlterarClick(Sender: TObject);
begin
  Foperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TfrmClienteOld.btnCancelarClick(Sender: TObject);
begin
  if Foperacao = opIncluir then
    HabilitarControles(opNavegar,True)
  else
    HabilitarControles(opNavegar);
end;

procedure TfrmClienteOld.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmClienteOld.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmClienteOld.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClienteOld.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TfrmClienteOld.btnNovoClick(Sender: TObject);
begin
  Incluir;
end;

procedure TfrmClienteOld.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmClienteOld.btnSalvarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TfrmClienteOld.CarregarCliente;
var
  oClienteModel : TClienteModel;
  oClienteController : TClienteController;
begin
  oClienteModel := TClienteModel.Create;
  oClienteController := TClienteController.Create;

  try
    oClienteController.CarregarCliente(oClienteModel, dsPesquisa.DataSet.FieldByName('ID').AsInteger);
    with oClienteModel do
    begin
      edCodigo.Text := IntToStr(Id);
      cbTipo.Text := Tipo;
      lblNomeCodigo.Caption := Nome;
      edNome.Text := Nome;
      edEndereco.Text := Endereco;
      edNumero.Text := IntToStr(Numero);
      edComplemento.Text := Complemento;
      edBairro.Text := Bairro;
      edCep.Text := IntToStr(Cep);
      edCidade.Text := IntToStr(Cidade);
      lblEstadoCodigo.Caption := Estado;
      lblPaisCodigo.Caption := Pais;
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

procedure TfrmClienteOld.DadosPadrao;
begin
  pgcCliente.ActivePage := tbsPesquisa;
  tbsPesquisa.TabVisible := True;
  tbsDados.TabVisible := False;
  btnDetalhar.Enabled := False;
  btnExcluir.Enabled := False;
end;

procedure TfrmClienteOld.dbgPesquisaDblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TfrmClienteOld.Detalhar;
begin
  CarregarCliente;
  Foperacao := opNavegar;
  pgcCliente.ActivePage := tbsDados;
  HabilitarControles(opNavegar);
end;

procedure TfrmClienteOld.edCidadeChange(Sender: TObject);
begin
  if (edCidade.Text <> EmptyStr) then
  begin
    PesquisarEstado;
    PesquisarPais;
  end;
end;

procedure TfrmClienteOld.Excluir;
var
  oClienteController : TClienteController;
  sErro : string;
begin
  oClienteController := TClienteController.Create;

  try
    if ((dmCliente.cdsPesquisar.Active) and (dmCliente.cdsPesquisar.RecordCount > 0)) then
    begin
      if MessageDlg('Deseja realmente excluir este cliente?',mtConfirmation,[mbYes,mbNo],0) = IDYES then
      begin
        if (oClienteController.ExcluirCliente(dmCliente.cdsPesquisarID.AsInteger,sErro) = False) then
        begin
          raise Exception.Create(sErro);
          oClienteController.PesquisarCliente(edPesquisar.Text);
        end
        else
          ShowMessage('Cliente exclu?do com sucesso');
      end;
    end
    else
      raise Exception.Create('N?o h? registro para excluir');

  finally
    FreeAndNil(oClienteController);
  end;

end;

procedure TfrmClienteOld.FormCreate(Sender: TObject);
begin
  dmCliente := TdmCliente.Create(nil);
  DadosPadrao;
end;

procedure TfrmClienteOld.FormDestroy(Sender: TObject);
begin
  FreeAndNil(dmCliente);
end;

procedure TfrmClienteOld.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmClienteOld.Gravar;
var
  oClienteController : TClienteController;
begin
  oClienteController := TClienteController.Create;

  try

    case Foperacao of
      opIncluir: Inserir;
      opAlterar: Alterar;
    end;

    oClienteController.PesquisarCliente(edPesquisar.Text);

  finally
    FreeAndNil(oClienteController);
  end;

end;

procedure TfrmClienteOld.HabilitarControles(pOperacao: Toperacao; pNovo: Boolean = False);
begin
  case pOperacao of
    opIncluir , opAlterar:
    begin
      if pNovo then
      begin
        edCodigo.Text := EmptyStr;
        cbTipo.Text := EmptyStr;
        lblNomeCodigo.Caption := EmptyStr;
        edNome.Text := EmptyStr;
        edEndereco.Text := EmptyStr;
        edNumero.Text := EmptyStr;
        edComplemento.Text := EmptyStr;
        edBairro.Text := EmptyStr;
        edCep.Text := EmptyStr;
        edCidade.Text := EmptyStr;
        lblEstadoCodigo.Caption := EmptyStr;
        lblPaisCodigo.Caption := EmptyStr;
        edTel1.Text := EmptyStr;
        edTel2.Text := EmptyStr;
        edEmail.Text := EmptyStr;
        edCPF.Text := EmptyStr;
        edCNPJ.Text := EmptyStr;
      end;

      cbTipo.Enabled :=  True;
      lblNomeCodigo.Enabled := True;
      edNome.Enabled := True;
      edEndereco.Enabled := True;
      edNumero.Enabled := True;
      edComplemento.Enabled := True;
      edBairro.Enabled := True;
      edCep.Enabled := True;
      edCidade.Enabled := True;
      lblEstadoCodigo.Enabled := True;
      lblPaisCodigo.Enabled := True;
      edTel1.Enabled := True;
      edTel2.Enabled := True;
      edEmail.Enabled := True;
      edCPF.Enabled := True;
      edCNPJ.Enabled := True;
      ///
      btnListar.Enabled := False;
      btnAlterar.Enabled := False;
      btnFechar.Enabled := False;
      ////
      btnSalvar.Enabled := True;
      btnCancelar.Enabled := True;

    end;
    opNavegar:
    begin
      cbTipo.Enabled :=  False;
      lblNomeCodigo.Enabled := True;
      edNome.Enabled := False;
      edEndereco.Enabled := False;
      edNumero.Enabled := False;
      edComplemento.Enabled := False;
      edBairro.Enabled := False;
      edCep.Enabled := False;
      edCidade.Enabled := False;
      lblEstadoCodigo.Enabled := True;
      lblPaisCodigo.Enabled := True;
      edTel1.Enabled := False;
      edTel2.Enabled := False;
      edEmail.Enabled := False;
      edCPF.Enabled := False;
      edCNPJ.Enabled := False;
      ///
      btnFechar.Enabled := True;
      btnListar.Enabled := True;
      if not(pNovo) then
        btnAlterar.Enabled := True;
      ////
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;

    end;
  end;
end;

procedure TfrmClienteOld.Incluir;
begin
  Foperacao := opIncluir;
  pgcCliente.ActivePage := tbsDados;
  HabilitarControles(opIncluir,True);
end;

procedure TfrmClienteOld.Inserir;
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
        Id := 0;
        Tipo := cbTipo.Text;
        Nome := edNome.Text;
        Endereco := edEndereco.Text;
        Numero := StrToInt(edNumero.Text);
        Complemento := edComplemento.Text;
        Bairro := edBairro.Text;
        Cep := StrToInt(edCep.Text);
        Cidade := StrToInt(edCidade.Text);
        Estado := lblEstadoCodigo.Caption;
        Pais  := lblPaisCodigo.Caption;
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

procedure TfrmClienteOld.Listar;
begin
  pgcCliente.ActivePage := tbsPesquisa;
end;

procedure TfrmClienteOld.Pesquisar;
var
  oClienteController : TClienteController;
begin
  oClienteController := TClienteController.Create;
 { try
    if oClienteController.Pesquisar(edPesquisar.Text) then
    begin
       btnDetalhar.Enabled := True;
       btnExcluir.Enabled := True;
    end
    else
    begin
      btnDetalhar.Enabled := False;
      btnExcluir.Enabled := False;
      ShowMessage('Nenhum Cliente cadastrado!');
    end;


  finally
    FreeAndNil(oClienteController);
  end;  }
end;

procedure TfrmClienteOld.PesquisarEstado;
var
  oClienteController : TClienteController;
  sEstado : TStringList;
begin
  oClienteController := TClienteController.Create;
  sEstado := TStringList.Create;
  try
    {sEstado.Clear;
    sEstado := oClienteController.PesquisarEstado(StrToInt(edCidade.Text));

    if sEstado.Count > 0 then
    begin
      lblEstadoCodigo.Caption := sEstado[0];
      lblEstadoNome.Caption := sEstado[1];
    end
    else
    begin
      lblEstadoCodigo.Caption := 'lblEstadoCodigo';
      lblEstadoNome.Caption := 'lblEstadoNome';
    end;  }

  finally
    FreeAndNil(oClienteController);
    FreeAndNil(sEstado);
  end;

end;

procedure TfrmClienteOld.PesquisarPais;
var
  oClienteController : TClienteController;
  sPais : TStringList;
begin
  oClienteController := TClienteController.Create;
  sPais := TStringList.Create;
  try
    {sPais.Clear;
    sPais := oClienteController.PesquisarPais(StrToInt(edCidade.Text));

    if sPais.Count > 0 then
    begin
      lblPaisCodigo.Caption := sPais[0];
      lblPaisNome.Caption := sPais[1];
    end
    else
    begin
      lblPaisCodigo.Caption := 'lblPaisCodigo';
      lblPaisNome.Caption := 'lblPaisNome';
    end;    }

  finally
    FreeAndNil(oClienteController);
    FreeAndNil(sPais);
  end;

end;

end.
