unit Cielo.ECommerce.Types;
{$SCOPEDENUMS ON}

interface

type

  TCieloECResponse<T> = reference to procedure(ACieloECResponse: T);

  TCieloUrlAction = (Request, Query);

  TCieloEnvironment = (Sandbox, Production);

  TCieloEnvironmentHelper = record helper for TCieloEnvironment
  const
    ceSandbox = TCieloEnvironment.Sandbox deprecated 'Use TCieloEnvironment.Sandbox';
    ceProduction = TCieloEnvironment.Production deprecated 'Use TCieloEnvironment.Production';
  end;

  TCieloRecurrentInterval = (Null, Monthly, Bimonthly, Quarterly, SemiAnnual, Annual);

  TCieloRecurrentIntervalHelper = record helper for TCieloRecurrentInterval
  public
    function ToString: string;
    function ToInteger: Integer;
  end;

  TCieloBrandType = (Null, Visa, MasterCard, AmericanExpress, Elo, DinersClub, Discover, JCB, Aura, Hipercard);

  TCieloBrandTypeHelper = record helper for TCieloBrandType
  public
    function ToString: string;
  end;

  TCieloCustomerStatus = (Null, New, Existing);

  TCieloCustomerStatusHelper = record helper for TCieloCustomerStatus
  public
    function ToString: string;
  end;

  TCieloInterest = (Null, ByMerchant, ByIssuer);

  TCieloInterestHelper = record helper for TCieloInterest
  public
    function ToString: string;
  end;

  TCieloCustomerIdentityType = (Null, RG, CPF, CPNJ);

  TCieloCustomerIdentityTypeHelper = record helper for TCieloCustomerIdentityType
  public
    function ToString: string;
  end;

  TCieloProvider = (Null, Cielo, Bradesco, BancodoBrasil, Bradesco2, BancodoBrasil2);

  TCieloProviderHelper = record helper for TCieloProvider
  public
    function ToString: string;
  end;

  TCieloPaymentType = (Null, CreditCard, DebitCard, Boleto, EletronicTransfer);

  TCieloPaymentTypeHelper = record helper for TCieloPaymentType
  public
    function ToString: string;
  end;

implementation

{ TCieloPaymentTypeHelper }

function TCieloPaymentTypeHelper.ToString: string;
begin
  case Self of
    TCieloPaymentType.Null:
      Result := '';
    TCieloPaymentType.CreditCard:
      Result := 'CreditCard';
    TCieloPaymentType.DebitCard:
      Result := 'DebitCard';
    TCieloPaymentType.Boleto:
      Result := 'Boleto';
    TCieloPaymentType.EletronicTransfer:
      Result := 'EletronicTransfer';
  end;
end;

{ TCieloCustomerStatusHelper }

function TCieloCustomerStatusHelper.ToString: string;
begin
  case Self of
    TCieloCustomerStatus.Null:
      Result := '';
    TCieloCustomerStatus.New:
      Result := 'New';
    TCieloCustomerStatus.Existing:
      Result := 'Existing';
  end;
end;

{ TCieloInterestHelper }

function TCieloInterestHelper.ToString: string;
begin
  case Self of
    TCieloInterest.Null:
      Result := '';
    TCieloInterest.ByMerchant:
      Result := 'ByMerchant';
    TCieloInterest.ByIssuer:
      Result := 'ByIssuer';
  end;
end;

{ TCieloBrandTypeHelper }

function TCieloBrandTypeHelper.ToString: string;
begin
  case Self of
    TCieloBrandType.Null:
      Result := '';
    TCieloBrandType.Visa:
      Result := 'Visa';
    TCieloBrandType.MasterCard:
      Result := 'MasterCard';
    TCieloBrandType.AmericanExpress:
      Result := 'AmericanExpress';
    TCieloBrandType.Elo:
      Result := 'Elo';
    TCieloBrandType.DinersClub:
      Result := 'DinersClub';
    TCieloBrandType.Discover:
      Result := 'Discover';
    TCieloBrandType.JCB:
      Result := 'JCB';
    TCieloBrandType.Aura:
      Result := 'Aura';
    TCieloBrandType.Hipercard:
      Result := 'Hipercard';
  end;
end;

{ TCieloCustomerIdentityTypeHelper }

function TCieloCustomerIdentityTypeHelper.ToString: string;
begin
  case Self of
    TCieloCustomerIdentityType.Null:
      Result := '';
    TCieloCustomerIdentityType.RG:
      Result := 'RG';
    TCieloCustomerIdentityType.CPF:
      Result := 'CPF';
    TCieloCustomerIdentityType.CPNJ:
      Result := 'CPNJ';
  end;
end;

{ TCieloProviderHelper }

function TCieloProviderHelper.ToString: string;
begin
  case Self of
    TCieloProvider.Null:
      Result := '';
    TCieloProvider.Cielo:
      Result := 'Cielo';
    TCieloProvider.Bradesco:
      Result := 'Bradesco';
    TCieloProvider.BancodoBrasil:
      Result := 'BancodoBrasil';
    TCieloProvider.Bradesco2:
      Result := 'Bradesco2';
    TCieloProvider.BancodoBrasil2:
      Result := 'BancodoBrasil2';
  end;
end;

{ TCieloRecurrentIntervalHelper }

function TCieloRecurrentIntervalHelper.ToInteger: Integer;
begin
  case Self of
    TCieloRecurrentInterval.Null:
      Result := 0;
    TCieloRecurrentInterval.Monthly:
      Result := 1;
    TCieloRecurrentInterval.Bimonthly:
      Result := 2;
    TCieloRecurrentInterval.Quarterly:
      Result := 3;
    TCieloRecurrentInterval.SemiAnnual:
      Result := 6;
    TCieloRecurrentInterval.Annual:
      Result := 12;
  end;
end;

function TCieloRecurrentIntervalHelper.ToString: string;
begin
  case Self of
    TCieloRecurrentInterval.Null:
      Result := '';
    TCieloRecurrentInterval.Monthly:
      Result := 'Monthly';
    TCieloRecurrentInterval.Bimonthly:
      Result := 'Bimonthly';
    TCieloRecurrentInterval.Quarterly:
      Result := 'Quarterly';
    TCieloRecurrentInterval.SemiAnnual:
      Result := 'SemiAnnual';
    TCieloRecurrentInterval.Annual:
      Result := 'Annual';
  end;
end;

end.
