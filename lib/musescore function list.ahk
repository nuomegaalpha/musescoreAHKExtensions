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
    Send, ^+!p
    Sleep, 500
    Send, {Tab}
    Send, {Enter}
    Sleep, 500
    Send, {Tab 7}
    Sleep, 50
    Send, {Enter}
    return
}

rhythmBlocks(pattern){
    Send, !n
    Send, {Esc}
    Send, ^+i
    ; -------------------------single notes-------------------
    if (pattern = "note-t") {
        Send, 2
    }
    else if (pattern = "note-s") {
        Send, 3
    }
    else if (pattern = "note-e") {
        Send, 4
    }
    else if (pattern = "note-q") {
        Send, 5
    }
    else if (pattern = "note-h") {
        Send, 6
    }
    else if (pattern = "note-w") {
        Send, 7
    }

    ; -----------------------dotted notes-------------------
    else if (pattern = "note-dt") {
        Send, .2.
    }
    else if (pattern = "note-ds") {
        Send, .3.
    }
    else if (pattern = "note-de") {
        Send, .4.
    }
    else if (pattern = "note-dq") {
        Send, .5.
    }
    else if (pattern = "note-dh") {
        Send, .6.
    }
    else if (pattern = "note-dw") {
        Send, .7.
    }
    ;-------------------- rests---------------------
    else if (pattern = "rest-t") {
        Send, 020
    }
    else if (pattern = "rest-s") {
        Send, 030
    }
    else if (pattern = "rest-e") {
        Send, 040
    }
    else if (pattern = "rest-q") {
        Send, 050
    }
    else if (pattern = "rest-h") {
        Send, 060
    }
    else if (pattern = "rest-w") {
        Send, 070
    }
    ; ------------------------groups-------------------------
    else if (pattern = "ee") {
        Send, 44
    }
    else if (pattern = "ess") {
        Send, 433
    }
    else if (pattern = "ree") {
        Send, 0404
    }
    else if (pattern = "ress") {
        Send, 04033
    }
    else if (pattern = "ssss") {
        Send, 3333
    }
    else if (pattern = "sse") {
        Send, 334
    }
    else if (pattern = "ses") {
        Send, 343
    }
    else if (pattern = "sde") {
        Send, 3.4.
    }
    else if (pattern = "des") {
        Send, .4.3
    }
    else if (pattern = "3eee") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, 444
    }
    else if (pattern = "3eree") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, 40404
    }
    else if (pattern = "3qe") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, 54
    }
    else if (pattern = "3reee") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, 04044
    }
    else if (pattern = "3dese") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, .4.34
    }
    else if (pattern = "5sssss") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^5
        Sleep, 50
        Send, 33333
    }
    else if (pattern = "6ssssss") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^6
        Sleep, 50
        Send, 333333
    }
    else if (pattern = "7sssssss") {
        Send, {Esc}
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^7
        Sleep, 50
        Send, 3333333
    }
    else if (pattern = "e3sss") {
        Send, {Esc}
        Sleep, 100
        Send, 4
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, 4
        Sleep, 50
        Send, ^3
        Sleep, 50
        Send, 333
    }
    else if (pattern = "3ssse") {
        Send, {Esc}
        Sleep, 100
        Send, 4
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, 333
        Send, 4
    }
    else if (pattern = "re3sss") {
        Send, {Esc}
        Sleep, 100
        Send, 4
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, 040
        Sleep, 50
        Send, ^3
        Sleep, 50
        Send, 333
    }
    else if (pattern = "3sssre") {
        Send, {Esc}
        Sleep, 100
        Send, 4
        Sleep, 100
        Send, ^+i
        Sleep, 100
        Send, ^3
        Sleep, 50
        Send, 333
        Send, 040
    }
    Send, {Right}
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