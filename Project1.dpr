program Project1;

uses
  Vcl.Forms,
  MyViewForm in 'MyViewForm.pas' {Form1},
  MyPresenter in 'MyPresenter.pas',
  MyViewIntf in 'MyViewIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
