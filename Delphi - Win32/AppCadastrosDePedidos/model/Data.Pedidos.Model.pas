unit Data.Pedidos.Model;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  System.Generics.Collections,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Pedidos.Entity;

type
  TdmPedidoModel = class(TDataModule)
    FDItemPedido: TFDQuery;
    FDPedidoCapa: TFDQuery;
    UdpItemPedido: TFDUpdateSQL;
    udpPedidoCapa: TFDUpdateSQL;
    procedure FDPedidoCapaBeforeOpen(DataSet: TDataSet);
    procedure FDItemPedidoBeforeOpen(DataSet: TDataSet);
    procedure FDItemPedidoAfterClose(DataSet: TDataSet);
  private
    FListaPedidos: TList<TPedidoEntity>;
    FListaItensPedidos: TList<TItemPedidoEntity>;
    procedure FecharConexao;
    procedure ParseQueryToObjtPedidos(var AModel : TPedidoEntity);
    procedure ParseQueryToObjtItensPedidos(var AModel : TItemPedidoEntity);
    procedure PersistirPedidos;
    procedure PersistirItensPedidos;
  public
    function BuscarPedidos: TList<TPedidoEntity>;
    function GravarPedidos(AModel: TPedidoEntity): TList<TPedidoEntity>;
    function BuscarItensPedidos: TList<TItemPedidoEntity>;
    function GravarItensPedidos(AModel: TItemPedidoEntity): TList<TItemPedidoEntity>;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  dmPedidoModel: TdmPedidoModel;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TdmPedidoModel.BuscarItensPedidos: TList<TItemPedidoEntity>;
begin
  FListaItensPedidos.Clear;
  try
    FDItemPedido.Open;

    FDItemPedido.First;
    while not FDItemPedido.Eof do
    begin
      var
      ItensPed := TItemPedidoEntity.Create;
      ParseQueryToObjtItensPedidos(ItensPed);
      FListaItensPedidos.Add(ItensPed);

      FDItemPedido.Next;
    end;
    Result := FListaItensPedidos;
  finally
    FDItemPedido.Close;
  end;
end;

function TdmPedidoModel.BuscarPedidos: TList<TPedidoEntity>;
begin
   FListaPedidos.Clear;
  try
    FDPedidoCapa.Open;

    FDPedidoCapa.First;
    while not FDPedidoCapa.Eof do
    begin
      var
      Pedido := TPedidoEntity.Create;
      ParseQueryToObjtPedidos(Pedido);
      FListaPedidos.Add(Pedido);

      FDPedidoCapa.Next;
    end;
    Result := FListaPedidos;
  finally
    FDPedidoCapa.Close;
  end;
end;

constructor TdmPedidoModel.Create(AOwner: TComponent);
begin
  inherited;
  FListaPedidos      := TList<TPedidoEntity>.Create;
  FListaItensPedidos := TList<TItemPedidoEntity>.Create;

  If AOwner is TFDConnection then
  begin
    FDPedidoCapa.Connection  := TFDConnection(AOwner);
    FDPedidoCapa.Transaction := TFDConnection(AOwner).Transaction;

    FDItemPedido.Connection  := TFDConnection(AOwner);
    FDItemPedido.Transaction := TFDConnection(AOwner).Transaction;
  end;
end;

destructor TdmPedidoModel.Destroy;
begin
  PersistirPedidos;
  PersistirItensPedidos;
  FecharConexao;

  FreeAndNil(FListaPedidos);
  FreeAndNil(FListaItensPedidos);
  inherited;
end;

procedure TdmPedidoModel.FDItemPedidoAfterClose(DataSet: TDataSet);
begin
  FecharConexao;
end;

procedure TdmPedidoModel.FDItemPedidoBeforeOpen(DataSet: TDataSet);
begin
  if not FDItemPedido.Connection.Connected then
    FDItemPedido.Connection.Connected := True;
end;

procedure TdmPedidoModel.FDPedidoCapaBeforeOpen(DataSet: TDataSet);
begin
   if not FDPedidoCapa.Connection.Connected then
    FDPedidoCapa.Connection.Connected := True;
end;

procedure TdmPedidoModel.FecharConexao;
begin
  FDPedidoCapa.Connection.Connected := false;
  FDItemPedido.Connection.Connected := false;
end;

function TdmPedidoModel.GravarItensPedidos(
  AModel: TItemPedidoEntity): TList<TItemPedidoEntity>;
begin

end;

function TdmPedidoModel.GravarPedidos(
  AModel: TPedidoEntity): TList<TPedidoEntity>;
begin

end;

procedure TdmPedidoModel.ParseQueryToObjtItensPedidos(var AModel: TItemPedidoEntity);
begin
  if not Assigned(AModel) then
    raise Exception.Create('Objeto Cliente n�o instanciado!');

  AModel.IdPedido    := FDItemPedido.FieldByName('ID_PEDIDO').AsInteger;
  AModel.NomeProduto := FDItemPedido.FieldByName('NOME_PRODUTO').AsString;
  AModel.IdItem      := FDItemPedido.FieldByName('ID_ITEM').AsInteger;
  AModel.IdProduto   := FDItemPedido.FieldByName('ID_PRODUTO').AsInteger;
  AModel.Preco       := FDItemPedido.FieldByName('PRECO').asFloat;
end;

procedure TdmPedidoModel.ParseQueryToObjtPedidos(var AModel: TPedidoEntity);
begin
  if not Assigned(AModel) then
    raise Exception.Create('Objeto Cliente n�o instanciado!');

  AModel.IdPedido    := FDPedidoCapa.FieldByName('ID_PEDIDO').AsInteger;
  AModel.NomeCliente := FDPedidoCapa.FieldByName('NOME_CLIENTE').AsString;
  AModel.IdCliente   := FDPedidoCapa.FieldByName('ID_CLIENTE').AsInteger;
  AModel.TotalPedido := FDPedidoCapa.FieldByName('TOTAL_PEDIDO').asFloat;
end;

procedure TdmPedidoModel.PersistirItensPedidos;
begin

  if Not Assigned(FListaItensPedidos)  then
    raise Exception.Create('Lista n�o criada');

  FDItemPedido.DisableControls;

  // Apenas uma dica
  // if FDItemPedido.State in dsEditModes then
  // raise Exception.Create('Apenas um teste');

  if FDItemPedido.State = dsInactive then
    FDItemPedido.Open;

  try
    FDItemPedido.Transaction.StartTransaction;

    for var I := 0 to FListaItensPedidos.Count - 1 do
    begin
      FDItemPedido.Filter := ' ID_ITEM = ' + FListaItensPedidos.Items[I].IdItem.ToString;
      FDItemPedido.Filtered := True;

      if FDItemPedido.RecordCount > 0 then
      begin
        FDItemPedido.Edit;

        FDItemPedido.FieldByName('ID_PEDIDO').AsInteger     := FListaItensPedidos.Items[i].IdPedido;
        FDItemPedido.FieldByName('NOME_PRODUTO').AsString   := FListaItensPedidos.Items[i].NomeProduto;
        FDItemPedido.FieldByName('ID_ITEM').AsInteger       := FListaItensPedidos.Items[i].IdItem;
        FDItemPedido.FieldByName('ID_PRODUTO').AsInteger    := FListaItensPedidos.Items[i].IdProduto;
        FDItemPedido.FieldByName('PRECO').asFloat           := FListaItensPedidos.Items[i].Preco;

        FDItemPedido.post;
      end
      else
        FDItemPedido.AppendRecord( [
                                    FListaItensPedidos.Items[i].IdPedido,
                                    FListaItensPedidos.Items[i].NomeProduto,
                                    FListaItensPedidos.Items[i].IdItem,
                                    FListaItensPedidos.Items[i].IdProduto,
                                    FListaItensPedidos.Items[i].Preco
                                  ]);

    end;
    FDItemPedido.Filter := '';
    FDItemPedido.Filtered := false;
    FDItemPedido.ApplyUpdates(0);

    FDItemPedido.Transaction.Commit;
    FDItemPedido.Close;
  except
    on E: Exception do
    begin
      FDItemPedido.Transaction.Rollback;
      raise Exception.Create('Erro ao gravar no banco '+sLineBreak + E.Message);
    end;
  end;
end;

procedure TdmPedidoModel.PersistirPedidos;
begin
    if Not Assigned(FListaPedidos)  then
    raise Exception.Create('Lista n�o criada');

  FDPedidoCapa.DisableControls;

  // Apenas uma dica
  // if FDPedidoCapa.State in dsEditModes then
  // raise Exception.Create('Apenas um teste');

  if FDPedidoCapa.State = dsInactive then
    FDPedidoCapa.Open;

  try
    FDPedidoCapa.Transaction.StartTransaction;

    for var I := 0 to FListaPedidos.Count - 1 do
    begin
      FDPedidoCapa.Filter := ' ID_PEDIDO = ' + FListaPedidos.Items[I].IdPedido.ToString;
      FDPedidoCapa.Filtered := True;

      if FDPedidoCapa.RecordCount > 0 then
      begin
        FDPedidoCapa.Edit;

        FDPedidoCapa.FieldByName('ID_PEDIDO').AsInteger    := FListaPedidos.Items[i].IdPedido;
        FDPedidoCapa.FieldByName('NOME_CLIENTE').AsString  := FListaPedidos.Items[i].NomeCliente;
        FDPedidoCapa.FieldByName('ID_CLIENTE').AsInteger   := FListaPedidos.Items[i].IdCliente;
        FDPedidoCapa.FieldByName('TOTAL_PEDIDO').asFloat   := FListaPedidos.Items[i].TotalPedido;
        FDPedidoCapa.post;
      end
      else
        FDPedidoCapa.AppendRecord( [
                                     FListaPedidos.Items[i].IdPedido,
                                     FListaPedidos.Items[i].NomeCliente,
                                     FListaPedidos.Items[i].IdCliente,
                                     FListaPedidos.Items[i].TotalPedido
                                  ]);

    end;
    FDPedidoCapa.Filter := '';
    FDPedidoCapa.Filtered := false;
    FDPedidoCapa.ApplyUpdates(0);

    FDPedidoCapa.Transaction.Commit;
    FDPedidoCapa.Close;
  except
    on E: Exception do
    begin
      FDPedidoCapa.Transaction.Rollback;
      raise Exception.Create('Erro ao gravar no banco '+sLineBreak + E.Message);
    end;
  end;
end;

end.
