unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { TbtnUbah }

  TbtnUbah = class(TForm)
    Button1: TButton;
    btnExit: TButton;
    edtEditCaption: TEdit;
    lblUbahCaption: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  btnUbah: TbtnUbah;

implementation

{$R *.lfm}

{ TbtnUbah }

procedure TbtnUbah.Label2Click(Sender: TObject);
begin
  caption:=edtEditCaption.Text;
end;

procedure TbtnUbah.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.

