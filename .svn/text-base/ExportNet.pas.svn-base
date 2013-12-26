unit ExportNet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, RzPrgres, ExtCtrls, Panel3D;

type
  TfrmExportNet = class(TForm)
    Panel3D1: TPanel3D;
    Label5: TLabel;
    pBar: TRzProgressBar;
    bitOK: TRzBitBtn;
    bitCancel: TRzBitBtn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bitCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportNet: TfrmExportNet;

const
  cImportNet=2 ;

implementation

uses DBPackage;

{$R *.dfm}

procedure TfrmExportNet.FormShow(Sender: TObject);
begin
  label1.Caption :='' ;
  label1.Visible :=false ;

end;

procedure TfrmExportNet.bitCancelClick(Sender: TObject);
begin
   close ;
end;

end.
