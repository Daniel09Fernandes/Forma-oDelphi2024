unit base.Pesquisa.Controller;

interface
  uses System.Classes,Base.Form.Pesquisa.View;
type
  TPesquisaController = class
    class function GetTelaPesquisa(AOwner : TComponent): TfrPesquisa;
  end;

implementation

{ TPesquisaController }

class function TPesquisaController.GetTelaPesquisa(AOwner: TComponent): TfrPesquisa;
begin
   result := TfrPesquisa.Create(AOwner);
end;

end.
