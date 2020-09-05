Gui, Add, DropDownList, w200 vxspos, 1||2|3
Gui, Add, Button, Default, OK
Gui, Show, w260, XuanShang V2.0
return


ButtonOK:
Gui, Submit, nohide
Gui, Minimize
if (xspos = 1)
    goto, subclick1
else if (xspos = 2)
    goto, subclick2
else if (xspos = 3)
    goto, subclick3
return

subclick1:
run, .\subxs\xs1px3.ahk
return

subclick2:
run, .\subxs\xs2px3.ahk
return

subclick3:
run, .\subxs\xs3px3.ahk
return
