unit uCadastro.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, uPokemon.View, uTema.conf;

type
  TfrHome = class(TForm)
    PopupMenu1: TPopupMenu;
    emadosistema1: TMenuItem;
    Dark1: TMenuItem;
    Ligth1: TMenuItem;
    pnlBoasVindas: TPanel;
    PnlMain: TPanel;
    Button1: TButton;
    ImageList1: TImageList;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Dark1Click(Sender: TObject);
    procedure Ligth1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
//     frPokemon: TfrPokemon;
     FTemaDefault: TTemaPadrao;
  public
    procedure AbrirTelaPokemon;
  end;

var
  frHome: TfrHome;

implementation

{$R *.dfm}

uses
  Vcl.Themes,
  Vcl.Styles, uFrQRCode.View, uFrPaises.View;

{ TfrHome }

procedure TfrHome.AbrirTelaPokemon;
begin
 // var LfrPokemon: TfrPokemon := TfrPokemon.Create(self);
  try
//    LfrPokemon.ShowModel;
//   if frPokemon <> nil then
//     frPokemon := TfrPokemon.Create(self)
//   else
//   begin
//     FreeAndNil(frPokemon);
//     frPokemon := TfrPokemon.Create(self);
//   end;

    frPokemon.Show;
  finally
//    LfrPokemon.Free;
  end;
end;

procedure TfrHome.Button1Click(Sender: TObject);
begin
  AbrirTelaPokemon;
end;

procedure TfrHome.Button2Click(Sender: TObject);
begin
 // FreeAndNil(frPokemon);
end;

procedure TfrHome.Button3Click(Sender: TObject);
begin
  var frGeraQrCode := TfrQrCode.create(self);
  try
     frGeraQrCode.ShowModal;
  finally
    frGeraQrCode.free;
  end;
end;

procedure TfrHome.Button4Click(Sender: TObject);
begin
  var frPais := TfrPaises.create(self);
  try
    frPais.ShowModal;
  finally
    frPais.Free;
  end;
end;

procedure TfrHome.Dark1Click(Sender: TObject);
begin
  TStyleManager.TrySetStyle('Cyan Night');
  FTemaDefault.GravarTema('Cyan Night');
end;

procedure TfrHome.FormCreate(Sender: TObject);
begin
   frPokemon    := TfrPokemon.Create(self);
   FTemaDefault := TTemaPadrao.Create;

   var LTema := FTemaDefault.BuscarTemaDefault;

   if not LTema.Trim.IsEmpty then
     TStyleManager.TrySetStyle(LTema);
end;

procedure TfrHome.FormDestroy(Sender: TObject);
begin
   FreeAndNil(frPokemon);
   FreeAndNil(FTemaDefault);
end;

procedure TfrHome.Ligth1Click(Sender: TObject);
begin
   TStyleManager.TrySetStyle('Luna');
   FTemaDefault.GravarTema('Luna');
end;

end.
