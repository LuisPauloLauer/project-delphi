unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    pnlBanner: TPanel;
    imgBanner: TImage;
    edUsuario: TEdit;
    edSenha: TEdit;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    btnLogin: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uDmLogin, uFrmMenu;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  oLogin : TdmLogin;
  ofrmMenu : TfrmMenu;
begin
  try
    oLogin := TdmLogin.Create(nil);
    ofrmMenu := TfrmMenu.Create(nil);

    if oLogin.verificaAcessoLogin(edUsuario.Text,edSenha.Text) then
      ofrmMenu.ShowModal
    else
       ShowMessage('Usuário ou senha incorreto(s)!');
  finally
    FreeAndNil(oLogin);
    FreeAndNil(ofrmMenu);
  end;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
