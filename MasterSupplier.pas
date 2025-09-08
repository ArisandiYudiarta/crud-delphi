unit MasterSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, vcl.wwdbigrd, vcl.wwdbgrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.Menus;

type
  TFrmMasterSupplier = class(TForm)
    DBGridSupplier: TwwDBGrid;
    GroupBoxEntry: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditKodeSupp: TDBEdit;
    EditNamaSupp: TDBEdit;
    EditAlamat: TDBEdit;
    EditTelp: TDBEdit;
    EditFax: TDBEdit;
    Panel1: TPanel;
    ButtonEntry: TBitBtn;
    ButtonEdit: TBitBtn;
    ButtonDelete: TBitBtn;
    ButtonSave: TBitBtn;
    ButtonCancel: TBitBtn;
    ButtonClose: TBitBtn;
    SupplierDataSource: TDataSource;
    TableQuerySupplier: TFDQuery;
    FDUpdateSQLSupplier: TFDUpdateSQL;
    PopupMenu1: TPopupMenu;
    Label7: TLabel;
    EditKota: TDBEdit;
    EditContactPerson: TDBEdit;
    EditKredit: TDBEdit;
    EditBufferStock: TDBEdit;
    EditKeterangan: TDBEdit;
    EditRekening: TDBEdit;
    EditNamaBank: TDBEdit;
    EditJenisPkp: TDBEdit;
    EditNpwp: TDBEdit;
    EditNppkp: TDBEdit;
    EditNamaPerusahaan: TDBEdit;
    EditAlamatPerusahaan: TDBEdit;
    t1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormReadOnly(Cond: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonEnabled(Cond: Boolean);
    procedure ButtonEntryClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMasterSupplier: TFrmMasterSupplier;

implementation

 uses DataModule, Main;
{$R *.dfm}

procedure TFrmMasterSupplier.FormReadOnly(Cond: Boolean);
begin
    GroupBoxEntry.Enabled:=Not Cond;
    DBGridSupplier.Enabled:=Cond;
//    ComboboxCariKode.Enabled:=Cond;
end;

procedure TFrmMasterSupplier.FormShow(Sender: TObject);
begin
    FormReadOnly(True);
    ButtonEnabled(True);
    TableQuerySupplier.Open;
    TableQuerySupplier.Last;
    TableQuerySupplier.First;
    ButtonEntry.SetFocus;
end;

procedure TFrmMasterSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if DM.FDConnection.InTransaction then DM.FDConnection.Rollback;
    TableQuerySupplier.Close;

end;

procedure TFrmMasterSupplier.ButtonCancelClick(Sender: TObject);
begin
    TableQuerySupplier.Cancel;
    TableQuerySupplier.CancelUpdates;
    DM.FDConnection.Rollback;
    ButtonEnabled(True);
    FormReadonly(True);
end;

procedure TFrmMasterSupplier.ButtonDeleteClick(Sender: TObject);
begin
    if messagedlg('Hapus Data Customer Ini?', mtconfirmation, [mbyes, mbno], 0) = mryes then
    begin
      TableQuerySupplier.Delete;
    end;

end;

procedure TFrmMasterSupplier.ButtonEditClick(Sender: TObject);
begin
    FormReadOnly(False);
    ButtonEnabled(False);
    TableQuerySupplier.Edit;
    EditKodeSupp.ReadOnly:=True;
    EditNamaSupp.SetFocus;
end;

procedure TFrmMasterSupplier.ButtonEnabled(Cond: Boolean);
begin
    ButtonEntry.Enabled:=Cond;
    ButtonEdit.Enabled:=Cond;
    ButtonDelete.Enabled:=Cond;
    ButtonSave.Enabled:=Not Cond;
    ButtonCancel.Enabled:=Not Cond;
end;

procedure TFrmMasterSupplier.ButtonEntryClick(Sender: TObject);
begin
    FormReadOnly(False);
    ButtonEnabled(False);
    TableQuerySupplier.Append;
    EditKodeSupp.ReadOnly:=False;
    EditKodeSupp.SetFocus;
end;

procedure TFrmMasterSupplier.ButtonSaveClick(Sender: TObject);
begin
    TableQuerySupplier.Post;
    DM.FDConnection.StartTransaction;
    TableQuerySupplier.ApplyUpdates;
    TableQuerySupplier.CommitUpdates;
    DM.FDConnection.Commit;
    ButtonEnabled(True);
    FormReadOnly(True);
end;

end.
