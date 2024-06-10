object dmPedidoModel: TdmPedidoModel
  Height = 272
  Width = 347
  object FDItemPedido: TFDQuery
    BeforeOpen = FDItemPedidoBeforeOpen
    AfterClose = FDItemPedidoAfterClose
    CachedUpdates = True
    Connection = DmConexaoModel.FDConn
    UpdateObject = UdpItemPedido
    SQL.Strings = (
      '             '
      'select '
      ' ip.ID_PRODUTO,'
      ' ip.ID_ITEM,'
      ' ip.ID_PEDIDO,'
      ' p.NOME_PRODUTO,'
      ' p. preco'
      'from'
      '   itens_pedido ip'
      'inner join produtos p '
      '    on (p.ID_PRODUTO = ip.ID_PRODUTO)')
    Left = 72
    Top = 48
  end
  object FDPedidoCapa: TFDQuery
    BeforeOpen = FDPedidoCapaBeforeOpen
    AfterClose = FDItemPedidoAfterClose
    CachedUpdates = True
    UpdateObject = udpPedidoCapa
    SQL.Strings = (
      '  SELECT'
      '    PED.ID_PEDIDO,'
      '    PED.ID_CLIENTE,'
      '    CL.NOME_CLIENTE,'
      '    PED.TOTAL_PEDIDO'
      '  FROM'
      '    PEDIDOS PED'
      '  INNER JOIN'
      '    CLIENTE CL ON (CL.ID_CLIENTE = PED.ID_CLIENTE)  ')
    Left = 168
    Top = 48
  end
  object UdpItemPedido: TFDUpdateSQL
    Connection = DmConexaoModel.FDConn
    InsertSQL.Strings = (
      'INSERT INTO ITENS_PEDIDO'
      '(ID_ITEM, ID_PRODUTO, ID_PEDIDO)'
      'VALUES (:NEW_ID_ITEM, :NEW_ID_PRODUTO, :NEW_ID_PEDIDO)')
    ModifySQL.Strings = (
      'UPDATE ITENS_PEDIDO'
      
        'SET ID_ITEM = :NEW_ID_ITEM, ID_PRODUTO = :NEW_ID_PRODUTO, ID_PED' +
        'IDO = :NEW_ID_PEDIDO'
      'WHERE ID_ITEM = :OLD_ID_ITEM')
    DeleteSQL.Strings = (
      'DELETE FROM ITENS_PEDIDO'
      'WHERE ID_ITEM = :OLD_ID_ITEM')
    FetchRowSQL.Strings = (
      'SELECT ID_ITEM, ID_PRODUTO, ID_PEDIDO'
      'FROM ITENS_PEDIDO'
      'WHERE ID_ITEM = :OLD_ID_ITEM')
    Left = 72
    Top = 112
  end
  object udpPedidoCapa: TFDUpdateSQL
    Connection = DmConexaoModel.FDConn
    InsertSQL.Strings = (
      'INSERT INTO PEDIDOS'
      '(ID_PEDIDO, ID_CLIENTE, TOTAL_PEDIDO)'
      'VALUES (:NEW_ID_PEDIDO, :NEW_ID_CLIENTE, :NEW_TOTAL_PEDIDO)')
    ModifySQL.Strings = (
      'UPDATE PEDIDOS'
      
        'SET ID_PEDIDO = :NEW_ID_PEDIDO, ID_CLIENTE = :NEW_ID_CLIENTE, TO' +
        'TAL_PEDIDO = :NEW_TOTAL_PEDIDO'
      'WHERE ID_PEDIDO = :OLD_ID_PEDIDO')
    DeleteSQL.Strings = (
      'DELETE FROM PEDIDOS'
      'WHERE ID_PEDIDO = :OLD_ID_PEDIDO')
    FetchRowSQL.Strings = (
      'SELECT ID_PEDIDO, ID_CLIENTE, TOTAL_PEDIDO'
      'FROM PEDIDOS'
      'WHERE ID_PEDIDO = :OLD_ID_PEDIDO')
    Left = 176
    Top = 112
  end
end
