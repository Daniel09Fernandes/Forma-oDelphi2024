unit uPokemon.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TfrPokemon = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtNomePokemon: TEdit;
    Button1: TButton;
    ImageList1: TImageList;
    Panel2: TPanel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel3: TPanel;
    imgPokemon: TImage;
    Splitter1: TSplitter;
    Panel4: TPanel;
    pnlHabilidades: TPanel;
    Label2: TLabel;
    pnlItensHabilidades: TPanel;
    pnlMovimentos: TPanel;
    Label3: TLabel;
    sbMovimentos: TScrollBox;
    Label4: TLabel;
    lblNome: TLabel;
    Label6: TLabel;
    lblPeso: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FUrlFoto : string;
    procedure CapturarPokemon;
    procedure RenderizarFotoPokemon;
    procedure CriarLabel(AValor: string; ATopValor: integer; AOwner: TComponent);
    procedure LimparInformacoesPokemon;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frPokemon: TfrPokemon;

implementation

{$R *.dfm}
uses REST.Json, uPokemon.API, Vcl.Imaging.pngimage;

procedure TfrPokemon.Button1Click(Sender: TObject);
begin
  CapturarPokemon;
  RenderizarFotoPokemon;
end;

procedure TfrPokemon.Button2Click(Sender: TObject);
begin
//  RESTRequest1.Execute;
//  var Model := TJson.JsonToObject<TPokemon>(RESTRequest1.Response.JSONText);

//  Memo1.Lines.Clear;
//  for var i := 0 to Pred(Model.Abilities.Count) do
//  begin
//    Memo1.Lines.Add(Model.Abilities[i].Ability.Name);
//  end;
end;

procedure TfrPokemon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // FreeAndNil(frPokemon);
end;

procedure TfrPokemon.LimparInformacoesPokemon;
begin
  while pnlItensHabilidades.ComponentCount > 0 do
   pnlItensHabilidades.Components[0].Free;

  while sbMovimentos.ComponentCount > 0 do
   sbMovimentos.Components[0].Free;
end;


procedure TfrPokemon.CapturarPokemon;
begin
   var LModel :=  TPokemonApi.CapturarPokemon(edtNomePokemon.Text);

   LimparInformacoesPokemon;
   var lblTop := 8;
   for var i := 0 to LModel.Abilities.Count -1 do
   begin
     CriarLabel(LModel.Abilities[i].Ability.Name, lblTop, pnlItensHabilidades);
     lblTop := lblTop + 15;
   end;
   
   lblTop := 8;
   for var i := 0 to LModel.Moves.Count -1 do
   begin
       CriarLabel(LModel.Moves[i].Move.Name, lblTop, sbMovimentos);
       lblTop := lblTop + 20;
//     var lbl := TLabel.Create(pnlMovimentos);
//     lbl.Parent := pnlMovimentos;
//     lbl.Font.Color := clWhite;
//     lbl.font.Style := [];
//     lbl.Font.Size := 9;
//     lbl.Caption := LModel.Abilities[i].Ability.Name;
//     lbl.Left := 10;
//     lblTop := lblTop + 15;
//     lbl.Top :=  lblTop; 
//     lbl.Name :=  'lbl_habilidades_'+i.ToString+LModel.Abilities[i].Ability.Name.Replace('-','_'); 
   end;  
   FUrlFoto := LModel.Sprites.FrontDefault;
   lblNome.Caption := edtNomePokemon.Text; 
   lblPeso.Caption := LModel.Height.ToString;
end;

procedure TfrPokemon.CriarLabel(AValor:string; ATopValor: integer; AOwner:TComponent);
begin
   var lbl := TLabel.Create(AOwner);
     lbl.Parent := TWinControl(AOwner);
     lbl.Font.Color := clWhite;
     lbl.font.Style := [];
     lbl.Font.Size := 9;
     lbl.Caption := AValor;
     lbl.Left := 15;
     lbl.Top :=  ATopValor; 
     lbl.Name :=  'lbl_'+AValor.Replace('-','_'); 
end;

procedure TfrPokemon.RenderizarFotoPokemon;
begin 
   var Limg  := TMemoryStream.Create;   
   TPokemonApi.BuscarFotos(FUrlFoto, Limg);

   if Limg.Size > 0 then
   begin
     var LPng := TPngImage.Create;
     Limg.Position := 0;
     LPng.LoadFromStream(Limg);
     imgPokemon.Picture.Assign(LPng);
   end;   
end;


end.
