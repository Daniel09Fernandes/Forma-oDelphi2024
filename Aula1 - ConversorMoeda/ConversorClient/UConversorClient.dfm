object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Conversor Client'
  ClientHeight = 264
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 49
    Align = alTop
    Caption = 'Conversor Client'
    TabOrder = 0
    ExplicitWidth = 624
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 535
    Height = 104
    Align = alTop
    Alignment = taLeftJustify
    Caption = '  Converter Dolar para Real'
    TabOrder = 1
    VerticalAlignment = taAlignTop
    ExplicitTop = 43
    ExplicitWidth = 624
    object EdtResultReal: TEdit
      Left = 223
      Top = 32
      Width = 290
      Height = 41
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object EdtReal: TNumberBox
      Left = 40
      Top = 32
      Width = 121
      Height = 41
      Mode = nbmFloat
      TabOrder = 1
      OnKeyUp = EdtRealKeyUp
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 153
    Width = 535
    Height = 112
    Align = alTop
    Alignment = taLeftJustify
    Caption = '  Converter Real para Dolar'
    TabOrder = 2
    VerticalAlignment = taAlignTop
    ExplicitWidth = 624
    object EdtResultDolar: TEdit
      Left = 223
      Top = 32
      Width = 290
      Height = 41
      Enabled = False
      NumbersOnly = True
      TabOrder = 0
    end
    object EdtDolar: TNumberBox
      Left = 40
      Top = 32
      Width = 121
      Height = 41
      Mode = nbmFloat
      TabOrder = 1
      OnKeyUp = EdtDolarKeyUp
    end
  end
end
