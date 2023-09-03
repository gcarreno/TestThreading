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
    actThreadSingle: TAction;
    alMain: TActionList;
    btnThreadSingle: TButton;
    actFileExit: TFileExit;
    gbThreadSingle: TGroupBox;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    mnuThread: TMenuItem;
    mnuThreadSingle: TMenuItem;
    mnuMain: TMainMenu;
    memLog: TMemo;
    sbMain: TStatusBar;
    stThreadSingle: TStaticText;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure DisplayHint(Sender: TObject);

    procedure actThreadSingleExecute(Sender: TObject);
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
  fThreadSingle.Start;
  actThreadSingle.Enabled:= False;
end;

end.

