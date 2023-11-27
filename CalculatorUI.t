%Ansar Yonis
%Calculator Program
%Calculator Functions : Add, Subtract, Multiply, Divide, Click animation, negative int, decimal, pi, Eulers #, Clear Screen, Cos, Sine, Tan, Sin Inverse, Cos Inverse, tan inverse, Exponents, ln

%buttons display
var mouseX, mouseY, button : int
const calcHeight := 400
const calcWidth := 440
const buttonHeight := 40
const buttonWidth := 40
var trackertwo : int := 1
%Operator buttons
var Leftside, Rightside : string
var z : real := 0
var pi : real := 3.14159265
var euler : real := 2.71828
var tracker : int := 0
var answer : real
var l, r : real := 0
var operatorClicked := false
var Plussign, Subtractsign, Timessign, Dividesign : boolean := false
var Cossign, Sinsign, tansign, facts, cosinv, sininv, taninv, expos, lne : boolean := false
%end of listed variables
var buttonCharacters : array 1 .. 30 of string
    := init ("0", "1", "4", "7", "sin", ".", "2", "5", "8", "cos", "(-)", "3", "6", "9", "tan", "=", "-", "+", "x", "/", "TT", "AC", "tan-1", "cos-1", "sin-1", "", "x^!", "E", "ln", "x**n")
var font : int := Font.New ("serif:12")
var font2 : int := Font.New ("digital-7:20")
var buttonTracker : int := 1
drawfillbox (150, 40, calcWidth + 60, calcHeight - 1, 197)
drawbox (150, 40, calcWidth + 60, calcHeight - 1, 255)
var x : int := 100
var y : int := 0
for i : 1 .. 6
    for j : 0 .. 4
	drawfillbox (125 + i * 50,
	    60 + j * 50,
	    135 + i * 50 + buttonWidth,
	    60 + j * 50 + buttonHeight,
	    0)
	drawbox (125 + i * 50,
	    60 + j * 50,
	    135 + i * 50 + buttonWidth,
	    60 + j * 50 + buttonHeight,
	    255)
	Font.Draw (buttonCharacters (buttonTracker), 140 + i * 50, 75 + j * 50, font, black)
	buttonTracker := buttonTracker + 1
	delay (10)
    end for
    %Reset y postion for next column
end for
drawfillbox (475, 370, 170, 315, 165) %Calculator Screen
drawbox (475, 370, 170, 315, 255) %Calc Outline
%Clears the screen
procedure blankScreen
    drawfillbox (475, 370, 170, 315, 165)
    drawbox (475, 370, 170, 315, black)
end blankScreen
procedure outputOutcome (h : string)
    var x : int := 300
    var y : int := 350
    blankScreen
    for decreasing i : length (h) .. 1
	Font.Draw (h (i), x + 125, y - 25, font2, 255)
	x := x - 12 %outputs numbers 1-6
    end for
end outputOutcome
%***************************************************************************************%

%-----Trig functions-----%
function factorial (a : int) : real
    var answer : real := 1
    if a not= 0 then
	for b : 1 .. a
	    answer := answer * b
	end for
    end if
    result answer
end factorial

function cosine (a : real) : real
    var answer : real := 0
    for b : 0 .. 70
	answer := answer + ((-1) ** b) * (a) ** (2 * b) / factorial (2 * b)
    end for
    result answer
end cosine

function sine (a : real) : real
    var number : real := 0
    for b : 0 .. 70
	number := number + ((-1) ** b) * (a) ** ((2 * b) + 1) / factorial ((2 * b) + 1)
    end for
    result number
end sine

function tangent (var z : real) : real
    result sine (z) / cosine (z)
end tangent

function cosInverse (a : real) : real
    if a = 1 then
	result z
    end if
    var top : real := 0
    var bot : real := pi
    var mid := (top + bot) / 2
    const tolerance := 0.0000000001
    loop
	exit when abs (top - bot) < tolerance
	if a > cosine (mid) then
	    bot := mid
	    mid := (top + bot) / 2
	else
	    top := mid
	    mid := (top + bot) / 2
	end if
    end loop
    result mid
end cosInverse

function sinInverse (a : real) : real
    if a = 0 then
	result z
    end if
    var top : real := (1 / 2) * pi
    var bot : real := - (1 / 2) * pi
    var mid := (top + bot) / 2
    const tolerance := 0.0000000001
    loop
	exit when abs (top - bot) < tolerance
	if a > sine (mid) then
	    bot := mid
	    mid := (top + bot) / 2
	else
	    top := mid
	    mid := (top + bot) / 2
	end if
    end loop
    result mid
end sinInverse

function tanInverse (a : real) : real
    var top : real := (pi / 2)
    var bot : real := - (pi / 2)
    var mid := (bot + top) / 2 + 0.0000001
    const tolerance := 0.000001
    loop
	exit when abs (top - bot) < tolerance
	if a > tangent (mid) then
	    bot := mid
	    mid := (top + bot) / 2
	else
	    top := mid
	    mid := (top + bot) / 2
	end if
    end loop
    result mid
end tanInverse

function naturalgol (a : real) : real
    var answer : real := 0
    for i : 1 .. 2000
	answer := answer + (1 / i) * ((a - 1) / a) ** i
    end for
    result answer
end naturalgol
%-----Trig/ln functions

%----- Output Calc #-----%
procedure addDigit (a : string)
    if tracker = 0 then     %first digit
	Leftside := a
	outputOutcome (Leftside)
	tracker := tracker + 1
    elsif tracker not= 0 then
	Leftside := Leftside + a
	tracker := tracker + 1
	outputOutcome (Leftside)
    end if
end addDigit
%-----End Output Calc #-----%

%--------#1-9 and extra numbers procedures---------%
%Num 0
procedure zero
    addDigit ("0")
end zero
%Num 1
procedure one
    addDigit ("1")
end one
%Num 2
procedure two
    addDigit ("2")
end two
%Num 3
procedure three
    addDigit ("3")
end three
%Num 4
procedure four
    addDigit ("4")
end four
%Num 5
procedure five
    addDigit ("5")
end five
%Num 6
procedure six
    addDigit ("6")
end six
%Num 7
procedure seven
    addDigit ("7")
end seven
%Num 8
procedure eight
    addDigit ("8")
end eight
%Num 9
procedure nine
    addDigit ("9")
end nine
%Pi
procedure pie
    addDigit ("3.14159265")
end pie
%Euler #
procedure Eul
    addDigit ("2.71828")
end Eul
% -
procedure negative
    addDigit ("-")
end negative
%--------End of #1-9 and extra numbers procedures---------%

%----------Add subtract multiply Divide exponents procedures----------%
procedure add
    operatorClicked := true
    Plussign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end add

procedure subtract
    operatorClicked := true
    Subtractsign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end subtract

procedure multiply
    operatorClicked := true
    Timessign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end multiply

procedure divide
    operatorClicked := true
    Dividesign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end divide

procedure Exp
    operatorClicked := true
    expos := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end Exp
%-----End of Add subtract multiply Divide exponents procedures-----%

%-----Cos sin cosinv sininv tan factor exponent log procedure-----%
procedure coss
    operatorClicked := true
    Cossign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end coss

procedure sinne
    operatorClicked := true
    Sinsign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end sinne

procedure cosinve
    operatorClicked := true
    cosinv := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end cosinve

procedure sineinve
    operatorClicked := true
    sininv := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end sineinve

procedure taninve
    operatorClicked := true
    taninv := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end taninve

procedure tangint
    operatorClicked := true
    tansign := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end tangint

procedure factori
    operatorClicked := true
    facts := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end factori

procedure logs
    operatorClicked := true
    lne := true
    Rightside := Leftside
    blankScreen
    tracker := 0
end logs
%-----Cos sin cosinv sininv tan factor exponent log procedure-----%

%-----Equals procedure of signs and functions start-----%
procedure equals

    if operatorClicked = true then
	operatorClicked := false
	if Sinsign or tansign or Cossign or sininv or cosinv or taninv or facts or lne = true then
	    l := strreal (Leftside)
	    if Cossign = true then
		Cossign := false
		answer := cosine (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := realstr (answer, 250)
	    elsif facts = true then
		facts := false
		answer := factorial (l div 1)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := realstr (answer, 250)
	    elsif Sinsign = true then
		Sinsign := false
		answer := sine (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := realstr (answer, 250)
	    elsif tansign = true then
		tansign := false
		answer := tangent (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif cosinv = true then
		cosinv := false
		answer := cosInverse (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif sininv = true then
		sininv := false
		answer := sinInverse (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif taninv = true then
		taninv := false
		answer := tanInverse (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif lne = true then
		lne := false
		answer := naturalgol (l)
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    end if
	end if
	if Plussign or Subtractsign or Timessign or Dividesign or expos = true then
	    l := strreal (Leftside)         %Converts string to real
	    r := strreal (Rightside)
	    if Plussign = true then
		Plussign := false
		answer := l + r
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif Timessign = true then
		Timessign := false
		answer := l * r
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif Dividesign = true then
		Dividesign := false
		answer := r / l
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif Subtractsign = true then
		Subtractsign := false
		answer := r - l
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    elsif expos = true then
		expos := false
		answer := r ** l
		blankScreen
		outputOutcome (realstr (answer, 250))
		Leftside := (realstr (answer, 250))
	    end if
	end if
    end if
end equals
%-----End Equals procedure of signs and functions start-----%

%-----Button locations-----%
loop
    delay (99)
    mousewhere (mouseX, mouseY, button)
    %-----Start of Highlighted Buttons location-----%

    %ROW 1 Highlighted Button
    if mouseX < 225 and mouseX > 175 and mouseY > 60 and mouseY < 100 and button = 1 then
	Draw.Box (176, 101, 224, 59, white)
	delay (100)
	Draw.Box (176, 101, 224, 59, black)
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 60 and mouseY < 100 and button = 1 then
	Draw.Box (226, 101, 274, 59, white)
	delay (100)
	Draw.Box (226, 101, 274, 59, black)
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 60 and mouseY < 100 and button = 1 then
	Draw.Box (276, 101, 324, 59, white)
	delay (100)
	Draw.Box (276, 101, 324, 59, black)
    end if

    if mouseX < 375 and mouseX > 325 and mouseY > 60 and mouseY < 100 and button = 1 then
	Draw.Box (326, 101, 374, 59, white)
	delay (100)
	Draw.Box (326, 101, 374, 59, black)
    end if

    if mouseX < 425 and mouseX > 375 and mouseY > 60 and mouseY < 100 and button = 1 then
	Draw.Box (376, 101, 424, 59, white)
	delay (100)
	Draw.Box (376, 101, 424, 59, black)
    end if
    if mouseX < 475 and mouseX > 425 and mouseY > 60 and mouseY < 100 and button = 1 then
	Draw.Box (426, 101, 474, 59, white)
	delay (100)
	Draw.Box (426, 101, 474, 59, black)
    end if
    %ROW 2 Highlighted Button
    if mouseX < 225 and mouseX > 175 and mouseY > 107 and mouseY < 150 and button = 1 then
	Draw.Box (176, 151, 224, 109, white)
	delay (100)
	Draw.Box (176, 151, 224, 109, black)
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 107 and mouseY < 150 and button = 1 then
	Draw.Box (226, 151, 274, 109, white)
	delay (100)
	Draw.Box (226, 151, 274, 109, black)
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 107 and mouseY < 150 and button = 1 then
	Draw.Box (276, 151, 324, 109, white)
	delay (100)
	Draw.Box (276, 151, 324, 109, black)
    end if

    if mouseX < 375 and mouseX > 325 and mouseY > 107 and mouseY < 150 and button = 1 then
	Draw.Box (326, 151, 374, 109, white)
	delay (100)
	Draw.Box (326, 151, 374, 109, black)
    end if

    if mouseX < 425 and mouseX > 375 and mouseY > 107 and mouseY < 150 and button = 1 then
	Draw.Box (376, 151, 424, 109, white)
	delay (100)
	Draw.Box (376, 151, 424, 109, black)
    end if
    if mouseX < 475 and mouseX > 425 and mouseY > 107 and mouseY < 150 and button = 1 then
	Draw.Box (426, 151, 474, 109, white)
	delay (100)
	Draw.Box (426, 151, 474, 109, black)
    end if
    %ROW 3 Highlighted Button
    if mouseX < 225 and mouseX > 175 and mouseY > 159 and mouseY < 200 and button = 1 then
	Draw.Box (176, 201, 224, 159, white)
	delay (100)
	Draw.Box (176, 201, 224, 159, black)
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 159 and mouseY < 200 and button = 1 then
	Draw.Box (226, 201, 274, 159, white)
	delay (100)
	Draw.Box (226, 201, 274, 159, black)
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 159 and mouseY < 200 and button = 1 then
	Draw.Box (276, 201, 324, 159, white)
	delay (100)
	Draw.Box (276, 201, 324, 159, black)
    end if

    if mouseX < 375 and mouseX > 325 and mouseY > 159 and mouseY < 200 and button = 1 then
	Draw.Box (326, 201, 374, 159, white)
	delay (100)
	Draw.Box (326, 201, 374, 159, black)
    end if

    if mouseX < 425 and mouseX > 375 and mouseY > 159 and mouseY < 200 and button = 1 then
	Draw.Box (376, 201, 424, 159, white)
	delay (100)
	Draw.Box (376, 201, 424, 159, black)
    end if

    if mouseX < 475 and mouseX > 425 and mouseY > 159 and mouseY < 200 and button = 1 then
	Draw.Box (426, 201, 474, 159, white)
	delay (100)
	Draw.Box (426, 201, 474, 159, black)
    end if
    %ROW 4 Highlighted Button
    if mouseX < 225 and mouseX > 175 and mouseY > 211 and mouseY < 250 and button = 1 then
	Draw.Box (176, 251, 224, 209, white)
	delay (100)
	Draw.Box (176, 251, 224, 209, black)
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 211 and mouseY < 250 and button = 1 then
	Draw.Box (226, 251, 274, 209, white)
	delay (100)
	Draw.Box (226, 251, 274, 209, black)
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 211 and mouseY < 250 and button = 1 then
	Draw.Box (276, 251, 324, 209, white)
	delay (100)
	Draw.Box (276, 251, 324, 209, black)
    end if

    if mouseX < 375 and mouseX > 325 and mouseY > 211 and mouseY < 250 and button = 1 then
	Draw.Box (326, 251, 374, 209, white)
	delay (100)
	Draw.Box (326, 251, 374, 209, black)
    end if

    if mouseX < 425 and mouseX > 375 and mouseY > 211 and mouseY < 250 and button = 1 then
	Draw.Box (376, 251, 424, 209, white)
	delay (100)
	Draw.Box (376, 251, 424, 209, black)
    end if

    if mouseX < 475 and mouseX > 425 and mouseY > 211 and mouseY < 250 and button = 1 then
	Draw.Box (426, 251, 474, 209, white)
	delay (100)
	Draw.Box (426, 251, 474, 209, black)
    end if
    %ROW 5 Up Top Highlighted Button
    if mouseX < 225 and mouseX > 175 and mouseY > 263 and mouseY < 300 and button = 1 then
	Draw.Box (176, 301, 224, 259, white)
	delay (100)
	Draw.Box (176, 301, 224, 259, black)
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 263 and mouseY < 300 and button = 1 then
	Draw.Box (226, 301, 274, 259, white)
	delay (100)
	Draw.Box (226, 301, 274, 259, black)
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 263 and mouseY < 300 and button = 1 then
	Draw.Box (276, 301, 324, 259, white)
	delay (100)
	Draw.Box (276, 301, 324, 259, black)
    end if

    if mouseX < 375 and mouseX > 325 and mouseY > 263 and mouseY < 300 and button = 1 then
	Draw.Box (326, 301, 374, 259, white)
	delay (100)
	Draw.Box (326, 301, 374, 259, black)
    end if
    if mouseX < 425 and mouseX > 375 and mouseY > 263 and mouseY < 300 and button = 1 then
	Draw.Box (376, 301, 424, 259, white)
	delay (100)
	Draw.Box (376, 301, 424, 259, black)
    end if

    if mouseX < 475 and mouseX > 425 and mouseY > 263 and mouseY < 300 and button = 1 then
	Draw.Box (426, 301, 474, 259, white)
	delay (100)
	Draw.Box (426, 301, 474, 259, black)
    end if
    %-----End of Highlighted Buttons location-----%

    %clearScreen button
    if mouseX < 425 and mouseX > 375 and mouseY > 107 and mouseY < 150 and button = 1 then
	blankScreen
	tracker := 0
    end if

    %decimal button
    if mouseX < 275 and mouseX > 225 and mouseY > 60 and mouseY < 100 and button = 1 then
	addDigit (".")
    end if

    %negative integer button
    if mouseX < 325 and mouseX > 275 and mouseY > 60 and mouseY < 100 and button = 1 then
	negative
    end if

    %= button
    if mouseX < 375 and mouseX > 325 and mouseY > 60 and mouseY < 100 and button = 1 then
	blankScreen
	equals
    end if
    %Pi button
    if mouseX < 425 and mouseX > 375 and mouseY > 60 and mouseY < 100 and button = 1 then
	pie
    end if
    %-----Start of #'s 1 through 9-----%
    if mouseX < 225 and mouseX > 175 and mouseY > 60 and mouseY < 100 and button = 1 then
	zero
    end if

    if mouseX < 225 and mouseX > 175 and mouseY > 107 and mouseY < 150 and button = 1 then
	one
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 107 and mouseY < 150 and button = 1 then
	two
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 107 and mouseY < 150 and button = 1 then
	three
    end if

    if mouseX < 225 and mouseX > 175 and mouseY > 159 and mouseY < 200 and button = 1 then
	four
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 159 and mouseY < 200 and button = 1 then
	five
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 159 and mouseY < 200 and button = 1 then
	six
    end if

    if mouseX < 225 and mouseX > 175 and mouseY > 211 and mouseY < 250 and button = 1 then
	seven
    end if

    if mouseX < 275 and mouseX > 225 and mouseY > 211 and mouseY < 250 and button = 1 then
	eight
    end if

    if mouseX < 325 and mouseX > 275 and mouseY > 211 and mouseY < 250 and button = 1 then
	nine
    end if
    %-----End of #'s 1 through 9-----%
    %Cosine
    if mouseX < 275 and mouseX > 225 and mouseY > 263 and mouseY < 300 and button = 1 then
	coss
    end if
    %Tangent
    if mouseX < 325 and mouseX > 275 and mouseY > 263 and mouseY < 300 and button = 1 then
	tangint
    end if
    %Sine
    if mouseX < 225 and mouseX > 175 and mouseY > 263 and mouseY < 300 and button = 1 then
	sinne
    end if
    %Factorial
    if mouseX < 475 and mouseX > 425 and mouseY > 107 and mouseY < 150 and button = 1 then
	factori
    end if
    %Euler #
    if mouseX < 475 and mouseX > 425 and mouseY > 159 and mouseY < 200 and button = 1 then
	Eul
    end if
    %CosInverse
    if mouseX < 425 and mouseX > 375 and mouseY > 211 and mouseY < 250 and button = 1 then
	cosinve
    end if
    %SinInverse
    if mouseX < 425 and mouseX > 375 and mouseY > 263 and mouseY < 300 and button = 1 then
	sineinve
    end if
    %TanInverse
    if mouseX < 425 and mouseX > 375 and mouseY > 159 and mouseY < 200 and button = 1 then
	taninve
    end if
    %Lone button
    if mouseX < 475 and mouseX > 425 and mouseY > 211 and mouseY < 250 and button = 1 then

    end if
    %addition button
    if mouseX < 375 and mouseX > 325 and mouseY > 159 and mouseY < 200 and button = 1 then
	add
    end if
    %Lone button
    if mouseX < 475 and mouseX > 425 and mouseY > 211 and mouseY < 250 and button = 1 then
	logs
    end if
    %subtraction button
    if mouseX < 375 and mouseX > 325 and mouseY > 107 and mouseY < 150 and button = 1 then
	subtract
    end if
    %multiply button
    if mouseX < 375 and mouseX > 325 and mouseY > 211 and mouseY < 250 and button = 1 then
	multiply
    end if
    %divide button
    if mouseX < 375 and mouseX > 325 and mouseY > 263 and mouseY < 300 and button = 1 then
	divide
    end if
    %Exponents button
    if mouseX < 475 and mouseX > 425 and mouseY > 263 and mouseY < 300 and button = 1 then
	Exp
    end if
end loop
%----- end of button locations-----%
