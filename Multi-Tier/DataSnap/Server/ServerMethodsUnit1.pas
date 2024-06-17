unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, ClassePessoa, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, REST.JSON;

type
  TServerMethods1 = class(TDSServerModule)
    memPessoa: TFDMemTable;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    memPessoaId: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaIdade: TIntegerField;
  private
    { Private declarations }
    const
      DB_PESSOA = 'DB-Pessoa.json';
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function SetaRetornaPessoa: TPessoa;
    function GetPessoaDB: string;
    function SetPessoaDB(dbPessoa: string): Boolean;
    function GetPessoaNativo: TPessoa;
    function SetPessoaNativo(pes: TPessoa): Boolean;
    function GetPessoaNaoNativo: string;
    function SetPessoaNaoNativo(pessoa: string): Boolean;

  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetPessoaDB: string;
begin
   if FileExists(DB_PESSOA) then
   begin
     memPessoa.LoadFromFile(DB_PESSOA,sfJSON);
   end;

   var strStm: TStringStream := TStringStream.Create;
   memPessoa.SaveToStream(strStm,sfJSON);
   Result := strStm.DataString;
   strStm.Free;
end;

function TServerMethods1.GetPessoaNaoNativo: string;
begin
  var pes: TPessoa := TPessoa.Create;
  pes.Id := 321;
  pes.Nome := 'Wagner';
  pes.Idade := 90;

  Result := TJson.ObjectToJsonString(pes);

  pes.Free;
end;

function TServerMethods1.GetPessoaNativo: TPessoa;
begin
  Result := TPessoa.Create;
  Result.Id := 123;
  Result.Nome := 'Thiago';
  Result.Idade := 40;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetaRetornaPessoa: TPessoa;
begin
  Result := TPessoa.Create;
  Result.Id := 1;
  Result.Nome := 'Gustavo';
  Result.Idade := 33;
end;

function TServerMethods1.SetPessoaDB(dbPessoa: string): Boolean;
begin
  var srtStm: TStringStream := TStringStream.Create(dbPessoa);
  memPessoa.LoadFromStream(srtStm,sfJSON);

  memPessoa.SaveToFile(DB_PESSOA,sfJSON);
  memPessoa.Close;

  Result := True;
end;

function TServerMethods1.SetPessoaNaoNativo(pessoa: string): Boolean;
begin
  var pes: TPessoa := TJson.JsonToObject<TPessoa>(pessoa);
  var jsonObj : string := TJson.ObjectToJsonString(pes);

  var st1: TStringList := TStringList.Create;
  st1.Add(jsonObj);
  st1.SaveToFile('log-pessoa-NaoNativo.json');
  st1.Free;
  Result := True;
end;

function TServerMethods1.SetPessoaNativo(pes: TPessoa): Boolean;
begin
  var jsonObj: string := TJson.ObjectToJsonString(pes);

  var st1: TStringList := TStringList.Create;
  st1.Add(jsonObj);
  st1.SaveToFile('log-pessoa-Nativo.json');
  st1.Free;
  Result := True;
end;

end.

