#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
#IfWinActive ahk_exe MuseScore3.exe	; Enables Hotkeys when MuseScore3 Window is Active
#Include, %A_ScriptDir%\lib\musescore function list.ahk
#Include, %A_ScriptDir%\lib\infoShortcuts.ahk
Menu, Tray, Icon, %A_ScriptDir%\lib\PaletteIconv3.ico


~^RButton::			; selects all similar elements in range selection
selectAllSimilarElements()
return

; ------------------------------Prune Stack--------------------------

NumpadSub:: ;opens prune stack
Send, ^+!u
global PSInitX :=
global PSInity :=
MouseGetPos, PSInitX, PSInitY
return

#IfWinActive ahk_class Qt5QWindowOwnDCIcon

Numpad1:: ;clicks 1
PruneStack("272", "350")
return

Numpad2:: ;clicks 2
PruneStack("272", "260")
return

Numpad3:: ;clicks 3
PruneStack("272", "200")
return

Numpad4:: ;clicks 4
PruneStack("272", "150")
return

Numpad5:: ;clicks 5
PruneStack("410", "350")
return

Numpad6:: ;clicks 6
PruneStack("410", "260")
return

Numpad7:: ;clicks 7
PruneStack("410", "200")
return

Numpad8:: ;clicks 8
PruneStack("410", "150")
return

NumpadEnter:: ;clicks enter
PruneStack("1000", "170")
WinActivate, ahk_exe MuseScore3.exe
MouseMove, PSInitX, PSInitY
return

Numpad0:: ;clicks close
PruneStack("1000", "740")
WinActivate, ahk_exe MuseScore3.exe
MouseMove, PSInitX, PSInitY
return

#If

~z & a::
MouseGetPos, StartX, StartY			; position of mouse, horizontally, vertically, needed for positioning of InputBox variant, which is relative to mouseposition
global PaletteSymbol :=
InputBox, PaletteSymbol, Apply Symbols from Palette, , , 264, 100, StartX-=0, StartY-=0, , , Help = Questionmark	;  (*change?*) here the InputBox is positioned near the mouse
If ErrorLevel					; when Cancel is pressed
    Return

Else If (PaletteSymbol = "exit")
MsgBox, 4132, Apply Symbols from Palette, Are you sure you want to exit?
IfMsgBox, Yes
{
    ExitApp
    Return
}

Else If (PaletteSymbol = "Help = Questionmark")
    Return

Else If (PaletteSymbol = "")
    Return

Else If (PaletteSymbol = "parts") {
    generateAllParts()
    return
}

Else If PaletteSymbol Contains break
{
    sysBreakArray := StrSplit(PaletteSymbol, ".", " `t")
    global breakNumber := sysBreakArray[2]
    if (breakNumber = "remove") {
        systemBreaks("remove", "")
        return
    }

    else {
        systemBreaks("add", breakNumber)
        return
    }
}
    

Else If PaletteSymbol Contains rhy
{
    rhyPatternArray := StrSplit(PaletteSymbol, ".", " `t")
    global duration := rhyPatternArray[2]
    global numberOfRepeats := rhyPatternArray[3]
    ; If (numberOfRepeats > 16) {
    ;     MsgBox, 4132, Add Repeated Rhythm, Are you sure you want to add more than 16 notes?

    ; }
    repeatedNotes(duration, numberOfRepeats)
    return
}

Else If PaletteSymbol Contains style
{
    styleArray := StrSplit(PaletteSymbol, ".", " `t")
    styleFunctionType := styleArray[2]
    if (styleFunctionType = "new") {
        global path := defineStyleFile()
        loadStyle(path)
        return
    }
    else {
        loadStyle(path)
        return
    }
}

Else If PaletteSymbol in ?,?a,?ag,?b,?bl,?bp,?br,?bs,?c,?d,?f,?fd,?fm,?g,?gn,?h,?i,?k,?ks,?l,?m
,?n,?nh,?o,?p,?q,?r,?rj,?t,?tr,?ts,?u,?v,?w,?x,?z,?[

Goto, InfoShortcuts				; skip entering symbols and go to last part of script

Else {                          ; this is the actual add to palette part
    IniRead, sendToPalette, C:\Users\noahm\Desktop\AutoHotKey Scripts\musescore\lib\palettelist.ini, section1, %PaletteSymbol%
    If (sendToPalette = "ERROR") {          ; if can't find sendToPalette, check section2 where new info is stored
        IniRead, sendToPalette, C:\Users\noahm\Desktop\AutoHotKey Scripts\musescore\lib\palettelist.ini, section2, %PaletteSymbol%
        IniRead, paletteItemDefintion, C:\Users\noahm\Desktop\AutoHotKey Scripts\musescore\lib\paletteDefintions.ini, section2, %PaletteSymbol% ;   this section searches section2
    }
    Else {                                  ; else (ie sendToPalette is not ERROR) searches for defintion in section1
        IniRead, paletteItemDefintion, C:\Users\noahm\Desktop\AutoHotKey Scripts\musescore\lib\paletteDefintions.ini, section1, %PaletteSymbol%
    }
    insertPaletteItem(sendToPalette, paletteItemDefintion)
    return
}
