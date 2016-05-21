{ This unit contains class for Active Directory Schema Manipulation.

  Author: Ismagilov Ilshat (student group 4410)
  Email: ilshat.ismagilov2014@gmail.com
  Organisation: KAI (kai.ru)

  Version: 2.0
}

unit ADSchemaUnit;

interface

uses LDAPClientUnit;

type

  { Public class for administrating the Active Directory(AD) Schema }
  ADSchema = class
    private
      client : LDAPClient;
    public

  end;

implementation

end.
