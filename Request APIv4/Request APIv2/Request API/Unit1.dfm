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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1161
    Height = 625
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Visual Recognation'
      object Panel2: TPanel
        Left = 0
        Top = 65
        Width = 1153
        Height = 532
        Align = alClient
        TabOrder = 0
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 1151
          Height = 530
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 0
          object TabSheet3: TTabSheet
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
              Left = 8
              Top = 32
              Width = 137
              Height = 25
              Caption = 'Selecionar Imagem'
              TabOrder = 0
              OnClick = Button1Click
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Resultado'
            ImageIndex = 1
            object DBGrid1: TDBGrid
              Left = 0
              Top = 0
              Width = 1143
              Height = 502
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1153
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
        TabOrder = 1
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
          Top = 5
          Width = 401
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
          Left = 799
          Top = 21
          Width = 171
          Height = 25
          Caption = 'Executar'
          TabOrder = 2
          OnClick = Button2Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Tone'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 65
        Width = 1153
        Height = 532
        Align = alClient
        TabOrder = 0
        object PageControl3: TPageControl
          Left = 1
          Top = 1
          Width = 1151
          Height = 530
          ActivePage = TabSheet6
          Align = alClient
          TabOrder = 0
          object TabSheet6: TTabSheet
            Caption = 'Sele'#231#227'o'
            object Memo1: TMemo
              Left = 0
              Top = 0
              Width = 1143
              Height = 502
              Align = alClient
              Lines.Strings = (
                
                  'Team, I know that times are tough! Product sales have been disap' +
                  'pointing for the past three quarters. We have a competitive prod' +
                  'uct, but we need to do a better job of selling it!')
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Resultado'
            ImageIndex = 1
            object DBGrid2: TDBGrid
              Left = 0
              Top = 0
              Width = 1143
              Height = 137
              Align = alTop
              DataSource = dsToneMaster
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'tone'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'score'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'tone_id'
                  Visible = True
                end>
            end
            object DBGrid3: TDBGrid
              Left = 0
              Top = 137
              Width = 1143
              Height = 265
              Align = alClient
              DataSource = dsSequences
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'sequence_id'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'text'
                  Width = 726
                  Visible = True
                end>
            end
            object DBGrid4: TDBGrid
              Left = 0
              Top = 402
              Width = 1143
              Height = 100
              Align = alBottom
              DataSource = dsSequencetone
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'tone_name'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'score'
                  Visible = True
                end>
            end
          end
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1153
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
        TabOrder = 1
        object LabeledEdit2: TLabeledEdit
          Left = 8
          Top = 23
          Width = 233
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = 'Username'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '39b8a1df-8eee-4df8-9ee7-fb9c4448c68f'
        end
        object Button4: TButton
          Left = 503
          Top = 21
          Width = 171
          Height = 25
          Caption = 'Executar'
          TabOrder = 1
          OnClick = Button4Click
        end
        object LabeledEdit3: TLabeledEdit
          Left = 247
          Top = 23
          Width = 233
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Password'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'ud3kzuio5Lmq'
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
  object cdsToneMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 224
    object cdsToneMastertone: TStringField
      FieldName = 'tone'
      Size = 50
    end
    object cdsToneMasterscore: TFloatField
      FieldName = 'score'
    end
    object cdsToneMastertone_id: TStringField
      FieldName = 'tone_id'
      Size = 50
    end
  end
  object dsToneMaster: TDataSource
    DataSet = cdsToneMaster
    Left = 136
    Top = 288
  end
  object cdsSentences: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 224
    object cdsSentencestext: TStringField
      FieldName = 'text'
      Size = 1000
    end
    object cdsSentencessequence_id: TFloatField
      FieldName = 'sequence_id'
    end
  end
  object dsSequences: TDataSource
    DataSet = cdsSentences
    Left = 224
    Top = 288
  end
  object cdsSequenceTone: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'sequence_id'
    MasterFields = 'sequence_id'
    MasterSource = dsSequences
    PacketRecords = 0
    Params = <>
    Left = 312
    Top = 224
    object cdsSequenceTonetone_name: TStringField
      FieldName = 'tone_name'
      Size = 50
    end
    object cdsSequenceTonescore: TFloatField
      FieldName = 'score'
    end
    object cdsSequenceTonesequence_id: TFloatField
      FieldName = 'sequence_id'
    end
  end
  object dsSequencetone: TDataSource
    DataSet = cdsSequenceTone
    Left = 312
    Top = 288
  end
end
