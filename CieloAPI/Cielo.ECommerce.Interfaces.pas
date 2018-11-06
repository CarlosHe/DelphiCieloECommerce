unit Cielo.ECommerce.Interfaces;

interface

uses Cielo.ECommerce.Types, System.JSON, System.SysUtils,
  System.Generics.Collections;

type

  ICieloECExport = interface;
  ICieloECExportToJson = interface;
  ICieloECMerchant = interface;
  ICieloECAddress = interface;
  ICieloECDeliveryAddress = interface;
  ICieloECCustomer = interface;
  ICieloECPaymentType = interface;
  ICieloECPaymentCreditCard = interface;
  ICieloECPaymentDebitCard = interface;
  ICieloECPaymentRecurrentCreditCard = interface;
  ICieloECPaymentCardToken = interface;
  ICieloECPaymentEletronicTransfer = interface;
  ICieloECRecurrentPayment = interface;
  ICieloECPayment = interface;
  ICieloECOrder = interface;

  ICieloECExport = interface
    ['{22759AFF-6930-4E32-8119-B0BD31BB9F3E}']
  end;

  ICieloECExportToJson = interface(ICieloECExport)
    ['{395B377E-CC96-4D9D-A549-B98F8E4C387D}']
    function ToJSON: TJsonObject;
    // function ToJSONString: string;
  end;

  ICieloECMerchant = interface
    ['{1C0CDE69-9DD3-4C80-8048-C9C79851AE52}']
    function MerchantId(AValue: TGUID): ICieloECMerchant; overload;
    function MerchantKey(AValue: string): ICieloECMerchant; overload;

    function MerchantId: TGUID; overload;
    function MerchantKey: string; overload;
  end;

  ICieloECAddress = interface
    ['{A1626AA8-B27A-4047-83D2-2ADAF037027B}']
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
  end;

  ICieloECDeliveryAddress = interface
    ['{4A2061C9-924D-46A7-B48D-41CB5FE1D7E3}']
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
  end;

  ICieloECCustomer = interface
    ['{A1626AA8-B27A-4047-83D2-2ADAF037027B}']
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
  end;

  ICieloECRecurrentPayment = interface
    ['{F692D05A-3C60-4B57-9061-6031C54AABCC}']
    function AuthorizeNow(AValue: Boolean): ICieloECRecurrentPayment; overload;
    function StartDate(AValue: TDate): ICieloECRecurrentPayment; overload;
    function EndDate(AValue: TDate): ICieloECRecurrentPayment; overload;
    function Interval(AValue: TCieloRecurrentInterval): ICieloECRecurrentPayment; overload;

    function AuthorizeNow: Boolean; overload;
    function StartDate: TDate; overload;
    function EndDate: TDate; overload;
    function Interval: TCieloRecurrentInterval; overload;
  end;

  ICieloECCard = interface
    ['{4B81D677-84B8-4972-9509-4959B573687D}']
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
  end;

  ICieloECCardToken = interface
    ['{45485B40-51A5-4C84-8C2C-5C33E4C4DBC5}']
    function CardToken(AValue: string): ICieloECPaymentCardToken; overload;
    function SecurityCode(AValue: string): ICieloECPaymentCardToken; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCardToken; overload;

    function CardToken: string; overload;
    function SecurityCode: string; overload;
    function Brand: TCieloBrandType; overload;
  end;

  ICieloECPaymentType = interface
    ['{4AE2F594-DC23-41EF-821B-667D0D75F65A}']
    function &GetType: TCieloPaymentType;
  end;

  ICieloECPaymentCreditCard = interface(ICieloECPaymentType)
    ['{1AD024F8-662D-4008-B39F-1E7F47982634}']
    function Authenticate(AValue: Boolean): ICieloECPaymentCreditCard; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCreditCard; overload;
    function Capture(AValue: Boolean): ICieloECPaymentCreditCard; overload;
    function CardNumber(AValue: string): ICieloECPaymentCreditCard; overload;
    function Country(AValue: string): ICieloECPaymentCreditCard; overload;
    function Currency(AValue: string): ICieloECPaymentCreditCard; overload;
    function ExpirationDate(AValue: string): ICieloECPaymentCreditCard; overload;
    function Holder(AValue: string): ICieloECPaymentCreditCard; overload;
    function Installments(AValue: integer): ICieloECPaymentCreditCard; overload;
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
    function Installments: integer; overload;
    function Interest: TCieloInterest; overload;
    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;
    function SaveCard: Boolean; overload;
    function SecurityCode: string; overload;
    function ServiceTaxAmount: Single; overload;
    function SoftDescriptor: string; overload;
  end;

  ICieloECPaymentDebitCard = interface(ICieloECPaymentType)
    ['{3469D479-246E-4F1A-A5AA-19BF1D832260}']
    function CardNumber(AValue: string): ICieloECPaymentDebitCard; overload;
    function Holder(AValue: string): ICieloECPaymentDebitCard; overload;
    function ExpirationDate(AValue: string): ICieloECPaymentDebitCard; overload;
    function SecurityCode(AValue: string): ICieloECPaymentDebitCard; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentDebitCard; overload;
    function Authenticate(AValue: Boolean): ICieloECPaymentDebitCard; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentDebitCard; overload;

    function CardNumber: string; overload;
    function Holder: string; overload;
    function ExpirationDate: string; overload;
    function SecurityCode: string; overload;
    function Brand: TCieloBrandType; overload;
    function Authenticate: Boolean; overload;
    function ReturnUrl: string; overload;
  end;

  ICieloECPaymentRecurrentCreditCard = interface(ICieloECPaymentType)
    ['{F581DFDC-1B6B-4A12-8F2F-259E92133ADA}']
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
    function ReturnUrl(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function SaveCard(AValue: Boolean): ICieloECPaymentRecurrentCreditCard; overload;
    function SecurityCode(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function ServiceTaxAmount(AValue: Single): ICieloECPaymentRecurrentCreditCard; overload;
    function SoftDescriptor(AValue: string): ICieloECPaymentRecurrentCreditCard; overload;
    function Recurrent(AValue: Boolean): ICieloECPaymentRecurrentCreditCard; overload;
    function RecurrentPayment(AValue: ICieloECRecurrentPayment): ICieloECPaymentRecurrentCreditCard; overload;

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
  end;

  ICieloECPaymentCardToken = interface(ICieloECPaymentType)
    ['{B25B38DA-20F5-4AC5-B239-2B39731C46F7}']
    function CardToken(AValue: string): ICieloECPaymentCardToken; overload;
    function SecurityCode(AValue: string): ICieloECPaymentCardToken; overload;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCardToken; overload;

    function CardToken: string; overload;
    function SecurityCode: string; overload;
    function Brand: TCieloBrandType; overload;
  end;

  ICieloECPaymentEletronicTransfer = interface(ICieloECPaymentType)
    ['{E7A501B4-6E8E-417C-AE42-98D4A46AF9AE}']
    function Provider(AValue: TCieloProvider): ICieloECPaymentEletronicTransfer; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentEletronicTransfer; overload;

    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;
  end;

  ICieloECPaymentBoleto = interface(ICieloECPaymentType)
    ['{2CD17E04-FEF0-4D88-81FC-22EA8755C603}']
    function Address(AValue: string): ICieloECPaymentBoleto; overload;
    function BoletoNumber(AValue: string): ICieloECPaymentBoleto; overload;
    function Assignor(AValue: string): ICieloECPaymentBoleto; overload;
    function Demonstrative(AValue: string): ICieloECPaymentBoleto; overload;
    function ExpirationDate(AValue: TDate): ICieloECPaymentBoleto; overload;
    function Identification(AValue: string): ICieloECPaymentBoleto; overload;
    function Instructions(AValue: string): ICieloECPaymentBoleto; overload;
    function Provider(AValue: TCieloProvider): ICieloECPaymentBoleto; overload;
    function ReturnUrl(AValue: string): ICieloECPaymentBoleto; overload;

    function Address: string; overload;
    function BoletoNumber: string; overload;
    function Assignor: string; overload;
    function Demonstrative: string; overload;
    function ExpirationDate: TDate; overload;
    function Identification: string; overload;
    function Instructions: string; overload;
    function Provider: TCieloProvider; overload;
    function ReturnUrl: string; overload;
  end;

  ICieloECPayment = interface
    ['{B0D489FB-C150-49F5-944F-40212996A849}']
    function &Type(AValue: ICieloECPaymentType): ICieloECPayment; overload;
    function Amount(AValue: Single): ICieloECPayment; overload;

    function &Type: ICieloECPaymentType; overload;
    function Amount: Single; overload;
  end;

  ICieloECOrder = interface
    ['{81E38A92-1AC3-47E6-BE32-03A99B978B1D}']
    function MerchantOrderId(AValue: string): ICieloECOrder; overload;
    function Customer(AValue: ICieloECCustomer): ICieloECOrder; overload;
    function Payment(AValue: ICieloECPayment): ICieloECOrder; overload;

    function MerchantOrderId: string; overload;
    function Customer: ICieloECCustomer; overload;
    function Payment: ICieloECPayment; overload;
  end;

  ICieloECResponseError = interface
    ['{D2745D64-DB62-45A5-9402-119777D1AFA2}']
    function Code: integer;
    function &Message: string;
  end;

  ICieloECResponse = interface
    ['{6A7160FF-EE0E-4F6B-8EFF-2CDCA7BEB160}']
    function ContentAsString(const AEncoding: TEncoding = nil): string;
    function ContentAsJsonObject(const AEncoding: TEncoding = nil): TJsonObject;
    function Success: Boolean;
    function HasError: Boolean;
    function GetErrorList: TList<ICieloECResponseError>;
  end;

  ICieloECAPI = interface
    ['{10E3F385-83A3-412F-83E5-07BA7715DDC6}']
    function Merchant(AValue: ICieloECMerchant): ICieloECAPI; overload;
    function RequestId(AValue: TGUID): ICieloECAPI; overload;
    function Environment(AValue: TCieloEnvironment): ICieloECAPI; overload;

    function Merchant: ICieloECMerchant; overload;
    function RequestId: TGUID; overload;
    function Environment: TCieloEnvironment; overload;

    function NewSale(ACieloECROrder: ICieloECOrder; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
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
    function UpdateRecurrentPayment_Amount(ARecurrentPaymentId: TGUID; AAmount: integer; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function UpdateRecurrentPayment_NextPaymentDate(ARecurrentPaymentId: TGUID; ANextPaymentDate: TDate;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Payment(ARecurrentPaymentId: TGUID; APayment: ICieloECPaymentCreditCard;
      ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Deactivate(ARecurrentPaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Reactivate(ARecurrentPaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function NewCardToken(ACustomName: string; ACard: ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function ZeroAuth(ACieloECCard:ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI; overload;
    function ZeroAuth(ACieloECCardToken:ICieloECCardToken; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI; overload;
    function CardBin(ACardBIN: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
  end;

implementation

end.
