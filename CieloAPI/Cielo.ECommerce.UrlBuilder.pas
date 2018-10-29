unit Cielo.ECommerce.UrlBuilder;

interface

uses Cielo.ECommerce.Types;

type

  TCieloECUrlBuilder = class
  private
    { private declarations }
  protected
    { protected declarations }
    class function BuildUrl(AAction: TCieloUrlAction; ACieloEnvironment: TCieloEnvironment): string;
  public
    { public declarations }
    class function Request(ACieloEnvironment: TCieloEnvironment): string;
    class function Query(ACieloEnvironment: TCieloEnvironment): string;
  published
    { published declarations }
  end;

implementation

{ TCieloECUrl }

class function TCieloECUrlBuilder.BuildUrl(AAction: TCieloUrlAction; ACieloEnvironment: TCieloEnvironment): string;
var
  LUrlAction: string;
  LEnvironment: string;
begin

  case ACieloEnvironment of
    TCieloEnvironment.Sandbox:
      LEnvironment := 'sandbox';
    TCieloEnvironment.Production:
      LEnvironment := '';
  end;

  case AAction of
    TCieloUrlAction.Request:
      LUrlAction := '';
    TCieloUrlAction.Query:
      LUrlAction := 'query';
  end;

  Result := 'https://api' + LUrlAction + LEnvironment + '.cieloecommerce.cielo.com.br'
end;

class function TCieloECUrlBuilder.Query(ACieloEnvironment: TCieloEnvironment): string;
begin
  Result := BuildUrl(TCieloUrlAction.Query, ACieloEnvironment);
end;

class function TCieloECUrlBuilder.Request(ACieloEnvironment: TCieloEnvironment): string;
begin
  Result := BuildUrl(TCieloUrlAction.Request, ACieloEnvironment);
end;

end.
