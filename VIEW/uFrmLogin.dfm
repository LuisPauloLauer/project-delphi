object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 234
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsuario: TLabel
    Left = 43
    Top = 120
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object lblSenha: TLabel
    Left = 43
    Top = 147
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object pnlBanner: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object imgBanner: TImage
      Left = 0
      Top = 0
      Width = 377
      Height = 97
      Align = alClient
      ExplicitLeft = 88
      ExplicitTop = 56
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object edUsuario: TEdit
    Left = 85
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edSenha: TEdit
    Left = 85
    Top = 147
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnLogin: TButton
    Left = 85
    Top = 174
    Width = 121
    Height = 25
    Caption = 'Login'
    TabOrder = 3
    OnClick = btnLoginClick
  end
end
