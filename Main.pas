unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvSmoothButton, AdvOfficePager;

type
  TFrmMain = class(TForm)
    AdvOfficePager1: TAdvOfficePager;
    AdvOfficePager11: TAdvOfficePage;
    AdvOfficePager12: TAdvOfficePage;
    AdvOfficePager13: TAdvOfficePage;
    ButtonCustomer: TAdvSmoothButton;
    ButtonSupplier: TAdvSmoothButton;
    btnRegistrasiTransaksi: TAdvSmoothButton;
    procedure ButtonCustomerClick(Sender: TObject);
    procedure ButtonSupplierClick(Sender: TObject);
    procedure btnRegistrasiTransaksiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses MasterCustomer, MasterSupplier, RegistrasiPembelian;

procedure TFrmMain.btnRegistrasiTransaksiClick(Sender: TObject);
begin
  FrmRegistrasiPembelian.ShowModal;
end;

procedure TFrmMain.ButtonCustomerClick(Sender: TObject);
begin
  FrmMasterCustomer.ShowModal;
end;

procedure TFrmMain.ButtonSupplierClick(Sender: TObject);
begin
  FrmMasterSupplier.ShowModal;
end;

end.
