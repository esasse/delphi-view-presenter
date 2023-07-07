unit MyPresenter;

interface

uses
  MyViewIntf;

type
  TMyPresenter = class
  private
    FText: string;
    FView: IMyView;
    procedure SetText(const Value: string);
    procedure UpdateView;
  public
    property Text: string read FText write SetText;
    constructor Create(const View: IMyView);
  end;

implementation

constructor TMyPresenter.Create(const View: IMyView);
begin
  FView := View;
end;

procedure TMyPresenter.SetText(const Value: string);
begin
  FText := Value;
  UpdateView;
end;

procedure TMyPresenter.UpdateView;
begin
  if FText = '' then
    FView.DisableSubmit
  else
    FView.EnableSubmit;
end;

end.
