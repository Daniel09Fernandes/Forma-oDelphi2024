unit uZip.form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Zip, Zip.Helper;

type
  TForm2 = class(TForm)
    edtArquivos: TEdit;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  OpenDialog1.Execute();
  for var I := 0 to OpenDialog1.Files.Count -1 do
    edtArquivos.Text := OpenDialog1.Files[I] +
                          ';'+ edtArquivos.Text;
  //OpenDialog1.Files;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
//   var zip := TZipFile.Create;
//   try
//     var saida:string := GetCurrentDir+'\app.zip';
//
//     zip.Open(saida, zmWrite);
//
//     for var i := 0 to OpenDialog1.Files.Count -1 do
//        zip.Add(OpenDialog1.Files[i]);
//   finally
//     zip.CountFiles; //Helper sem class procedure, acessa via self no objeto
//     Zip.Free;
//   end;
  TZipFile.Zippar(GetCurrentDir,OpenDialog1.Files); // Helper com class procedure, acessa via class
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
//  var zip := TZipFile.Create;
//   try
//     var saida:string := GetCurrentDir+'\app.zip';
//
//     if not FileExists(saida) then
//       raise Exception.Create('Arquivo n�o encontrado');
//
//     zip.Open(saida, zmRead);
//
//     zip.ExtractAll(GetCurrentDir);
//   finally
//     Zip.Free;
//   end;

  TZipFile.DesZippar(GetCurrentDir);
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
 Var str :String;
   ShowMessage(str.GetMYName);
end;

end.
