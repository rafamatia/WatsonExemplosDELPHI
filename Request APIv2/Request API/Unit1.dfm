object frmWatsonSample: TfrmWatsonSample
  Left = 0
  Top = 0
  Caption = 'IBM Watson by Rad Studio'
  ClientHeight = 625
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1161
    Height = 65
    Align = alTop
    Color = clWindowFrame
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 8
      Top = 23
      Width = 321
      Height = 21
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = 'API Key'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 352
      Top = 4
      Width = 354
      Height = 41
      Caption = 'Tipo da Pesquisa'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Visual'
        'Faces'
        'Explicit'
        'Food')
      ParentFont = False
      TabOrder = 1
    end
    object Button2: TButton
      Left = 752
      Top = 21
      Width = 171
      Height = 25
      Caption = 'Executar'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 1161
    Height = 560
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1159
      Height = 558
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Sele'#231#227'o'
        object Label1: TLabel
          Left = 8
          Top = 13
          Width = 137
          Height = 13
          Caption = 'Nenhum arquivo selecionado'
        end
        object Image1: TImage
          Left = 3
          Top = 96
          Width = 649
          Height = 409
        end
        object Button1: TButton
          Left = 3
          Top = 32
          Width = 137
          Height = 25
          Caption = 'Selecionar Imagem'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1151
          Height = 530
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
    end
  end
  object RESTClient1: TRESTClient
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    Left = 880
    Top = 336
  end
  object RESTRequest1: TRESTRequest
    Accept = 'application/json, text/json, application/xml, text/xml'
    Client = RESTClient1
    Method = rmPOST
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 880
    Top = 232
  end
  object RESTResponse1: TRESTResponse
    Left = 880
    Top = 280
  end
  object OAuth2Authenticator1: TOAuth2Authenticator
    ResponseType = rtTOKEN
    TokenType = ttBEARER
    Left = 880
    Top = 184
  end
  object FileOpenDialog1: TFileOpenDialog
    DefaultFolder = 
      'C:\Users\AS-MANOEL\Desktop\Palestras\2018 - Embarcadero Conferen' +
      'ce\Conte'#250'do\Fotos'
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'Images'
        FileMask = '*.jpg'
      end>
    Options = []
    Left = 880
    Top = 440
  end
  object cdsResult: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 880
    Top = 392
  end
  object DataSource1: TDataSource
    Left = 880
    Top = 560
  end
  object cdsSexo: TClientDataSet
    PersistDataPacket.Data = {
      660000009619E0BD0100000018000000030000000000030000006600054C6162
      656C0100490000000100055749445448020002003C000556616C756501004900
      00000100055749445448020002003C0003524742010049000000010005574944
      5448020002003C000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Label'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Value'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'RGB'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 781
    Top = 179
    object cdsSexoLabel: TStringField
      FieldName = 'Label'
      Size = 60
    end
    object cdsSexoValue: TStringField
      FieldName = 'Value'
      Size = 60
    end
    object cdsSexoRGB: TStringField
      FieldName = 'RGB'
      Size = 60
    end
  end
end
