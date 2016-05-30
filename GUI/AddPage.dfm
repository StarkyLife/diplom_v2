object AddForm: TAddForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New Entry'
  ClientHeight = 433
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 679
    Height = 433
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 655
      ExplicitHeight = 0
      object LabelName: TLabel
        Left = 24
        Top = 24
        Width = 66
        Height = 16
        Caption = 'Entry Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LabelType: TLabel
        Left = 24
        Top = 60
        Width = 53
        Height = 13
        Caption = 'Entry Type'
      end
      object EditName: TEdit
        Left = 120
        Top = 18
        Width = 193
        Height = 21
        TabOrder = 0
      end
      object ComboBoxType: TComboBox
        Left = 120
        Top = 57
        Width = 193
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Attribute'
        OnChange = ComboBoxTypeChange
        Items.Strings = (
          'Attribute'
          'Class')
      end
      object GroupBox1: TGroupBox
        Left = 32
        Top = 100
        Width = 289
        Height = 149
        Caption = 'Mandatory'
        TabOrder = 2
        object OIDLabel: TLabel
          Left = 3
          Top = 24
          Width = 61
          Height = 16
          Caption = 'AttributeID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object SyntaxLabel: TLabel
          Left = 3
          Top = 69
          Width = 50
          Height = 16
          Caption = 'SyntaxID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object oMSyntaxLabel: TLabel
          Left = 3
          Top = 112
          Width = 55
          Height = 16
          Caption = 'oMSyntax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object OIDEdit: TEdit
          Left = 88
          Top = 24
          Width = 185
          Height = 21
          TabOrder = 0
        end
        object SyntaxEdit: TEdit
          Left = 88
          Top = 67
          Width = 185
          Height = 21
          TabOrder = 1
        end
        object oMSyntaxEdit: TEdit
          Left = 88
          Top = 110
          Width = 185
          Height = 21
          TabOrder = 2
        end
      end
      object FlowPanel1: TFlowPanel
        Left = 336
        Top = 18
        Width = 321
        Height = 353
        Caption = 'Optional'
        Padding.Left = 2
        Padding.Top = 2
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 3
      end
      object AddOptionButton: TButton
        Left = 432
        Top = 377
        Width = 113
        Height = 25
        Caption = 'AddOptionButton'
        TabOrder = 4
        OnClick = AddOptionButtonClick
      end
      object SaveBtn: TBitBtn
        Left = 120
        Top = 330
        Width = 89
        Height = 41
        Caption = 'Save'
        Default = True
        TabOrder = 5
        OnClick = SaveBtnClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'May/Must Attributes'
      ImageIndex = 1
    end
  end
end
