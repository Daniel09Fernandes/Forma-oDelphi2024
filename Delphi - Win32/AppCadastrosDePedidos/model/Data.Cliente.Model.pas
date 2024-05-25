unit Data.Cliente.Model;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Cliente.Entity, System.Generics.Collections;

type
  TDmClienteModel = class(TDataModule)
    FDQCadastroUsuario: TFDQuery;
    procedure FDQCadastroUsuarioBeforeOpen(DataSet: TDataSet);
    procedure FDQCadastroUsuarioAfterClose(DataSet: TDataSet);
  private
    FListaCliente : TList<TClienteEntity>;
    procedure ParseQueryToObjt(var AObtCliente : TClienteEntity);
    procedure FecharConexao;
  public
    function BuscarClientes: TList<TClienteEntity>;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  DmClienteModel: TDmClienteModel;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDmClienteModel.BuscarClientes: TList<TClienteEntity>;
begin
  if not Assigned(FListaCliente) then
    FListaCliente := TList<TClienteEntity>.Create;

  FListaCliente.Clear;
  try
    FDQCadastroUsuario.Open;

    FDQCadastroUsuario.First;
    while not FDQCadastroUsuario.Eof do
    begin
      var Cliente := TClienteEntity.Create;
      ParseQueryToObjt(Cliente);
      FListaCliente.Add(Cliente);

      FDQCadastroUsuario.Next;
    end;
    Result := FListaCliente;
  finally
     FDQCadastroUsuario.Close;
  end;
end;

constructor TDmClienteModel.Create(AOwner: TComponent);
begin
  inherited;

  If AOwner is TFDConnection then
    FDQCadastroUsuario.Connection := TFDConnection(AOwner);
end;

destructor TDmClienteModel.Destroy;
begin
   if Assigned(FListaCliente) then
    FreeAndNil(FListaCliente);

  FecharConexao;
  inherited;
end;

procedure TDmClienteModel.FDQCadastroUsuarioAfterClose(DataSet: TDataSet);
begin
  FecharConexao;
end;

procedure TDmClienteModel.FecharConexao;
begin
  FDQCadastroUsuario.Connection.Connected := false;
end;

procedure TDmClienteModel.FDQCadastroUsuarioBeforeOpen(DataSet: TDataSet);
begin
   if not FDQCadastroUsuario.Connection.Connected then
     FDQCadastroUsuario.Connection.Connected := true;
end;

procedure TDmClienteModel.ParseQueryToObjt(var AObtCliente: TClienteEntity);
begin
   if not Assigned(AObtCliente) then
     raise Exception.Create('Objeto Cliente n�o instanciado!');

  AObtCliente.IdCliente    := FDQCadastroUsuario.FieldByName('ID_CLIENTE').AsInteger;
  AObtCliente.NomeCliente  := FDQCadastroUsuario.FieldByName('NOME_CLIENTE').AsString;
  AObtCliente.Endereco     := FDQCadastroUsuario.FieldByName('ENDERECO').AsString;
  AObtCliente.DataCadastro := FDQCadastroUsuario.FieldByName('DTA_CADASTRO').AsDateTime;
end;

end.
