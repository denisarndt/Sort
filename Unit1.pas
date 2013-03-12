unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Memo2: TMemo;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Sort(A: array of Integer);
    procedure Button3Click(Sender: TObject);
    procedure QuickSort(var A: array of Integer; iLo, iHi: Integer) ;
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  buffer,bufferOut: array of integer;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  a: Integer;
begin
memo1.Clear;
setlength(buffer,spinedit1.Value);
setlength(bufferOut,spinedit1.Value);
for a := 0 to length(buffer)-1 do
  begin
  randomize;
  buffer[a]:=random(5000000);
  bufferOut[a]:=0;
  memo1.Lines.Add(inttostr(buffer[a]));
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  a: Integer;
  indMaior, indBO: integer;
  timeinit:integer;
begin
memo2.Clear;
indMaior:=0;
indBO:=length(buffer)-1;
timeinit:=gettickcount;
while indBO>=0 do
begin
  for a := 0 to length(buffer)-1 do
    begin
    if buffer[a]>=buffer[indMaior] then
      begin
      bufferOut[indBO]:=buffer[a];
      indMaior:=a;
      end;
    end;
  buffer[indMaior]:=0;
  dec(indBO);
  indMaior:=0;
end;
buffer[indMaior]:=0;
edit1.Text:=inttostr(Gettickcount-timeInit) + ' ms';
for a := 0 to length(bufferOut)-1 do memo2.Lines.Add(inttostr(bufferOut[a]));

end;



procedure TForm1.Button3Click(Sender: TObject);
begin
sort(buffer);
end;

procedure TForm1.Button4Click(Sender: TObject);
var b:integer;
begin
Quicksort(buffer,low(buffer),high(buffer));
for b := 0 to length(buffer)-1 do memo2.Lines.Add(inttostr(buffer[b]));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Clear;
memo2.Clear;
end;

procedure Tform1.Sort(A: array of Integer);
var
  I, J, T, b, timeinit: Integer;
begin
memo2.Clear;
timeinit:=gettickcount;
  for I := High(A) downto Low(A) do
    for J := Low(A) to High(A) - 1 do
      if A[J] > A[J + 1] then
      begin
        T := A[J];
        A[J] := A[J + 1];
        A[J + 1] := T;
      end;
edit1.Text:=inttostr(Gettickcount-timeInit) + ' ms';
for b := 0 to length(A)-1 do memo2.Lines.Add(inttostr(A[b]));
end;


procedure tform1.QuickSort(var A: array of Integer; iLo, iHi: Integer) ;
 var
  timeinit, b, Lo, Hi, Pivot, T: Integer;
 begin
 memo2.Clear;
  timeinit:=gettickcount;
   Lo := iLo;
   Hi := iHi;
   Pivot := A[(Lo + Hi) div 2];
   repeat
     while A[Lo] < Pivot do Inc(Lo) ;
     while A[Hi] > Pivot do Dec(Hi) ;
     if Lo <= Hi then
     begin
       T := A[Lo];
       A[Lo] := A[Hi];
       A[Hi] := T;
       Inc(Lo) ;
       Dec(Hi) ;
     end;
   until Lo > Hi;
   if Hi > iLo then QuickSort(A, iLo, Hi) ;
   if Lo < iHi then QuickSort(A, Lo, iHi) ;
edit1.Text:=inttostr(Gettickcount-timeInit) + ' ms';
end;


end.
