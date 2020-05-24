unit Recognize;

{*******************************************************************************
    Generated By   : JsonToDelphiClass - 0.65 
    Project link   : https://github.com/PKGeorgiev/Delphi-JsonToDelphiClass
    Generated On   : 2018-10-19 05:50:35

    Created By     : Petar Georgiev - (http://pgeorgiev.com) 
    Adapted Web By : Marlon Nardi - (http://jsontodelphi.com)
*******************************************************************************}

interface

uses Generics.Collections, Rest.Json;

type

TClassesClass = class
private
  FClass: String;
  FScore: Extended;
  FType_hierarchy: String;
public
  property &class: String read FClass write FClass;
  property score: Extended read FScore write FScore;
  property type_hierarchy: String read FType_hierarchy write FType_hierarchy;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TClassesClass;
end;

TClassifiersClass = class
private
  FClasses: TArray<TClassesClass>;
  FClassifier_id: String;
  FName: String;
public
  property classes: TArray<TClassesClass> read FClasses write FClasses;
  property classifier_id: String read FClassifier_id write FClassifier_id;
  property name: String read FName write FName;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TClassifiersClass;
end;

TImagesClass = class
private
  FClassifiers: TArray<TClassifiersClass>;
public
  property classifiers: TArray<TClassifiersClass> read FClassifiers write FClassifiers;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TImagesClass;
end;

TRootClass = class
private
  FCustom_classes: Extended;
  FImages: TArray<TImagesClass>;
  FImages_processed: Extended;
public
  property custom_classes: Extended read FCustom_classes write FCustom_classes;
  property images: TArray<TImagesClass> read FImages write FImages;
  property images_processed: Extended read FImages_processed write FImages_processed;
  destructor Destroy; override;
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TRootClass;
end;

implementation

{TClassesClass}


function TClassesClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TClassesClass.FromJsonString(AJsonString: string): TClassesClass;
begin
  result := TJson.JsonToObject<TClassesClass>(AJsonString)
end;

{TClassifiersClass}

destructor TClassifiersClass.Destroy;
var
  LclassesItem: TClassesClass;
begin

 for LclassesItem in FClasses do
   LclassesItem.Free;

  inherited;
end;

function TClassifiersClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TClassifiersClass.FromJsonString(AJsonString: string): TClassifiersClass;
begin
  result := TJson.JsonToObject<TClassifiersClass>(AJsonString)
end;

{TImagesClass}

destructor TImagesClass.Destroy;
var
  LclassifiersItem: TClassifiersClass;
begin

 for LclassifiersItem in FClassifiers do
   LclassifiersItem.Free;

  inherited;
end;

function TImagesClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TImagesClass.FromJsonString(AJsonString: string): TImagesClass;
begin
  result := TJson.JsonToObject<TImagesClass>(AJsonString)
end;

{TRootClass}

destructor TRootClass.Destroy;
var
  LimagesItem: TImagesClass;
begin

 for LimagesItem in FImages do
   LimagesItem.Free;

  inherited;
end;

function TRootClass.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TRootClass.FromJsonString(AJsonString: string): TRootClass;
begin
  result := TJson.JsonToObject<TRootClass>(AJsonString)
end;

end.
