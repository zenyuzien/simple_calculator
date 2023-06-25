unit calci;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn7: TButton;
    btn4: TButton;
    btn2: TButton;
    btn5: TButton;
    btn8: TButton;
    btn3: TButton;
    btn9: TButton;
    btn6: TButton;
    Btnplus: TButton;
    btn0: TButton;
    btnminus: TButton;
    btnmultiply: TButton;
    btndot: TButton;
    btnequall: TButton;
    btndivide: TButton;
    btnback: TButton;
    btnc: TButton;
    Label1: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn0Click(Sender: TObject);
    procedure btncClick(Sender: TObject);
    procedure btnbackClick(Sender: TObject);
    procedure btndotClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnplusClick(Sender: TObject);
    procedure btnminusClick(Sender: TObject);
    procedure btnmultiplyClick(Sender: TObject);
    procedure btndivideClick(Sender: TObject);
    procedure btnequallClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  op1 : double ;
  op2 : double ;

  op: char;

  op1dot : bool ;
  op2dot : bool ;

  opactive : bool ;

implementation

{$R *.dfm}

procedure TForm1.btn0Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '0';
    end
  else if (label1.Caption[length(label1.caption)] in ['/','*','-','+']  ) then
    begin
       ;
    end
  else
  begin
       label1.Caption := label1.Caption + '0';
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);

begin
  if label1.Caption='0' then
    begin
      label1.Caption := '1';
    end
  else
  begin
       label1.Caption := label1.Caption + '1';
  end;

end;

procedure TForm1.btn2Click(Sender: TObject);

begin
  if label1.Caption='0' then
    begin
      label1.Caption := '2';
    end
  else
  begin
       label1.Caption := label1.Caption + '2';
  end;

end;

procedure TForm1.btn3Click(Sender: TObject);
begin
      if label1.Caption='0' then
    begin
      label1.Caption := '3';
    end
  else
  begin
       label1.Caption := label1.Caption + '3';
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '4';
    end
  else
  begin
       label1.Caption := label1.Caption + '4';
  end;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '5';
    end
  else
  begin
       label1.Caption := label1.Caption + '5';
  end;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '6';
    end
  else
  begin
       label1.Caption := label1.Caption + '6';
  end;
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '7';
    end
  else
  begin
       label1.Caption := label1.Caption + '7';
  end;
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '8';
    end
  else
  begin
       label1.Caption := label1.Caption + '8';
  end;
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
if label1.Caption='0' then
    begin
      label1.Caption := '9';
    end
  else
  begin
       label1.Caption := label1.Caption + '9';
  end;
end;

procedure TForm1.btnbackClick(Sender: TObject);
var mystr : string;
    i: shortint;
begin

  if length(label1.Caption)<=1 then
    begin
      label1.Caption := '0' ;
    end
  else
    begin
//    Delete(label1.Caption,
//    (length(label1.Caption)-1) ,
//    1)  ;
// why is this not working ?

      if (opactive) then
        begin
           if (label1.Caption[length(label1.caption)] = '.' ) then
            begin
                 op2dot := false;
            end
           else if (label1.Caption[length(label1.caption)] in ['*','-','/','+'] )then
             begin
                opactive := false ;
           end;
      end
      else if (label1.Caption[length(label1.caption)] = '.' ) then
        begin
          op1dot := false ;
        end;

      mystr := '' ;
      for i := 1 to (length(label1.caption) - 1 ) do
        begin
          mystr := mystr + label1.caption[i] ;
        end;
      label1.Caption := mystr ;
    end;
end;

procedure TForm1.btncClick(Sender: TObject);
begin
label1.Caption := '0';
opactive := false ;
op1dot := false;
op2dot := false;
end;

function okdot(mystr: string): bool ;
begin
 // showmessage('op1dot: '+booltostr(op1dot)+' op2dot: '+booltostr(op2dot) + 'opactive: '+ booltostr(opactive));
  if ( (opactive= false) and (op1dot = false) ) then
     begin
       op1dot := true ;
       okdot := true ;
     end
  else if ( (opactive = true) and (op2dot = false)  ) then
    begin
       op2dot := true;
       okdot := true ;
    end

  else
    begin
      showmessage('Number can not have more than one decimal point');
      okdot := false;
    end;
end;

procedure TForm1.btndivideClick(Sender: TObject);
begin
  if (opactive ) then
    begin
      showmessage('please perform one arithmetic operation at a time')
    end else if ( label1.Caption[length(label1.caption)]='.' ) then
  begin
      showmessage('enter a number after decimal point')
  end
  else
    begin
      opactive := true ;
      op := '/' ;
      op1 := strtofloat(label1.caption);
      label1.Caption := label1.Caption + '/' ;
    end;

end;

procedure TForm1.btndotClick(Sender: TObject);
begin

  if (label1.Caption[length(label1.caption)] in ['+','-','*','/'] ) then
  begin
          showmessage('enter a number after operator before adding decimal');
  end
  else
  if(okdot(label1.caption)) then
  begin
    label1.Caption := label1.Caption + '.' ;
  end;
end;

procedure TForm1.btnequallClick(Sender: TObject);
var i: shortint ;
  mystr: string;
  myfile:textfile;
begin
  i:=1;
  while ((label1.Caption[i] in ['-','/','*','+']) = false) do
  begin
     i:= i + 1;
  end;
  i:=i+1;
  mystr := '' ;
  for i:= i to length(label1.caption) do
    begin
      mystr := mystr + label1.Caption[i] ;
    end;
  op2 := strtofloat(mystr);
  //showmessage(  'op1: ' + floattostr(op1) + ' op2: '+ floattostr(op2) + ' op: ' + op)  ;
  case op of
  '+':    label1.Caption := floattostr(op1 + op2 );
  '-':    label1.Caption := floattostr(op1 - op2) ;
  '/':    label1.Caption := floattostr(op1 / op2) ;
  '*':   label1.Caption := floattostr(op1 * op2) ;
  end;

  opactive := false ;
  op2dot := false ;
  op1dot := false ;
  for i := 1 to length(label1.caption)  do
    begin
      if label1.Caption[i] = '.' then
      begin
      op1dot := true ;
      break;
      end;
    end;

    assignfile(myfile, 'history.txt');
    while not Eof(myFile) do
    begin
      ReadLn(myFile, text);
      ShowMessage(text);
    end;

  // Close the file for the last time
  CloseFile(myFile);



end;

procedure TForm1.btnminusClick(Sender: TObject);
begin
  if (opactive ) then
    begin
      showmessage('please perform one arithmetic operation at a time')
    end   else if ( label1.Caption[length(label1.caption)]='.' ) then
  begin
      showmessage('enter a number after decimal point')
  end
  else
    begin
      opactive := true ;
      op := '-' ;
      op1 := strtofloat(label1.caption);
      label1.Caption := label1.Caption + '-' ;
    end;

end;

procedure TForm1.btnmultiplyClick(Sender: TObject);
begin
  if (opactive ) then
    begin
      showmessage('please perform one arithmetic operation at a time')
    end
        else if ( label1.Caption[length(label1.caption)]='.' ) then
  begin
      showmessage('enter a number after decimal point')
  end
  else
    begin
      opactive := true ;
      op := '*' ;
      op1 := strtofloat(label1.caption);
      label1.Caption := label1.Caption + '*' ;
    end;

end;

procedure TForm1.BtnplusClick(Sender: TObject);
begin
  if (opactive ) then
    begin
      showmessage('please perform one arithmetic operation at a time')
    end

  else if ( label1.Caption[length(label1.caption)]='.' ) then
  begin
      showmessage('enter a number after decimal point')
  end

  else
    begin
      opactive := true ;
      op := '+' ;
      op1 := strtofloat(label1.caption);
      label1.Caption := label1.Caption + '+' ;
    end;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
opactive := false ;
op1dot := false;
op2dot := false;
end;

end.

