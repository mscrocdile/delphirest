unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,FireDAC.Comp.Client;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetDataset: TStream;
  end;
{$METHODINFO OFF}

implementation

uses System.StrUtils, XDM, FireDAC.Stan.Intf;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetDataset: TStream;
var ms: TMemorystream;
begin
  ms := TMemorystream.Create;
  XDM.DataModule1.FDMemTable1.SaveToStream(ms{,tfdstorageformat.sfJSON});
  result := ms;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
end.

