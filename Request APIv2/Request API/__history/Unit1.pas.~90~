unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.IOUtils,
  REST.Authenticator.OAuth, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, System.JSON, Vcl.ExtCtrls, jpeg, Data.DB, Datasnap.DBClient;

const
  UrlVisual  = 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19';
  UrlFaces   = 'https://gateway.watsonplatform.net/visual-recognition/api/v3/detect_faces?version=2018-03-19';
  UrlExplicit= 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19&classifier_ids=explicit';
  UrlFood    = 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19&classifier_ids=food';

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button2: TButton;
    OAuth2Authenticator1: TOAuth2Authenticator;
    LabeledEdit1: TLabeledEdit;
    FileOpenDialog1: TFileOpenDialog;
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    cdsResult: TClientDataSet;

    RadioGroup1: TRadioGroup;    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure RestToDefaults;
    function RequestToken(ApiKey: String): String;
    procedure ProcessContent(JsonString: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (FileOpenDialog1.Execute) then
  begin
    Label1.Caption := FileOpenDialog1.FileName;
    Image1.Picture.LoadFromFile(FileOpenDialog1.FileName);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  filePath: String;
  ABytes: TBytes;
  token: string;

begin

  token := RequestToken(LabeledEdit1.Text);

  RestToDefaults;
  RESTClient1.Authenticator := OAuth2Authenticator1;
  if (RadioGroup1.ItemIndex = 0) then
    RestClient1.BaseURL := UrlVisual
  else if (RadioGroup1.ItemIndex = 1) then
    RestClient1.BaseURL := UrlFaces
  else if (RadioGroup1.ItemIndex = 2) then
    RestClient1.BaseURL := UrlExplicit
  else
    RestClient1.BaseURL := UrlFood;

  OAuth2Authenticator1.AccessToken := token;

  filePath := Label1.Caption; //'E:\Exemplos\Request API\Win32\Debug\F02.jpg';
  ABytes := TFile.ReadAllBytes(filePath);
  RESTRequest1.Method := TRestRequestMethod.rmPOST;

  RESTRequest1.Params.AddItem('images_file',ABytes, pkGETorPOST, [poDoNotEncode], ctIMAGE_JPEG);
//  if (RadioGroup1.ItemIndex = 2) then
//    RESTRequest1.Params.AddItem('classifier_ids','explicit', pkGETorPOST, [poDoNotEncode], ctTEXT_PLAIN);
  RESTRequest1.Execute();
  ProcessContent(RESTResponse1.Content);
end;

procedure TForm1.ProcessContent(JsonString: string);
var
  jsonOBJ: TRootClass;
  img: TImagesClass;
  classifier: TClassifiersClass;
  classes: TClassesClass;

  faces: TRootFaceClass;
  imgFaces: TImageFaceClass;
  face: TFacesClass;

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
  Form2 := TForm2.Create(self);
  Form2.DataSource1.DataSet := cdsResult;
  Form2.ShowModal;
  FreeAndNil(Form2);
end;

function TForm1.RequestToken(ApiKey: String): String;
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

procedure TForm1.RestToDefaults;
begin
  RESTRequest1.ResetToDefaults;
  RESTClient1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;

  RESTClient1.Authenticator := nil;
  RESTClient1.ContentType := 'application/x-www-form-urlencoded';

  RESTRequest1.Accept := 'application/json, text/json, application/xml, text/xml';
  RESTRequest1.AcceptCharset := '';
end;

end.
