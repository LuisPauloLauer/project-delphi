program SistemaLP;

uses
  Vcl.Forms,
  uFrmLogin in 'VIEW\uFrmLogin.pas' {frmLogin},
  uFrmMenu in 'VIEW\uFrmMenu.pas' {frmMenu},
  uFrmBase in 'VIEW\Base\uFrmBase.pas' {frmBase},
  uClienteModel in 'MODEL\uClienteModel.pas',
  uClienteController in 'CONTROLLER\uClienteController.pas',
  uDmConexao in 'DAO\uDmConexao.pas' {dmConexao: TDataModule},
  uDmCliente in 'DAO\uDmCliente.pas' {dmCliente: TDataModule},
  uDmLogin in 'DAO\uDmLogin.pas' {dmLogin: TDataModule},
  uFrmCliente in 'VIEW\Cadastro\uFrmCliente.pas' {frmCliente},
  uDmLibGeral in 'DAO\uDmLibGeral.pas' {dmLibGeral: TDataModule},
  uLibGeralController in 'CONTROLLER\uLibGeralController.pas',
  uLibGeralModel in 'MODEL\uLibGeralModel.pas',
  uNovosComponentes in 'Componentes\uNovosComponentes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmLibGeral, dmLibGeral);
  //Application.CreateForm(TfrmCliente, frmCliente);
  // Application.CreateForm(TfrmBase, frmBase);
  Application.Run;
end.
