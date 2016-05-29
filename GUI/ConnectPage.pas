unit ConnectPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ADSchemaUnit, ADSchemaTypes, ErrorPage;

type
  TConnectForm = class(TForm)
    EditHost: TEdit;
    EditUsername: TEdit;
    EditPassword: TEdit;
    LabelHost: TLabel;
    LabelUsername: TLabel;
    LabelPassword: TLabel;
    ConnectBtn: TButton;
    ErrorLabel: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure ConnectBtnClick(Sender: TObject);
    procedure ErrorLabelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    schema : ADSchema;
    status : ADSchemaStatus;

    procedure pvShowErrorDialog(errorNumb: integer; errorMsg: string);
  public
    { Public declarations }
    property GetSchema : ADSchema
      read schema;
  end;

var
  ConnectForm: TConnectForm;

implementation

{$R *.dfm}

//Error handling
procedure TConnectForm.pvShowErrorDialog(errorNumb: integer; errorMsg: string);
var
  errorForm : TErrorForm;
begin
  errorForm := TErrorForm.Create(Application);
  errorForm.SetErrorInfo(errorNumb, errorMsg);
  try
    errorForm.ShowModal;
  finally
    errorForm.Free;
  end;
end;

procedure TConnectForm.ConnectBtnClick(Sender: TObject);
var
  hostName, userName, password : string;
  portNumber : integer;
  entry : ADEntry;
begin
  hostName := EditHost.Text;
  userName := EditUsername.Text;
  password := EditPassword.Text;
  portNumber := 389;

  schema := ADSchema.Create(hostName, userName, password, portNumber, status);
  if (status.StatusType <> SuccessStatus) then
  begin
    ErrorLabel.Visible := true
  end
  else
  begin
    status.Free;
    status := nil;

    //check is user in schema admin group
    entry := schema.GetEntry('account', ClassEntry, ['cn'], status);
    if status.StatusType <> SuccessStatus then
      ErrorLabel.Visible := true      
    else ModalResult := mrOk;
  end;
end;

procedure TConnectForm.ErrorLabelClick(Sender: TObject);
begin
  pvShowErrorDialog(status.StatusNumb, status.StatusMsg);
end;

procedure TConnectForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if status <> nil then
  begin
    status.free;
    status := nil;
  end;
end;

end.
