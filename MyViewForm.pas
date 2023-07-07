unit MyViewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  MyViewIntf, MyPresenter;

type
  TForm1 = class(TForm, IMyView)
    Button1: TButton;
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPresenter: TMyPresenter;
  public
    procedure EnableSubmit;
    procedure DisableSubmit;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FPresenter.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPresenter := TMyPresenter.Create(Self);
end;

{ TForm1 }

procedure TForm1.DisableSubmit;
begin
  Button1.Enabled := False;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  FPresenter.Text := Edit1.Text;
end;

procedure TForm1.EnableSubmit;
begin
  Button1.Enabled := True;
end;

end.
