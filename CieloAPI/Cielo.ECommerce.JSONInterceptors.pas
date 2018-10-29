unit Cielo.ECommerce.JSONInterceptors;

interface

uses
  System.SysUtils, System.RTTI, Cielo.ECommerce.Types, REST.JsonReflect;

var
  Marshal: TJSONMarshal;
  UnMarshal: TJSONUnMarshal;

type
  TCieloEnumInterceptor<T> = class(TJSONInterceptor)
  private
    function ObjectToEnumValue(Data: TObject; Field: string): Integer;
    procedure StringToEnumValue(Data: TObject; Field: string; Value: Integer);
  public
    procedure ExpectTypeKind(ATypeKind: TTypeKind);
  end;

  TCieloBrandTypeInterceptor = class(TCieloEnumInterceptor<TCieloBrandType>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;


  TCieloCustomerStatusInterceptor = class(TCieloEnumInterceptor<TCieloCustomerStatus>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  TCieloInterestInterceptor = class(TCieloEnumInterceptor<TCieloInterest>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  TCieloCustomerIdentityTypeInterceptor = class(TCieloEnumInterceptor<TCieloCustomerIdentityType>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  TCieloProviderInterceptor = class(TCieloEnumInterceptor<TCieloProvider>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  TCieloPaymentTypeInterceptor = class(TCieloEnumInterceptor<TCieloPaymentType>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  TCieloRecurrentIntervalInterceptor = class(TCieloEnumInterceptor<TCieloRecurrentInterval>)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

  TCieloDateInterceptor = class(TJSONInterceptor)
  public
    function StringConverter(Data: TObject; Field: string): string; override;
    procedure StringReverter(Data: TObject; Field: string; Arg: string); override;
  end;

implementation

uses
  System.TypInfo;

{ TCieloCustomerStatusInterceptor }

function TCieloCustomerStatusInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloCustomerStatus(ObjectToEnumValue(Data, Field)).ToString.ToUpper;
end;

procedure TCieloCustomerStatusInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerStatus.Null))
  else if Arg.Trim.ToUpper = 'NEW' then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerStatus.New))
  else if Arg.Trim.ToUpper = 'EXISTING' then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerStatus.Existing));
end;

{ TCieloInterestInterceptor }

function TCieloInterestInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloInterest(ObjectToEnumValue(Data, Field)).ToString;
end;

procedure TCieloInterestInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloInterest.Null))
  else if Arg.Trim.ToUpper = 'BYMERCHANT' then
    StringToEnumValue(Data, Field, Integer(TCieloInterest.ByMerchant))
  else if Arg.Trim.ToUpper = 'BYISSUER' then
    StringToEnumValue(Data, Field, Integer(TCieloInterest.ByIssuer));
end;

{ TCieloEnumInterceptor<T> }

procedure TCieloEnumInterceptor<T>.ExpectTypeKind(ATypeKind: TTypeKind);
begin
  Assert(TypeInfo(TCieloInterest) <> nil, 'Type has no typeinfo!');
  Assert(PTypeInfo(TypeInfo(TCieloInterest)).Kind = ATypeKind, 'Type is not expected type!');
end;

function TCieloEnumInterceptor<T>.ObjectToEnumValue(Data: TObject; Field: string): Integer;
var
  LRttiContext: TRttiContext;
  LValue: Integer;
  LType: TRttiType;
  LField: TRttiField;
begin
  ExpectTypeKind(tkEnumeration);
  LRttiContext := TRttiContext.Create;
  LType := LRttiContext.GetType(Data.ClassType);
  LField := LType.GetField(Field);
  Result := GetEnumValue(TypeInfo(T), LField.GetValue(Data).ToString);
end;

procedure TCieloEnumInterceptor<T>.StringToEnumValue(Data: TObject; Field: string; Value: Integer);
var
  LRttiContext: TRttiContext;
  LValue: Integer;
  LType: TRttiType;
  LField: TRttiField;
begin
  ExpectTypeKind(tkEnumeration);
  LRttiContext := TRttiContext.Create;
  LType := LRttiContext.GetType(Data.ClassType);
  LField := LType.GetField(Field);
  LField.SetValue(Data, TValue.From(Value));
end;

{ TCieloPaymentTypeInterceptor }

function TCieloPaymentTypeInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloPaymentType(ObjectToEnumValue(Data, Field)).ToString;
end;

procedure TCieloPaymentTypeInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloPaymentType.Null))
  else if Arg.Trim.ToUpper = 'CREDITCARD' then
    StringToEnumValue(Data, Field, Integer(TCieloPaymentType.CreditCard))
  else if Arg.Trim.ToUpper = 'DEBITCARD' then
    StringToEnumValue(Data, Field, Integer(TCieloPaymentType.DebitCard))
  else if Arg.Trim.ToUpper = 'BOLETO' then
    StringToEnumValue(Data, Field, Integer(TCieloPaymentType.Boleto))
  else if Arg.Trim.ToUpper = 'ELETRONICTRANSFER' then
    StringToEnumValue(Data, Field, Integer(TCieloPaymentType.EletronicTransfer));
end;

{ TCieloProviderInterceptor }

function TCieloProviderInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloProvider(ObjectToEnumValue(Data, Field)).ToString;
end;

procedure TCieloProviderInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloProvider.Null))
  else if Arg.Trim.ToUpper = 'CIELO' then
    StringToEnumValue(Data, Field, Integer(TCieloProvider.Cielo))
  else if Arg.Trim.ToUpper = 'BRADESCO' then
    StringToEnumValue(Data, Field, Integer(TCieloProvider.Bradesco))
  else if Arg.Trim.ToUpper = 'BANCODOBRASIL' then
    StringToEnumValue(Data, Field, Integer(TCieloProvider.BancodoBrasil))
  else if Arg.Trim.ToUpper = 'BRADESCO2' then
    StringToEnumValue(Data, Field, Integer(TCieloProvider.Bradesco2))
  else if Arg.Trim.ToUpper = 'BANCODOBRASIL2' then
    StringToEnumValue(Data, Field, Integer(TCieloProvider.BancodoBrasil2));
end;

{ TCieloCustomerIdentityTypeInterceptor }

function TCieloCustomerIdentityTypeInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloCustomerIdentityType(ObjectToEnumValue(Data, Field)).ToString;
end;

procedure TCieloCustomerIdentityTypeInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerIdentityType.Null))
  else if Arg.Trim.ToUpper = 'RG' then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerIdentityType.RG))
  else if Arg.Trim.ToUpper = 'CPF' then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerIdentityType.CPF))
  else if Arg.Trim.ToUpper = 'CPNJ' then
    StringToEnumValue(Data, Field, Integer(TCieloCustomerIdentityType.CPNJ));
end;

{ TCieloBrandTypeInterceptor }

function TCieloBrandTypeInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloBrandType(ObjectToEnumValue(Data, Field)).ToString;
end;

procedure TCieloBrandTypeInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.Null))
  else if Arg.Trim.ToUpper = 'VISA' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.Visa))
  else if Arg.Trim.ToUpper = 'MASTERCARD' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.MasterCard))
  else if Arg.Trim.ToUpper = 'AMERICANEXPRESS' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.AmericanExpress))
  else if Arg.Trim.ToUpper = 'ELO' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.Elo))
  else if Arg.Trim.ToUpper = 'DINERSCLUB' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.DinersClub))
  else if Arg.Trim.ToUpper = 'DISCOVER' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.Discover))
  else if Arg.Trim.ToUpper = 'JCB' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.JCB))
  else if Arg.Trim.ToUpper = 'AURA' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.Aura))
  else if Arg.Trim.ToUpper = 'HIPERCARD' then
    StringToEnumValue(Data, Field, Integer(TCieloBrandType.Hipercard));
end;

{ TCieloDateInterceptor }

function TCieloDateInterceptor.StringConverter(Data: TObject; Field: string): string;
var
  LRttiContext: TRttiContext;
  LValue: Integer;
  LType: TRttiType;
  LField: TRttiField;
  LExtendedDate: Extended;
begin
  LRttiContext := TRttiContext.Create;
  LType := LRttiContext.GetType(Data.ClassType);
  LField := LType.GetField(Field);
  LExtendedDate:=LField.GetValue(Data).AsExtended;
  if LExtendedDate > 0 then
  Result:= FormatDateTime('yyyy-mm-dd', StrToDateTime(LField.GetValue(Data).ToString)  )
  else
  Result:= EmptyStr;
end;

procedure TCieloDateInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  inherited;

end;

{ TCieloRecurrentIntervalInterceptor }

function TCieloRecurrentIntervalInterceptor.StringConverter(Data: TObject; Field: string): string;
begin
  Result := TCieloRecurrentInterval(ObjectToEnumValue(Data, Field)).ToString;
end;

procedure TCieloRecurrentIntervalInterceptor.StringReverter(Data: TObject; Field, Arg: string);
begin
  inherited;
  if Arg.Trim.IsEmpty then
    StringToEnumValue(Data, Field, Integer(TCieloRecurrentInterval.Null))
  else if Arg.Trim.ToUpper = 'MONTHLY' then
    StringToEnumValue(Data, Field, Integer(TCieloRecurrentInterval.Monthly ))
  else if Arg.Trim.ToUpper = 'BIMONTHLY' then
    StringToEnumValue(Data, Field, Integer(TCieloRecurrentInterval.Bimonthly))
  else if Arg.Trim.ToUpper = 'QUARTERLY' then
    StringToEnumValue(Data, Field, Integer(TCieloRecurrentInterval.Quarterly))
  else if Arg.Trim.ToUpper = 'SEMIANNUAL' then
    StringToEnumValue(Data, Field, Integer(TCieloRecurrentInterval.SemiAnnual))
  else if Arg.Trim.ToUpper = 'ANNUAL' then
    StringToEnumValue(Data, Field, Integer(TCieloRecurrentInterval.Annual));
end;

end.
