object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 595
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 69
    Width = 137
    Height = 13
    Caption = 'Nenhum arquivo selecionado'
  end
  object Image1: TImage
    Left = 8
    Top = 119
    Width = 674
    Height = 457
    Stretch = True
  end
  object Button2: TButton
    Left = 688
    Top = 551
    Width = 75
    Height = 25
    Caption = 'POST'
    TabOrder = 0
    OnClick = Button2Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 28
    Width = 305
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = 'API Key'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 88
    Width = 137
    Height = 25
    Caption = 'Selecionar Imagem'
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 328
    Top = 8
    Width = 354
    Height = 41
    Caption = 'Tipo da Pesquisa'
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Visual'
      'Faces'
      'Explicit'
      'Food')
    TabOrder = 3
  end
  object RESTClient1: TRESTClient
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    Left = 736
    Top = 192
  end
  object RESTRequest1: TRESTRequest
    Accept = 'application/json, text/json, application/xml, text/xml'
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 728
    Top = 80
  end
  object RESTResponse1: TRESTResponse
    Left = 736
    Top = 136
  end
  object OAuth2Authenticator1: TOAuth2Authenticator
    ResponseType = rtTOKEN
    TokenType = ttBEARER
    Left = 728
    Top = 24
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Images'
        FileMask = '*.jpg'
      end>
    Options = []
    Left = 736
    Top = 296
  end
  object cdsResult: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 248
  end
end
