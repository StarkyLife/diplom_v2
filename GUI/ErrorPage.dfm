object ErrorForm: TErrorForm
  Left = 0
  Top = 0
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'ERROR'
  ClientHeight = 226
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 25
  Padding.Top = 25
  Padding.Right = 25
  Padding.Bottom = 25
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ErrorNumbLabel: TLabel
    Left = 111
    Top = 25
    Width = 88
    Height = 23
    Caption = 'ERROR #'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 25
    Top = 57
    Width = 265
    Height = 105
    Caption = 'Message'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ErrorMsgLabel: TLabel
      Left = 16
      Top = 24
      Width = 233
      Height = 65
      AutoSize = False
      Caption = 'No Info!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 168
    Width = 82
    Height = 33
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
end