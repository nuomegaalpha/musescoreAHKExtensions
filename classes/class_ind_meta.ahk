#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
SetBatchLines, -1

class meta {
    parse(input) {
        ; returns 1 for palette
        ; returns 2 for command
        If input contains ":" ; ie a command
        {
            return 2
        }
        Else
        {
            return 1
        }
    }

}