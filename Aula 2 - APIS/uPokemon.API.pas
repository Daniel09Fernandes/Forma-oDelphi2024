unit uPokemon.API;

interface
uses uPokemon.Model, Rest.Client, REST.Json, sysUtils, StrUtils,
  System.Classes, REST.Types;
type
  TPokemonApi = class
    private
      const URL_POKEMON_API =  'https://pokeapi.co/api/v2/pokemon/';
    public
     class procedure BuscarFotos(const AUrlFoto:string; AImage: TStream);
     class function CapturarPokemon(const ANomePokemon:string): TPokemon;
  end;

const NAO_USAR_VARIAVEIS_GOLBAIS = '';

implementation

{ TPokemonApi }
uses uHttp.Bytes;

class procedure TPokemonApi.BuscarFotos(const AUrlFoto: string; AImage: TStream);
begin
   THttpBytes.GetBytes(AUrlFoto, AImage);
end;

class function TPokemonApi.CapturarPokemon( const ANomePokemon: string): TPokemon;
begin
   if ANomePokemon.Trim.IsEmpty then
     raise Exception.Create('Informar um pokemon para consulta!');

   var LRest := TRESTClient.Create(URL_POKEMON_API + ANomePokemon);
   var LReq  := TRESTRequest.Create(LRest);
   try
      LRest.Accept := '*/*';
      LRest.ContentType := 'application/json';

      LReq.Client := LRest;
      LReq.Method := rmGET;

      LReq.Execute;

      Result := TJson.JsonToObject<TPokemon>(LReq.Response.JSonValue.ToString);
   finally
      LReq.Free;
      LRest.Free;
   end;
end;

end.