unit uConversorGenerico;

interface

uses System.SysUtils, System.Rtti;

type
  TConversorMoedaGenerico<T> = class
  private
    function GetTipo(ATipo: T): TTypeKind;
    function ParsT_ToString(ATipo: T): string;
    function ParsT_ToDouble(ATipo: T): Double;

  public
    function ConverterDolarParaReal(ADolar: T): T;
    function ConverterRealParaDolar(AReal: T): T;
  end;

implementation

uses uConversor;
{ TConversorMoedaGenerico<T> }


function  TConversorMoedaGenerico<T>.GetTipo(ATipo: T): TTypeKind;
begin
    Result := GetTypeKind(ATipo);
end;

function  TConversorMoedaGenerico<T>.ParsT_ToString(ATipo: T): string;
begin
   Result := TValue.From<T>(ATipo).AsType<string>;
end;

function  TConversorMoedaGenerico<T>.ParsT_ToDouble(ATipo: T): Double;
begin
   Result := TValue.From<T>(ATipo).AsType<Double>;
end;

function TConversorMoedaGenerico<T>.ConverterDolarParaReal(ADolar: T): T;
begin
  var Conversor := TConversorMoedas.Create;
  try
    if GetTipo(ADolar) = tkUString then
    begin
      exit(TValue.From<String>
                             (Conversor.ConverterDolarParaReal(
                                                                ParsT_ToString(ADolar)
                                                               ).ToString)
                                                                .AsType<T>);

    end;

    if TValue.From<T>(ADolar).Kind = tkFloat then
    begin
       Result  := TValue.From<Double>
                               (Conversor.ConverterDolarParaReal(
                                                                  ParsT_ToDouble(ADolar) )
                                                                 ).AsType<T>;

        exit;
    end;
  finally
    FreeAndNil(Conversor);
  end;
end;

function TConversorMoedaGenerico<T>.ConverterRealParaDolar(AReal: T): T;
begin
  var Conversor := TConversorMoedas.Create;
  try
    if GetTipo(AReal) = tkUString then
    begin
        Result := TValue.From<String>
                             (Conversor.ConverterRealParaDolar(
                                                                ParsT_ToString(AReal)
                                                               ).ToString)
                                                                .AsType<T>;
    end;

    if GetTipo(AReal) = tkFloat then
    begin
       Result  := TValue.From<Double>
                               (Conversor.ConverterRealParaDolar(
                                                                  ParsT_ToDouble(AReal))
                                                                 ).AsType<T>;

        exit;
    end;

  finally
     FreeAndNil(Conversor);
  end;
end;

end.
