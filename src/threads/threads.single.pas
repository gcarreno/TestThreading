unit Threads.Single;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
;

type
{ TThreadSingleShowStatusEvent }
  TThreadSingleShowStatusEvent = procedure(const AStatus: String) of Object;
{ TThreadSingle }
  TThreadSingle = class(TThread)
  private
    fStatusText : string;
    FOnShowStatus: TThreadSingleShowStatusEvent;

    procedure SynchronisedShowStatus;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended : boolean);

    property OnShowStatus: TThreadSingleShowStatusEvent
      read FOnShowStatus
      write FOnShowStatus;
  end;

implementation

{ TThreadSingle }

constructor TThreadSingle.Create(CreateSuspended: boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := True;
end;

procedure TThreadSingle.SynchronisedShowStatus;
begin
  if Assigned(FOnShowStatus) then
  begin
    FOnShowStatus(fStatusText);
  end;
end;

procedure TThreadSingle.Execute;
var
  index: Integer = 0;
begin
  fStatusText := 'TThreadSingle Starting...';
  Synchronize(@SynchronisedShowStatus);
  fStatusText := 'TThreadSingle Running...';
  Synchronize(@SynchronisedShowStatus);
  while (not Terminated) and (index < 9) do
  begin
    Inc(index);
    fStatusText:= Format('Running iteration #%d', [ index ]);
    Synchronize(@SynchronisedShowStatus);
    Sleep(500);
  end;
  fStatusText := 'TThreadSingle Exiting...';
  Synchronize(@SynchronisedShowStatus);
end;

end.

