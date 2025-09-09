unit Tanya;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, RxCtrls;

type
  TFrmTanya = class(TForm)
    LblAsk: TRxLabel;
    ButtonGanti: TSpeedButton;
    ButtonTambah: TSpeedButton;
    ButtonBatal: TSpeedButton;
    ButtonBaru: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonGantiClick(Sender: TObject);
    procedure ButtonTambahClick(Sender: TObject);
    procedure ButtonBaruClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTanya: TFrmTanya;
  Answer : String;

implementation

{$R *.dfm}

procedure TFrmTanya.ButtonBaruClick(Sender: TObject);
begin
    Answer:='Baru';
    Close;
end;

procedure TFrmTanya.ButtonGantiClick(Sender: TObject);
begin
    Answer:='Ganti';
    Close;
end;

procedure TFrmTanya.ButtonTambahClick(Sender: TObject);
begin
    Answer:='Tambah';
    Close;
end;

procedure TFrmTanya.FormShow(Sender: TObject);
begin
    Answer := 'Batal';
end;

end.
