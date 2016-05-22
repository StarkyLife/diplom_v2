program SchemaAdmin;

{%File 'Modules\jedi.inc'}
{%File 'Modules\jediapilib.inc'}
{%DotNetAssemblyCompiler '$(SystemRoot)\system32\wldap32.dll'}

uses
  Forms,
  MainPage in 'GUI\MainPage.pas' {Form7},
  jwawinldap in 'Modules\jwawinldap.pas',
  LDAPClientUnit in 'Modules\LDAPClientUnit.pas',
  ADSchemaUnit in 'Modules\ADSchemaUnit.pas',
  HelpUnit_LDAPClient in 'Modules\HelpUnit_LDAPClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
