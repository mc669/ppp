program PeterPetrolPump;

uses Crt, Graph;

var GraphDriver, GraphMode, GraphError :integer;
    x,y :integer;
    action :char;
    number :char;
    count :integer;
    ppl :real;
    petrol_cost : real;
    petrol_sold : real;
    current_cost : real;
    current_sold : real;
    daily_cost : real;
    daily_petrol_sold : real;


procedure TopLeft(a,b:integer);
  begin
  MoveTo(a+30,b+30);
  LineTo(a+30,b+70);
  end;
  {top left}

  procedure BottomLeft(a,b:integer);
  begin
  MoveTo(a+30,b+90);
  LineTo(a+30,b+130);
  end;
  {bottom left}

  procedure TopRight(a,b: integer);
  begin
  MoveTo(a+90,b+30);
  LineTo(a+90,b+70);
  end;
  {top right}

  procedure BottomRight(a,b:integer);
  begin
  MoveTo(a+90,b+90);
  LineTo(a+90,b+130);
  end;
  {bottom right}

  procedure Top(a,b:integer);
  begin
  MoveTo(a+35,b+20);
  LineTo(a+85,b+20);
  end;
  {top}

  procedure Middle(a,b:integer);
  begin
  MoveTo(a+35,b+80);
  LineTo(a+85,b+80);
  end;
  {middle}

  procedure Bottom(a,b:integer);
  begin
  MoveTo(a+35,b+140);
  LineTo(a+85,b+140);
  end;
  {bottom}

procedure Zero(x,y: integer);
  begin
  TopLeft(x,y);
  BottomLeft(x,y);
  TopRight(x,y);
  BottomRight(x,y);
  Top(x,y);
  Bottom(x,y);
  end;

procedure One(x,y:integer);

  begin
  TopRight(x,y);
  BottomRight(x,y);
  end;

procedure Two(x,y:integer);

  begin
  TopRight(x,y);
  BottomLeft(x,y);
  Top(x,y);
  Middle(x,y);
  Bottom(x,y);
  end;

procedure Three(x,y:integer);

  begin
  TopRight(x,y);
  BottomRight(x,y);
  Top(x,y);
  Middle(x,y);
  Bottom(x,y);
  end;

procedure Four(x,y:integer);

  begin
  TopLeft(x,y);
  TopRight(x,y);
  BottomRight(x,y);
  Middle(x,y);
  end;

procedure Five(x,y:integer);

  begin
  TopLeft(x,y);
  BottomRight(x,y);
  Top(x,y);
  Middle(x,y);
  Bottom(x,y);
  end;

procedure Six(x,y:integer);

  begin
  TopLeft(x,y);
  BottomLeft(x,y);
  BottomRight(x,y);
  Top(x,y);
  Middle(x,y);
  Bottom(x,y);
  end;

procedure Seven(x,y:integer);

  begin
  TopRight(x,y);
  BottomRight(x,y);
  Top(x,y);
  end;

procedure Eight(x,y:integer);

  begin
  TopLeft(x,y);
  BottomLeft(x,y);
  TopRight(x,y);
  BottomRight(x,y);
  Top(x,y);
  Middle(x,y);
  Bottom(x,y);
  end;

procedure Nine(x,y:integer);

  begin
  TopLeft(x,y);
  TopRight(x,y);
  BottomRight(x,y);
  Top(x,y);
  Middle(x,y);
  Bottom(x,y);
  end;

procedure dot(x,y:integer);

  begin
  rectangle(x+61,y+78,x+64,y+81);
  end;

procedure initialise_values;
begin
ppl :=0;
petrol_cost :=0;
petrol_sold :=0;
current_cost :=0;
current_sold :=0;
daily_cost :=0;
daily_petrol_sold :=0;
count :=0;
end;

procedure set_price_per_litre(var p:real);

var
    pp: real;
    string_pp: string;
    errorcode: integer;


 begin
 repeat;
 clrscr;
 writeln('PETERS PETROL PUMP ');
 writeln('Pump State : Out of Use ');
 gotoxy(10,13);
 write('Enter todays price per litre in pence ');
 readln(string_pp);
 val(string_pp, p, errorcode);
 if p >= 200 then
 errorcode:=1;
 if p < 0 then
 errorcode:=1;
 if errorcode <> 0 then
 begin
 gotoxy(10,14);
 writeln('Invalid entry, please re-enter ');
 delay(1000);
 clrscr;
 end;
 until errorcode=0;
{repeat
  while p >= 200 do
   begin
   clrscr;
   writeln('PETERS PETROL PUMP ');
   writeln('Pump State : Out of Use ');
   gotoxy(10,13);
   write('Invalid entry, please re-enter ');
   readln(p);
   end;
  while p <= 0 do
   begin
   clrscr;
   writeln('PETERS PETROL PUMP ');
   writeln('Pump State : Out of Use ');
   gotoxy(10,13);
   write('Invalid entry, please re-enter ');
   readln(p);
   end;
until p < 200; }
end;

procedure zero_pump_display;
begin
clrscr;
writeln('PETERS PETROL PUMP ');
writeln('Pump State : Out of Use ');
gotoxy(10,13);
write('Press Z to zero pump display ');
repeat
 petrol_cost:=0;
 petrol_sold:=0;
 current_cost :=0;
 current_sold :=0;
 action:= readkey;
until (action in ['Z','z']);
end;


procedure display_this_sale(s:real);
var strsale: string;
    l: integer;
    x,y:integer;
    charnum: integer;

    begin
    moveto(10,5);
    outtext('This Sale');
    str(s:6:2,strsale);
    x:=20;
    y:=0;
    for charnum := 1 to 6 do
      begin
      x:=x+75;

    case strsale[charnum] of
'0' : Zero(x,y);
'1' : One(x,y);
'2' : Two(x,y);
'3' : Three(x,y);
'4' : Four(x,y);
'5' : Five(x,y);
'6' : Six(x,y);
'7' : Seven(x,y);
'8' : Eight(x,y);
'9' : Nine(x,y);
'.' : Dot(x,y);
' ' : Zero(x,y);
    end;
      end;
delay(5);
end;

procedure display_petrol_sold(ps:real);
var strsold: string;
    l: integer;
    x,y:integer;
    charnum: integer;

    begin
    moveto(10,155);
    outtext('Petrol Sold');
    str(ps:4:1,strsold);
    x:=95;
    y:=150;
    for charnum := 1 to 4 do
      begin
      x:=x+75;

    case strsold[charnum] of
'0' : Zero(x,y);
'1' : One(x,y);
'2' : Two(x,y);
'3' : Three(x,y);
'4' : Four(x,y);
'5' : Five(x,y);
'6' : Six(x,y);
'7' : Seven(x,y);
'8' : Eight(x,y);
'9' : Nine(x,y);
'.' : Dot(x,y);
' ' : Zero(x,y);
    end;
      end;
delay(5);
end;

procedure display_ppl(p:real);
var strppl: string;
    l: integer;
    x,y:integer;
    charnum: integer;

    begin
    moveto(10,305);
    outtext('Price Per Litre');
    str(p:5:1,strppl);
    x:=20;
    y:=300;
    for charnum := 1 to 5 do
      begin
      x:=x+75;

    case strppl[charnum] of
'0' : Zero(x,y);
'1' : One(x,y);
'2' : Two(x,y);
'3' : Three(x,y);
'4' : Four(x,y);
'5' : Five(x,y);
'6' : Six(x,y);
'7' : Seven(x,y);
'8' : Eight(x,y);
'9' : Nine(x,y);
'.' : Dot(x,y);
' ' : Zero(x,y);
    end;
      end;
delay(5);
end;

procedure dispense_petrol;
var action:char;
    petrol_cost:real;
    petrol_amount:real;



  begin
  RestoreCrtMode;
  clrscr;
  writeln('PETERS PETROL PUMP ');
  writeln('Pump State : Ready to Use ');
  gotoxy(10,12);
  write('Press F to start dispensing petrol ');
  gotoxy(10,15);
  write('Press S to stop dispensing petrol ');
  while not keypressed do;
  {SetGraphMode(GraphMode);
  SetLineStyle(SolidLn,0,ThickWidth);
  SetColor(white);}
       x:=0;
       y:=0;
       petrol_cost:=0;
       petrol_sold:=0;
       current_cost :=0;
       current_sold :=0;

   repeat
    action:=readkey;
    while (action in ['F','f']) do
        begin
        SetGraphMode(GraphMode);
        petrol_sold:=petrol_sold+0.1;
        petrol_cost:=(petrol_sold*ppl)/100;
        display_ppl(ppl);
        display_this_sale(petrol_cost);
        display_petrol_sold(petrol_sold);
        delay(5);
        action:=readkey;
        end;

   until action in ['S','s'];
   count:=count+1;
   current_cost:=current_cost+petrol_cost;
   current_sold:=current_sold+petrol_sold;
   daily_petrol_sold:=daily_petrol_sold+current_sold;
   daily_cost:=daily_cost+current_cost;
   end;



procedure view_daily_totals;
begin
clrscr;
writeln('PETERS PETROL PUMP ');
writeln('Daily Summary ');
gotoxy(10,10);
if daily_petrol_sold < 0.5 then
daily_petrol_sold := 0.5;
writeln('Total amount of petrol sold is ',Daily_petrol_sold:4:1,' litres');
gotoxy(10,13);
writeln('Total amount of money taken is œ', Daily_cost:5:2);
gotoxy(10,16);
writeln('Total amount of customers is ',count);
readln;
end;

procedure next_customer;
begin
clrscr;
writeln('PETERS PETROL PUMP ');
writeln('Pump State : Out of Use ');
gotoxy(10,10);
write('Press any other key for next customer ');
gotoxy(10,13);
write('Press V to view daily totals and close petrol station ');
gotoxy(10,16);
write('Press C to change petrol price ');
action:=readkey;
end;



begin {automatically detect and initialise a graphics display mode}
GraphDriver:=Detect;
InitGraph(GraphDriver, GraphMode,'d:\TP\BGI');
{'c:\TP\BGI' is the directory holding BGI and CHR files}
{checks for errors in Graph initialisation}
GraphError := GraphResult;
if GraphError <> GrOk then {there is an error}
  begin
  RestoreCrtMode;
  Writeln('Graphics error');
  readln;
  end
else
  begin
  RestoreCrtMode;
  clrscr;
  initialise_values;
  set_price_per_litre(ppl);

repeat

  zero_pump_display;
  dispense_petrol;
  RestoreCrtMode;
  if not (action in ['V','v']) then
  next_customer;
  while (action in ['C','c']) do
        begin
        set_price_per_litre(ppl);
        next_customer;
        end;

until (action in ['V','v']);
RestoreCrtMode;
view_daily_totals;
  end;
closegraph;
end.

