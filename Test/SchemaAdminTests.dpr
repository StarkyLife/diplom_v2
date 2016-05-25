program SchemaAdminTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options 
  to use the console test runner.  Otherwise the GUI test runner will be used by 
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestLDAPClientUnit in 'TestLDAPClientUnit.pas',
  LDAPClientUnit in '..\Modules\LDAPClientUnit.pas',
  jwawinldap in '..\Modules\jwawinldap.pas',
  HelpUnit_LDAPClient in '..\Modules\HelpUnit_LDAPClient.pas',
  TestADSchemaUnit in 'TestADSchemaUnit.pas',
  ADSchemaUnit in '..\Modules\ADSchemaUnit.pas',
  ADSchemaHelpUnit in '..\Modules\ADSchemaHelpUnit.pas',
  ADSchemaTypes in '..\Modules\ADSchemaTypes.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.

