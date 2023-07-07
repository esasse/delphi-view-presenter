unit MyPresenterTests;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks,
  MyViewIntf,
  MyPresenter;

type
  [TestFixture]
  TMyTestObject = class
  private
    FMockView: TMock<IMyView>;
    FSUT: TMyPresenter;
    procedure Test2(const AValue1, AValue2: Integer);
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure DisableSubmitWhenNoText;
    [Test]
    procedure EnableSubmitWhenNoText;
  end;

implementation

procedure TMyTestObject.EnableSubmitWhenNoText;
begin
  FMockView.Setup.Expect.Once.When.EnableSubmit;

  FSUT.Text := 'qq';

  FMockView.Verify;
end;

procedure TMyTestObject.Setup;
begin
  FMockView := TMock<IMyView>.Create;
  FSUT := TMyPresenter.Create(FMockView);
end;

procedure TMyTestObject.TearDown;
begin
  FSUT.Free;
end;

procedure TMyTestObject.DisableSubmitWhenNoText;
begin
  FMockView.Setup.Expect.Once.When.DisableSubmit;

  FSUT.Text := '';

  FMockView.Verify;
end;

procedure TMyTestObject.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
