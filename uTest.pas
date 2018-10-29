unit uTest;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Cielo.ECommerce.Classes, Cielo.ECommerce.Interfaces, Cielo.ECommerce.Types,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Objects, FMX.Edit, MD.Input, FMX.Rating;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
var
  LCieloOrder: ICieloECOrder;

  LCieloECAPI: ICieloECAPI;

begin
  LCieloOrder:= TCieloECOrder.Create;

  LCieloOrder.MerchantOrderId('00001')
  .Customer(
    TCieloECCustomer.Create
    .Status( TCieloCustomerStatus.New )
    .Name('Carlos Henrique Ribeiro Modesto')
    .Identity('000.000.000-00')
    .IdentityType( TCieloCustomerIdentityType.CPF )
    .Email('carlos@gabaritocorrigido.com.br')
    .Address(
      TCieloECAddress.Create
      .Street('STREET NAME')
      .Number('000')
      .Complement('COMPLEMENT')
      .ZipCode('70000000')
      .City('CITY NAME')
      .State('DF')
      .Country('BRA')
    )
  )
  .Payment(
    TCieloECPayment.Create
    .&Type(
    { CREDIT CARD PAYMENT }
     TCieloECPaymentCreditCard.Create
     .CardNumber('0000.0000.0000.0001')
     .Holder('HOLDER')
     .ExpirationDate('12/2030')
     .SecurityCode('111')
     .Brand(TCieloBrandType.Visa)
     .SaveCard(True)
     .Installments(2)
     .ServiceTaxAmount(0)
     .Interest(TCieloInterest.ByMerchant)
     .SoftDescriptor('PRODUTO X')
     .Currency('BRL')
     .Country('BRA')
     .ReturnUrl('http://www.cielo.com.br')
     .Authenticate(True)

     { RECURRENT CREDIT CARD PAYMENT }
     // TCieloECPaymentRecurrentCreditCard.Create
     // .CardNumber('0000.0000.0000.0001')
     // .Holder('HOLDER')
     // .ExpirationDate('12/2030')
     // .SecurityCode('111')
     // .Brand(TCieloBrandType.Visa)
     // .SaveCard(True)
     // .ServiceTaxAmount(0)
     // .Interest(TCieloInterest.ByMerchant)
     // .SoftDescriptor('PRODUTO X')
     // .Currency('BRL')
     // .Country('BRA')
     // .ReturnUrl('http://www.cielo.com.br')
     // .Authenticate(False)
     // .RecurrentPayment(
     // TCieloECRecurrentPayment.Create
     // .StartDate(Now())
     // .EndDate(StrToDate('29/10/2019'))
     // .Interval(TCieloRecurrentInterval.Annual)
     // .AuthorizeNow(True)
     // )

     { DEBIT CARD PAYMENT }
     // TCieloECPaymentDebitCard.Create
     // .CardNumber('0000.0000.0000.0001')
     // .Holder('HOLDER')
     // .ExpirationDate('12/2030')
     // .SecurityCode('111')
     // .Brand(TCieloBrandType.Visa)
     // .ReturnUrl('http://www.cielo.com.br')
     // .Authenticate(True)

     { ELETRONIC TRANSFER PAYMENT }
     // TCieloECPaymentEletronicTransfer.Create
     // .Provider(TCieloProvider.Bradesco)
     // .ReturnUrl('http://www.cielo.com.br')

     { BOLETO PAYMENT }
     // TCieloECPaymentBoleto.Create
     // .Address('Test')
     // .BoletoNumber('0001')
     // .Assignor('asdasdasd')
     // .Demonstrative('DEMO')
     // .ExpirationDate(Now())
     // .Identification('ID')
     // .Instructions('Instructions')
     // .Provider(TCieloProvider.Bradesco)
     // .ReturnUrl('http://www.cielo.com.br')

    )
    .Amount(1000)
  );


  LCieloECAPI:= TCieloECAPI.Create

  { MERCHANT }
  .Merchant(
    TCieloECMerchant.Create
    .MerchantId(StringToGUID('{YOUR MERCHANT ID}'))
    .MerchantKey('YOUR MERCHANT KEY')
  )

   { REQUEST ID }
  .RequestId(StringToGUID('{5BBAE6F1-198B-4904-A814-2F1CA1ADE0EB}'))

   { NEW SALE }
  .NewSale(LCieloOrder,
    procedure(ACieloECResponse: ICieloECResponse)
    var
      I: Integer;
    begin
      if ACieloECResponse.Success then
        Memo2.Lines.Add(ACieloECResponse.ContentAsString);
      if ACieloECResponse.HasError then
        for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
          ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);

    end
  )
  { GET SALE }
  // .GetSale(StringToGUID('{A235E780-353E-4F37-BFD4-4D4AA1B5B707}'),
  // procedure(ACieloECResponse: ICieloECResponse)
  // var
  // I: Integer;
  // begin
  // if ACieloECResponse.Success then
  // Memo2.Lines.Add(ACieloECResponse.ContentAsString);
  // if ACieloECResponse.HasError then
  // for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
  // ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);
  // end
  // )

  { GET PAYMENTS }
  // .GetPayments('80564',
  // procedure(ACieloECResponse: ICieloECResponse)
  // var
  // I: Integer;
  // begin
  // if ACieloECResponse.Success then
  // Memo2.Lines.Add(ACieloECResponse.ContentAsString);
  // if ACieloECResponse.HasError then
  // for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
  // ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);
  // end
  // )

  { GET CATCH SALE }
  // .GetCatchSale(StringToGUID('{A235E780-353E-4F37-BFD4-4D4AA1B5B707}'), nil,
  // procedure(ACieloECResponse: ICieloECResponse)
  // var
  // I: Integer;
  // begin
  // if ACieloECResponse.Success then
  // Memo2.Lines.Add(ACieloECResponse.ContentAsString);
  // if ACieloECResponse.HasError then
  // for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
  // ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);
  // end
  // )

  { CANCEL PAYMENT }
  // .CancelPayment (StringToGUID('{A235E780-353E-4F37-BFD4-4D4AA1B5B707}') , nil,
  // procedure(ACieloECResponse: ICieloECResponse)
  // var
  // I: Integer;
  // begin
  // if ACieloECResponse.Success then
  // Memo2.Lines.Add(ACieloECResponse.ContentAsString);
  // if ACieloECResponse.HasError then
  // for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
  // ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);
  // end
  // )

  { DEACTIVATE RECURRENT PAYMENT }
  // .UpdateRecurrentPayment_Deactivate(
  // StringToGUID('{86D3FF10-DBF3-40B5-A5DB-309CF368DEAA}'),
  //
  // procedure(ACieloECResponse: ICieloECResponse)
  // var
  // I: Integer;
  // begin
  // if ACieloECResponse.Success then
  // Memo2.Lines.Add('Deactivate');
  // if ACieloECResponse.HasError then
  // for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
  // ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);
  //
  // end
  //
  // )

  { DEACTIVATE RECURRENT PAYMENT }
  // .UpdateRecurrentPayment_Reactivate(
  // StringToGUID('{86D3FF10-DBF3-40B5-A5DB-309CF368DEAA}'),
  // procedure(ACieloECResponse: ICieloECResponse)
  // var
  // I: Integer;
  // begin
  // if ACieloECResponse.Success then
  // Memo2.Lines.Add('Reactivate');
  // if ACieloECResponse.HasError then
  // for I := 0 to ACieloECResponse.GetErrorList.Count - 1 do
  // ShowMessage(ACieloECResponse.GetErrorList.Items[I].Message);
  //
  // end
  // )

end;

end.
