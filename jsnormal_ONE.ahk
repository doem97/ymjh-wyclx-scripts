if JoystickNumber <= 0
{
	Loop 16  ; Query each joystick number to find out which ones exist.
	{
		GetKeyState, JoyName, %A_Index%JoyName
		if JoyName <>
		{
			JoystickNumber = %A_Index%
			break
		}
	}
	if JoystickNumber <= 0
	{
		MsgBox The system does not appear to have any joysticks.
		ExitApp
	}
}

#SingleInstance

SetMouseDelay, 0
MouseMoveSpeed := 0
SingleMoveUnit := 20
MouseRMoveL := -1*SingleMoveUnit
MouseRMoveR := SingleMoveUnit
JoystickPrefix = %JoystickNumber%Joy
Hotkey, %JoystickPrefix%1, joyaop
Hotkey, %JoystickPrefix%2, joybop
Hotkey, %JoystickPrefix%3, joyxop
Hotkey, %JoystickPrefix%5, joylbop
Hotkey, %JoystickPrefix%6, joyrbop
Hotkey, %JoystickPrefix%7, joybackop
Hotkey, %JoystickPrefix%8, joystartop
Hotkey, %JoystickPrefix%9, joylsop
Hotkey, %JoystickPrefix%10, joyrsop
JoyThreshold = 40
JoyThresholdUpper := 50 + JoyThreshold
JoyThresholdLower := 50 - JoyThreshold

SetTimer, WatchJoyLv, 0
SetTimer, WatchJoyLh, 0
SetTimer, WatchJoyV, 0
setTimer, WatchJoyZ, 0
setTimer, WatchJoyR, 0
setTimer, WatchJoyP, 150
return

joyaop:
SetTimer, WaitForAButtonUp, 0
return

WaitForAButtonUp:
if GetKeyState(JoystickPrefix . 1)
{
    send {1}
	return
}
SetTimer, WaitForAButtonUp, Off
return

joybop:
if GetKeyState(JoystickPrefix . 4)
    SendInput {q}
else
    SendInput {space}
return
return

joyxop:
SendInput {f}
return

/*
joyyop:
SetTimer, WaitForYButtonUp, 10
return

WaitForYButtonUp:
if GetKeyState(JoystickPrefix . 4)
{
    send {y}
	return
}
SetTimer, WaitForYButtonUp, Off
return
*/

joylbop:
if GetKeyState(JoystickPrefix . 4)
    send {6}
else
    Send {2}
return

joyrbop:
if GetKeyState(JoystickPrefix . 4)
    send {8}
else
    Send {4}
return

joybackop:
if GetKeyState(JoystickPrefix . 4)
    SendInput {Click 985, 154}
else
    SendInput {F3}
return

joystartop:
SendInput {r}
return

joylsop:
SendInput {space}
SendInput {e}
return

joyrsop:
SendInput {Tab}
return

WatchJoyLv:
GetKeyState, JoyX, %JoystickNumber%JoyX
KeyToHoldDownPrevv := KeyToHoldDownv
if (JoyX > 70)
    KeyToHoldDownv := "d"
else if (JoyX < 30)
    KeyToHoldDownv := "a"
else
    KeyToHoldDownv := ""
if (KeyToHoldDownv = KeyToHoldDownPrevv)
    return
SetKeyDelay -1
if KeyToHoldDownPrevv
    Send, {%KeyToHoldDownPrevv% up}
if KeyToHoldDownv
    Send, {%KeyToHoldDownv% down}
return

WatchJoyLh:
GetKeyState, JoyY, %JoystickNumber%JoyY
KeyToHoldDownPrevh := KeyToHoldDownh
if (JoyY > 70)
    KeyToHoldDownh := "s"
else if (JoyY < 30)
    KeyToHoldDownh := "w"
else
    KeyToHoldDownh := ""
if (KeyToHoldDownh = KeyToHoldDownPrevh)
    return
SetKeyDelay -1
if KeyToHoldDownPrevh
    Send, {%KeyToHoldDownPrevh% up}
if KeyToHoldDownh
    Send, {%KeyToHoldDownh% down}
return

WatchJoyV:
WinGetActiveStats, naha, WinWidth, nahb, nahc, nahd
WinCenter := WinWidth/2
WinEdgeL := 100
WinEdgeR := WinWidth - 100
GetKeyState, JoyV, %JoystickNumber%JoyV
PrevDir := CurrentDir
if (JoyV < 45)
    CurrentDir := 0
else if (JoyV > 55)
    CurrentDir := 2
else
    CurrentDir := 1
if (CurrentDir = PrevDir)
{
    MouseGetPos, mouseposU
    if (CurrentDir = 0)
    {
        if (mouseposU < WinEdgeL)
        {
            MouseClick, left, , , , 0, U
            MouseClick, left, WinCenter, 70, , 0, D
        }
        MouseMove, MouseRMoveL, 0, MouseMoveSpeed, R
        return
    }
    else if (CurrentDir = 2)
    {
        if (mouseposU > WinEdgeR)
        {
            MouseClick, left, , , , 0, U
            MouseClick, left, WinCenter, 70, , 0, D
        }
        MouseMove, MouseRMoveR, 0, MouseMoveSpeed, R
        return
    }
    else
        return
}
else
{
    MouseClick, left, , , , 0, U
    if (CurrentDir = 0)
    {
        MouseClick, left, WinCenter, 70, , 0, D
        MouseMove, MouseRMoveL, 0, MouseMoveSpeed, R
        return
    }
    else if (CurrentDir = 2)
    {
        MouseClick, left, WinCenter, 70, , 0, D
        MouseMove, MouseRMoveR, 0, MouseMoveSpeed, R
        return
    }
    else
        return
}
return

WatchJoyZ:
GetKeyState, JoyZ, %JoystickNumber%JoyZ
KeyToHoldDownPrevz := KeyToHoldDownz
if (JoyZ > 70)
{
    if GetKeyState(JoystickPrefix . 4) 
        KeyToHoldDownz := "7"
    else 
        KeyToHoldDownz := "3"
}
else
    KeyToHoldDownz := ""
if (KeyToHoldDownz = KeyToHoldDownPrevz)
    return
SetKeyDelay -1
if KeyToHoldDownPrevz
    Send, {%KeyToHoldDownPrevz% up}
if KeyToHoldDownz
    Send, {%KeyToHoldDownz% down}
return

WatchJoyR:
GetKeyState, JoyR, %JoystickNumber%JoyR
KeyToHoldDownPrevr := KeyToHoldDownr
if (JoyR > 70)
{
    if GetKeyState(JoystickPrefix . 4) 
        KeyToHoldDownr := "9"
    else 
        KeyToHoldDownr := "5"
}
else
    KeyToHoldDownr := ""
if (KeyToHoldDownr = KeyToHoldDownPrevr)
    return
SetKeyDelay -1
if KeyToHoldDownPrevr
    Send, {%KeyToHoldDownPrevr% up}
if KeyToHoldDownr
    Send, {%KeyToHoldDownr% down}
return


WatchJoyP:
GetKeyState, joyPOV, %JoystickNumber%JoyPOV
if (JoyPOV = -1)
    return
if (JoyPOV = 0)
{
    if GetKeyState(JoystickPrefix . 4)
        Send {k}
}
else if (JoyPOV = 27000)
    Send {F4}
else if (JoyPOV = 9000)
    Send {y}
else if (JoyPOV = 18000)
{
    if GetKeyState(JoystickPrefix . 4)
        Send {F5}
    else
        SendInput {Click 1840, 100}
}
return