unit uFrQRCode.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrQrCode = class(TForm)
    Panel1: TPanel;
    pnlPrincipal: TPanel;
    imgQRCode: TImage;
    edtValor: TEdit;
    Label1: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
  private
    procedure GerarQRCode;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses uQRCode.Api, Vcl.Imaging.pngimage;

procedure TfrQrCode.Button1Click(Sender: TObject);
begin
   GerarQRCode;
end;

procedure TfrQrCode.GerarQRCode;
begin
   var Limg  := TMemoryStream.Create;
   TQrCodeApi.GerarQrCode(edtValor.Text, Limg);

   if Limg.Size > 0 then
   begin
     var LPng := TPngImage.Create;
     Limg.Position := 0;
     LPng.LoadFromStream(Limg);
     imgQRCode.Picture.Assign(LPng);
   end;
end;

end.
