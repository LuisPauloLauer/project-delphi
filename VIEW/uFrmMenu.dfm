object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 234
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnCliente: TButton
    Left = 120
    Top = 8
    Width = 100
    Height = 50
    Caption = 'Cliente'
    TabOrder = 0
    OnClick = btnClienteClick
  end
  object btnUsuario: TButton
    Left = 8
    Top = 8
    Width = 100
    Height = 50
    Caption = 'Usuario'
    TabOrder = 1
  end
end
