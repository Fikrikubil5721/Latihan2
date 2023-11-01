unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { TfrmUtama }

  TfrmUtama = class(TForm)
    btnClose: TButton;
    btnKlikAku: TButton;
    btnUbahCaption: TButton;
    edtCaption: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure btnKlikAkuClick(Sender: TObject);
    procedure btnUbahCaptionClick(Sender: TObject);
  private

  public

  end;

var
  frmUtama: TfrmUtama;

implementation

{$R *.lfm}

{ TfrmUtama }

procedure TfrmUtama.btnKlikAkuClick(Sender: TObject);
begin
  ShowMessage('Hellow');
end;

procedure TfrmUtama.btnUbahCaptionClick(Sender: TObject);
begin
  frmUtama.Caption:=edtCaption.Text;
end;

procedure TfrmUtama.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

