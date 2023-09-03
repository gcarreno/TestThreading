unit Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, Forms
, Controls
, Graphics
, Dialogs, StdCtrls, ActnList, StdActns, Menus, ComCtrls
, Threads.Single
;

type

{ TfrmMain }
  TfrmMain = class(TForm)
    actThreadSingleMultipleInstances: TAction;
    actThreadSingle: TAction;
    alMain: TActionList;
    btnThreadSingle: TButton;
    actFileExit: TFileExit;
    btnThreadSingleMultipleInstances: TButton;
    gbThreadSingle: TGroupBox;
    gbSingleThreadMultipleInstances: TGroupBox;
    mnuThreadSingleMultipleInstances: TMenuItem;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    mnuThread: TMenuItem;
    mnuThreadSingle: TMenuItem;
    mnuMain: TMainMenu;
    memLog: TMemo;
    sbMain: TStatusBar;
    stThreadSingle: TStaticText;
    stThreadSingleMultipleInstances: TStaticText;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure DisplayHint(Sender: TObject);

    procedure actThreadSingleExecute(Sender: TObject);
    procedure actThreadSingleMultipleInstancesExecute(Sender: TObject);
  private
    fThreadSingle: TThreadSingle;

    procedure ThreadSingleShowStatus(const AStatus: String);
  public

  end;

var
  frmMain: TfrmMain;

implementation

const
  cVersion = '0.1';

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Caption with version
  Caption:= Format('Test Therading v%s', [ cVersion ]);

  // DisplayHint
  Application.OnHint:=@DisplayHint;

  // Thread Single
  fThreadSingle:= TThreadSingle.Create(True);
  fThreadSingle.OnShowStatus:= @ThreadSingleShowStatus;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  // Since he have set FreeOnTerminate to True, we cannot do this
  //fThreadSingle.Free;
end;

procedure TfrmMain.DisplayHint(Sender: TObject);
begin
  sbMain.SimpleText:= GetShortHint(Application.Hint);
end;

procedure TfrmMain.ThreadSingleShowStatus(const AStatus: String);
begin
  memLog.Append(AStatus);
end;

procedure TfrmMain.actThreadSingleExecute(Sender: TObject);
begin
  actThreadSingle.Enabled:= False;
  fThreadSingle.Start;
end;

procedure TfrmMain.actThreadSingleMultipleInstancesExecute(Sender: TObject);
var
  index: Integer;
  singleThreadArray: array [1..3] of TThreadSingle;
begin
  actThreadSingleMultipleInstances.Enabled:= False;
  for index:= 1 to 3 do
  begin
    singleThreadArray[index]:= TThreadSingle.Create(True);
    singleThreadArray[index].OnShowStatus:= @ThreadSingleShowStatus;
    singleThreadArray[index].Start;
  end;
end;

end.

