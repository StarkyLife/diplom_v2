unit ADSchemaHelpUnit;

interface

uses Windows;

const
  NameUnknown            = 0;
  NameFullyQualifiedDN   = 1;
  NameSamCompatible      = 2;
  NameDisplay            = 3;
  NameUniqueId           = 6;
  NameCanonical          = 7;
  NameUserPrincipal      = 8;
  NameCanonicalEx        = 9;
  NameServicePrincipal   = 10;
  NameDnsDomain          = 12;

//function to get current user DN
function GetUserNameExString(ANameFormat: DWORD): string;

implementation

function GetUserNameExString(ANameFormat: DWORD): string;
var
  Buf: array[0..256] of Char;
  BufSize: DWORD;
  GetUserNameEx: function (NameFormat: DWORD; lpNameBuffer: LPSTR;
    var nSize: ULONG): BOOL; stdcall;
begin
  Result := '';
  BufSize := SizeOf(Buf) div SizeOf(Buf[0]);
  GetUserNameEx := GetProcAddress(GetModuleHandle('secur32.dll'), 'GetUserNameExA');
  if Assigned(GetUserNameEx) then
    if GetUserNameEx(ANameFormat, Buf, BufSize) then
      Result := Buf;
end;

end.
