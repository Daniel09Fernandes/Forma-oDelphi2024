unit uTema.conf;

interface

uses inifiles, System.SysUtils;
type
  TTemaPadrao = class
    private
       FIni: TInifile;
    public
       procedure GravarTema(AValue:string);
       function BuscarTemaDefault:string;
      constructor Create;
  end;


implementation

uses
  Vcl.Forms;

{ TIniTema }

function TTemaPadrao.BuscarTemaDefault: string;
begin
  result := FIni.ReadString('TEMA','default', '');
end;

constructor TTemaPadrao.Create;
begin
   FIni := TiniFile.Create(ExtractFilePath(Application.ExeName)+ 'tema.ini');
end;

procedure TTemaPadrao.GravarTema(AValue: string);
begin
  FIni.writeString('TEMA','default',AValue);
end;
end.
