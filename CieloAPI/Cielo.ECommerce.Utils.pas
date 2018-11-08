unit Cielo.ECommerce.Utils;

interface

uses Cielo.ECommerce.Types;

type

  TCieloECUtils = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    class function BrandToCieloECString(ACieloBrandType: TCieloBrandType): string;
  published
    { published declarations }
  end;

implementation

{ TCieloECUtils }

class function TCieloECUtils.BrandToCieloECString(ACieloBrandType: TCieloBrandType): string;
begin
  case ACieloBrandType of
    TCieloBrandType.Null:
      Result := '';
    TCieloBrandType.Visa:
      Result := 'VISA';
    TCieloBrandType.MasterCard:
      Result := 'MASTER';
    TCieloBrandType.AmericanExpress:
      Result := 'AMERICANEXPRESS';
    TCieloBrandType.Elo:
      Result := 'ELO';
    TCieloBrandType.DinersClub:
      Result := 'DINERSCLUB';
    TCieloBrandType.Discover:
      Result := 'DISCOVER';
    TCieloBrandType.JCB:
      Result := 'JCB';
    TCieloBrandType.Aura:
      Result := 'AURA';
    TCieloBrandType.Hipercard:
      Result := 'HIPERCARD';
  end;
end;

end.
