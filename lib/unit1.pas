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
  gol, jkerja, jlembur, gapok, glembur, tun_pengabdian: Integer;
  pajakgapok, pajaklembur, totpajak, gajibersih: Double;
begin
  // Mendapatkan input dari komponen-komponen form
  gol := cbJabatan.ItemIndex + 1; // Menggunakan index ComboBox
  jkerja := StrToIntDef(edtTotalGaji.Text, 0); // Menggunakan StrToIntDef untuk menghindari kesalahan

  // Hitung gaji berdasarkan jabatan yang dipilih
  case gol of
    1: // Direktur
    begin
      gapok := 5000000;
      tun_pengabdian := 0; // Tidak ada tunjangan pengabdian untuk Direktur
    end;
    2: // Manager
    begin
      gapok := 3000000;
      tun_pengabdian := 250000; // Tunjangan pengabdian untuk Manager
    end;
    3: // Karyawan
    begin
      gapok := 1000000;
      tun_pengabdian := 200000; // Tunjangan pengabdian untuk Karyawan
    end;
  end;

  if jkerja > 173 then
    jlembur := jkerja - 173
  else
    jlembur := 0;

  glembur := jlembur * 20000;
  pajakgapok := 0.05 * gapok;
  pajaklembur := 0.05 * glembur;
  totpajak := pajakgapok + pajaklembur;
  gajibersih := ((gapok + tun_pengabdian + glembur) - totpajak);

  // Tampilkan hasil perhitungan pada komponen-komponen form
  edtGapok.Text := FloatToStr(gapok);
  edtTunjangan.Text := FloatToStr(tun_pengabdian);
  edtTotalGaji.Text := FloatToStr(gajibersih); // Menampilkan gajibersih di edtTotalGaji
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

