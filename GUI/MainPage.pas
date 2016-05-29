unit MainPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, ToolWin, ADSchemaUnit, ADSchemaTypes,
  Menus, ImgList;

type
  TMainForm = class(TForm)
    GridPanel1: TGridPanel;
    TreeViewMain: TTreeView;
    StringGridMain: TStringGrid;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    ModifyButton: TToolButton;
    ToolButton3: TToolButton;
    ActivateButton: TToolButton;
    DeactivateButton: TToolButton;
    ToolButton6: TToolButton;
    RefreshButton: TToolButton;
    ToolButton8: TToolButton;
    ConnectButton: TToolButton;
    DisconnectButton: TToolButton;
    ToolButton11: TToolButton;
    ExitButton: TToolButton;
    MainMenu1: TMainMenu;
    sss: TMenuItem;
    Start1: TMenuItem;
    Connect1: TMenuItem;
    Disconnect1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Add1: TMenuItem;
    Attribute1: TMenuItem;
    Class1: TMenuItem;
    Modify1: TMenuItem;
    Activate1: TMenuItem;
    Deactivate1: TMenuItem;
    Refresh1: TMenuItem;
    Howto1: TMenuItem;
    AttributeSyntaxes1: TMenuItem;
    ImageListTool: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TreeViewMainChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGridMainDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    ATTRIBUTE_NODE : TTreeNode;
    CLASS_NODE : TTreeNode;
    TREE_NODE : TTreeNode;

    TreeViewCurrentNode : TTreeNode;
    schema : ADSchema;

    procedure pvResizeGridColumns();
    procedure pvLoadItemsToTree();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if schema <> nil then
    schema.Destroy;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  status : ADSchemaStatus;
  firstNode : TTreeNode;
begin
  pvResizeGridColumns;
  
  firstNode := TreeViewMain.Items.GetFirstNode;
  ATTRIBUTE_NODE := TreeViewMain.Items.AddChild(firstNode, 'Attributes');
  CLASS_NODE := TreeViewMain.Items.AddChild(firstNode, 'Classes');
  TREE_NODE := TreeViewMain.Items.AddChild(firstNode, 'ClassTree');

  //TODO: connection form
  schema := ADSchema.Create('starkyli-1sqlu0.domain.local',
                             'starkylife@domain.local',
                             'pa$$w0rd', 389, status);
  status.Free;
  status := nil;
  pvLoadItemsToTree;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  pvResizeGridColumns;
end;

{ PRIVATE Resize function for stringGrid columns }
procedure TMainForm.pvResizeGridColumns();
begin
  StringGridMain.ColWidths[0] := trunc(StringGridMain.Width*0.29);
  StringGridMain.ColWidths[1] := trunc(StringGridMain.Width*0.7);
end;

procedure TMainForm.StringGridMainDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  AGrid : TStringGrid;
begin
  AGrid := TStringGrid(Sender);

  if ARow = 0 then
  begin
    AGrid.Canvas.Brush.Color := clActiveBorder;
    AGrid.Canvas.FillRect(Rect);
    AGrid.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, AGrid.Cells[ACol, ARow]);
  end;
end;

procedure TMainForm.TreeViewMainChange(Sender: TObject; Node: TTreeNode);
begin
  { Controling wich node is selected in tree }
  TreeViewCurrentNode := Node;
end;

{ PRIVATE Load TreeView Items function }
procedure TMainForm.pvLoadItemsToTree();

var
  entries : ADEntryList;
  status : ADSchemaStatus;
  iEntry : integer;
  
begin
  //Get Classes
  entries := schema.GetAll(ClassEntry, ['cn'], status);
  if status.StatusType <> SuccessStatus then
  begin
    //here error handling
    Exit;
  end;
  status.Free;
  status := nil;   
  for iEntry := 0 to entries.EntriesCount - 1 do
  begin
    TreeViewMain.Items.AddChild(CLASS_NODE, entries.Items[iEntry].Name);
  end;
  entries.Destroy;
  entries := nil;

  //Get Attributes     !!!TODO: sizelimit in search operation exceeded
  entries := schema.GetAll(AttributeEntry, ['cn'], status);
  if status.StatusType <> SuccessStatus then
  begin
    //here error handling
    Exit;
  end;
  status.Free;
  status := nil;
  
  for iEntry := 0 to entries.EntriesCount - 1 do
  begin
    TreeViewMain.Items.AddChild(ATTRIBUTE_NODE, entries.Items[iEntry].Name);
  end;
  entries.Destroy;
  entries := nil;

end;

end.
