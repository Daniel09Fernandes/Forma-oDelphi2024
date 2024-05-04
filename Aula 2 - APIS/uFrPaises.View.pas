unit uFrPaises.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.StorageBin;

type
  TfrPaises = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    imgFlag: TImage;
    Panel2: TPanel;
    edtSigla: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    memPais: TFDMemTable;
    memPaisPais: TStringField;
    memPaisBandeira: TStringField;
    memPaisPopulacao: TStringField;
    DataSource1: TDataSource;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    procedure Button1Click(Sender: TObject);
    procedure memPaisAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
   const bd = 'arquivo.dbs';
  public
    { Public declarations }
  end;

var
  frPaises: TfrPaises;

implementation

{$R *.dfm}

uses uPaises.Api, Vcl.Imaging.pngimage;

procedure TfrPaises.Button1Click(Sender: TObject);
begin
  var
  model := TPaisApi.BuscarPais(edtSigla.text);

  memPais.open;
  memPais.Append;
  memPaisPais.asString := model.Items.First.Name.Common;
  memPaisBandeira.asString := model.Items.First.Flags.Png;
  memPaisPopulacao.asString := model.Items.First.Population.toString;
  memPais.post;

   var Limg  := TMemoryStream.Create;
   TPaisApi.PegarImgBandeira(model.Items.First.Flags.Png, Limg);

   if Limg.Size > 0 then
   begin
     var LPng := TPngImage.Create;
     Limg.Position := 0;
     LPng.LoadFromStream(Limg);
     imgFlag.Picture.Assign(LPng);
   end;
end;



procedure TfrPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   memPais.SavetoFile(bd);
end;

procedure TfrPaises.FormShow(Sender: TObject);
begin
  if fileExists(bd) then
    memPais.LoadFromFile(bd);

end;

procedure TfrPaises.memPaisAfterScroll(DataSet: TDataSet);
begin

 var Limg  := TMemoryStream.Create;
   TPaisApi.PegarImgBandeira(memPaisBandeira.asString, Limg);

   if Limg.Size > 0 then
   begin
     var LPng := TPngImage.Create;
     Limg.Position := 0;
     LPng.LoadFromStream(Limg);
     imgFlag.Picture.Assign(LPng);
   end;

end;

end.
