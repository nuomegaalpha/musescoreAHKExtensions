#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
Menu, Tray, Icon, %A_ScriptDir%\lib\PaletteIconv3.ico


pruneStack(posX, posY) {
    MouseGetPos, PSStartX, PSStartY
    Sleep, 50
    Click, %posX%, %posY%
    Sleep, 50
    MouseMove, PSStartX, PSStartY
    return
}


insertPaletteItem(paletteCode, itemName, toolTipTime, IPE_delay) {
	ToolTip, %itemName%
	Send, ^{F9}
	Sleep, %IPE_delay%
	Send, ^a
	Sleep, %IPE_delay%
	Send, %paletteCode%
	Send, ^!p
	SetTimer, RemoveToolTip, %toolTipTime%
	return
}

nativeArticulation(keyName, articulationName) {
	ToolTip, %ArticulationName%
	Send, +%keyName%
	SetTimer, RemoveToolTip, 700
	return
}

flipVoices(varFlip) {
    Send, !t
    Send, v
    If (varFlip = "1-2") {
        ToolTip, Flip Voices 1 and 2
        SetTimer, RemoveToolTip, 700
        Send, {Enter} 
    }
    Else If (varFlip = "1-3") {
        ToolTip, Flip Voices 1 and 3
        SetTimer, RemoveToolTip, 700
        Send, {Down}
        Send, {Enter}
    }
    Else If (varFlip = "1-4") {
        ToolTip, Flip Voices 1 and 4
        SetTimer, RemoveToolTip, 700
        Send, {Down 2}
        Send, {Enter}
    }
    Else If (varFlip = "2-3") {
        ToolTip, Flip Voices 2 and 3
        SetTimer, RemoveToolTip, 700
        Send, {Down 3}
        Send, {Enter}
    }
    Else If (varFlip = "2-4") {
        ToolTip, Flip Voices 2 and 4
        SetTimer, RemoveToolTip, 700
        Send, {Down 4}
        Send, {Enter}
    }
    Else If (varFlip = "3-4") {
        ToolTip, Flip Voices 3 and 4
        SetTimer, RemoveToolTip, 700
        Send, {Down 5}
        Send, {Enter}
    }
    return
}

slashNotation(slashType) {
    Send, !t
    Send, {Down 7}
    If (slashType = "area") {
        Send, {Enter}
    }
    Else If (slashType = "rhythm") || (slashType = "rhy") {
        Send, {Down}
        Send, {Enter}
    }
    return
}

systemBreaks(sysType, systemNumber) {
    Send, !o
    Send, {down 2}
    Send, {Enter}
    Sleep, 200
    If (sysType = "add") {
        Send, {Tab}
        Send, %systemNumber%
        Send, {Enter}
    }
    Else If (sysType = "remove") {
        Send, {Down 2}
        Send, {Enter}
    }
    return
}

extendSlur(esType) {
    if (eSType = "forward") {
        Send, ^+{Right}
    }
    if (eSType = "backwards") {
        Send, ^+{Left}
    }
    return
}

repeatedNotes(duration, numberOfRepeats, RP_hotkey) {
    If (numberOfRepeats > 16)
    {
        MsgBox, 4, Warning, Are you sure you want to add more than 16 notes?
        IfMsgBox, Yes
        {
            Send, %RP_hotkey%           ;enter rhythm entry mode
            If (duration = "16") || (duration = "s") {
                duration := 3
            }
            Else If (duration = "8") || (duration = "e") {
                duration := 4
            }
            Else If (duration = "4") || (duration = "q") {
                duration := 5
            }
            Else If (duration = "2") || (duration = "h") {
                duration := 6
            }
            Else If (duration = "1") || (duration = "w") {
                duration := 7
            }
            Loop, %numberOfRepeats% {
                Send, %duration%
                Sleep, 50
            }
            Send, {Esc}
            return
        }
        Else
        {
            return
        }
    }
    Send, %RP_hotkey%           ;enter rhythm entry mode
    If (duration = "16") || (duration = "s") {
        duration := 3
    }
    Else If (duration = "8") || (duration = "e") {
        duration := 4
    }
    Else If (duration = "4") || (duration = "q") {
        duration := 5
    }
    Else If (duration = "2") || (duration = "h") {
        duration := 6
    }
    Else If (duration = "1") || (duration = "w") {
        duration := 7
    }
    Loop, %numberOfRepeats% {
        Send, %duration%
        Sleep, 50
    }
    Send, {Esc}
    return
}

selectAllSimilarElements() {
    Click, right			; executing each line takes about 30 ms
    Sleep, 30			; additional sleeptime increases stability
    Send {down 6}
    Sleep, 30			; important!
    Send {right}
    Sleep, 30			; increase sleeptime if needed
    Send {down 2}
    Sleep, 30
    Send {Enter}			; OK
    return
}

defineStyleFile(root) {
    FileSelectFile, stylePath, S, %root%, Select Style File, *.mss
    return stylePath
}

loadStyle(styleFilePath) {
    Send, !o
    Send, {Down 7}
    Send, {Enter}
    Sleep, 100
    Send, %styleFilePath%
    Sleep, 100
    Send, {Enter}
    return
}

generateAllParts() {
    Send, !f
    Send, {down 12}
    Send, {Enter}
    Sleep, 100
    Send, {Tab}
    Send, {Enter}
    Sleep, 100
    Send, {Tab 7}
    Sleep, 50
    Send, {Enter}
    return
}

; newPaletteItem() {
;     InputBox, newPaletteCall, Enter New Palette Calling Code, , , 264, 100, , , , ,eg. qt
;     IniRead, doesItemAlreadyExist, C:\Users\noahm\Desktop\AutoHotKey Scripts\musescore\lib\palettelist.ini, section1, %newPaletteCall%
;     If (doesItemAlreadyExist != "ERROR") {
;         MsgBox, The palette calling code you have chosen already exists. Please choose a different one.  The program will exit.
;         return
;     }
;     Else {
;         return
;     }
    
;     return
; }


RemoveToolTip:
ToolTip,
return