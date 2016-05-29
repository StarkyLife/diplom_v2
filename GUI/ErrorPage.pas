unit ErrorPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TErrorForm = class(TForm)
    GroupBox1: TGroupBox;
    ErrorMsgLabel: TLabel;
    ErrorNumbLabel: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetErrorInfo(numb: integer; msg: string);
  end;

var
  ErrorForm: TErrorForm;

implementation

{$R *.dfm}

procedure TErrorForm.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TErrorForm.SetErrorInfo(numb: integer; msg: string);
begin
  ErrorNumbLabel.Caption := ErrorNumbLabel.Caption + IntToStr(numb);
  ErrorMsgLabel.Caption := msg;
end;

end.