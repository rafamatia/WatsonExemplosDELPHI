unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.IOUtils,
  REST.Authenticator.OAuth, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, System.JSON, Vcl.ExtCtrls, jpeg, Data.DB, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.OleCtrls,
  Vcl.Buttons;

const
  UrlVisual  = 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19';
  UrlFaces   = 'https://gateway.watsonplatform.net/visual-recognition/api/v3/detect_faces?version=2018-03-19';
  UrlExplicit= 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19&classifier_ids=explicit';
  UrlFood    = 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19&classifier_ids=food';

type
  TfrmWatsonSample = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    OAuth2Authenticator1: TOAuth2Authenticator;
    FileOpenDialog1: TFileOpenDialog;
    cdsResult: TClientDataSet;
    Panel1: TPanel;
    LabeledEdit1: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    cdsSexo: TClientDataSet;
    cdsSexoLabel: TStringField;
    cdsSexoValue: TStringField;
    cdsSexoRGB: TStringField;    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    procedure RestToDefaults;
    function RequestToken(ApiKey: String): String;
    procedure ProcessContent(JsonString: string);
    procedure GeraDataSetsDash;
    procedure GeraGraficoTipoSx;
    procedure GeraDashBoard;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWatsonSample: TfrmWatsonSample;

implementation

{$R *.dfm}

uses RestRequest, REST.Types, Recognize, Unit2, FacesUnit;

function BytesToStr(abytes: tbytes): string;
var
  abyte: byte;
begin
   for abyte in abytes do
   begin
      Result := result + IntToStr(abyte) + ',';
   end;
   Result := '[' + Copy(Result, 1, Length(Result) - 1) + ']';
end;

procedure TfrmWatsonSample.Button1Click(Sender: TObject);
begin
  if (FileOpenDialog1.Execute) then
  begin
    Label1.Caption := FileOpenDialog1.FileName;
    Image1.Picture.LoadFromFile(FileOpenDialog1.FileName);
  end;
end;

procedure TfrmWatsonSample.Button2Click(Sender: TObject);
var
  filePath: String;
  ABytes  : TBytes;
  token   : string;

begin

  token := RequestToken(LabeledEdit1.Text);

  RestToDefaults;
  RESTClient1.Authenticator := OAuth2Authenticator1;

  case RadioGroup1.ItemIndex of
     0:RestClient1.BaseURL := UrlVisual;
     1:RestClient1.BaseURL := UrlFaces;
     2:RestClient1.BaseURL := UrlExplicit;
     else
     RestClient1.BaseURL := UrlFood;
  end;


  OAuth2Authenticator1.AccessToken := token;

  filePath            := Label1.Caption;
  ABytes              := TFile.ReadAllBytes(filePath);
  RESTRequest1.Method := TRestRequestMethod.rmPOST;

  RESTRequest1.Params.AddItem('images_file',ABytes, pkGETorPOST, [poDoNotEncode], ctIMAGE_JPEG);
  RESTRequest1.Execute();
  ProcessContent(RESTResponse1.Content);
end;

procedure TfrmWatsonSample.GeraDashBoard;
begin
 
end;

procedure TfrmWatsonSample.GeraDataSetsDash;
var
  i : integer;
begin

  try
    cdsResult.DisableControls;
    cdsResult.First;

    for i:= 0 to cdsResult.recordcount-1 do
    begin

         if cdsSexo.Locate('label',cdsResult.FieldByName('gender').AsString,[]) then
         begin
           cdsSexo.Edit;
           cdsSexoValue.AsInteger := cdsSexoValue.AsInteger + 1;
         end
         else
         begin
           cdsSexo.Append;
           cdsSexoLabel.Value := cdsResult.FieldByName('gender').AsString;
           cdsSexoValue.Value := '1';
           case cdsResult.FieldByName('gender').AsString[1] of
               'M':cdsSexoRGB.Value   := '134, 134, 134';
               'F':cdsSexoRGB.Value   := '214, 222, 222';
           end;
         end;

       cdsSexo.Post;

       cdsResult.Next;
    end;

  finally
    cdsResult.EnableControls;
  end;

end;

procedure TfrmWatsonSample.GeraGraficoTipoSx;
begin
end;

procedure TfrmWatsonSample.ProcessContent(JsonString: string);
var
  jsonOBJ   : TRootClass;
  img       : TImagesClass;
  classifier: TClassifiersClass;
  classes   : TClassesClass;

  faces     : TRootFaceClass;
  imgFaces  : TImageFaceClass;
  face      : TFacesClass;

begin

  cdsResult.Close;
  cdsResult.FieldDefs.Clear;
  if (RadioGroup1.ItemIndex = 1) then
  begin
    cdsResult.FieldDefs.Add('gender', ftString, 30);
    cdsResult.FieldDefs.Add('score', ftFloat);
    cdsResult.FieldDefs.Add('min_age', ftFloat);
    cdsResult.FieldDefs.Add('max_age', ftFloat);
    cdsResult.FieldDefs.add('face_location_height', ftFloat);
    cdsResult.FieldDefs.add('face_location_left', ftFloat);
    cdsResult.FieldDefs.add('face_location_top', ftFloat);
    cdsResult.FieldDefs.add('face_location_width', ftFloat);
  end
  else
  begin
    cdsResult.FieldDefs.Add('class',ftString,100);
    cdsresult.FieldDefs.Add('score',ftFloat);
    cdsResult.FieldDefs.Add('type_hierarchy',ftString,100);
  end;
  cdsResult.CreateDataSet;

  if (RadioGroup1.ItemIndex = 1) then
  begin
    faces := TRootFaceClass.FromJsonString(JsonString);
    for imgFaces in faces.images do
    begin
      for face in imgFaces.faces do
      begin
        cdsResult.Append;
        cdsResult.FieldByName('gender').AsString := face.gender.gender;
        cdsResult.FieldByName('score').AsFloat := face.gender.score;
        cdsResult.FieldByname('min_age').AsFloat := face.age.min;
        cdsResult.FieldByName('max_age').AsFloat := face.age.max;
        cdsResult.FieldByName('face_location_height').AsFloat := face.face_location.height;
        cdsResult.FieldByName('face_location_left').AsFloat := face.face_location.left;
        cdsResult.FieldByName('face_location_top').AsFloat := face.face_location.top;
        cdsResult.FieldByName('face_location_width').AsFloat := face.face_location.width;
        cdsResult.Post;
      end;
    end;
  end
  else
  begin
    jsonOBJ := TRootClass.FromJsonString(JsonString);
    for img in jsonOBJ.images do
    begin
      for classifier in img.classifiers do
      begin
        for classes in classifier.classes do
        begin
          cdsResult.Append;
          cdsResult.FieldByName('class').AsString := classes.&class;
          cdsResult.FieldByName('score').AsFloat := classes.score;
          cdsResult.FieldByName('type_hierarchy').AsString := classes.type_hierarchy;
          cdsResult.Post;
        end;
      end;
    end;
  end;

  cdsResult.First;
  DataSource1.DataSet     := cdsResult;
  PageControl1.ActivePage := TabSheet2;
end;

function TfrmWatsonSample.RequestToken(ApiKey: String): String;
var
  strParams: string;
  objResult: TJSONObject;
begin
  strParams := 'grant_type=urn%3Aibm%3Aparams%3Aoauth%3Agrant-type%3Aapikey&response_type=cloud_iam&apikey=' + ApiKey;

  RestToDefaults;

  RESTClient1.BaseURL := 'https://iam.bluemix.net/identity/token';

  RESTRequest1.Method := TRestRequestMethod.rmPOST;
  RESTRequest1.AddAuthParameter('Authorization','Basic Yng6Yng=',TRESTRequestParameterKind.pkHTTPHEADER);
  RESTRequest1.Body.Add(strParams,TRESTContentType.ctAPPLICATION_X_WWW_FORM_URLENCODED);

  RESTRequest1.Execute();
  objResult := RESTResponse1.JSONValue as TJSONObject;

  result := objResult.Values['access_token'].value;

end;

procedure TfrmWatsonSample.RestToDefaults;
begin
  RESTRequest1.ResetToDefaults;
  RESTClient1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;

  RESTClient1.Authenticator := nil;
  RESTClient1.ContentType := 'application/x-www-form-urlencoded';

  RESTRequest1.Accept := 'application/json, text/json, application/xml, text/xml';
  RESTRequest1.AcceptCharset := '';
end;

procedure TfrmWatsonSample.SpeedButton7Click(Sender: TObject);
begin
  GeraDataSetsDash;
  GeraDashBoard;
end;

end.
