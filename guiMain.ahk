#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
SetBatchLines, -1
; #Include, %A_ScriptDir%\lib_old\musescore function list.ahk
; #Include, %A_ScriptDir%\lib_old\infoShortcuts.ahk
; #Include, %A_ScriptDir%\classes\class_ind_palette.ahk
; #Include, %A_ScriptDir%\classes\class_ind_meta.ahk

PALETTE := New palette
; META := New meta

width := 500
height := 60
; xPos := A_ScreenWidth / 50
xPos := 0
; yPos := A_ScreenHeight - (A_ScreenHeight / 9)
yPos := 1890
font := "Source Code Pro"
fontSize := 10
colorWhite := "e6e6e6"
colorBlack := "2C2C2C"
colorBlue := "2a9eeb"
colorRed := "e03445"
textHeight := 15

Gui, New, +AlwaysOnTop +Border -Caption -SysMenu +ToolWindow
Gui, Show, Center W%width% H%height% X%xPos% Y%yPos%
Gui, Color, %colorBlack%, %colorBlack% 
Gui, Font, c%colorWhite% s%fontSize% w400, %font% ;this W is weight, stupidly

; draws a > in front of text box
Gui, Add, Text, Y0 X5, >

; creates the editing line
Gui, Font, c%colorBlue% s%fontSize% w400, %font% ;this W is weight, stupidly
Gui, Add, Edit, vEditData gOnSubmit W%width% H%textHeight% X15 Y0 -E0x200 +Lowercase -WantReturn ; this W is width; -E0x200 gets rid of border 

; creates the text line for error messages etc
Gui, Font, c%colorWhite% s%fontSize% w400, %font% ;this W is weight, stupidly
Gui, Add, Text, W%width% H%textHeight% vLineTwo X15 Y20 ; this W is width; -E0x200 gets rid of border 

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
    code := PALETTE.getCode(EditData)
    definition := PALETTE.getDefinition(EditData)
    PALETTE.add(code, definition, 1200, 50)
    GuiControl,, EditData
    If (code = "ERROR") {
        Gui, Font, c%colorRed% s%fontSize% w400, %font% ;this W is weight, stupidly
        GuiControl, Font, LineTwo
        GuiControl,, LineTwo, Error. Could not find Palette Item "%EditData%"
        WinActivate, ahk_exe MuseScore3.exe
        return   
    }
    Else {
        Gui, Font, c%colorWhite% s%fontSize% w400, %font% ;this W is weight, stupidly
        GuiControl, Font, LineTwo
        GuiControl,, LineTwo, Added %definition% to score.
        WinActivate, ahk_exe MuseScore3.exe
        return
    }
}
#If

; insertPaletteItem(input, toolTipTime, IPE_delay) {
;     WinActivate, ahk_exe MuseScore3.exe
;     IniRead, paletteCode, %A_ScriptDir%\lib_old\paletteList.ini, section1, %input%
;     IniRead, paletteItemDefintion, %A_ScriptDir%\lib_old\paletteDefintions.ini, section1, %input%

;     ToolTip, %paletteItemDefintion%
; 	Send, ^{F9}
; 	Sleep, %IPE_delay%
; 	Send, ^a
; 	Sleep, %IPE_delay%
; 	Send, %paletteCode%
; 	Send, ^!p
; 	SetTimer, RemoveToolTip, %toolTipTime%
; 	return
; }

RemoveToolTip:
ToolTip,
return


class palette {
    add(paletteCode, itemName, toolTipTime, delay) {
        WinActivate, ahk_exe MuseScore3.exe
        ToolTip, %itemName%
        Send, ^{F9}
        Sleep, %delay%
        Send, ^a
        Sleep, %delay%
        Send, %paletteCode%
        Send, ^!p
        SetTimer, RemoveToolTip, %toolTipTime%
        return
    }

    getCode(input) {        ; change path!
        IniRead, sendToPalette, C:\Users\noahm\Desktop\GitHub\musescoreAHKExtensions\lib\palettelist.ini, section1, %input%
        return sendToPalette 
    }

    getDefinition(input) {        ; change path!
        IniRead, paletteDefinition, C:\Users\noahm\Desktop\GitHub\musescoreAHKExtensions\lib\paletteDefintions.ini, section1, %input%
        return paletteDefinition
    }
}