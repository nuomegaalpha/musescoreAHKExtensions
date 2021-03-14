; #NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  				; Enable warnings to assist with detecting common errors.
; SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
#IfWinActive ahk_exe MuseScore3.exe	; Enables Hotkeys when MuseScore3 Window is Active
#Include, %A_ScriptDir%\lib\musescore function list.ahk
#Include, %A_ScriptDir%\lib\infoShortcuts.ahk

Menu, Tray, Icon, %A_ScriptDir%\lib\PaletteIconv3.ico


^+0::
WinMenuSelectItem, ahk_exe MuseScore3.exe, , &File, Open...
return

~^RButton::			; selects all similar elements in range selection
selectAllSimilarElements()
return

; ------------------------------Prune Stack--------------------------

NumpadSub:: ;opens prune stack
Send, ^+!u
MouseGetPos, PSInitX, PSInitY
#Include, %A_ScriptDir%\lib\variables.ahk
return

#IfWinActive ahk_class Qt5QWindowOwnDCIcon

Numpad1:: ;clicks 1
pruneStack(pruneStack_Click1_X, pruneStack_Click1_Y)
return

Numpad2:: ;clicks 2
pruneStack(pruneStack_Click2_X, pruneStack_Click2_Y)
return

Numpad3:: ;clicks 3
pruneStack(pruneStack_Click3_X, pruneStack_Click3_Y)
return

Numpad4:: ;clicks 4
pruneStack(pruneStack_Click4_X, pruneStack_Click4_Y)
return

Numpad5:: ;clicks 5
pruneStack(pruneStack_Click5_X, pruneStack_Click5_Y)
return

Numpad6:: ;clicks 6
pruneStack(pruneStack_Click6_X, pruneStack_Click6_Y)
return

Numpad7:: ;clicks 7
pruneStack(pruneStack_Click7_X, pruneStack_Click7_Y)
return

Numpad8:: ;clicks 8
pruneStack(pruneStack_Click8_X, pruneStack_Click8_Y)
return

NumpadEnter:: ;clicks enter
pruneStack(pruneStack_ClickEnter_X, pruneStack_ClickEnter_Y)
WinActivate, ahk_exe MuseScore3.exe
MouseMove, PSInitX, PSInitY
return

Numpad0:: ;clicks close
pruneStack(pruneStack_ClickClose_X, pruneStack_ClickClose_Y)
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
    repeatedNotes(duration, numberOfRepeats, "^+i")
    return
}

Else If PaletteSymbol Contains flip
{
    flipArray := StrSplit(PaletteSymbol, ".", " `t")
    global varFlip := flipArray[2]
    StringReplace, varFlip, varFlip, ", , All
    flipVoices(varFlip)
    return
}

Else If PaletteSymbol Contains slash
{
    slashArray := StrSplit(PaletteSymbol, ".", " `t")
    global slashType := slashArray[2]
    slashNotation(slashType)
    return
}

Else If PaletteSymbol Contains sty
{
    styleArray := StrSplit(PaletteSymbol, ".", " `t")
    styleFunctionType := styleArray[2]
    if (styleFunctionType = "new") {
        global path := defineStyleFile("C:\Users\noahm\Documents\MuseScore3\Styles")
        MsgBox, % "The style file you selected is" . path
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
    IniRead, sendToPalette, %A_ScriptDir%\lib\paletteList.ini, section1, %PaletteSymbol%
    If (sendToPalette = "ERROR") {          ; if can't find sendToPalette, check section2 where new info is stored
        IniRead, sendToPalette, %A_ScriptDir%\lib\paletteList.ini, section2, %PaletteSymbol%
        IniRead, paletteItemDefintion, %A_ScriptDir%\lib\paletteDefintions.ini, section2, %PaletteSymbol% ;   this section searches section2
    }
    Else {                                  ; else (ie sendToPalette is not ERROR) searches for defintion in section1
        IniRead, paletteItemDefintion, %A_ScriptDir%\lib\paletteDefintions.ini, section1, %PaletteSymbol%
    }
    insertPaletteItem(sendToPalette, paletteItemDefintion, 1200, 50)
    return
}
