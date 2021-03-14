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

; Change the path S:\etc. to your location of MuseScore3.exe

CounterAVTS := 0
ToggleAVTS := 0					; Alternating Virtual Time Signatures


~[ & F5::
CoordMode, Tooltip, Screen
Tooltip, F5  Alt.Time Sigs., ToolT_F5_X, 0, 1	; tooltip (1) Alt.Time Sigs.
Return

~] & F5::
MsgBox, 4132, Alternating Time Signatures, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 5::
MsgBox, 4096, F5: Alternating Time Signatures      [ + 5,
(
Real Alternating Time Signatures 	Z + T
+ corresponding beaming patterns

Virtual Alternating Time Signatures	CapsLock + T
Variable number of beats
in actual measure duration

Set Beam Properties (loop)		Z + B
To change beaming patterns
)
Return

; ♣============================== CREATE ALTERNATING TIMESIGNATURES ===============================

; NB: MuseScore shortcut 'Apply current palette element': Ctrl+Alt+P
; NB: MuseScore shortcut Palette Search: Ctrl+F9

; creating TimeSigs is taxing the computer. The macro works most fast and stable in an empty system
; on the top staff while the other staves are invisible
; may be you have to increase sleeptimes for slower systems in lines marked (*change*?)
; in Alternating TimeSigs a colored note is created in the first measure as a point of reference
; when the first TimeSig is created MuseScore 3.5 loses focus or it's not predictable which element is selected.
; AHK finds the colored note and from there Alt+Left returns the cursor to the TimeSig and the loop can start
; ALTERNATING BEAMING PATTERNS - example
; this macro uses the Advanced AutoHotKey workspace to create the Time Signatures
; orignally posted in https://musescore.org/en/node/303798
; see the pdf info about 5/8 with alternating beaming patterns 2+3/8 resp. 3+2/8
; https://musescore.org/en/handbook/time-signatures#create-time-signature
; adding to the TimeSig Palette: https://musescore.org/en/handbook/palettes#custom-palettes
; as for all palette symbols: the name of the Time Sig must of course be unique 
; PM: rightclick the TimeSig to edit the name (here 2+3/8 resp. 3+2/8)
; the macro will send the name to the Palette Search
; NB1: the enriched workspace is one of the attachments belonging to the AHK Kit.
; NB2: when we send special signs like the + sign we have to use the Send {Raw} command
; for the details of this example see the lines containing 'Send {Raw}'

; Select a Rest - duration measure (whole measure rest)

~z & t::				; create alternating timesignatures (or only one Time Sig)
CoordMode, Mouse, Screen
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel				; if 'Inspector' is not in the correct spot
{
    MsgBox, 4112, Inspector Check, The Canvas is not in the defined state.`nThe macro will exit.
    Return
}
MsgBox, 4388, Alternating Time Signatures + Beaming Patterns,
(
Select a 'Rest Duration Measure' in voice 1.
A.k.a. 'whole measure rest'.
For a stable operation:
this macro works best in Page View
on an empty staff.
Preferably the highest one
with no other staves visible.
Would you like to continue?
)
IfMsgBox, No
    Return

ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest_Duration_Measure.png
If Errorlevel = 1
{
MsgBox, 4112, Startcondition, No Rest-Duration-Measure selected!`nThe macro will exit.
    Return
}
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
{
MsgBox, 4144, Searching the rest, Rest not found.`nMaybe this info screen covers the rest!`nThe macro will exit.
    Return
}
Click, %ElementX%, %ElementY%
MouseGetPos, StartX, StartY

InputBox, TimeSig, Alternating Time Signatures,
(
Enter one Time Signature or a Mix.
Separate each TS with a comma from the next one.
)
, , W_IB, H_IB, IB_X, IB_Y, , , e.g. 7/8  or 3/4,4/4,5/4  Help = ?	; (*change*?)
if ErrorLevel					; when Cancel is pressed
    Return

If InStr(TimeSig, "?")				; if there is a questionmark
{
MsgBox, 4097, Time Signatures,
(
Select a rest - duration measure

⁞	FOR		ENTER
⁞
⁞	2/4		  2/4
⁞	3/4		  3/4
⁞	4/4		  4/4
⁞	5/4		  5/4
⁞	6/4		  6/4
⁞	C		  C
⁞	₵		  2/2
⁞	3/2		  3/2
⁞	3/8		  3/8
⁞	2+3/8		  2+3/8
⁞	3+2/8		  3+2/8
⁞	6/8		  6/8
⁞	7/8		  7/8
⁞	9/8		  9/8
⁞	3+2+2+3/8	  3+2+2+3/8
⁞	12/8		  12/8

MIXED METRES - ALTERNATING TIME SIGNATURES

For reasons of stability:
Create the time signatures in an empty staff.
Preferably in Page View.
Create them in the highest staff.
Best at the start of a new piece.
And the other staves not visible.

In the InputBox you can enter any combination.
Separate the time signatures by a comma.

Example: 3/4,4/4,5/4

After the input of the combination you'll be asked
how many times the combination must be created.
)
IfMsgBox, Cancel
    Return

InputBox, TimeSig, Alternating Time Signatures,
(
Enter one Time Signature or a Mix.
Separate each TS with a comma from the next one.
)
, , W_IB, H_IB, IB_X, IB_Y, , , e.g. 5/4  or 3/4,4/4,5/4		; (*change*?)
if ErrorLevel				; when Cancel is pressed
    Return
}
If TimeSig in 2/4,3/4,4/4,5/4,6/4,3/8,6/8,7/8,9/8,12/8,c,2/2,3/2,2+3/8,3+2/8,3+2+2+3/8
{
Send ^{F9}				; MSc shortcut, Palette Search (Ctrl + F9)
Sleep, 100
If (TimeSig = "2/4")			; glyph 050, 2/4
    Send 2/4
If (TimeSig = "3/4")			; glyph 051, 3/4A
    Send 3/4
If (TimeSig = "4/4")			; glyph 052, 4/4
    Send 4/4-
If (TimeSig = "5/4")			; glyph 053, 5/4
    Send 5/4
If (TimeSig = "6/4")			; glyph 054, 6/4
    Send 6/4
If (TimeSig = "3/8")			; glyph 055, 3/8
    Send 3/8
If (TimeSig = "2+3/8")
    Send {Raw}2+3/8
If (TimeSig = "3+2/8")
    Send {Raw}3+2/8
If (TimeSig = "3+2+2+3/8")
    Send {Raw}3+2+2+3/8
If (TimeSig = "6/8")			; glyph 056, 6/8
    Send 6/8
If (TimeSig = "7/8")			; glyph 062, 7/8
    Send 7/8
If (TimeSig = "9/8")			; glyph 057, 9/8
    Send 9/8
If (TimeSig = "12/8")			; glyph 058, 12/8
    Send 12/8
If (TimeSig = "c")			; glyph 059, C 4/4
    Send c4/4
If (TimeSig = "2/2")			; glyph 060, ₵ 2/2
    Send 2/2
If (TimeSig = "3/2")			; glyph 061, 3/2
    Send 3/2

Sleep, 100
Send ^!p				; MSc user defined shortcut 'Apply current palette element'
Sleep, 400
Return
}
If InStr(TimeSig, "`,")				; if input has a comma
InputBox, RepetitionCombiTS, How many times?, , , W_IB, H_IB, IB_X, IB_Y, , , Input number	; (*change*?)
if ErrorLevel					; when Cancel is pressed
    Return
Tooltip, Select a Rest - duration measure.`nPress Z when ready, StartX, StartY - 100, 2	; position may be (*change*?)
Keywait, z, d
Tooltip, , , , 2			; close tooltip (2)
Send 5
Send a					; one quarter note created - pitch a
Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#ff00ff			; select color magenta 
Sleep, 50
Send {Enter}				; note "a" colored
Sleep, 200
; MsgBox, Note Colored?			; for testing

Loop, %RepetitionCombiTS%
{
Loop, Parse, TimeSig, `,
    {
    Send ^{F9}				; MSc shortcut, Palette Search (Ctrl + F9)
    Sleep, 100				; increase sleeptime for slower systems (*change*?)
    If (A_LoopField = "2/4")
        Send 2/4				; glyph 050, 2/4
    If (A_LoopField = "3/4")
        Send 3/4				; glyph 051, 3/4
    If (A_LoopField = "4/4")
        Send 4/4-				; glyph 052, 4/4
    If (A_LoopField = "5/4")
        Send 5/4				; glyph 053, 5/4
    If (A_LoopField = "6/4")
        Send 6/4				; glyph 054, 6/4
    If (A_LoopField = "3/8")
        Send 3/8				; glyph 055, 3/8
    If (A_LoopField = "2+3/8")
        Send {Raw}2+3/8
    If (A_LoopField = "3+2/8")
        Send {Raw}3+2/8
    If (A_LoopField = "3+2+2+3/8")
        Send {Raw}3+2+2+3/8
    If (A_LoopField = "6/8")
        Send 6/8				; glyph 056, 6/8
    If (A_LoopField = "7/8")
        Send 7/8				; glyph 062, 7/8
    If (A_LoopField = "9/8")
        Send 9/8				; glyph 057, 97/8
    If (A_LoopField = "12/8")
        Send 12/8				; glyph 058, 12/8
    If (A_LoopField = "c")
        Send C4/4				; glyph 059, C 4/4
    If (A_LoopField = "2/2")
        Send 2/2				; glyph 060, ₵ 2/2
    If (A_LoopField = "3/2")
        Send 3/2				; glyph 061, 3/2

    Send ^!p				; MSc user defined shortcut 'Apply current palette element'
    Sleep, 100				; increase sleeptime for slower systems (*change*?)
    If (RepetitionCombiTS = 1)		; create colored note on first pass
        {
        CoordMode, Mouse, Screen
        CoordMode, Pixel, Screen
        PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
        if ErrorLevel
            {
            MsgBox, 4112, Searching for the note, The colored note was not found.`nThe macro will exit
            Return
            }
        Click, %MagentaX%, %MagentaY%
        Send ^{right}
        Sleep, 50
        Send ^+{right}
        Sleep, 50
        Send ^+{left}			; second measure selected
        Sleep, 50
        Continue
        }
    If (RepetitionCombiTS > 1)		; after the first pass
        {
        Send !{left}			; to Time Sig
        Sleep, 50
        Send !{right}			; to whole measure rest
        Sleep, 50
        Send ^{right}			; to rest of next measure NM
        Sleep, 50
        Send ^+{right}			; range selection NM and NM+1
        Sleep, 50
        Send ^+{left}			; NM+1 selected
        Sleep, 50
        }
    }
}
Send n
PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Reset colored note, The colored note was not found.`nMaybe it is off screen.`nActivate macrogroup #1 and`nreset the note manually with Y + N.`nThe macro will exit
    Return
}
Click, %MagentaX%, %MagentaY%
Click, %IN_013_X%, %IN_013_Y%		; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
Sleep, 50
Click, %MagentaX%, %MagentaY%
Sleep, 50
Send ^+{right}				; select the start measure
Sleep, 50
Send {del}				; creates rest - (duration measure)
Return

; ♣=========================== ALTERNATING VIRTUAL TIME SIGNATURES ================================

; ALTERNATING INVISIBLE TIME SIGNATURES

; ALTERNATING INVISIBLE TIME SIGNATURES using Measure Properties
; start with choosing a Time Signature. All bars will have the same denominator.
; the macro makes the numerator of the second measure of the pairs one higher than that of the first.
; tip: when you repeat the macro starting on the same measure the length
; of the second measure of the pair will again increase with one beat.
; or for changes in bigger steps: remove the semicolon+space in line (2*) and or (3*)

#MaxThreadsPerHotkey, 2				; while loop runs it can be stopped by the same hotkey (second thread)
~CapsLock & t::
CounterAVTS+=1					; how many times CapsLock + T is pressed
CoordMode, Tooltip, Screen
ToggleAVTS := !ToggleAVTS
If (CounterAVTS = 1)				; only after the first press
{
    MsgBox, 4417, Alternating 'Virtual' Time Signatures,
(
Changes of the Actual Measure Duration

In these alternating pairs each second measure will get one beat more than the first.
Press OK and click the first beat of the measure where you want the alternation to start.

Press CapsLock + T again to stop the loop.
A tooltip at the position of F5 appears as a reminder.
)
    IfMsgBox, Cancel
        Return
    Tooltip, Press CapsLock + T again to stop the loop, ToolT_F5_X, 40, 3	; (*change*?)
    KeyWait, LButton, D
    Sleep, 30
    Click, up					; releases left mouse button
    Click, right
    Send {down 2}
    Send {Enter}				; to Window Measure Properties
    Sleep, 150
}
CoordMode, Mouse, Window
Loop
{
    If !ToggleAVTS				; after the second press of the hotkey
        break
    Click, %WMPP_03X%, %WMPP_03Y% 		; (WMPP_03) To next measure →
    Sleep, 50
    Click, %WMPP_01X%, %WMPP_01Y% 		; (WMPP_01) Duration Actual
    ; Send {down}				; creates duration with one beat less (1)
    Send {up}				; creates duration with one beat more (1)
    ; Send {up}				; creates duration with one beat more (2*)
    ; Send {up}				; creates duration with one beat more (3*)
    Sleep, 50
    Click, %WMPP_04X%, %WMPP_04Y% 		; (WMPP_04) Apply
    Sleep, 50
    Click, %WMPP_03X%, %WMPP_03Y% 		; (WMPP_03) To next measure →
    Sleep, 50
}
Tooltip, , , , 3				; close tooltip (3)
Click, %WMPP_05X%, %WMPP_05Y% 			; (WMPP_05) OK
If (CounterAVTS = 2)				; after second press of the hotkey
    CounterAVTS := 0				; reset counter hotkey press
CoordMode, Mouse, Screen
Return
#MaxThreadsPerHotkey, 1

; ♣============================== SET BEAM PROPERTIES ====================================

; the macro uses the Advanced AutoHotKey workspace

~z & b::					; Set Beam Property
BeamRange := 0
Send {Volume_Mute}				; Mute/unmute the master volume
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseGetPos, StartX, StartY
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If (ErrorLevel = 1)				; if 'Inspector' is not in the correct spot
{
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit.
    Send {Volume_Mute}				; Mute/unmute the master volume
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)
{
    BeamRange := 1
    Goto, SkipBeamNoteSearch
}
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Set Beam Property, Note not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
    Send {Volume_Mute}				; Mute/unmute the master volume
    Return
}
Click, %ElementX%, %ElementY%
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    MsgBox, 4144, Set Beam Property, No note selected!
    Send {Volume_Mute}				; Mute/unmute the master volume
    Return
}
SkipBeamNoteSearch:
Tooltip, Set Beam Property.`nHelp = ?`nPress Z to exit the macro.`nPress CapsLock to suspend the macro., ToolT_F5_X, 40, 4	;(*change*?)
Loop
{
    Input, Beaming, L1, {CapsLock}{Escape}{Enter}{Numpad4}{Numpad6}{Left}{Right}{Up}{Down}{PgUp}{PgDn}, 2,3,a,b,f,s,n,m,r,z,?
    If (ErrorLevel = "Max")
    {
        MsgBox, 4144, Set Beam Property, No valid command!
        Continue
    }
    If (ErrorLevel = "EndKey:CapsLock")
    {
        KeyWait, CapsLock, u
        Tooltip, You suspended the macro by pressing CapsLock.`nNow you can enter any MuseScore or AHK command.`n`nPress CapsLock again to return to the macro., ToolT_F5_X, 40, 5	;(*change*?)
        MouseGetPos, StartSel_X, StartSel_Y
        KeyWait, CapsLock, d
        KeyWait, CapsLock, u
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
        If (ErrorLevel = 0)
            BeamRange := 1
        Tooltip, , , , 5
    }
    If (ErrorLevel = "EndKey:Left")
        Send {left}
    If (ErrorLevel = "EndKey:Right")
        Send {right}
    If (ErrorLevel = "EndKey:Numpad4")
        Send ^{left}
    If (ErrorLevel = "EndKey:Numpad6")
        Send ^{right}
    If (ErrorLevel = "EndKey:Escape")
        Break
    If (Beaming = "z")
        Break
    If (ErrorLevel = "EndKey:Up")
        Send {up}
    If (ErrorLevel = "EndKey:Down")
        Send {down}
    If (ErrorLevel = "EndKey:PgUp")
        Send {PgUp}
    If (ErrorLevel = "EndKey:PgDn")
        Send {PgDn}
    If (ErrorLevel = "EndKey:Enter") and (BeamRange = 0)	; no search when range selected
    {
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        if ErrorLevel
        {
            MsgBox, 4144, Set Beam Property, Mousemove to note.`nNo note found!
            Continue
        }
        Click, %ElementX%, %ElementY%
    }
    If (Beaming = "?")
        MsgBox, 4096, Set Beam Property,
(
Select a note with the arrowkeys or the mouse.
Or select a range e.g. to unbeam all notes in one go.
Press the hotkey Z + B.
Range selection is also possible during the macro:
Pressing CapsLock will suspend all macro commands and
enable all MuseScore and AHK commands.
NB: Feathered beam commands don't work in a range.

Start a beam		B
No beam			N
Middle beam		M
Autobeam		A
Beam 16th sub		3
Beam 32nd sub		2
Feathered slower		S
Feathered faster		F
Reset feathered beam	R

Next note		Right
Previous note		Left
Next measure		Numpad 6  →
Previous  measure		Numpad 4  ←
Pitch down		Down
Pitch up			Up
Next Page		Page Down
Previous Page		Page Up
Mouse to selected note	Enter
Suspend macro		CapsLock
Back to macro		CapsLock
Exit macro		Escape	Z

During the loop sound is muted.
)
    If Beaming in f,s,r
    {
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        if ErrorLevel
        {
            MsgBox, 4144, Set Beam Property, No element found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
            Continue
        }
        Click, %ElementX%, %ElementY%		; position selected beamed note. NB: There is no check of 16th/32nd beam
        ImageSearch, , , IM_08_X1, IM_08_Y1, IM_08_X2, IM_08_Y2, *40 IM_08_Inspector_Select_Beam.png
        If (ErrorLevel = 1)			; if the image is not recognized
        {
            MsgBox, 4144, Feathered Beams,
(
The commands F, S and R can only be applied if a single
beamed note is selected. They will not work in a range.
Press Z if you want to exit the macro.

If you however want to continue setting beaming properties:
Press CapsLock to enable MuseScore and AHK commands.
With group #3 active press WIN + N to return to a note.
Press CapsLock again to enable the beam prop macro.
)
            Continue
        }
        Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
    }
    If (Beaming = "r")
    {
        Send ^{r}				; reset beam
        Click, %ElementX%, %ElementY%		; back to selected beamed note
        Continue
    }
    If Beaming in a,b,f,s,n,m,2,3
    {
        Send ^{F9}				; MSc shortcut, Palette Search (Ctrl + F9)
        Sleep, 100
        If (Beaming = "b")
            Send bp1-				; glyph 620, Start a beam
        If (Beaming = "m")
            Send bp2-				; glyph 621, Middle beam
        If (Beaming = "n")
            Send bp3-				; glyph 622, No beam
        If (Beaming = "3")
            Send bp4-				; glyph 623, Start second level beam - Beam 16th sub
        If (Beaming = "2")
            Send bp5-				; glyph 624, Start third level beam - Beam 32th sub
        If (Beaming = "a")
            Send bp6-				; glyph 625, Autobeam
        If (Beaming = "s")
            Send bp7-				; glyph 626, Feathered beam slower
        If (Beaming = "f")
            Send bp8-				; glyph 627, Feathered beam faster
        Sleep, 100
        Send ^!p				; MSc user defined shortcut 'Apply current palette element'
        Sleep, 200
        If (Beaming = "s") || (Beaming = "f")
            Click, %ElementX%, %ElementY%	; from beam back to note
        Continue
    }
}
Tooltip, , , , 4				; close tooltip (4)
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Finish Beaming Properties,
(
Nothing selected.

With macro group F3 active press WIN + N to return to a note.
Next, with group F1 active, press ALT + Z to steer the mouse
back to the note in voice 1.

Voice 2		Alt + X
Voice 3		Alt + C
Voice 4		Alt + D
All voices		Alt + S
)
    Send {Volume_Mute}				; Mute/unmute the master volume
    Return
}
Click, %ElementX%, %ElementY%			; mouse selects current note
Sleep, 50
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If (ErrorLevel = 0)
{
    Send {Volume_Mute}				; Mute/unmute the master volume
    Return
}
If (ErrorLevel = 1)
{
    Loop, 8
    {
        Send !{right}
        Sleep, 200
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
        If (ErrorLevel = 1)
            Continue
        If (ErrorLevel = 0)
            Break
    }
}
Sleep, 100
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Set Beaming Properties, Note not found.`nMaybe caused by a sudden screenshift.`nThe macro will exit.
    Return
}
Click, %ElementX%, %ElementY%			; mouse selects note
Send {Volume_Mute}				; Mute/unmute the master volume
Return

; ♣=======================================================================================