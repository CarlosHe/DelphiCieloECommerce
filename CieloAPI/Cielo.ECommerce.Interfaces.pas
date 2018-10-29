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
    function Street(AValue: string): ICieloECAddress;
    function Number(AValue: string): ICieloECAddress;
    function Complement(AValue: string): ICieloECAddress;
    function ZipCode(AValue: string): ICieloECAddress;
    function City(AValue: string): ICieloECAddress;
    function State(AValue: string): ICieloECAddress;
    function Country(AValue: string): ICieloECAddress;
  end;

  ICieloECDeliveryAddress = interface
    ['{4A2061C9-924D-46A7-B48D-41CB5FE1D7E3}']
    function Complement(AValue: string): ICieloECDeliveryAddress;
    function ZipCode(AValue: string): ICieloECDeliveryAddress;
    function City(AValue: string): ICieloECDeliveryAddress;
    function State(AValue: string): ICieloECDeliveryAddress;
    function Country(AValue: string): ICieloECDeliveryAddress;
  end;

  ICieloECCustomer = interface
    ['{A1626AA8-B27A-4047-83D2-2ADAF037027B}']
    function Status(AValue: TCieloCustomerStatus): ICieloECCustomer;
    function Name(AValue: string): ICieloECCustomer;
    function Identity(AValue: string): ICieloECCustomer;
    function IdentityType(AValue: TCieloCustomerIdentityType): ICieloECCustomer;
    function Email(AValue: string): ICieloECCustomer;
    function Birthdate(AValue: TDate): ICieloECCustomer;
    function Address(AValue: ICieloECAddress): ICieloECCustomer;
    function DeliveryAddress(AValue: ICieloECDeliveryAddress): ICieloECCustomer;
  end;

  ICieloECRecurrentPayment = interface
    ['{F692D05A-3C60-4B57-9061-6031C54AABCC}']
    function AuthorizeNow(AValue: Boolean): ICieloECRecurrentPayment;
    function StartDate(AValue: TDate): ICieloECRecurrentPayment;
    function EndDate(AValue: TDate): ICieloECRecurrentPayment;
    function Interval(AValue: TCieloRecurrentInterval): ICieloECRecurrentPayment;
  end;

  ICieloECCard = interface
    ['{4B81D677-84B8-4972-9509-4959B573687D}']
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCreditCard;
    function CardNumber(AValue: string): ICieloECPaymentCreditCard;
    function ExpirationDate(AValue: string): ICieloECPaymentCreditCard;
    function Holder(AValue: string): ICieloECPaymentCreditCard;
    function SecurityCode(AValue: string): ICieloECPaymentCreditCard;
  end;

  ICieloECPaymentType = interface
    ['{4AE2F594-DC23-41EF-821B-667D0D75F65A}']
    function &GetType: TCieloPaymentType;
  end;

  ICieloECPaymentCreditCard = interface(ICieloECPaymentType)
    ['{1AD024F8-662D-4008-B39F-1E7F47982634}']
    function Authenticate(AValue: Boolean): ICieloECPaymentCreditCard;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCreditCard;
    function Capture(AValue: Boolean): ICieloECPaymentCreditCard;
    function CardNumber(AValue: string): ICieloECPaymentCreditCard;
    function Country(AValue: string): ICieloECPaymentCreditCard;
    function Currency(AValue: string): ICieloECPaymentCreditCard;
    function ExpirationDate(AValue: string): ICieloECPaymentCreditCard;
    function Holder(AValue: string): ICieloECPaymentCreditCard;
    function Installments(AValue: integer): ICieloECPaymentCreditCard;
    function Interest(AValue: TCieloInterest): ICieloECPaymentCreditCard;
    function Provider(AValue: TCieloProvider): ICieloECPaymentCreditCard;
    function ReturnUrl(AValue: string): ICieloECPaymentCreditCard;
    function SaveCard(AValue: Boolean): ICieloECPaymentCreditCard;
    function SecurityCode(AValue: string): ICieloECPaymentCreditCard;
    function ServiceTaxAmount(AValue: Single): ICieloECPaymentCreditCard;
    function SoftDescriptor(AValue: string): ICieloECPaymentCreditCard;
  end;

  ICieloECPaymentDebitCard = interface(ICieloECPaymentType)
    ['{3469D479-246E-4F1A-A5AA-19BF1D832260}']
    function CardNumber(AValue: string): ICieloECPaymentDebitCard;
    function Holder(AValue: string): ICieloECPaymentDebitCard;
    function ExpirationDate(AValue: string): ICieloECPaymentDebitCard;
    function SecurityCode(AValue: string): ICieloECPaymentDebitCard;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentDebitCard;
    function Authenticate(AValue: Boolean): ICieloECPaymentDebitCard;
    function ReturnUrl(AValue: string): ICieloECPaymentDebitCard;
  end;

  ICieloECPaymentRecurrentCreditCard = interface(ICieloECPaymentType)
    ['{F581DFDC-1B6B-4A12-8F2F-259E92133ADA}']
    function Authenticate(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentRecurrentCreditCard;
    function Capture(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
    function CardNumber(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function Country(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function Currency(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function ExpirationDate(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function Holder(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function Interest(AValue: TCieloInterest): ICieloECPaymentRecurrentCreditCard;
    function Provider(AValue: TCieloProvider): ICieloECPaymentRecurrentCreditCard;
    function ReturnUrl(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function SaveCard(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
    function SecurityCode(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function ServiceTaxAmount(AValue: Single): ICieloECPaymentRecurrentCreditCard;
    function SoftDescriptor(AValue: string): ICieloECPaymentRecurrentCreditCard;
    function Recurrent(AValue: Boolean): ICieloECPaymentRecurrentCreditCard;
    function RecurrentPayment(AValue: ICieloECRecurrentPayment): ICieloECPaymentRecurrentCreditCard;
  end;

  ICieloECPaymentCardToken = interface(ICieloECPaymentType)
    ['{B25B38DA-20F5-4AC5-B239-2B39731C46F7}']
    function CardToken(AValue: string): ICieloECPaymentCardToken;
    function SecurityCode(AValue: string): ICieloECPaymentCardToken;
    function Brand(AValue: TCieloBrandType): ICieloECPaymentCardToken;
  end;

  ICieloECPaymentEletronicTransfer = interface(ICieloECPaymentType)
    ['{E7A501B4-6E8E-417C-AE42-98D4A46AF9AE}']
    function Provider(AValue: TCieloProvider): ICieloECPaymentEletronicTransfer;
    function ReturnUrl(AValue: string): ICieloECPaymentEletronicTransfer;
  end;

  ICieloECPaymentBoleto = interface(ICieloECPaymentType)
    ['{2CD17E04-FEF0-4D88-81FC-22EA8755C603}']
    function Address(AValue: string): ICieloECPaymentBoleto;
    function BoletoNumber(AValue: string): ICieloECPaymentBoleto;
    function Assignor(AValue: string): ICieloECPaymentBoleto;
    function Demonstrative(AValue: string): ICieloECPaymentBoleto;
    function ExpirationDate(AValue: TDate): ICieloECPaymentBoleto;
    function Identification(AValue: string): ICieloECPaymentBoleto;
    function Instructions(AValue: string): ICieloECPaymentBoleto;

    function Provider(AValue: TCieloProvider): ICieloECPaymentBoleto;
    function ReturnUrl(AValue: string): ICieloECPaymentBoleto;
  end;

  ICieloECPayment = interface
    ['{B0D489FB-C150-49F5-944F-40212996A849}']
    function &Type(AValue: ICieloECPaymentType): ICieloECPayment;
    function Amount(AValue: Single): ICieloECPayment;
  end;

  ICieloECOrder = interface
    ['{81E38A92-1AC3-47E6-BE32-03A99B978B1D}']
    function MerchantOrderId(AValue: string): ICieloECOrder;
    function Customer(AValue: ICieloECCustomer): ICieloECOrder;
    function Payment(AValue: ICieloECPayment): ICieloECOrder;
  end;

  ICieloECResponseError = interface
    ['{D2745D64-DB62-45A5-9402-119777D1AFA2}']
    function Code: integer;
    function &Message: string;
  end;

  ICieloECResponse = interface
    ['{6A7160FF-EE0E-4F6B-8EFF-2CDCA7BEB160}']
    function ContentAsString(const AEncoding: TEncoding = nil): string;
    function Success: Boolean;
    function HasError: Boolean;
    function GetErrorList: TList<ICieloECResponseError>;
  end;

  ICieloECAPI = interface
    ['{10E3F385-83A3-412F-83E5-07BA7715DDC6}']
    function Merchant(AValue: ICieloECMerchant): ICieloECAPI;
    function RequestId(AValue: TGUID): ICieloECAPI;
    function Environment(AValue: TCieloEnvironment): ICieloECAPI;
    function NewSale(ACieloECROrder: ICieloECOrder; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetSale(APaymentId: TGUID; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetPayments(AMerchantOrderId: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetRecurrentPayment(ARecurrentPaymentId: string; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function GetCatchSale(APaymentId: TGUID; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function CancelPayment(APaymentId: TGUID; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function CancelOrder(AMerchantOrderId: string; AParams: TDictionary<string, string>; ACieloECResponse: TCieloECResponse<ICieloECResponse>)
      : ICieloECAPI;
    function UpdateRecurrentPayment_Customer(ARecurrentPaymentId: TGUID; ACieloECCustomer: ICieloECCustomer; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_EndDate(ARecurrentPaymentId: TGUID; ADate: TDate; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Interval(ARecurrentPaymentId: TGUID; ARecurrentInterval: TCieloRecurrentInterval; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_RecurrencyDay(ARecurrentPaymentId: TGUID; ARecurrencyDay: Byte; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Amount(ARecurrentPaymentId: TGUID; AAmount: Integer; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_NextPaymentDate(ARecurrentPaymentId: TGUID; ANextPaymentDate: TDate; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Payment(ARecurrentPaymentId: TGUID; APayment: ICieloECPaymentCreditCard; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Deactivate(ARecurrentPaymentId: TGUID; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function UpdateRecurrentPayment_Reactivate(ARecurrentPaymentId: TGUID; ACieloECesponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
    function NewCardToken(ACusomName: string; ACard: ICieloECCard; ACieloECResponse: TCieloECResponse<ICieloECResponse>): ICieloECAPI;
  end;

implementation

end.
