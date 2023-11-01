unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type
  { TForm1 }
  TForm1 = class(TForm)
    btnGaji: TButton;
    cbJabatan: TComboBox;
    edtTotalGaji: TEdit;
    edtTunjangan: TEdit;
    edtNama: TEdit;
    edtGapok: TEdit;
    Label1: TLabel;
    lblGajiBersih: TLabel;
    lblPengguna: TLabel;
    lblJabatan: TLabel;
    lblGaji: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    rgStatus: TRadioGroup;
    procedure btnGajiClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnGajiClick(Sender: TObject);
var
  gajiPokok, tunjangan, totalGaji: Double;
  jabatan: string;
  status: string;
begin
  // Mendapatkan jabatan dari ComboBox
  jabatan := cbJabatan.Text;

  if jabatan = '' then
  begin
    ShowMessage('Pilih jabatan terlebih dahulu');
    Exit;
  end;

  // Menghitung gaji pokok berdasarkan jabatan
  if jabatan = 'Direktur=5000000' then
    gajiPokok := 5000000
  else if jabatan = 'Manager=3000000' then
    gajiPokok := 3000000
  else if jabatan = 'Karyawan=1000000' then
    gajiPokok := 1000000
  else
  begin
    ShowMessage('Pilih jabatan yang valid');
    Exit;
  end;

  // Mengambil status dari RadioGroup
  status := rgStatus.Items[rgStatus.ItemIndex];

  // Menghitung tunjangan berdasarkan status kepegawaian
  if status = 'Tetap' then
    tunjangan := 1500000 // pegawai tetap
  else if status = 'Honorer' then
    tunjangan := 500000  // pegawai honorer
  else
  begin
    ShowMessage('Pilih status kepegawaian terlebih dahulu');
    Exit;
  end;

  // Menghitung total gaji
  totalGaji := gajiPokok + tunjangan;
  edtTotalGaji.Text := FloatToStr(totalGaji);
end;

procedure TForm1.cbJabatanChange(Sender: TObject);
var
  gaji: Double;
begin
  case cbJabatan.ItemIndex of
    0: gaji := 5000000;  // Jabatan: Direktur
    1: gaji := 3000000;  // Jabatan: Manager
    2: gaji := 1000000;  // Jabatan: Karyawan
  end;

  // Tampilkan gaji pokok ke dalam komponen edtGapok
  edtGapok.Text := FloatToStr(gaji);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  // Nonaktifkan input gaji pokok (edtGapok) jika jabatan sudah dipilih
  edtGapok.Enabled := (cbJabatan.Text = '');
  edtGapok.Text := '';  // Menghapus input gaji pokok jika ComboBox dipilih
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

