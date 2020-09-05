/*
    recognize the top of the first item's number.
    best optimized.
*/

all_in := 1
click_speed := 332
;scan_speed := 212
scan_speed := 300
click_count := 0

^!b::
; Single Search
loop{
SetMouseDelay, -1
SendInput {Click 376,510}
StartTime := A_TickCount
Sleep, scan_speed
PixelSearch, P1x, P1y, 830, 405, 834, 413, 0x7ab42b, , Fast

if (P1x != ""){
    SendInput {Click 830, 408}
    Sleep, 122
    SendInput {Click 803, 413}
    Sleep, 42
    SendInput {Click 970, 788}
    Sleep, 42
    SendInput {Click 1291, 786}
    if (all_in = 0)
        break
    click_count := click_count + 1
    ;following is for rec.
    Sleep, 500
    PixelGetColor, isRec1, 1492, 187
    PixelGetColor, isRec2, 1032, 394
    if (isRec2 = 0xB1C1C4)
        SendInput {Click 1291, 786}
    if (isRec1 = 0xFFFFFF){
        SendInput {Click 970, 788}
        Sleep, 120
        SendInput {Click 1291, 786}
    }
}

if (GetKeyState("b") && GetKeyState("NumpadEnd"))
    break
Sleep, %click_speed%
ElapsedTime := A_TickCount - StartTime
ToolTip, %click_count% %ElapsedTime%, 791, 129
}
return