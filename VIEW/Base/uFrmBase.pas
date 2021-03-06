unit uFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd,
  Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr;

type
  Toperacao = (opIncluir, opAlterar, opExcluir, opSalvar, opNavegar);
  TopcaoPesquisa = (opID,opNOME);

  TfrmBase = class(TForm)
    pnlRodapeBase: TPanel;
    stbRodapeBase: TStatusBar;
    pnlCadastroBase: TPanel;
    pgcBase: TPageControl;
    tbsPesquisaBase: TTabSheet;
    tbsDadosBase: TTabSheet;
    pnlRodapeDadosBase: TPanel;
    btnFecharBase: TBitBtn;
    btnAlterarDadosBase: TBitBtn;
    btnSalvarDadosBase: TBitBtn;
    btnCancelarDadosBase: TBitBtn;
    btnListarDadosBase: TBitBtn;
    pnlRodapePesquisaBase: TPanel;
    btnIncluirPesquisaBase: TBitBtn;
    btnDetalharPesquisaBase: TBitBtn;
    btnExcluirPesquisaBase: TBitBtn;
    pgcDadosBase: TPageControl;
    tbsCapaDadosBase: TTabSheet;
    pnlCabecalhoDadosBase: TPanel;
    lblCodigoDadosBase: TLabel;
    edCodigoDadosBase: TMaskEdit;
    edNomeCodigoDadosBase: TMaskEdit;
    dsPesquisaBase: TDataSource;
    pnlCabecalhoPesquisaBase: TPanel;
    cbOpcaoPesquisaBase: TComboBox;
    lblOpcaoPesquisaBase: TLabel;
    lblConteudoPesquisaBase: TLabel;
    edConteudoPesquisaBase: TMaskEdit;
    btnPesquisarPesquisaBase: TBitBtn;
    dbgPesquisaBase: TDBGrid;
    dspPesquisaBase: TDataSetProvider;
    cdsPesquisaBase: TClientDataSet;
    sqlPesquisaBase: TSQLQuery;
    sqlExcluiBase: TSQLQuery;
    procedure btnFecharBaseClick(Sender: TObject);
    procedure btnPesquisarPesquisaBaseClick(Sender: TObject);
    procedure btnIncluirPesquisaBaseClick(Sender: TObject);
    procedure btnDetalharPesquisaBaseClick(Sender: TObject);
    procedure btnExcluirPesquisaBaseClick(Sender: TObject);
    procedure btnListarDadosBaseClick(Sender: TObject);
    procedure btnAlterarDadosBaseClick(Sender: TObject);
    procedure btnSalvarDadosBaseClick(Sender: TObject);
    procedure btnCancelarDadosBaseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPesquisaBaseDblClick(Sender: TObject);
    procedure cbOpcaoPesquisaBaseChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edConteudoPesquisaBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    //Foperacao: Toperacao;
    //FopcaoPesquisa : TopcaoPesquisa;
    bAchouDados : Boolean;
    procedure DadosPadraoBase;
    procedure DefineActivePageBase(pOperacao: Toperacao; pDetalhar : Boolean = False);
    procedure DefineStatusBarBase(pOperacao: Toperacao; pCancelar: Boolean = False);
    procedure HabilitaControlesDadosBase(pOperacao: Toperacao);
    procedure PesquisarBase;
    procedure HabilitaControlesRodapePesquisaBase(pAchou: Boolean; pFrmNome: string; pListar: Boolean = False);
    procedure IncluirBase;
    procedure HabilitaControlesRodapeDadosBase(pOperacao: Toperacao; pIncluir: Boolean = False);
    procedure DetalharBase;
    procedure ExcluirBase(pCodigo : TField);
    procedure ListarBase;
    procedure AlterarBase;
    procedure SalvarBase;
    procedure CancelarBase;
    { Private declarations }
  public
    Foperacao: Toperacao;
    FopcaoPesquisa : TopcaoPesquisa;
    { Public declarations }
  end;

var
  frmBase: TfrmBase;

implementation

uses
  uDmConexao, uLibGeralController;

{$R *.dfm}

procedure TfrmBase.AlterarBase;
begin
  Foperacao := opAlterar;
  DefineStatusBarBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption);
  HabilitaControlesDadosBase(Foperacao);
  HabilitaControlesRodapeDadosBase(Foperacao);
end;

procedure TfrmBase.btnAlterarDadosBaseClick(Sender: TObject);
begin
  AlterarBase;
end;

procedure TfrmBase.btnCancelarDadosBaseClick(Sender: TObject);
begin
  CancelarBase;
end;

procedure TfrmBase.btnDetalharPesquisaBaseClick(Sender: TObject);
begin
  DetalharBase;
end;

procedure TfrmBase.btnExcluirPesquisaBaseClick(Sender: TObject);
begin

  if ((cdsPesquisaBase.Active) and (cdsPesquisaBase.RecordCount > 0)) then
  begin
    if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = IDYES then
    begin
      ExcluirBase(cdsPesquisaBase.FieldByName('ID'));
    end;
  end
  else
    raise Exception.Create('N?o h? registro para excluir');

end;

procedure TfrmBase.btnFecharBaseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBase.btnIncluirPesquisaBaseClick(Sender: TObject);
begin
  IncluirBase;
end;

procedure TfrmBase.btnListarDadosBaseClick(Sender: TObject);
begin
  ListarBase;
end;

procedure TfrmBase.btnPesquisarPesquisaBaseClick(Sender: TObject);
begin
  PesquisarBase;
end;

procedure TfrmBase.btnSalvarDadosBaseClick(Sender: TObject);
begin
  SalvarBase;
end;

procedure TfrmBase.CancelarBase;
begin
  DefineStatusBarBase(Foperacao,True);
  HabilitaControlesDadosBase(opNavegar);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption);
  if Foperacao = opIncluir then
    HabilitaControlesRodapeDadosBase(opNavegar,True)
  else if Foperacao = opAlterar then
    HabilitaControlesRodapeDadosBase(opNavegar);
end;

procedure TfrmBase.cbOpcaoPesquisaBaseChange(Sender: TObject);
begin
  case cbOpcaoPesquisaBase.ItemIndex of
      0: FopcaoPesquisa := opID;
      1: FopcaoPesquisa := opNOME;
  end;

  case FopcaoPesquisa of
    opID :
    begin
      edConteudoPesquisaBase.Text := EmptyStr;
      edConteudoPesquisaBase.EditMask := '!9999999999;1;_';
      edConteudoPesquisaBase.Width := 119;
    end;
    opNOME :
    begin
      edConteudoPesquisaBase.Text := EmptyStr;
      edConteudoPesquisaBase.EditMask := EmptyStr;
      edConteudoPesquisaBase.Width := 282;
    end;
  end;


end;

procedure TfrmBase.DadosPadraoBase;
begin
  Foperacao := opNavegar;
  FopcaoPesquisa := opID;
  bAchouDados := False;

  cbOpcaoPesquisaBaseChange(Self);
  DefineActivePageBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption,True);
end;

procedure TfrmBase.dbgPesquisaBaseDblClick(Sender: TObject);
begin
  DetalharBase;
end;

procedure TfrmBase.DefineActivePageBase(pOperacao: Toperacao; pDetalhar : Boolean = False);
begin

  case pOperacao of
    opIncluir, opAlterar, opSalvar:
    begin
      pgcBase.ActivePage := tbsDadosBase;
      tbsDadosBase.TabVisible := True;
      tbsPesquisaBase.TabVisible := False;
    end;
    opExcluir, opNavegar:
    begin
      if pDetalhar then
      begin
        pgcBase.ActivePage := tbsDadosBase;
        tbsDadosBase.TabVisible := True;
        tbsPesquisaBase.TabVisible := False;
      end
      else
      begin
        pgcBase.ActivePage := tbsPesquisaBase;
        tbsDadosBase.TabVisible := False;
        tbsPesquisaBase.TabVisible := True;
      end;
    end;
  end;

end;

procedure TfrmBase.DefineStatusBarBase(pOperacao: Toperacao; pCancelar: Boolean = False);
begin
  if pCancelar then
     stbRodapeBase.Panels[1].Text := 'Cancelado'
  else if pOperacao = opIncluir then
    stbRodapeBase.Panels[1].Text := 'Incluindo'
  else if pOperacao = opAlterar then
    stbRodapeBase.Panels[1].Text := 'Alterando'
  else if pOperacao = opExcluir then
    stbRodapeBase.Panels[1].Text := 'Dados Exclu?dos'
  else if pOperacao = opSalvar then
    stbRodapeBase.Panels[1].Text := 'Dados salvados'
  else if pOperacao = opNavegar then
    stbRodapeBase.Panels[1].Text := 'Consultando';
end;

procedure TfrmBase.DetalharBase;
begin
  Foperacao := opNavegar;
  DefineActivePageBase(Foperacao, True);
  DefineStatusBarBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption);
  HabilitaControlesDadosBase(Foperacao);
  HabilitaControlesRodapeDadosBase(Foperacao);
end;

procedure TfrmBase.edConteudoPesquisaBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  oLibGeralController : TLibGeralController;
begin
  if FopcaoPesquisa = opID then
  begin
    try
      oLibGeralController := TLibGeralController.Create;

    if key = VK_RETURN then
      edConteudoPesquisaBase.Text := oLibGeralController.PadL(Trim(edConteudoPesquisaBase.Text),10,'0');
    finally
      FreeAndNil(oLibGeralController);
    end;
  end;
end;

procedure TfrmBase.ExcluirBase(pCodigo : TField);
var
  sErro : string;
begin
  Foperacao := opExcluir;
  DefineStatusBarBase(Foperacao);
  HabilitaControlesDadosBase(Foperacao);
  HabilitaControlesRodapeDadosBase(Foperacao);

  with sqlExcluiBase do
  begin
    if pCodigo.DataType = ftInteger then
      Params[0].AsInteger := pCodigo.AsInteger
    else if pCodigo.DataType = ftString then
      Params[0].AsString := pCodigo.AsString;

    try
      ExecSQL();

    except on E: Exception do
      begin
        sErro := 'Ocorreu erro ao excluir o clinte:'+ sLineBreak+E.Message;
        ShowMessage(sErro);
      end;
    end;

  end;

  PesquisarBase;
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  DadosPadraoBase;
end;

procedure TfrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    //Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmBase.HabilitaControlesDadosBase(pOperacao: Toperacao);
var
  nI: integer;
  bEnabCompDados: Boolean;
begin
  bEnabCompDados  := ((pOperacao = opIncluir) or (pOperacao = opAlterar));

  for nI := 0 to ComponentCount-1 do
  begin
    if Components[nI] is TMaskEdit then
    begin
      if ( (TMaskEdit(Components[nI]).Name <> 'edConteudoPesquisaBase') and
           (TMaskEdit(Components[nI]).Name <> 'edCodigoDadosBase') and
           (TMaskEdit(Components[nI]).Name <> 'edNomeCodigoDadosBase') ) then
      begin
        (Components[nI] As TMaskEdit).Enabled := bEnabCompDados;
      end;
    end;

    if Components[nI] is TComboBox then
    begin
      if ( (TComboBox(Components[nI]).Name <> 'cbOpcaoPesquisaBase') ) then
        (Components[nI] As TComboBox).Enabled := bEnabCompDados;
    end;

  end;

  if (pOperacao = opIncluir) then
    for nI := 0 to ComponentCount-1 do
    begin
      if Components[nI] is TMaskEdit then
      begin
        if (TMaskEdit(Components[nI]).Name <> 'edConteudoPesquisaBase') then
        begin
          (Components[nI] As TMaskEdit).Text := EmptyStr;
        end;
      end;
    end;
end;

procedure TfrmBase.HabilitaControlesRodapeDadosBase(pOperacao: Toperacao;pIncluir: Boolean = False);
begin
  case pOperacao of
    opIncluir , opAlterar:
    begin
      btnFecharBase.Enabled := False;
      btnListarDadosBase.Enabled := False;
      btnAlterarDadosBase.Enabled := False;
      /////
      btnSalvarDadosBase.Enabled := True;
      btnCancelarDadosBase.Enabled := True;
    end;
    opNavegar, opSalvar, opExcluir:
    begin
      btnFecharBase.Enabled := True;
      btnListarDadosBase.Enabled := True;
      if not(pIncluir) then
        btnAlterarDadosBase.Enabled := True;
      /////
      btnSalvarDadosBase.Enabled := False;
      btnCancelarDadosBase.Enabled := False;
    end;
  end;
end;

procedure TfrmBase.HabilitaControlesRodapePesquisaBase(pAchou: Boolean; pFrmNome: string; pListar: Boolean = False);
begin
  if (pgcBase.ActivePage = tbsPesquisaBase) then
  begin
    if pAchou then
    begin
      btnIncluirPesquisaBase.Enabled := True;
      btnDetalharPesquisaBase.Enabled := True;
      btnExcluirPesquisaBase.Enabled := True;
    end
    else
    begin
      btnIncluirPesquisaBase.Enabled := True;
      btnDetalharPesquisaBase.Enabled := False;
      btnExcluirPesquisaBase.Enabled := False;
      if (not pListar) then
        ShowMessage('N?o h? dados na pesquisa de :'+pFrmNome+' !');
    end;
  end
  else
  begin
    btnIncluirPesquisaBase.Enabled := False;
    btnDetalharPesquisaBase.Enabled := False;
    btnExcluirPesquisaBase.Enabled := False;
  end;
end;

procedure TfrmBase.IncluirBase;
begin
  Foperacao := opIncluir;
  DefineActivePageBase(Foperacao);
  DefineStatusBarBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption);
  HabilitaControlesDadosBase(Foperacao);
  HabilitaControlesRodapeDadosBase(Foperacao,True);
end;

procedure TfrmBase.ListarBase;
begin
  Foperacao := opNavegar;
  DefineActivePageBase(Foperacao);
  DefineStatusBarBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption,True);
  HabilitaControlesDadosBase(Foperacao);
  HabilitaControlesRodapeDadosBase(Foperacao);
end;

procedure TfrmBase.PesquisarBase;
begin
  Foperacao := opNavegar;

  with cdsPesquisaBase do
  begin
    if (cdsPesquisaBase.Active = False) then
      cdsPesquisaBase.Active := True;
    Close;

    case FopcaoPesquisa of
      opID :
      begin
        if (Trim(edConteudoPesquisaBase.Text) <> EmptyStr) then
          ParamByName('PID').AsString := Trim(edConteudoPesquisaBase.Text)
        else
          ParamByName('PID').AsString := '0000000000';
        ParamByName('PNOME').Value := null;
      end;
      opNOME :
      begin
        ParamByName('PID').AsString := '0000000000';
        ParamByName('PNOME').AsString := '%'+UpperCase(edConteudoPesquisaBase.Text)+'%';
      end;
    end;

    Open;
    First;
  end;

  if ((cdsPesquisaBase.Active) and (cdsPesquisaBase.RecordCount > 0)) then
    bAchouDados := True
  else
    bAchouDados := False;

  DefineStatusBarBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption);
end;

procedure TfrmBase.SalvarBase;
begin
  Foperacao := opSalvar;
  DefineStatusBarBase(Foperacao);
  HabilitaControlesRodapePesquisaBase(bAchouDados,frmBase.Caption);
  HabilitaControlesDadosBase(Foperacao);
  HabilitaControlesRodapeDadosBase(Foperacao);
end;

end.
