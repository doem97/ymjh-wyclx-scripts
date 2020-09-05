/*
    recognize top of 6 item's number.
*/

all_in := 1
click_speed := 250
scan_wait := 300
click_count := 0

^!b::
; multi Search
loop{
SetMouseDelay, -1
SendInput {Click 376,510}
StartTime := A_TickCount
Sleep, scan_wait
PixelSearch, P1x, P1y, 830, 405, 834, 413, 0x7ab42b, , Fast
PixelSearch, P2x, P2y, 1304, 405, 1308, 413, 0x7ab42b, , Fast
PixelSearch, P3x, P3y, 830, 558, 834, 564, 0x7ab42b, , Fast
PixelSearch, P4x, P4y, 1304, 558, 1308, 564, 0x7ab42b, , Fast
PixelSearch, P5x, P5y, 830, 708, 834, 714, 0x7ab42b, , Fast
PixelSearch, P6x, P6y, 1304, 708, 1308, 714, 0x7ab42b, , Fast

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
    Sleep, 200
    PixelGetColor, isRec, 1032, 394
    if (isRec = 0xB1C1C4)
        SendInput {Click 1291, 786}
}
else if (P2x != ""){
    SendInput {Click 1304, 408}
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
    Sleep, 200
    PixelGetColor, isRec, 1032, 394
    if (isRec = 0xB1C1C4)
        SendInput {Click 1291, 786}
}
else if (P3x != ""){
    SendInput {Click 830, 560}
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
    Sleep, 200
    PixelGetColor, isRec, 1032, 394
    if (isRec = 0xB1C1C4)
        SendInput {Click 1291, 786}
}
else if (P4x != ""){
    SendInput {Click 1304, 560}
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
    Sleep, 200
    PixelGetColor, isRec, 1032, 394
    if (isRec = 0xB1C1C4)
        SendInput {Click 1291, 786}
}
else if (P5x != ""){
    SendInput {Click 830, 710}
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
    Sleep, 200
    PixelGetColor, isRec, 1032, 394
    if (isRec = 0xB1C1C4)
        SendInput {Click 1291, 786}
}
else if (P6x != ""){
    SendInput {Click 1304, 710}
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
    Sleep, 200
    PixelGetColor, isRec, 1032, 394
    if (isRec = 0xB1C1C4)
        SendInput {Click 1291, 786}
}
if (GetKeyState("b") && GetKeyState("NumpadEnd"))
    break
Sleep, click_speed
ElapsedTime := A_TickCount - StartTime
ToolTip, %click_count% %ElapsedTime%, 791, 129
}
return