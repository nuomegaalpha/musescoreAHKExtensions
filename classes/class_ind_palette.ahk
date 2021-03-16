#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
SetBatchLines, -1

class palette extends meta{
    add(paletteCode, itemName, toolTipTime, delay) {
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

    getCode(PaletteSymbol) {        ; change path!
        IniRead, sendToPalette, C:\Users\noahm\Desktop\GitHub\musescoreAHKExtensions\v2\lib\paletteList.ini, section1, %PaletteSymbol%
        return sendToPalette 
    }

    getDefinition(PaletteSymbol) {        ; change path!
        IniRead, paletteDefinition, C:\Users\noahm\Desktop\GitHub\musescoreAHKExtensions\v2\lib\paletteDefintions.ini, section1, %PaletteSymbol%
        return paletteDefinition
    }
}


; RemoveToolTip:
; ToolTip,
; return