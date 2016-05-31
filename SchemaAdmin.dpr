program SchemaAdmin;

{%File 'Modules\jedi.inc'}
{%File 'Modules\jediapilib.inc'}
{%DotNetAssemblyCompiler '$(SystemRoot)\system32\wldap32.dll'}
{%Bmp 'Icons\delete2322.bmp'}

uses
  Forms,
  MainPage in 'GUI\MainPage.pas' {MainForm},
  jwawinldap in 'Modules\jwawinldap.pas',
  LDAPClientUnit in 'Modules\LDAPClientUnit.pas',
  ADSchemaUnit in 'Modules\ADSchemaUnit.pas',
  HelpUnit_LDAPClient in 'Modules\HelpUnit_LDAPClient.pas',
  ADSchemaTypes in 'Modules\ADSchemaTypes.pas',
  ADSchemaHelpUnit in 'Modules\ADSchemaHelpUnit.pas',
  AddPage in 'GUI\AddPage.pas' {AddForm},
  ConnectPage in 'GUI\ConnectPage.pas' {ConnectForm},
  ErrorPage in 'GUI\ErrorPage.pas' {ErrorForm},
  SelectPage in 'GUI\SelectPage.pas' {SelectForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelectForm, SelectForm);
  //Application.CreateForm(TForm2, Form2);
  {Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TConnectForm, ConnectForm);
  Application.CreateForm(TErrorForm, ErrorForm);}
  Application.Run;
end.
