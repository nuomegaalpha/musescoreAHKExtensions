#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
#IfWinActive ahk_exe S:\MuseScore 3.6 portable\MuseScorePortable\App\MuseScore\bin\MuseScore3.exe	; Enables Hotkeys when MuseScore3 Window is Active
#Include Coordinates.ahk	; All coordinates are managed in this external file
				; The Include directive causes the script to behave as though
				; the specified file's contents are present at this exact position

; Replace the path S:\etc. with your location of MuseScore3.exe
; to use a bit less memory you could outcomment the #Include directive and enter the value of
; ToolT_F10_X here:
; ToolT_F10_X := xxxx

; ~CapsLock & t:: Change Score Status to Concert Pitch
; ~CapsLock & c:: Change Score Status to Transposed Pitch


; Define unassigned MSc shortcut for 'Display Concert Pitch' (toggle): used here: Alt+Shift+C
; A tooltip makes the toolbar "Concert Pitch" superfluous. This can save Canvas Real Estate.
; The macro is rather simplistic: a tooltip reminds you of the score status.
; After startup you'll have to verify the score status once yourself.

~[ & F10::
CoordMode, Tooltip, Screen
Tooltip, F10  Score Status active!, ToolT_F10_X, 0, 1

SetTimer, RemoveToolTip, -2000
	Return
RemoveToolTip:
ToolTip, , , , 1
MsgBox, 4132 , F10: Score Status,
(
INFO			[ + 0

Is the score now displayed in Transposed Pitch?
)
IfMsgBox, No
{
    Tooltip, F10  Concert Pitch, ToolT_F10_X, 0, 2
    Return
}
IfMsgBox, Yes
{
    Tooltip, F10  Transposed ₮r, ToolT_F10_X, 0, 2
    Return
}
Return

~] & F10::
MsgBox, 4132, Score Status, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 0::
MsgBox, 4096 , Score Status      [ + 0,
(
Change to Concert Pitch		\ + C
Change to Transposed Pitch	\ + T
)
Return

~\ & c::
CoordMode, Tooltip, Screen
MsgBox, 4132, F10: Change Score Status to Concert Pitch,
(
Is the score now displayed in Transposed Pitch?
)
IfMsgBox, No
    Return
Send !+c
Tooltip, F10  Concert Pitch, ToolT_F10_X, 0, 2
Return

~\ & t::
CoordMode, Tooltip, Screen
MsgBox, 4132, F10: Change Score Status to Transposed Pitch,
(
Is the score now displayed in Concert Pitch?
)
IfMsgBox, No
    Return
Else
Send !+c
Tooltip, F10  Transposed ₮r, ToolT_F10_X, 0, 2
Return

