unit uFrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMenu = class(TForm)
    btnCliente: TButton;
    btnUsuario: TButton;
    procedure btnClienteClick(Sender: TObject);
  private
    procedure AbrirTelaCliente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses
  uFrmCliente;

{$R *.dfm}

procedure TfrmMenu.AbrirTelaCliente;
//var
  //ofrmCliente : TfrmCliente;
begin
  frmCliente := TfrmCliente.Create(nil);

  try
    frmCliente.ShowModal;
  finally
    FreeAndNil(frmCliente);
  end;

end;

procedure TfrmMenu.btnClienteClick(Sender: TObject);
begin
  AbrirTelaCliente;
end;

end.
