#Persistent

PointX1 := 469
PointY1 := 160
PointX2 := 1415
PointY2 := 830
PATH := "C:\Users\Адмін\Desktop\Ank\ball2.PNG"  ; -- If you dont put "" things, script wont work!
Click := 0  ; Set to 1 for click, 0 for Send {F} -- if you put that to 1 it will click instead of pressing F every time it detects ball

loopActive := false
return

F::
	ToolTip, Active!, %MouseX%, %MouseY%, 7
	ToolTip, 2, %PointX1%, %PointY1%, 2
	ToolTip, 3, %PointX2%, %PointY2%, 3
	ToolTip, 4, %PointX2%, %PointY1%, 4
	ToolTip, 5, %PointX1%, %PointY2%, 5

    if (loopActive)
    {
        loopActive := false
    }
    else
    {
        loopActive := true
        Loop
        {
           ImageSearch, OutputVarX, OutputVarY, %PointX1%, %PointY1%, %PointX2%, %PointY2%, %PATH%

	If ErrorLevel = 0
{
            if (Click = 1)
{

	Send, {LButton}
	ToolTip, !, %OutputVarX%, %OutputVarY%, 6
}
else {
	Send, {F}
	ToolTip, !, %OutputVarX%, %OutputVarY%, 6
     }
}




            if (!loopActive)
                break

        }
    }
return

G::
    loopActive := false

	ToolTip, , %MouseX%, %MouseY%, 7
	ToolTip, , , , 6
	ToolTip, , 680, 260, 2
	ToolTip, , 1390, 830, 3
	ToolTip, , 1390, 260, 4
	ToolTip, , 680, 830, 5
	ToolTip, , , , 6

return

Numpad4:: Reload
return

Numpad1:: Suspend, Toggle
	ToolTip, 
