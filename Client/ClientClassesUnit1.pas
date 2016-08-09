//
// Created by the DataSnap proxy generator.
// 09.08.2016 10:39:06
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetDatasetCommand: TDSRestCommand;
    FGetDatasetCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetDataset(const ARequestFilter: string = ''): TStream;
    function GetDataset_Cache(const ARequestFilter: string = ''): IDSRestCachedStream;
  end;

const
  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetDataset: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 33; TypeName: 'TStream')
  );

  TServerMethods1_GetDataset_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetDataset(const ARequestFilter: string): TStream;
begin
  if FGetDatasetCommand = nil then
  begin
    FGetDatasetCommand := FConnection.CreateCommand;
    FGetDatasetCommand.RequestType := 'GET';
    FGetDatasetCommand.Text := 'TServerMethods1.GetDataset';
    FGetDatasetCommand.Prepare(TServerMethods1_GetDataset);
  end;
  FGetDatasetCommand.Execute(ARequestFilter);
  Result := FGetDatasetCommand.Parameters[0].Value.GetStream(FInstanceOwner);
end;

function TServerMethods1Client.GetDataset_Cache(const ARequestFilter: string): IDSRestCachedStream;
begin
  if FGetDatasetCommand_Cache = nil then
  begin
    FGetDatasetCommand_Cache := FConnection.CreateCommand;
    FGetDatasetCommand_Cache.RequestType := 'GET';
    FGetDatasetCommand_Cache.Text := 'TServerMethods1.GetDataset';
    FGetDatasetCommand_Cache.Prepare(TServerMethods1_GetDataset_Cache);
  end;
  FGetDatasetCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedStream.Create(FGetDatasetCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetDatasetCommand.DisposeOf;
  FGetDatasetCommand_Cache.DisposeOf;
  inherited;
end;

end.

