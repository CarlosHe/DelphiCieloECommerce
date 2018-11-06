unit Cielo.ECommerce.Classes;

interface

uses Cielo.ECommerce.Interfaces, Cielo.ECommerce.Types, System.JSON, REST.JSON, REST.JSON.Types,
  System.Net.HttpClient, REST.JsonReflect, Cielo.ECommerce.JSONInterceptors, Cielo.ECommerce.UrlBuilder,
  System.SysUtils, System.Generics.Collections;

type

  TCieloECMerchant = class(TInterfacedObject, ICieloECMerchant)
  private
    { private declarations }
    FMerchantId: TGUID;
    FMerchantKey: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function MerchantId(AValue: TGUID): ICieloECMerchant; overload;
    function MerchantKey(AValue: string): ICieloECMerchant; overload;
    function MerchantId: TGUID; overload;
    function MerchantKey: string; overload;
  published
    { published declarations }
  end;

  TCieloECAddress = class(TInterfacedObject, ICieloECAddress, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Street')]
    FStreet: string;
    [JsonName('Number')]
    FNumber: string;
    [JsonName('Complement')]
    FComplement: string;
    [JsonName('ZipCode')]
    FZipCode: string;
    [JsonName('City')]
    FCity: string;
    [JsonName('State')]
    FState: string;
    [JsonName('Country')]
    FCountry: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Street(AValue: string): ICieloECAddress; overload;
    function Number(AValue: string): ICieloECAddress; overload;
    function Complement(AValue: string): ICieloECAddress; overload;
    function ZipCode(AValue: string): ICieloECAddress; overload;
    function City(AValue: string): ICieloECAddress; overload;
    function State(AValue: string): ICieloECAddress; overload;
    function Country(AValue: string): ICieloECAddress; overload;
    function Street: string; overload;
    function Number: string; overload;
    function Complement: string; overload;
    function ZipCode: string; overload;
    function City: string; overload;
    function State: string; overload;
    function Country: string; overload;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECDeliveryAddress = class(TInterfacedObject, ICieloECDeliveryAddress, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Complement')]
    FComplement: string;
    [JsonName('ZipCode')]
    FZipCode: string;
    [JsonName('City')]
    FCity: string;
    [JsonName('State')]
    FState: string;
    [JsonName('Country')]
    FCountry: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Complement(AValue: string): ICieloECDeliveryAddress; overload;
    function ZipCode(AValue: string): ICieloECDeliveryAddress; overload;
    function City(AValue: string): ICieloECDeliveryAddress; overload;
    function State(AValue: string): ICieloECDeliveryAddress; overload;
    function Country(AValue: string): ICieloECDeliveryAddress; overload;

    function Complement: string; overload;
    function ZipCode: string; overload;
    function City: string; overload;
    function State: string; overload;
    function Country: string; overload;

    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECRecurrentPayment = class(TInterfacedObject, ICieloECRecurrentPayment, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('AuthorizeNow')]
    FAuthorizeNow: Boolean;
    [JsonName('StartDate'), JsonReflect(ctString, rtString, TCieloDateInterceptor, nil, true)]
    FStartDate: TDate;
    [JsonName('EndDate'), JsonReflect(ctString, rtString, TCieloDateInterceptor, nil, true)]
    FEndDate: TDate;
    [JsonName('Interval'), JsonReflect(ctString, rtString, TCieloRecurrentIntervalInterceptor, nil, true)]
    FInterval: TCieloRecurrentInterval;
  protected
    { protected declarations }
  public
    { public declarations }
    function AuthorizeNow(AValue: Boolean): ICieloECRecurrentPayment; overload;
    function StartDate(AValue: TDate): ICieloECRecurrentPayment; overload;
    function EndDate(AValue: TDate): ICieloECRecurrentPayment; overload;
    function Interval(AValue: TCieloRecurrentInterval): ICieloECRecurrentPayment; overload;

    function AuthorizeNow: Boolean; overload;
    function StartDate: TDate; overload;
    function EndDate: TDate; overload;
    function Interval: TCieloRecurrentInterval; overload;

    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECCard = class(TInterfacedObject, ICieloECCard, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Brand'), JsonReflect(ctString, rtString, TCieloBrandTypeInterceptor, nil, true)]
    FBrand: TCieloBrandType;
    [JsonName('CardNumber')]
    FCardNumber: string;
    [JsonName('ExpirationDate')]
    FExpirationDate: string;
    [JsonName('Holder')]
    FHolder: string;
    [JsonName('SecurityCode')]
    FSecurityCode: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Brand(AValue: TCieloBrandType): ICieloECCard; overload;
    function CardNumber(AValue: string): ICieloECCard; overload;
    function ExpirationDate(AValue: string): ICieloECCard; overload;
    function Holder(AValue: string): ICieloECCard; overload;
    function SecurityCode(AValue: string): ICieloECCard; overload;

    function Brand: TCieloBrandType; overload;
    function CardNumber: string; overload;
    function ExpirationDate: string; overload;
    function Holder: string; overload;
    function SecurityCode: string; overload;

    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECCustomer = class(TInterfacedObject, ICieloECCustomer, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Status'), JsonReflect(ctString, rtString, TCieloCustomerStatusInterceptor, nil, true)]
    FStatus: TCieloCustomerStatus;
    [JsonName('Name')]
    FName: string;
    [JsonName('Identity')]
    FIdentity: string;
    [JsonName('IdentityType'), JsonReflect(ctString, rtString, TCieloCustomerIdentityTypeInterceptor, nil, true)]
    FIdentityType: TCieloCustomerIdentityType;
    [JsonName('Email')]
    FEmail: string;
    [JsonName('Birthdate'), JsonReflect(ctString, rtString, TCieloDateInterceptor, nil, true)]
    FBirthdate: TDate;
    [JSONMarshalled(False)]
    FAddress: ICieloECAddress;
    [JSONMarshalled(False)]
    FDeliveryAddress: ICieloECDeliveryAddress;
  protected
    { protected declarations }
  public
    { public declarations }
    function Status(AValue: TCieloCustomerStatus): ICieloECCustomer; overload;
    function Name(AValue: string): ICieloECCustomer; overload;
    function Identity(AValue: string): ICieloECCustomer; overload;
    function IdentityType(AValue: TCieloCustomerIdentityType): ICieloECCustomer; overload;
    function Email(AValue: string): ICieloECCustomer; overload;
    function Birthdate(AValue: TDate): ICieloECCustomer; overload;
    function Address(AValue: ICieloECAddress): ICieloECCustomer; overload;
    function DeliveryAddress(AValue: ICieloECDeliveryAddress): ICieloECCustomer; overload;

    function Status: TCieloCustomerStatus; overload;
    function Name: string; overload;
    function Identity: string; overload;
    function IdentityType: TCieloCustomerIdentityType; overload;
    function Email: string; overload;
    function Birthdate: TDate; overload;
    function Address: ICieloECAddress; overload;
    function DeliveryAddress: ICieloECDeliveryAddress; overload;

    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPaymentTypeBase = class(TInterfacedObject)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    function &GetType: TCieloPaymentType; virtual;
  published
    { published declarations }
  end;

  TCieloECPaymentCreditCard = class(TCieloECPaymentTypeBase, ICieloECPaymentCreditCard, ICieloECExportToJson)
  private
    { private declarations }
    FAuthenticate: Boolean;
    FBrand: TCieloBrandType;
    FCapture: Boolean;
    FCardNumber: string;
    FCountry: string;
    FCurrency: string;
    FExpirationDate: string;
    FHolder: string;
    FInstallments: Integer;
    FInterest: TCieloInterest;
    FProvider: TCieloProvider;
    FReturnUrl: string;
    FSaveCard: Boolean;
    FSecurityCode: string;
    FServiceTaxAmount: Single;
    FSoftDescriptor: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Authenticate(AValue: Boolean): ICieloECPaymentCreditCard; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCreditCard; overload;
    function Capture(AValue: Boolean): ICieloECPaymentCreditCard; overload;
    function CardNumber(AValue: string): ICieloECPaymentCreditCard; overload;
    function Country(AValue: string): ICieloECPaymentCreditCard; overload;
    function Currency(AValue: string): ICieloECPaymentCreditCard; overload;
    function ExpirationDate(AValue: string): ICieloECPaymentCreditCard; overload;
    function Holder(AValue: string): ICieloECPaymentCreditCard; overload;
    function Installments(AValue: Integer): ICieloECPaymentCreditCard; overload;
    function Interest(AValue: TCieloInterest): ICieloECPaymentCreditCard; overload;
    function Provider(AValue: TCieloProvider): ICieloECPaymentCreditCard; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentCreditCard; overload;
    function SaveCard(AValue: Boolean): ICieloECPaymentCreditCard; overload;
    function SecurityCode(AValue: string): ICieloECPaymentCreditCard; overload;
    function ServiceTaxAmount(AValue: Single): ICieloECPaymentCreditCard; overload;
    function SoftDescriptor(AValue: string): ICieloECPaymentCreditCard; overload;

    function Authenticate: Boolean; overload;
    function Brand: TCieloBrandType; overload;
    function Capture: Boolean; overload;
    function CardNumber: string; overload;
    function Country: string; overload;
    function Currency: string; overload;
    function ExpirationDate: string; overload;
    function Holder: string; overload;
    function Installments: Integer; overload;
    function Interest: TCieloInterest; overload;
    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;
    function SaveCard: Boolean; overload;
    function SecurityCode: string; overload;
    function ServiceTaxAmount: Single; overload;
    function SoftDescriptor: string; overload;

    function &GetType: TCieloPaymentType; override;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPaymentDebitCard = class(TCieloECPaymentTypeBase, ICieloECPaymentDebitCard, ICieloECExportToJson)
  private
    { private declarations }
    FAuthenticate: Boolean;
    FBrand: TCieloBrandType;
    FCardNumber: string;
    FExpirationDate: string;
    FHolder: string;
    FReturnUrl: string;
    FSecurityCode: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Authenticate(AValue: Boolean): ICieloECPaymentDebitCard; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentDebitCard; overload;
    function CardNumber(AValue: string): ICieloECPaymentDebitCard; overload;
    function ExpirationDate(AValue: string): ICieloECPaymentDebitCard; overload;
    function Holder(AValue: string): ICieloECPaymentDebitCard; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentDebitCard; overload;
    function SecurityCode(AValue: string): ICieloECPaymentDebitCard; overload;

    function CardNumber: string; overload;
    function Holder: string; overload;
    function ExpirationDate: string; overload;
    function SecurityCode: string; overload;
    function Brand: TCieloBrandType; overload;
    function Authenticate: Boolean; overload;
    function ReturnUrl: string; overload;

    function &GetType: TCieloPaymentType; override;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPaymentRecurrentCreditCard = class(TCieloECPaymentTypeBase, ICieloECPaymentRecurrentCreditCard, ICieloECExportToJson)
  private
    { private declarations }
    FAuthenticate: Boolean;
    FBrand: TCieloBrandType;
    FCapture: Boolean;
    FCardNumber: string;
    FCountry: string;
    FCurrency: string;
    FExpirationDate: string;
    FHolder: string;
    FInstallments: Integer;
    FInterest: TCieloInterest;
    FProvider: TCieloProvider;
    FRecurrent: Boolean;
    FRecurrentPayment: ICieloECRecurrentPayment;
    FReturnUrl: string;
    FSaveCard: Boolean;
    FSecurityCode: string;
    FServiceTaxAmount: Single;
    FSoftDescriptor: string;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    function Authenticate(AValue: Boolean): ICieloECPaymentRecurrentCreditCard; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentRecurrentCreditCard; overload;
    function Capture(AValue: Boolean): ICieloECPaymentRecurrentCreditCard; overload;
    function CardNumber(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function Country(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function Currency(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function ExpirationDate(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function Holder(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function Interest(AValue: TCieloInterest): ICieloECPaymentRecurrentCreditCard; overload;
    function Provider(AValue: TCieloProvider): ICieloECPaymentRecurrentCreditCard; overload;
    function Recurrent(AValue: Boolean): ICieloECPaymentRecurrentCreditCard; overload;
    function RecurrentPayment(AValue: ICieloECRecurrentPayment): ICieloECPaymentRecurrentCreditCard; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function SaveCard(AValue: Boolean): ICieloECPaymentRecurrentCreditCard; overload;
    function SecurityCode(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function ServiceTaxAmount(AValue: Single): ICieloECPaymentRecurrentCreditCard; overload;
    function SoftDescriptor(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;

    function Authenticate: Boolean; overload;
    function Brand: TCieloBrandType; overload;
    function Capture: Boolean; overload;
    function CardNumber: string; overload;
    function Country: string; overload;
    function Currency: string; overload;
    function ExpirationDate: string; overload;
    function Holder: string; overload;
    function Interest: TCieloInterest; overload;
    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;
    function SaveCard: Boolean; overload;
    function SecurityCode: string; overload;
    function ServiceTaxAmount: Single; overload;
    function SoftDescriptor: string; overload;
    function Recurrent: Boolean; overload;
    function RecurrentPayment: ICieloECRecurrentPayment; overload;

    function &GetType: TCieloPaymentType; override;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPaymentCardToken = class(TCieloECPaymentTypeBase, ICieloECPaymentCardToken, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('CardToken')]
    FCardToken: string;
    [JsonName('SecurityCode')]
    FSecurityCode: string;
    [JsonName('Brand'), JsonReflect(ctString, rtString, TCieloBrandTypeInterceptor, nil, true)]
    FBrand: TCieloBrandType;
  protected
    { protected declarations }
  public
    { public declarations }
    function CardToken(AValue: string): ICieloECPaymentCardToken; overload;
    function SecurityCode(AValue: string): ICieloECPaymentCardToken; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCardToken; overload;

    function CardToken: string; overload;
    function SecurityCode: string; overload;
    function Brand: TCieloBrandType; overload;

    function &GetType: TCieloPaymentType; override;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPaymentBoleto = class(TCieloECPaymentTypeBase, ICieloECPaymentBoleto, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Provider'), JsonReflect(ctString, rtString, TCieloProviderInterceptor, nil, true)]
    FProvider: TCieloProvider;
    [JsonName('ReturnUrl')]
    FReturnUrl: string;
    [JsonName('Address')]
    FAddress: string;
    [JsonName('BoletoNumber')]
    FBoletoNumber: string;
    [JsonName('Assignor')]
    FAssignor: string;
    [JsonName('Demonstrative')]
    FDemonstrative: string;
    [JsonName('ExpirationDate'), JsonReflect(ctString, rtString, TCieloDateInterceptor, nil, true)]
    FExpirationDate: TDate;
    [JsonName('Identification')]
    FIdentification: string;
    [JsonName('Instructions')]
    FInstructions: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Provider(AValue: TCieloProvider): ICieloECPaymentBoleto; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentBoleto; overload;
    function Address(AValue: string): ICieloECPaymentBoleto; overload;
    function BoletoNumber(AValue: string): ICieloECPaymentBoleto; overload;
    function Assignor(AValue: string): ICieloECPaymentBoleto; overload;
    function Demonstrative(AValue: string): ICieloECPaymentBoleto; overload;
    function ExpirationDate(AValue: TDate): ICieloECPaymentBoleto; overload;
    function Identification(AValue: string): ICieloECPaymentBoleto; overload;
    function Instructions(AValue: string): ICieloECPaymentBoleto; overload;

    function Address: string; overload;
    function BoletoNumber: string; overload;
    function Assignor: string; overload;
    function Demonstrative: string; overload;
    function ExpirationDate: TDate; overload;
    function Identification: string; overload;
    function Instructions: string; overload;
    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;

    function &GetType: TCieloPaymentType; override;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPaymentEletronicTransfer = class(TCieloECPaymentTypeBase, ICieloECPaymentEletronicTransfer, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Provider'), JsonReflect(ctString, rtString, TCieloProviderInterceptor, nil, true)]
    FProvider: TCieloProvider;
    [JsonName('ReturnUrl')]
    FReturnUrl: string;
  protected
    { protected declarations }
  public
    { public declarations }
    function Provider(AValue: TCieloProvider): ICieloECPaymentEletronicTransfer; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentEletronicTransfer; overload;

    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;

    function &GetType: TCieloPaymentType; override;
    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECPayment = class(TInterfacedObject, ICieloECPayment, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('Type')]
    FType: string;
    [JSONMarshalled(False), JsonReflect(ctString, rtString, TCieloPaymentTypeInterceptor, nil, true)]
    FPaymentType: ICieloECPaymentType;
    [JsonName('Amount')]
    FAmount: Single;
  protected
    { protected declarations }
  public
    { public declarations }
    function &Type(AValue: ICieloECPaymentType): ICieloECPayment; overload;
    function Amount(AValue: Single): ICieloECPayment; overload;

    function &Type: ICieloECPaymentType; overload;
    function Amount: Single; overload;

    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECOrder = class(TInterfacedObject, ICieloECOrder, ICieloECExportToJson)
  private
    { private declarations }
    [JsonName('MerchantOrderId')]
    FMerchantOrderId: string;
    [JSONMarshalled(False)]
    FCustomer: ICieloECCustomer;
    [JSONMarshalled(False)]
    FPayment: ICieloECPayment;
  protected
    { protected declarations }
  public
    { public declarations }
    function MerchantOrderId(AValue: string): ICieloECOrder; overload;
    function Customer(AValue: ICieloECCustomer): ICieloECOrder; overload;
    function Payment(AValue: ICieloECPayment): ICieloECOrder; overload;

    function MerchantOrderId: string; overload;
    function Customer: ICieloECCustomer; overload;
    function Payment: ICieloECPayment; overload;

    function ToJSON: TJsonObject;
  published
    { published declarations }
  end;

  TCieloECResponseError = class(TInterfacedObject, ICieloECResponseError)
  private
    { private declarations }
    FCode: Integer;
    FMessage: string;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create(ACode: Integer; AMessage: string);
    class function New(ACode: Integer; AMessage: string): ICieloECResponseError;
    function Code: Integer;
    function &Message: string;
  published
    { published declarations }
  end;

  TCieloECAPI = class(TInterfacedObject, ICieloECAPI)
  private
    { private declarations }
    FHttpClient: THTTPClient;
    FMerchant: ICieloECMerchant;
    FRequestId: TGUID;
    FEnvironment: TCieloEnvironment;
  protected
    { protected declarations }
    function BuildUrlParams(AParams: TDictionary<string, string>): string;
    function Post(ARoute, ABody: string): IHTTPResponse;
    function Get(ARoute: string; const AParams: TDictionary<string, string> = nil): IHTTPResponse;
    function Put(ARoute: string; const AParams: TDictionary<string, string> = nil; const ABody: string = ''): IHTTPResponse;
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    function Merchant(AValue: ICieloECMerchant): ICieloECAPI; overload;
    function RequestId(AValue: TGUID): ICieloECAPI; overload;
    function Environment(AValue: TCieloEnvironment): ICieloECAPI; overload;

    function Merchant: ICieloECMerchant; overload;
    function RequestId: TGUID; overload;
    function Environment: TCieloEnvironment; overload;

    function NewSale(ACieloECOrder: ICieloECOrder; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetSale(APaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetPayments(AMerchantOrderId: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetRecurrentPayment(ARecurrentPaymentId: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetCatchSale(APaymentId: TGUID; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function CancelPayment(APaymentId: TGUID; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function CancelOrder(AMerchantOrderId: string; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function UpdateRecurrentPayment_Customer(ARecurrentPaymentId: TGUID; ACieloECCustomer: ICieloECCustomer;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_EndDate(ARecurrentPaymentId: TGUID; ADate: TDate; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function UpdateRecurrentPayment_Interval(ARecurrentPaymentId: TGUID; ARecurrentInterval: TCieloRecurrentInterval;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_RecurrencyDay(ARecurrentPaymentId: TGUID; ARecurrencyDay: Byte;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Amount(ARecurrentPaymentId: TGUID; AAmount: Integer; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function UpdateRecurrentPayment_NextPaymentDate(ARecurrentPaymentId: TGUID; ANextPaymentDate: TDate;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Payment(ARecurrentPaymentId: TGUID; APayment: ICieloECPaymentCreditCard;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Deactivate(ARecurrentPaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Reactivate(ARecurrentPaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function NewCardToken(ACustomName: string; ACard: ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function ZeroAuth(ACieloECCard: ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI; overload;
    function ZeroAuth(ACieloECCardToken: ICieloECCardToken; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI; overload;
    function CardBin(ACardBIN: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
  published
    { published declarations }
  end;

  TCieloECResponse = class(TInterfacedObject, ICieloECResponse)
  private
    { private declarations }
    FHTTPResponse: IHTTPResponse;
    FCieloECResponseErrorList: TList<ICieloECResponseError>;
  protected
    { protected declarations }
    procedure JsonObjectToResponseErrorList(AJsonObject: TJsonObject);
  public
    { public declarations }
    constructor Create(AHTTPResponse: IHTTPResponse);
    destructor Destroy; override;
    function ContentAsString(const AEncoding: TEncoding = nil): string;
    function ContentAsJsonObject(const AEncoding: TEncoding = nil): TJsonObject;
    function Success: Boolean;
    function HasError: Boolean;
    function GetErrorList: TList<ICieloECResponseError>;
  published
    { published declarations }
  end;

implementation

uses
  System.Classes;

{ TCieloECMerchant }

function TCieloECMerchant.MerchantId(AValue: TGUID): ICieloECMerchant;
begin
  FMerchantId := AValue;
  Result := Self;
end;

function TCieloECMerchant.MerchantKey(AValue: string): ICieloECMerchant;
begin
  FMerchantKey := AValue;
  Result := Self;
end;

function TCieloECMerchant.MerchantKey: string;
begin
  Result := FMerchantKey;
end;

function TCieloECMerchant.MerchantId: TGUID;
begin
  Result := FMerchantId;
end;

{ TCieloECAddress }

function TCieloECAddress.City(AValue: string): ICieloECAddress;
begin
  FCity := AValue;
  Result := Self;
end;

function TCieloECAddress.Complement(AValue: string): ICieloECAddress;
begin
  FComplement := AValue;
  Result := Self;
end;

function TCieloECAddress.Country(AValue: string): ICieloECAddress;
begin
  FCountry := AValue;
  Result := Self;
end;

function TCieloECAddress.Number(AValue: string): ICieloECAddress;
begin
  FNumber := AValue;
  Result := Self;
end;

function TCieloECAddress.State(AValue: string): ICieloECAddress;
begin
  FState := AValue;
  Result := Self;
end;

function TCieloECAddress.Street(AValue: string): ICieloECAddress;
begin
  FStreet := AValue;
  Result := Self;
end;

function TCieloECAddress.ToJSON: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
end;

function TCieloECAddress.ZipCode: string;
begin
  Result := FZipCode;
end;

function TCieloECAddress.ZipCode(AValue: string): ICieloECAddress;
begin
  FZipCode := AValue;
  Result := Self;
end;

function TCieloECAddress.City: string;
begin
  Result := FCity;
end;

function TCieloECAddress.Complement: string;
begin
  Result := FComplement;
end;

function TCieloECAddress.Country: string;
begin
  Result := FCountry;
end;

function TCieloECAddress.Number: string;
begin
  Result := FNumber;
end;

function TCieloECAddress.State: string;
begin
  Result := FState;
end;

function TCieloECAddress.Street: string;
begin
  Result := FStreet;
end;

{ TCieloECDeliveryAddress }

function TCieloECDeliveryAddress.City(AValue: string): ICieloECDeliveryAddress;
begin
  FCity := AValue;
  Result := Self;
end;

function TCieloECDeliveryAddress.Complement(AValue: string): ICieloECDeliveryAddress;
begin
  FComplement := AValue;
  Result := Self;
end;

function TCieloECDeliveryAddress.Country(AValue: string): ICieloECDeliveryAddress;
begin
  FCountry := AValue;
  Result := Self;
end;

function TCieloECDeliveryAddress.State(AValue: string): ICieloECDeliveryAddress;
begin
  FState := AValue;
  Result := Self;
end;

function TCieloECDeliveryAddress.ToJSON: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
end;

function TCieloECDeliveryAddress.ZipCode: string;
begin
  Result := FZipCode;
end;

function TCieloECDeliveryAddress.ZipCode(AValue: string): ICieloECDeliveryAddress;
begin
  FZipCode := AValue;
  Result := Self;
end;

function TCieloECDeliveryAddress.City: string;
begin
  Result := FCity;
end;

function TCieloECDeliveryAddress.Complement: string;
begin
  Result := FComplement;
end;

function TCieloECDeliveryAddress.Country: string;
begin
  Result := FCountry;
end;

function TCieloECDeliveryAddress.State: string;
begin
  Result := FState;
end;

{ TCieloECCustomer }

function TCieloECCustomer.Address(AValue: ICieloECAddress): ICieloECCustomer;
begin
  FAddress := AValue;
  Result := Self;
end;

function TCieloECCustomer.Birthdate(AValue: TDate): ICieloECCustomer;
begin
  FBirthdate := AValue;
  Result := Self;
end;

function TCieloECCustomer.DeliveryAddress(AValue: ICieloECDeliveryAddress): ICieloECCustomer;
begin
  FDeliveryAddress := AValue;
  Result := Self;
end;

function TCieloECCustomer.Email(AValue: string): ICieloECCustomer;
begin
  FEmail := AValue;
  Result := Self;
end;

function TCieloECCustomer.Identity(AValue: string): ICieloECCustomer;
begin
  FIdentity := AValue;
  Result := Self;
end;

function TCieloECCustomer.IdentityType(AValue: TCieloCustomerIdentityType): ICieloECCustomer;
begin
  FIdentityType := AValue;
  Result := Self;
end;

function TCieloECCustomer.Name(AValue: string): ICieloECCustomer;
begin
  FName := AValue;
  Result := Self;
end;

function TCieloECCustomer.Status(AValue: TCieloCustomerStatus): ICieloECCustomer;
begin
  FStatus := AValue;
  Result := Self;
end;

function TCieloECCustomer.ToJSON: TJsonObject;
var
  LJsonObject: TJsonObject;
  LExportToJson: ICieloECExportToJson;
begin
  LJsonObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);

  if Supports(FAddress, ICieloECExportToJson, LExportToJson) then
    LJsonObject.AddPair('Address', TJsonValue(LExportToJson.ToJSON));
  if Supports(FDeliveryAddress, ICieloECExportToJson, LExportToJson) then
    LJsonObject.AddPair('DeliveryAddress', TJsonValue(LExportToJson.ToJSON));
  Result := LJsonObject;
end;

function TCieloECCustomer.Address: ICieloECAddress;
begin
  Result := FAddress;
end;

function TCieloECCustomer.Birthdate: TDate;
begin
  Result := FBirthdate;
end;

function TCieloECCustomer.DeliveryAddress: ICieloECDeliveryAddress;
begin
  Result := FDeliveryAddress;
end;

function TCieloECCustomer.Email: string;
begin
  Result := FEmail;
end;

function TCieloECCustomer.Identity: string;
begin
  Result := FIdentity;
end;

function TCieloECCustomer.IdentityType: TCieloCustomerIdentityType;
begin
  Result := FIdentityType;
end;

function TCieloECCustomer.Name: string;
begin
  Result := FName;
end;

function TCieloECCustomer.Status: TCieloCustomerStatus;
begin
  Result := FStatus;
end;

{ TCieloECPaymentTypeBase }

function TCieloECPaymentTypeBase.GetType: TCieloPaymentType;
begin

end;

{ TCieloECPayment }

function TCieloECPayment.Amount(AValue: Single): ICieloECPayment;
begin
  FAmount := AValue;
  Result := Self;
end;

function TCieloECPayment.Amount: Single;
begin
  Result := FAmount;
end;

function TCieloECPayment.ToJSON: TJsonObject;
var
  LJsonObject: TJsonObject;
  LExportToJson: ICieloECExportToJson;
  LExportedJson: TJsonObject;
  LJsonString: TJsonString;
  LJsonValue: TJsonValue;
  I: Integer;
begin
  LJsonObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
  if Supports(FPaymentType, ICieloECExportToJson, LExportToJson) then
  begin
    LExportedJson := LExportToJson.ToJSON;
    try
      for I := 0 to LExportedJson.Count - 1 do
        LJsonObject.AddPair(TJsonPair(LExportedJson.Pairs[I].Clone));
    finally
      LExportedJson.Free;
    end;
  end;
  Result := LJsonObject;
end;

function TCieloECPayment.&Type(AValue: ICieloECPaymentType): ICieloECPayment;
begin
  FType := AValue.GetType.ToString;
  FPaymentType := AValue;
  Result := Self;
end;

function TCieloECPayment.&Type: ICieloECPaymentType;
begin
  Result := FPaymentType;
end;

{ TCieloECOrder }

function TCieloECOrder.Customer(AValue: ICieloECCustomer): ICieloECOrder;
begin
  FCustomer := AValue;
  Result := Self;
end;

function TCieloECOrder.MerchantOrderId(AValue: string): ICieloECOrder;
begin
  FMerchantOrderId := AValue;
  Result := Self;
end;

function TCieloECOrder.Payment(AValue: ICieloECPayment): ICieloECOrder;
begin
  FPayment := AValue;
  Result := Self;
end;

function TCieloECOrder.ToJSON: TJsonObject;
var
  LJsonObject: TJsonObject;
  LExportToJson: ICieloECExportToJson;
begin
  LJsonObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);

  if Supports(FCustomer, ICieloECExportToJson, LExportToJson) then
    LJsonObject.AddPair('Customer', TJsonValue(LExportToJson.ToJSON));

  if Supports(FPayment, ICieloECExportToJson, LExportToJson) then
    LJsonObject.AddPair('Payment', TJsonValue(LExportToJson.ToJSON));

  Result := LJsonObject;
end;

function TCieloECOrder.Customer: ICieloECCustomer;
begin
  Result := FCustomer;
end;

function TCieloECOrder.MerchantOrderId: string;
begin
  Result := FMerchantOrderId;
end;

function TCieloECOrder.Payment: ICieloECPayment;
begin
  Result := FPayment;
end;

{ TCieloECAPI }

function TCieloECAPI.BuildUrlParams(AParams: TDictionary<string, string>): string;
var
  LKey: string;
  LUrlParams: string;
begin
  for LKey in AParams.Keys do
  begin
    LUrlParams := LUrlParams + LKey + '=' + AParams.Items[LKey] + '&';
  end;
  if not LUrlParams.Trim.IsEmpty then
    LUrlParams := '?' + LUrlParams;
  Result := LUrlParams.TrimRight(['&']);
end;

function TCieloECAPI.CancelOrder(AMerchantOrderId: string; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
  : ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/sales/OrderId/' + AMerchantOrderId + '/void', AParams)));
  Result := Self;
end;

function TCieloECAPI.CancelPayment(APaymentId: TGUID; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
  : ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/sales/' + APaymentId.ToString.Trim(['{', '}']) + '/void', AParams)));
  Result := Self;
end;

function TCieloECAPI.CardBin(ACardBIN: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Get('/1/cardBin/' + ACardBIN.Trim)));
  Result := Self;
end;

constructor TCieloECAPI.Create;
begin
  FHttpClient := THTTPClient.Create;
  FHttpClient.ContentType := 'application/json';
end;

destructor TCieloECAPI.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

function TCieloECAPI.Environment: TCieloEnvironment;
begin
  Result := FEnvironment;
end;

function TCieloECAPI.Environment(AValue: TCieloEnvironment): ICieloECAPI;
begin
  FEnvironment := AValue;
  Result := Self;
end;

function TCieloECAPI.Get(ARoute: string; const AParams: TDictionary<string, string> = nil): IHTTPResponse;
var
  LParams: string;
begin
  if AParams <> nil then
  begin
    LParams := BuildUrlParams(AParams);
    AParams.Free;
  end;
  Result := FHttpClient.Get(TCieloECUrlBuilder.Query(TCieloEnvironment.Sandbox) + ARoute + LParams);
end;

function TCieloECAPI.GetCatchSale(APaymentId: TGUID; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
  : ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/sales/' + APaymentId.ToString.Trim(['{', '}']) + '/capture', AParams)));
  Result := Self;
end;

function TCieloECAPI.GetPayments(AMerchantOrderId: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LParams: TDictionary<string, string>;
begin
  LParams := TDictionary<string, string>.Create;
  LParams.Add('merchantOrderId', AMerchantOrderId);
  ACieloECResponse(TCieloECResponse.Create(Get('/1/sales', LParams)));
  Result := Self;
end;

function TCieloECAPI.GetRecurrentPayment(ARecurrentPaymentId: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Get('/1/RecurrentPayment/' + ARecurrentPaymentId)));
  Result := Self;
end;

function TCieloECAPI.GetSale(APaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Get('/1/sales/' + APaymentId.ToString.Trim(['{', '}']))));
  Result := Self;
end;

function TCieloECAPI.Merchant: ICieloECMerchant;
begin
  Result := FMerchant;
end;

function TCieloECAPI.Merchant(AValue: ICieloECMerchant): ICieloECAPI;
begin
  FHttpClient.CustomHeaders['MerchantId'] := AValue.MerchantId.ToString.Trim(['{', '}']);
  FHttpClient.CustomHeaders['MerchantKey'] := AValue.MerchantKey;
  FMerchant := AValue;
  Result := Self;
end;

function TCieloECAPI.NewCardToken(ACustomName: string; ACard: ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LExportToJson: ICieloECExportToJson;
  LJsonObject: TJsonObject;
  LJsonString: string;
begin
  if Supports(ACard, ICieloECExportToJson, LExportToJson) then
  begin
    LJsonObject := LExportToJson.ToJSON;
    LJsonObject.AddPair('CustomName', ACustomName);
    LJsonString := LJsonObject.ToString;
    LJsonObject.Free;
    ACieloECResponse(TCieloECResponse.Create(Post('/1/card/', LJsonString)));
  end;
  Result := Self;
end;

function TCieloECAPI.NewSale(ACieloECOrder: ICieloECOrder; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LExportToJson: ICieloECExportToJson;
  LJsonObject: TJsonObject;
  LJsonString: string;
begin
  if Supports(ACieloECOrder, ICieloECExportToJson, LExportToJson) then
  begin
    LJsonObject := LExportToJson.ToJSON;
    LJsonString := LJsonObject.ToString;
    LJsonObject.Free;
    ACieloECResponse(TCieloECResponse.Create(Post('/1/sales/', LJsonString)));
  end;
  Result := Self;
end;

function TCieloECAPI.Post(ARoute, ABody: string): IHTTPResponse;
var
  LSource: TStringStream;
begin
  LSource := TStringStream.Create(ABody);
  try
    Result := FHttpClient.Post(TCieloECUrlBuilder.Request(TCieloEnvironment.Sandbox) + ARoute, LSource);
  finally
    LSource.Free;
  end;
end;

function TCieloECAPI.Put(ARoute: string; const AParams: TDictionary<string, string> = nil; const ABody: string = ''): IHTTPResponse;
var
  LParams: string;
  LSource: TStringStream;
begin

  begin
    LSource := TStringStream.Create(ABody);
    try
      if AParams <> nil then
      begin
        LParams := BuildUrlParams(AParams);
        AParams.Free;
      end;
      Result := FHttpClient.Put(TCieloECUrlBuilder.Request(TCieloEnvironment.Sandbox) + ARoute + LParams, LSource);
    finally
      LSource.Free;
    end;
  end;

end;

function TCieloECAPI.RequestId: TGUID;
begin
  Result := FRequestId;
end;

function TCieloECAPI.RequestId(AValue: TGUID): ICieloECAPI;
begin
  FHttpClient.CustomHeaders['RequestId'] := AValue.ToString.Trim(['{', '}']);
  FRequestId := AValue;
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_Amount(ARecurrentPaymentId: TGUID; AAmount: Integer; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
  : ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Amount', nil,
    AAmount.ToString)));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_Customer(ARecurrentPaymentId: TGUID; ACieloECCustomer: ICieloECCustomer;
  ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LExportToJson: ICieloECExportToJson;
  LJsonObject: TJsonObject;
  LJsonString: string;
begin
  if Supports(ACieloECCustomer, ICieloECExportToJson, LExportToJson) then
  begin
    LJsonObject := LExportToJson.ToJSON;
    LJsonString := LJsonObject.ToString;
    LJsonObject.Free;
    ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Customer', nil,
      LJsonString)));
  end;
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_Deactivate(ARecurrentPaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Deactivate', nil, '')));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_EndDate(ARecurrentPaymentId: TGUID; ADate: TDate; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
  : ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/EndDate', nil,
    FormatDateTime('yyyy-mm-dd', ADate))));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_Interval(ARecurrentPaymentId: TGUID; ARecurrentInterval: TCieloRecurrentInterval;
  ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Interval', nil,
    ARecurrentInterval.ToInteger.ToString)));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_NextPaymentDate(ARecurrentPaymentId: TGUID; ANextPaymentDate: TDate;
  ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/NextPaymentDate', nil,
    FormatDateTime('yyyy-mm-dd', ANextPaymentDate))));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_Payment(ARecurrentPaymentId: TGUID; APayment: ICieloECPaymentCreditCard;
  ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LExportToJson: ICieloECExportToJson;
begin
  if Supports(APayment, ICieloECExportToJson, LExportToJson) then
    ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Payment', nil,
      LExportToJson.ToJSON.ToString)));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_Reactivate(ARecurrentPaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Reactivate', nil, '')));
  Result := Self;
end;

function TCieloECAPI.UpdateRecurrentPayment_RecurrencyDay(ARecurrentPaymentId: TGUID; ARecurrencyDay: Byte;
  ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
begin
  ACieloECResponse(TCieloECResponse.Create(Put('/1/RecurrentPayment/' + ARecurrentPaymentId.ToString.Trim(['{', '}']) + '/Interval', nil,
    ARecurrencyDay.ToString)));
  Result := Self;
end;

function TCieloECAPI.ZeroAuth(ACieloECCardToken: ICieloECCardToken; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LExportToJson: ICieloECExportToJson;
  LJsonObject: TJsonObject;
  LJsonString: string;
begin
  if Supports(ACieloECCardToken, ICieloECExportToJson, LExportToJson) then
  begin
    LJsonObject := LExportToJson.ToJSON;
    LJsonString := LJsonObject.ToString;
    LJsonObject.Free;
    ACieloECResponse(TCieloECResponse.Create(Post('/1/zeroauth', LJsonString)));
  end;
  Result := Self;
end;

function TCieloECAPI.ZeroAuth(ACieloECCard: ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
var
  LExportToJson: ICieloECExportToJson;
  LJsonObject: TJsonObject;
  LJsonString: string;
begin
  if Supports(ACieloECCard, ICieloECExportToJson, LExportToJson) then
  begin
    LJsonObject := LExportToJson.ToJSON;
    LJsonString := LJsonObject.ToString;
    LJsonObject.Free;
    ACieloECResponse(TCieloECResponse.Create(Post('/1/zeroauth', LJsonString)));
  end;
  Result := Self;
end;

{ TCieloECResponse }

function TCieloECResponse.ContentAsJsonObject(const AEncoding: TEncoding): TJsonObject;
begin
  Result := TJsonObject.ParseJSONValue(ContentAsString(AEncoding)) as TJsonObject;
end;

function TCieloECResponse.ContentAsString(const AEncoding: TEncoding): string;
begin
  Result := FHTTPResponse.ContentAsString(AEncoding);
end;

constructor TCieloECResponse.Create(AHTTPResponse: IHTTPResponse);
begin
  FHTTPResponse := AHTTPResponse;
  FCieloECResponseErrorList := TList<ICieloECResponseError>.Create;
  if FHTTPResponse.StatusCode = 400 then
  begin
    JsonObjectToResponseErrorList(TJsonObject(TJsonObject.Create.ParseJSONValue(FHTTPResponse.ContentAsString, true)));
  end;
end;

destructor TCieloECResponse.Destroy;
begin
  FCieloECResponseErrorList.Free;
  inherited;
end;

function TCieloECResponse.GetErrorList: TList<ICieloECResponseError>;
begin
  Result := FCieloECResponseErrorList;
end;

function TCieloECResponse.HasError: Boolean;
begin
  Result := FCieloECResponseErrorList.Count > 0;
end;

procedure TCieloECResponse.JsonObjectToResponseErrorList(AJsonObject: TJsonObject);
var
  LJsonArray: TJsonArray;
  I: Integer;
  LCode: Integer;
  LMessage: string;
begin
  LJsonArray := TJsonArray(AJsonObject);
  for I := 0 to LJsonArray.Count - 1 do
  begin
    if LJsonArray.Items[I].TryGetValue('Code', LCode) and LJsonArray.Items[I].TryGetValue('Message', LMessage) then
    begin
      FCieloECResponseErrorList.Add(TCieloECResponseError.New(LCode, LMessage));
    end;
  end;
end;

function TCieloECResponse.Success: Boolean;
begin
  Result := (FHTTPResponse.StatusCode = 200) or (FHTTPResponse.StatusCode = 201);
end;

{ TCieloECPaymentCardTokenBase }

function TCieloECPaymentCardToken.Brand(AValue: TCieloBrandType): ICieloECPaymentCardToken;
begin
  FBrand := AValue;
  Result := Self;
end;

function TCieloECPaymentCardToken.CardToken(AValue: string): ICieloECPaymentCardToken;
begin
  FCardToken := AValue;
  Result := Self;
end;

function TCieloECPaymentCardToken.SecurityCode(AValue: string): ICieloECPaymentCardToken;
begin
  FSecurityCode := AValue;
  Result := Self;
end;

function TCieloECPaymentCardToken.ToJSON: TJsonObject;
var
  LJsonPair: TJsonPair;
begin
  LJsonPair := TJsonPair.Create(Self.GetType.ToString, TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]) as TJsonValue);
  Result := TJsonObject(LJsonPair);
end;

{ TCieloECPaymentCardToken }

function TCieloECPaymentCardToken.CardToken: string;
begin
  Result := FCardToken;
end;

function TCieloECPaymentCardToken.GetType: TCieloPaymentType;
begin
  Result := TCieloPaymentType.CreditCard;
end;

function TCieloECPaymentCardToken.SecurityCode: string;
begin
  Result := FSecurityCode;
end;

{ TCieloECPaymentEletronicTransferBase }

function TCieloECPaymentEletronicTransfer.GetType: TCieloPaymentType;
begin
  Result := TCieloPaymentType.EletronicTransfer;
end;

function TCieloECPaymentEletronicTransfer.Provider(AValue: TCieloProvider): ICieloECPaymentEletronicTransfer;
begin
  FProvider := AValue;
  Result := Self;
end;

function TCieloECPaymentEletronicTransfer.ReturnUrl(AValue: string): ICieloECPaymentEletronicTransfer;
begin
  FReturnUrl := AValue;
  Result := Self;
end;

function TCieloECPaymentEletronicTransfer.ToJSON: TJsonObject;
var
  LJsonObject: TJsonObject;
begin
  LJsonObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
  Result := LJsonObject;
end;

{ TCieloECPaymentBoletoBase }

function TCieloECPaymentBoleto.Address(AValue: string): ICieloECPaymentBoleto;
begin
  FAddress := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.Assignor(AValue: string): ICieloECPaymentBoleto;
begin
  FAssignor := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.BoletoNumber(AValue: string): ICieloECPaymentBoleto;
begin
  FBoletoNumber := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.Demonstrative(AValue: string): ICieloECPaymentBoleto;
begin
  FDemonstrative := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.ExpirationDate(AValue: TDate): ICieloECPaymentBoleto;
begin
  FExpirationDate := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.GetType: TCieloPaymentType;
begin
  Result := TCieloPaymentType.Boleto;
end;

function TCieloECPaymentBoleto.Identification(AValue: string): ICieloECPaymentBoleto;
begin
  FIdentification := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.Instructions(AValue: string): ICieloECPaymentBoleto;
begin
  FInstructions := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.Provider(AValue: TCieloProvider): ICieloECPaymentBoleto;
begin
  FProvider := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.ReturnUrl(AValue: string): ICieloECPaymentBoleto;
begin
  FReturnUrl := AValue;
  Result := Self;
end;

function TCieloECPaymentBoleto.ToJSON: TJsonObject;
var
  LJsonObject: TJsonObject;
begin
  LJsonObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
  Result := LJsonObject;
end;

function TCieloECPaymentCardToken.Brand: TCieloBrandType;
begin
  Result := FBrand;
end;

{ TCieloECPaymentCreditCard }

function TCieloECPaymentCreditCard.Authenticate(AValue: Boolean): ICieloECPaymentCreditCard;
begin
  FAuthenticate := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Brand(AValue: TCieloBrandType): ICieloECPaymentCreditCard;
begin
  FBrand := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Capture(AValue: Boolean): ICieloECPaymentCreditCard;
begin
  FCapture := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.CardNumber(AValue: string): ICieloECPaymentCreditCard;
begin
  FCardNumber := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Country(AValue: string): ICieloECPaymentCreditCard;
begin
  FCountry := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Currency(AValue: string): ICieloECPaymentCreditCard;
begin
  FCurrency := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.ExpirationDate(AValue: string): ICieloECPaymentCreditCard;
begin
  FExpirationDate := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.GetType: TCieloPaymentType;
begin
  Result := TCieloPaymentType.CreditCard;
end;

function TCieloECPaymentCreditCard.Holder: string;
begin
  Result := FHolder;
end;

function TCieloECPaymentCreditCard.Holder(AValue: string): ICieloECPaymentCreditCard;
begin
  FHolder := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Installments(AValue: Integer): ICieloECPaymentCreditCard;
begin
  FInstallments := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Interest(AValue: TCieloInterest): ICieloECPaymentCreditCard;
begin
  FInterest := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.Provider(AValue: TCieloProvider): ICieloECPaymentCreditCard;
begin
  FProvider := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.ReturnUrl(AValue: string): ICieloECPaymentCreditCard;
begin
  FReturnUrl := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.SaveCard(AValue: Boolean): ICieloECPaymentCreditCard;
begin
  FSaveCard := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.SecurityCode(AValue: string): ICieloECPaymentCreditCard;
begin
  FSecurityCode := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.ServiceTaxAmount(AValue: Single): ICieloECPaymentCreditCard;
begin
  FServiceTaxAmount := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.SoftDescriptor(AValue: string): ICieloECPaymentCreditCard;
begin
  FSoftDescriptor := AValue;
  Result := Self;
end;

function TCieloECPaymentCreditCard.ToJSON: TJsonObject;
var
  LJsonObjectCard: TJsonObject;
  LJsonObjectPayment: TJsonObject;
begin
  LJsonObjectCard := TJsonObject.Create;
  if not FCardNumber.Trim.IsEmpty then
    LJsonObjectCard.AddPair('CardNumber', FCardNumber);
  if not FHolder.Trim.IsEmpty then
    LJsonObjectCard.AddPair('Holder', FHolder);
  if not FExpirationDate.Trim.IsEmpty then
    LJsonObjectCard.AddPair('ExpirationDate', FExpirationDate);
  if not FSecurityCode.Trim.IsEmpty then
    LJsonObjectCard.AddPair('SecurityCode', FSecurityCode);
  if not FBrand.ToString.IsEmpty then
    LJsonObjectCard.AddPair('Brand', FBrand.ToString);
  if FSaveCard then
    LJsonObjectCard.AddPair('SaveCard', FSaveCard.ToString(TUseBoolStrs.True));

  LJsonObjectPayment := TJsonObject.Create;
  if FAuthenticate then
    LJsonObjectPayment.AddPair('Authenticate', TJSONBool.Create(FAuthenticate));
  if FCapture then
    LJsonObjectPayment.AddPair('Capture', TJSONBool.Create(FCapture));
  if not FCountry.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Country', FCountry);
  if not FCurrency.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Currency', FCurrency);
  if FInstallments > 0 then
    LJsonObjectPayment.AddPair('Installments', TJSONNumber.Create(FInstallments));
  if not FInterest.ToString.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Interest', FInterest.ToString);
  if not FProvider.ToString.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Provider', FProvider.ToString);
  if not FReturnUrl.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('ReturnUrl', FReturnUrl);
  if FServiceTaxAmount > 0 then
    LJsonObjectPayment.AddPair('ServiceTaxAmount', TJSONNumber.Create(FServiceTaxAmount));
  if not FSoftDescriptor.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('SoftDescriptor', FSoftDescriptor);

  LJsonObjectPayment.AddPair(Self.GetType.ToString, LJsonObjectCard as TJsonValue);

  Result := LJsonObjectPayment;
end;

function TCieloECPaymentCreditCard.Authenticate: Boolean;
begin
  Result := FAuthenticate;
end;

function TCieloECPaymentCreditCard.Brand: TCieloBrandType;
begin
  Result := FBrand;
end;

function TCieloECPaymentCreditCard.Capture: Boolean;
begin
  Result := FCapture;
end;

function TCieloECPaymentCreditCard.CardNumber: string;
begin
  Result := FCardNumber;
end;

function TCieloECPaymentCreditCard.Country: string;
begin
  Result := FCountry;
end;

function TCieloECPaymentCreditCard.Currency: string;
begin
  Result := FCurrency;
end;

function TCieloECPaymentCreditCard.ExpirationDate: string;
begin
  Result := FExpirationDate;
end;

function TCieloECPaymentCreditCard.Installments: Integer;
begin
  Result := FInstallments;
end;

function TCieloECPaymentCreditCard.Interest: TCieloInterest;
begin
  Result := FInterest;
end;

function TCieloECPaymentCreditCard.Provider: TCieloProvider;
begin
  Result := FProvider;
end;

function TCieloECPaymentCreditCard.ReturnUrl: string;
begin
  Result := FReturnUrl;
end;

function TCieloECPaymentCreditCard.SaveCard: Boolean;
begin
  Result := FSaveCard;
end;

function TCieloECPaymentCreditCard.SecurityCode: string;
begin
  Result := FSecurityCode;
end;

function TCieloECPaymentCreditCard.ServiceTaxAmount: Single;
begin
  Result := FServiceTaxAmount;
end;

function TCieloECPaymentCreditCard.SoftDescriptor: string;
begin
  Result := FSoftDescriptor;
end;

{ TCieloECPaymentDebitCard }

function TCieloECPaymentDebitCard.Authenticate(AValue: Boolean): ICieloECPaymentDebitCard;
begin
  FAuthenticate := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.Brand(AValue: TCieloBrandType): ICieloECPaymentDebitCard;
begin
  FBrand := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.CardNumber(AValue: string): ICieloECPaymentDebitCard;
begin
  FCardNumber := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.ExpirationDate(AValue: string): ICieloECPaymentDebitCard;
begin
  FExpirationDate := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.GetType: TCieloPaymentType;
begin
  Result := TCieloPaymentType.DebitCard;
end;

function TCieloECPaymentDebitCard.Holder: string;
begin
  Result := FHolder;
end;

function TCieloECPaymentDebitCard.Holder(AValue: string): ICieloECPaymentDebitCard;
begin
  FHolder := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.ReturnUrl(AValue: string): ICieloECPaymentDebitCard;
begin
  FReturnUrl := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.SecurityCode(AValue: string): ICieloECPaymentDebitCard;
begin
  FSecurityCode := AValue;
  Result := Self;
end;

function TCieloECPaymentDebitCard.ToJSON: TJsonObject;
var
  LJsonObjectCard: TJsonObject;
  LJsonObjectPayment: TJsonObject;
begin
  LJsonObjectCard := TJsonObject.Create;
  if not FCardNumber.Trim.IsEmpty then
    LJsonObjectCard.AddPair('CardNumber', FCardNumber);
  if not FHolder.Trim.IsEmpty then
    LJsonObjectCard.AddPair('Holder', FHolder);
  if not FExpirationDate.Trim.IsEmpty then
    LJsonObjectCard.AddPair('ExpirationDate', FExpirationDate);
  if not FSecurityCode.Trim.IsEmpty then
    LJsonObjectCard.AddPair('SecurityCode', FSecurityCode);
  if not FBrand.ToString.IsEmpty then
    LJsonObjectCard.AddPair('Brand', FBrand.ToString);

  LJsonObjectPayment := TJsonObject.Create;
  if FAuthenticate then
    LJsonObjectPayment.AddPair('Authenticate', TJSONBool.Create(FAuthenticate));
  if not FReturnUrl.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('ReturnUrl', FReturnUrl);

  LJsonObjectPayment.AddPair(Self.GetType.ToString, LJsonObjectCard as TJsonValue);

  Result := LJsonObjectPayment;
end;

function TCieloECPaymentDebitCard.Authenticate: Boolean;
begin
  Result := FAuthenticate;
end;

function TCieloECPaymentDebitCard.Brand: TCieloBrandType;
begin
  Result := FBrand;
end;

function TCieloECPaymentDebitCard.CardNumber: string;
begin
  Result := FCardNumber;
end;

function TCieloECPaymentDebitCard.ExpirationDate: string;
begin
  Result := FExpirationDate;
end;

function TCieloECPaymentDebitCard.ReturnUrl: string;
begin
  Result := FReturnUrl;
end;

function TCieloECPaymentDebitCard.SecurityCode: string;
begin
  Result := FSecurityCode;
end;

{ TCieloECResponseError }

function TCieloECResponseError.Code: Integer;
begin
  Result := FCode;
end;

constructor TCieloECResponseError.Create(ACode: Integer; AMessage: string);
begin
  FCode := ACode;
  FMessage := AMessage;
end;

function TCieloECResponseError.Message: string;
begin
  Result := FMessage;
end;

class function TCieloECResponseError.New(ACode: Integer; AMessage: string): ICieloECResponseError;
begin
  Result := TCieloECResponseError.Create(ACode, AMessage);
end;

{ TCieloECRecurrentPayment }

function TCieloECRecurrentPayment.EndDate(AValue: TDate): ICieloECRecurrentPayment;
begin
  FEndDate := AValue;
  Result := Self;
end;

function TCieloECRecurrentPayment.Interval(AValue: TCieloRecurrentInterval): ICieloECRecurrentPayment;
begin
  FInterval := AValue;
  Result := Self;
end;

function TCieloECRecurrentPayment.AuthorizeNow(AValue: Boolean): ICieloECRecurrentPayment;
begin
  FAuthorizeNow := AValue;
  Result := Self;
end;

function TCieloECRecurrentPayment.StartDate(AValue: TDate): ICieloECRecurrentPayment;
begin
  FStartDate := AValue;
  Result := Self;
end;

function TCieloECRecurrentPayment.ToJSON: TJsonObject;
begin
  Result := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
end;

function TCieloECRecurrentPayment.AuthorizeNow: Boolean;
begin
  Result := FAuthorizeNow;
end;

function TCieloECRecurrentPayment.EndDate: TDate;
begin
  Result := FEndDate;
end;

function TCieloECRecurrentPayment.Interval: TCieloRecurrentInterval;
begin
  Result := FInterval;
end;

function TCieloECRecurrentPayment.StartDate: TDate;
begin
  Result := FStartDate;
end;

{ TCieloECPaymentRecurrentCreditCard }

function TCieloECPaymentRecurrentCreditCard.Authenticate(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
begin
  FAuthenticate := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.Brand(AValue: TCieloBrandType): ICieloECPaymentRecurrentCreditCard;
begin
  FBrand := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.Capture(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
begin
  FCapture := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.CardNumber(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FCardNumber := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.Country(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FCountry := AValue;
  Result := Self;
end;

constructor TCieloECPaymentRecurrentCreditCard.Create;
begin
  FRecurrent := true;
  FInstallments := 1;
end;

function TCieloECPaymentRecurrentCreditCard.Currency: string;
begin
  Result := FCurrency;
end;

function TCieloECPaymentRecurrentCreditCard.Currency(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FCurrency := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.ExpirationDate(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FExpirationDate := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.GetType: TCieloPaymentType;
begin
  Result := TCieloPaymentType.CreditCard;
end;

function TCieloECPaymentRecurrentCreditCard.Holder: string;
begin
  Result := FHolder;
end;

function TCieloECPaymentRecurrentCreditCard.Holder(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FHolder := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.Interest(AValue: TCieloInterest): ICieloECPaymentRecurrentCreditCard;
begin
  FInterest := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.Provider(AValue: TCieloProvider): ICieloECPaymentRecurrentCreditCard;
begin
  FProvider := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.Recurrent(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
begin
  FRecurrent := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.RecurrentPayment(AValue: ICieloECRecurrentPayment): ICieloECPaymentRecurrentCreditCard;
begin
  FRecurrentPayment := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.ReturnUrl(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FReturnUrl := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.SaveCard(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
begin
  FSaveCard := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.SecurityCode(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FSecurityCode := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.ServiceTaxAmount(AValue: Single): ICieloECPaymentRecurrentCreditCard;
begin
  FServiceTaxAmount := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.SoftDescriptor(AValue: string): ICieloECPaymentRecurrentCreditCard;
begin
  FSoftDescriptor := AValue;
  Result := Self;
end;

function TCieloECPaymentRecurrentCreditCard.ToJSON: TJsonObject;
var
  LJsonObjectCard: TJsonObject;
  LJsonObjectPayment: TJsonObject;
  LExportToJson: ICieloECExportToJson;
begin
  LJsonObjectCard := TJsonObject.Create;
  if not FCardNumber.Trim.IsEmpty then
    LJsonObjectCard.AddPair('CardNumber', FCardNumber);
  if not FHolder.Trim.IsEmpty then
    LJsonObjectCard.AddPair('Holder', FHolder);
  if not FExpirationDate.Trim.IsEmpty then
    LJsonObjectCard.AddPair('ExpirationDate', FExpirationDate);
  if not FSecurityCode.Trim.IsEmpty then
    LJsonObjectCard.AddPair('SecurityCode', FSecurityCode);
  if not FBrand.ToString.IsEmpty then
    LJsonObjectCard.AddPair('Brand', FBrand.ToString);
  if FSaveCard then
    LJsonObjectCard.AddPair('SaveCard', FSaveCard.ToString(TUseBoolStrs.True));

  LJsonObjectPayment := TJsonObject.Create;
  if FAuthenticate then
    LJsonObjectPayment.AddPair('Authenticate', TJSONBool.Create(FAuthenticate));
  if FCapture then
    LJsonObjectPayment.AddPair('Capture', TJSONBool.Create(FCapture));
  if not FCountry.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Country', FCountry);
  if not FCurrency.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Currency', FCurrency);
  if FInstallments > 0 then
    LJsonObjectPayment.AddPair('Installments', TJSONNumber.Create(FInstallments));
  if not FInterest.ToString.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Interest', FInterest.ToString);
  if not FProvider.ToString.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('Provider', FProvider.ToString);
  if not FReturnUrl.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('ReturnUrl', FReturnUrl);
  if FServiceTaxAmount > 0 then
    LJsonObjectPayment.AddPair('ServiceTaxAmount', TJSONNumber.Create(FServiceTaxAmount));
  if not FSoftDescriptor.Trim.IsEmpty then
    LJsonObjectPayment.AddPair('SoftDescriptor', FSoftDescriptor);

  if (FRecurrentPayment <> nil) and (Supports(FRecurrentPayment, ICieloECExportToJson, LExportToJson)) then
    LJsonObjectPayment.AddPair('RecurrentPayment', LExportToJson.ToJSON)
  else
    LJsonObjectPayment.AddPair('Recurrent', TJSONBool.Create(FRecurrent));

  LJsonObjectPayment.AddPair(Self.GetType.ToString, LJsonObjectCard as TJsonValue);

  Result := LJsonObjectPayment;
end;

function TCieloECPaymentRecurrentCreditCard.Authenticate: Boolean;
begin
  Result := FAuthenticate;
end;

function TCieloECPaymentRecurrentCreditCard.Brand: TCieloBrandType;
begin
  Result := FBrand;
end;

function TCieloECPaymentRecurrentCreditCard.Capture: Boolean;
begin
  Result := FCapture;
end;

function TCieloECPaymentRecurrentCreditCard.CardNumber: string;
begin
  Result := FCardNumber;
end;

function TCieloECPaymentRecurrentCreditCard.Country: string;
begin
  Result := FCountry;
end;

function TCieloECPaymentRecurrentCreditCard.ExpirationDate: string;
begin
  Result := FExpirationDate;
end;

function TCieloECPaymentRecurrentCreditCard.Interest: TCieloInterest;
begin
  Result := FInterest;
end;

function TCieloECPaymentRecurrentCreditCard.Provider: TCieloProvider;
begin
  Result := FProvider;
end;

function TCieloECPaymentRecurrentCreditCard.Recurrent: Boolean;
begin
  Result := FRecurrent;
end;

function TCieloECPaymentRecurrentCreditCard.RecurrentPayment: ICieloECRecurrentPayment;
begin
  Result := FRecurrentPayment;
end;

function TCieloECPaymentRecurrentCreditCard.ReturnUrl: string;
begin
  Result := FReturnUrl;
end;

function TCieloECPaymentRecurrentCreditCard.SaveCard: Boolean;
begin
  Result := FSaveCard;
end;

function TCieloECPaymentRecurrentCreditCard.SecurityCode: string;
begin
  Result := FSecurityCode;
end;

function TCieloECPaymentRecurrentCreditCard.ServiceTaxAmount: Single;
begin
  Result := FServiceTaxAmount;
end;

function TCieloECPaymentRecurrentCreditCard.SoftDescriptor: string;
begin
  Result := FSoftDescriptor;
end;

{ TCieloECCard }

function TCieloECCard.Brand(AValue: TCieloBrandType): ICieloECCard;
begin
  FBrand := AValue;
  Result := Self;
end;

function TCieloECCard.CardNumber(AValue: string): ICieloECCard;
begin
  FCardNumber := AValue;
  Result := Self;
end;

function TCieloECCard.ExpirationDate(AValue: string): ICieloECCard;
begin
  FExpirationDate := AValue;
  Result := Self;
end;

function TCieloECCard.Holder(AValue: string): ICieloECCard;
begin
  FHolder := AValue;
  Result := Self;
end;

function TCieloECCard.SecurityCode(AValue: string): ICieloECCard;
begin
  FSecurityCode := AValue;
  Result := Self;
end;

function TCieloECCard.ToJSON: TJsonObject;
var
  LJsonObject: TJsonObject;
begin
  LJsonObject := TJson.ObjectToJsonObject(Self, [TJsonOption.joIgnoreEmptyStrings]);
  Result := LJsonObject;
end;

function TCieloECCard.Brand: TCieloBrandType;
begin
  Result := FBrand;
end;

function TCieloECCard.CardNumber: string;
begin
  Result := FCardNumber;
end;

function TCieloECCard.ExpirationDate: string;
begin
  Result := FExpirationDate;
end;

function TCieloECCard.Holder: string;
begin
  Result := FHolder;
end;

function TCieloECCard.SecurityCode: string;
begin
  Result := FSecurityCode;
end;

function TCieloECPaymentBoleto.Address: string;
begin
  Result := FAddress;
end;

function TCieloECPaymentBoleto.Assignor: string;
begin
  Result := FAssignor;
end;

function TCieloECPaymentBoleto.BoletoNumber: string;
begin
  Result := FBoletoNumber;
end;

function TCieloECPaymentBoleto.Demonstrative: string;
begin
  Result := FDemonstrative;
end;

function TCieloECPaymentBoleto.ExpirationDate: TDate;
begin
  Result := FExpirationDate;
end;

function TCieloECPaymentBoleto.Identification: string;
begin
  Result := FIdentification;
end;

function TCieloECPaymentBoleto.Instructions: string;
begin
  Result := FInstructions;
end;

function TCieloECPaymentBoleto.Provider: TCieloProvider;
begin
  Result := FProvider;
end;

function TCieloECPaymentBoleto.ReturnUrl: string;
begin
  Result := FReturnUrl;
end;

function TCieloECPaymentEletronicTransfer.Provider: TCieloProvider;
begin
  Result := FProvider;
end;

function TCieloECPaymentEletronicTransfer.ReturnUrl: string;
begin
  Result := FReturnUrl;
end;

end.
