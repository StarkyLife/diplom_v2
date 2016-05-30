unit AddPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TAddForm = class(TForm)
    LabelName: TLabel;
    EditName: TEdit;
    LabelType: TLabel;
    ComboBoxType: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}

end.
