program DelphiCielo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uTest in 'uTest.pas' {Form3},
  Cielo.ECommerce.Classes in 'CieloAPI\Cielo.ECommerce.Classes.pas',
  Cielo.ECommerce.Interfaces in 'CieloAPI\Cielo.ECommerce.Interfaces.pas',
  Cielo.ECommerce.Types in 'CieloAPI\Cielo.ECommerce.Types.pas',
  Cielo.ECommerce.JSONInterceptors in 'CieloAPI\Cielo.ECommerce.JSONInterceptors.pas',
  Cielo.ECommerce.UrlBuilder in 'CieloAPI\Cielo.ECommerce.UrlBuilder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
