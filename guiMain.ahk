#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
; #Include, %A_ScriptDir%\lib_old\musescore function list.ahk
; #Include, %A_ScriptDir%\lib_old\infoShortcuts.ahk

; loop {
;     MouseGetPos, x1, y1
;     PixelGetColor, col, x1, y1
;     ToolTip, %col%, x1 + 50, y1 + 50
;     Sleep, 50
; }

width := 300
height := 30
; xPos := A_ScreenWidth / 50
xPos := 0
; yPos := A_ScreenHeight - (A_ScreenHeight / 9)
yPos := 1980
font := "Segoe UI"
fontSize := 11
textColor := "e6e6e6"
backgroundColor := "2C2C2C"

Gui, New, +AlwaysOnTop +Border -Caption -SysMenu +ToolWindow
Gui, Show, Center W%width% H%height% X%xPos% Y%yPos%
Gui, Color, %backgroundColor%, %backgroundColor% 
Gui, Font, c%textColor% s%fontSize% w400, %font% ;this W is weight, stupidly

; draws a > in front of text box
Gui, Add, Text, Y0 X5, >

textHeight := height - 5
Gui, Font, c3ecce6 s%fontSize% w700, %font% ;this W is weight, stupidly
Gui, Add, Edit, vEditData gOnSubmit W%width% H%textHeight% X15 Y0 -E0x200 +Lowercase -WantReturn ; this W is width; -E0x200 gets rid of border 

#WinActivateForce

~z & a::
WinActivate, ahk_class AutoHotkeyGUI
; Gui, Show, Restore        ; I couldn't get the Gui controls to work reliably
; GuiControl, Focus, Edit1
Sleep, 20
ControlClick, Edit1, ahk_class AutoHotkeyGUI
return


#IfWinActive, ahk_class AutoHotKeyGUI

OnSubmit:
len = StrLen(EditData)
if (len > 0) {
    KeyWait, Enter, D
    Gui, Submit, NoHide
    insertPaletteItem(EditData, 1200, 50)
    GuiControl,, EditData
    WinActivate, ahk_exe MuseScore3.exe
    return
}
#If

insertPaletteItem(input, toolTipTime, IPE_delay) {
    WinActivate, ahk_exe MuseScore3.exe
    IniRead, paletteCode, %A_ScriptDir%\lib_old\paletteList.ini, section1, %input%
    IniRead, paletteItemDefintion, %A_ScriptDir%\lib_old\paletteDefintions.ini, section1, %input%

    ToolTip, %paletteItemDefintion%
	Send, ^{F9}
	Sleep, %IPE_delay%
	Send, ^a
	Sleep, %IPE_delay%
	Send, %paletteCode%
	Send, ^!p
	SetTimer, RemoveToolTip, %toolTipTime%
	return
}

RemoveToolTip:
ToolTip,
return