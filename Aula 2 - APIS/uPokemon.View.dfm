object frPokemon: TfrPokemon
  Left = 0
  Top = 0
  Caption = 'Temos que pegar, POKEMON'
  ClientHeight = 441
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 1316118
  Font.Height = -12
  Font.Name = 'Roboto'
  Font.Style = [fsBold]
  OnClose = FormClose
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 152
    Top = 41
    Width = 11
    Height = 400
    Color = clGradientActiveCaption
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    Color = 11992352
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 12
      Width = 54
      Height = 14
      Caption = 'Pokemon:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNomePokemon: TEdit
      Left = 68
      Top = 9
      Width = 181
      Height = 18
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      ParentBiDiMode = False
      TabOrder = 0
      Text = 'charmander'
      TextHint = 'Informe o nome do pokemon'
    end
    object Button1: TButton
      Left = 255
      Top = 7
      Width = 30
      Height = 26
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 166
    Top = 44
    Width = 455
    Height = 394
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label4: TLabel
      Left = 12
      Top = 24
      Width = 34
      Height = 14
      Caption = 'Nome:'
    end
    object lblNome: TLabel
      Left = 52
      Top = 24
      Width = 35
      Height = 14
      Caption = '*******'
    end
    object Label6: TLabel
      Left = 12
      Top = 44
      Width = 30
      Height = 14
      Caption = 'Peso:'
    end
    object lblPeso: TLabel
      Left = 52
      Top = 44
      Width = 35
      Height = 14
      Caption = '*******'
    end
    object Panel4: TPanel
      Left = 1
      Top = 80
      Width = 453
      Height = 313
      Align = alBottom
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object pnlHabilidades: TPanel
        Left = 5
        Top = 11
        Width = 124
        Height = 118
        Color = 10756003
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 114
          Height = 15
          Margins.Left = 5
          Margins.Top = 5
          Align = alTop
          Caption = 'Habilidades'
          Color = 10887077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = 15
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 66
        end
        object pnlItensHabilidades: TPanel
          Left = 1
          Top = 24
          Width = 122
          Height = 93
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlItensHabilidades'
          ParentColor = True
          ShowCaption = False
          TabOrder = 0
        end
      end
      object pnlMovimentos: TPanel
        Left = 157
        Top = 11
        Width = 138
        Height = 118
        Color = 14794830
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          138
          118)
        object Label3: TLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 128
          Height = 15
          Margins.Left = 5
          Margins.Top = 5
          Align = alTop
          Caption = 'Movimentos'
          Color = 10887077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = 15
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 69
        end
        object sbMovimentos: TScrollBox
          Left = 2
          Top = 24
          Width = 136
          Height = 94
          HorzScrollBar.Color = 14794830
          HorzScrollBar.ParentColor = False
          HorzScrollBar.Smooth = True
          HorzScrollBar.Style = ssFlat
          VertScrollBar.Color = 14794830
          VertScrollBar.ParentColor = False
          VertScrollBar.Smooth = True
          VertScrollBar.Style = ssFlat
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 152
    Height = 400
    Align = alLeft
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object imgPokemon: TImage
      Left = 1
      Top = 1
      Width = 150
      Height = 398
      Align = alClient
      Proportional = True
      Stretch = True
      ExplicitLeft = 6
      ExplicitTop = 18
      ExplicitWidth = 129
      ExplicitHeight = 126
    end
  end
  object ImageList1: TImageList
    Left = 544
    Top = 72
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FFFFFA00FEFDFF00FEFDFF00FFFEFB00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FFFCF300421B0500BBBCC000C9BDB100CFC9BE00BFC0BE0041290D00FFF8
      F400FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FCFEFE00542A
      0700D2C8B700773B0000723C0000723C0000723C0000723C00006E3C0000CDC1
      B70049240200FCFFFA00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE004D2A0900773F
      0E00723C0000723C0000723C0000723C0000723C0000723C0000723C0000723C
      0000763F140048250300FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F9F0E600D7C6B300723C
      0000723C0000723C0000723C00008642130073310000723C0000723C0000723C
      0000723C0000D5CBC100FEF3EF00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE0042240900723C0000723C
      0000723C00007C440D00492A0B003A1F0500331D040040260E00753C0000723C
      0000723C00006E3C000040230800FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00BFBEC200723C0000723C
      0000713804004D2A1000FEFEFE00FEFEFE00FEFDFF00FEFEFE0041270F00723C
      0000723C0000723C0000BFC0BE00FFFFFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00B9BFBA00FFD58E005B2B
      00006835030032160000FFFDFE00E9EEF100FFFFF900FFFFFA00331D04005F2E
      00006C3E0000FFE09200C3C5AF00FEFDFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00B7B9BA004E2A0C004E2A
      0C004221000038163B002A05E300EBEAEE00E1E9E9002800E800301C28004B28
      14004E2A0C004E2A0C00BFB9B400FEFDFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00BDC0BE004E2A0C004E2A
      0C00432A10004E2E03002500EA002904E2002904E8002502E600473300004E2A
      0C004E2A0C004E2A0C00BBBABC00FFFFFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00533518004E2A0C004E2A
      0C004E2A0C00472501004E2E030037153A003B163C003E23080046280B004E2A
      0C004E2A0C0050290D004C331100FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FFFFF800CAC9BB004E2A
      0C004E2A0C004E2A0C0047291000452305004F2D09004C2A0C004E2A0C004E2A
      0C004E2A0C00D4C3BA00FFFFF700FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00502A08004E27
      00004E2A0C004E2A0C004E2A0C004E2A0C004E2A0C004E2A0C004E2A0C004E2A
      0C0047240A00542A0700FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00502A
      0800C9C8BA004E2A0C004E2A0C004E2A0C004E2A0C004E2A0C004E2A0C00C9C1
      B40052290900FCFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FFFFF70056321A00BFC0BE00C7C9CA00BCBFC300BFBEC2003D1F0400F5EC
      E200FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://pokeapi.co/api/v2/pokemon/charmander'
    Params = <>
    SynchronizedEvents = False
    Left = 568
    Top = 232
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 568
    Top = 168
  end
  object RESTResponse1: TRESTResponse
    Left = 560
    Top = 304
  end
end