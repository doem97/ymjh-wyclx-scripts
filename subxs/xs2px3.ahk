/*
    recognize the first square's x3 symbol
    (No matter it is TIE or not)
*/

scan_wait := 80
click_count := 0
blank_count := 0

^!x::
loop{
SetMouseDelay, -1
SendInput {Click 1500,238}
StartTime := A_TickCount
Sleep, scan_wait
;PixelSearch, Px, Py, 679, 617, 680, 621, 0x304250, , Fast ;third xuanshang box number
;PixelSearch, Px, Py, 661, 617, 663, 621, 0x304250, , Fast ;second xuanshang box number
PixelGetColor, Px, 922, 445 ; 1st xuanshang square's x3 symbol
if (Px = 0xffffff || Px = 0xfffffe){
;if (Px != ""){
    SendInput {Click 899, 785}
    Sleep, 32
    SendInput {Click 1307,780}
    click_count := click_count + 1
    ElapsedTime := A_TickCount - StartTime
    ToolTip, %click_count% %blank_count% %ElapsedTime%, 791, 129
    ;Sleep, 100
    ;PixelGetColor, jiequ, 605, 511
    ;if (jiequ = 0x000000) 
	break
    ;else
    ;    continue
}
else blank_count := blank_count + 1
if (GetKeyState("x") && GetKeyState("NumpadEnd"))
    break
ElapsedTime := A_TickCount - StartTime
ToolTip, %click_count% %blank_count% %ElapsedTime%, 791, 129
}
ExitApp