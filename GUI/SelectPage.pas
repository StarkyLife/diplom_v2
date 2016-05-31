unit SelectPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ADSchemaUnit, ADSchemaTypes;

type
  TSelectForm = class(TForm)
    ListBoxSelect: TListBox;
    BtnOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    schema : ADSchema;
    selectedValue : string;

    procedure LoadInOtherThread();
  end;

  TLoadThread = class(TThread)
    protected
      procedure Execute; override;
  end;

var
  SelectForm: TSelectForm;

implementation

{$R *.dfm}

procedure TLoadThread.Execute;
begin
  SelectForm.LoadInOtherThread;
end;

procedure TSelectForm.LoadInOtherThread();
var
  entries : ADEntryList;
  status : ADSchemaStatus;
  i : integer;
begin
  if schema <> nil then
  begin
    entries := schema.GetAll(AttributeEntry, ['cn'], status);
    if status.StatusType <> SuccessStatus then
    begin
      ShowMessage('Unable to load attribute list!');
      status.Free;
      if entries <> nil then
        entries.Destroy;
      Exit;
    end;

    if entries.EntriesCount = 0 then
      Exit;

    for i := 0 to entries.EntriesCount - 1 do
    begin
      ListBoxSelect.Items.Add(entries.Items[i].Name);
    end;
      
  end;
end;

procedure TSelectForm.BtnOKClick(Sender: TObject);
begin
  if ListBoxSelect.ItemIndex = -1 then
  begin
    ShowMessage('Please Select the attribute!');
    Exit;
  end;

  selectedValue := ListBoxSelect.Items[ListBoxSelect.ItemIndex];
  ModalResult := mrOk;

end;

procedure TSelectForm.FormShow(Sender: TObject);
var
  newThread : TLoadThread;
begin
  newThread := TLoadThread.Create(true);
  newThread.Synchronize(LoadInOtherThread);
end;

end.
