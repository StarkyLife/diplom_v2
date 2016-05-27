program SchemaAdmin;

{%File 'Modules\jedi.inc'}
{%File 'Modules\jediapilib.inc'}
{%DotNetAssemblyCompiler '$(SystemRoot)\system32\wldap32.dll'}

uses
  Forms,
  MainPage in 'GUI\MainPage.pas' {MainForm},
  jwawinldap in 'Modules\jwawinldap.pas',
  LDAPClientUnit in 'Modules\LDAPClientUnit.pas',
  ADSchemaUnit in 'Modules\ADSchemaUnit.pas',
  HelpUnit_LDAPClient in 'Modules\HelpUnit_LDAPClient.pas',
  ADSchemaTypes in 'Modules\ADSchemaTypes.pas',
  ADSchemaHelpUnit in 'Modules\ADSchemaHelpUnit.pas',
  AddPage in 'GUI\AddPage.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
