unit MyPresenterTests;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  MyViewIntf,
  MyPresenter;

type
  [TestFixture]
  TMyPresenterTests = class
  private
    FMockView: TMock<IMyView>;
    FSUT: TMyPresenter;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure DisableSubmitWhenNoText;
    [Test]
    procedure EnableSubmitWhenTextPresent;
  end;

implementation

procedure TMyPresenterTests.Setup;
begin
  FMockView := TMock<IMyView>.Create;
  FSUT := TMyPresenter.Create(FMockView);
end;

procedure TMyPresenterTests.TearDown;
begin
  FSUT.Free;
end;

procedure TMyPresenterTests.DisableSubmitWhenNoText;
begin
  FMockView.Setup.Expect.Once.When.DisableSubmit;

  FSUT.Text := '';

  FMockView.Verify;
end;

procedure TMyPresenterTests.EnableSubmitWhenTextPresent;
begin
  FMockView.Setup.Expect.Once.When.EnableSubmit;

  FSUT.Text := 'qq';

  FMockView.Verify;
end;

initialization
  TDUnitX.RegisterTestFixture(TMyPresenterTests);

end.
