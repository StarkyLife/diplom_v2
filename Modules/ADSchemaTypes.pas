unit ADSchemaTypes;

interface

uses Windows, Classes;

type
  { Attribute model }
  ADAttribute = class
    strict private
      AttributeName : string;
      AttributeValues : TStringList;

      function GetValuesCount() : integer;
      function GetValue(index : integer) : string;
      procedure SetValue(index : integer; value : string);
    public     
      property Name : string
        read AttributeName
        write AttributeName;
      property Values[index : integer] : string
        read GetValue
        write SetValue;
      property ValuesCount : integer
        read GetValuesCount;          
        
      function GetList() : TStringList;
      procedure AddValue(value : string);
      procedure DeleteValue(valueIndex : integer);

      constructor Create(attrName : string; attrValues : array of string); overload;
      constructor Create(attrName : string); overload;
      destructor Destroy(); override;
  end;

  { Entry model }
  ADEntry = class
    strict private
      EntryName : string;
      EntryAttributes : TList;

      function GetAttributesCount() : integer;
      function GetAttribute(index : integer) : ADAttribute;
      
      //Because of memory risks
      //procedure SetAttribute(index : integer; value : ADAttribute);
    public  
      property Name : string
        read EntryName
        write EntryName;
      property Attributes[index : integer] : ADAttribute
        read GetAttribute;
        //write SetAttribute;
      property AttributesCount : integer
        read GetAttributesCount;

      function GetList() : TList;

      procedure AddAttribute(attribute : ADAttribute); overload;
      procedure AddAttribute(attrName : string; attrValues : array of string); overload;
      procedure AddAttribute(attrName : string); overload;

      procedure DeleteAttribute(index : integer); overload;
      procedure DeleteAttribute(name : string); overload;

      constructor Create(entrName : string); overload;
      constructor Create(entrName : string; attrs : array of ADAttribute); overload;
      destructor Destroy(); override;
  end; 

  { Entries List model }
  ADEntryList = class
    strict private
      Entries : TList;

      function GetEntriesCount() : integer;
      function GetEntry(index : integer) : ADEntry;  
    public
      property Items[index : integer] : ADEntry
        read GetEntry;
      property EntriesCount : integer
        read GetEntriesCount;

      function GetList() : TList;

      procedure AddEntry(entry : ADEntry); overload;
      procedure AddEntry(entryName : string); overload;
      procedure AddEntry(entryName : string; attrs : array of ADAttribute); overload;

      procedure DeleteEntry(index : integer); overload;
      procedure DeleteEntry(name : string); overload;

      constructor Create();
      destructor Destroy(); override;
  end;

implementation

  { --------------------------------------------------------
    ------------------- IMPLEMENTATION ---------------------
    ------------------- ADAttribute ------------------------
    -------------------------------------------------------- }
  constructor ADAttribute.Create(attrName : string; attrValues : array of string);
  var
    i : integer;
  begin
    AttributeName := attrName;
    AttributeValues := TStringList.Create;
    for i := 0 to Length(attrValues) - 1 do
      AttributeValues.Add(attrValues[i]);
  end;

  constructor ADAttribute.Create(attrName : string);
  begin
    AttributeName := attrName;
    AttributeValues := TStringList.Create;
  end;

  destructor ADAttribute.Destroy();
  begin
    if AttributeValues <> nil then
      AttributeValues.Free;

    inherited;
  end;

  function ADAttribute.GetList() : TStringList;
  begin
    result := AttributeValues;
  end;

  procedure ADAttribute.AddValue(value : string);
  begin
    AttributeValues.Add(value);
  end;

  procedure ADAttribute.DeleteValue(valueIndex : integer);
  begin
    AttributeValues.Delete(valueIndex);
  end;

  function ADAttribute.GetValuesCount() : integer;
  begin
    result := AttributeValues.Count;
  end;

  function ADAttribute.GetValue(index : integer) : string;
  begin
    result := AttributeValues[index];
  end;

  procedure ADAttribute.SetValue(index : integer; value : string);
  begin
    AttributeValues[index] := value;
  end;

  { --------------------------------------------------------
    ------------------- IMPLEMENTATION ---------------------
    ------------------- ADEntry ----------------------------
    -------------------------------------------------------- }
  constructor ADEntry.Create(entrName : string);
  begin
    EntryName := entryName;
    EntryAttributes := TList.Create;
  end;

  constructor ADEntry.Create(entrName : string; attrs : array of ADAttribute);
  var
    i : integer;
  begin
    EntryName := entryName;
    EntryAttributes := TList.Create;
    for i := 0 to Length(attrs) - 1 do
      EntryAttributes.Add(attrs[i]);
  end;

  destructor ADEntry.Destroy();
  var
    i : integer;
  begin
    if (EntryAttributes <> nil) then
    begin
      if EntryAttributes.Count > 0 then
      begin
        for i := 0 to EntryAttributes.Count - 1 do
          ADAttribute(EntryAttributes[i]).Destroy;
        EntryAttributes.Clear;  
      end;
      EntryAttributes.Free;
    end;

    inherited;
  end;

  function ADEntry.GetList() : TList;
  begin
    result := EntryAttributes;
  end;

  procedure ADEntry.AddAttribute(attribute : ADAttribute);  
  begin
    EntryAttributes.Add(attribute);
  end;

  procedure ADEntry.AddAttribute(attrName : string; attrValues : array of string);
  begin
    EntryAttributes.Add(ADAttribute.Create(attrName, attrValues));
  end;

  procedure ADEntry.AddAttribute(attrName : string);
  begin
    EntryAttributes.Add(ADAttribute.Create(attrName));
  end;

  procedure ADEntry.DeleteAttribute(index : integer);
  begin
    ADAttribute(EntryAttributes[index]).Destroy;
    EntryAttributes.Delete(index);
  end;

  procedure ADEntry.DeleteAttribute(name : string);
  var
    i : integer;
  begin
    for i := 0 to EntryAttributes.Count - 1 do
    begin
      if ADAttribute(EntryAttributes[i]).Name = name then
      begin
        ADAttribute(EntryAttributes[i]).Destroy;
        EntryAttributes.Delete(i);
        break;
      end;
    end;
  end;

  function ADEntry.GetAttributesCount() : integer;
  begin
    result := EntryAttributes.Count;
  end;

  function ADEntry.GetAttribute(index : integer) : ADAttribute;
  begin
    result := ADAttribute(EntryAttributes[index]);
  end;

  { --------------------------------------------------------
    ------------------- IMPLEMENTATION ---------------------
    ------------------- ADEntryList ------------------------
    -------------------------------------------------------- }
  constructor ADEntryList.Create();
  begin
    Entries.Create;
  end;

  destructor ADEntryList.Destroy();
  var
    i : integer;
  begin
    if Entries <> nil then
    begin
      if Entries.count > 0 then
      begin
        for i := 0 to Entries.Count - 1 do
        begin
          ADEntry(Entries[i]).Destroy; 
        end;
        Entries.Clear;
      end;
      Entries.Free;
    end;

    inherited;
  end;

  function ADEntryList.GetList() : TList;
  begin
    result := Entries;
  end;

  procedure ADEntryList.AddEntry(entry : ADEntry);
  begin
    Entries.Add(entry);
  end;

  procedure ADEntryList.AddEntry(entryName : string);
  begin
    Entries.Add(ADEntry.Create(entryName));
  end;

  procedure ADEntryList.AddEntry(entryName : string; attrs : array of ADAttribute);
  begin
    Entries.Add(ADEntry.Create(entryName, attrs));
  end;

  procedure ADEntryList.DeleteEntry(index : integer);
  begin
    ADEntry(Entries[index]).Destroy;
    Entries.Delete(index);
  end;

  procedure ADEntryList.DeleteEntry(name : string);
  var
    i : integer;
  begin
    for i := 0 to Entries.Count - 1 do
    begin
      if ADEntry(Entries[i]).Name = name then
      begin
        ADEntry(Entries[i]).Destroy;
        Entries.Delete(i);
        break;
      end;
    end;
  end;

  function ADEntryList.GetEntriesCount() : integer;
  begin
    result := Entries.Count;
  end;

  function ADEntryList.GetEntry(index : integer) : ADEntry;
  begin
    result := ADEntry(Entries[index]);
  end;

end.
