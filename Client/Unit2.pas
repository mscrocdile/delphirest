unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    FDMemTable1: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses ClientModuleUnit1;
{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
  FDMemTable1.LoadFromStream(ClientModuleUnit1.ClientModule1.ServerMethods1Client.GetDataset(){,tfdstorageformat.sfJSON});
  assert(FDMemTable1.Fields.Count > 0);
  Label1.Text := FDMemTable1.Fields[0].DisplayText;

//  if FDMemTable1.Fields[0].ReadOnly then
//    Label1.Text := 'OK'
//  else
//    Label1.Text := 'KO';
end;

end.
