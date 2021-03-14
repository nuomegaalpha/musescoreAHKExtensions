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


~[ & F8::
CoordMode, Tooltip, Screen
Tooltip, F8 ♫ Input ♭♭×♮♭♯, ToolT_F8_X, 0, 1		; tooltip (1) Note Patterns
Return

~] & F8::
MsgBox, 4132, Note Input ♭♭×♮♭♯, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 8::
MsgBox, 4096, F8: Note Input ♭♭×♮♭♯      [ + 8,
(
Pitch before Duration		Z + P
Accidentals			Z + X
Note Patterns			Z + N
Colored Rest Templates		Z + R
Help in macros			?

PM: Wheel Input is macro group F11
)
Return

; ♣===================================== NOTE PATTERNS ============================================

; to use when you prefer a workflow of inputting the rhythm first and repitching afterwards
; supported durations are from 64th to whole note (dotted 64th can be created but not a 128th)
; durations with more than one dot are not supported
; option L4: the maximum allowed length of the input is 4 characters
; pressing Z or Escape breaks the loop
; notepitch is b4 - middle line in staff with Treble clef - at start the actual octave depends on preceding note
; 11 produces 64th, 22 32th, 33 16th, 44 eight, 55 quarter, 66 half, 77 whole note
; 1. produces dotted 64th  2. dotted 32th,  3. dotted 16th, idem 4. 5. 6. and 7.
; 1t produces two tied 64ths, 2t tied 32ths, idem 3t 4t 5t 6t and 7t for eight, quarter, half and whole note
; in combinations containing a hyphen between two numbers the first note will be tied to the second
; noteduration here is: 1 produces 64th, 2 32th, 3 16th, 4 eight, 5 quarter, 6 half, 7 whole note
; NB: 1t has the same effect as 1-1, 2t as 2-2, 3t as 3-3 etc.
; in combinations containing a semicolon the first note is dotted and will be tied to the second
; there are no hotkeys for combinations where the SECOND tied note is dotted
; in those cases: for the second note enter first the noteduration (1.2.3.4.5.6.or 7.) and then + to tie 
; to delete a note press delete
; to create a rest: input first the duration to create a note and then press End to create the rest
; press Left to move the cursor backward, press Right to move the cursor forward
; press R to repeat the previous command

; TUPLETS - In F3 Navigation: Win + U to set number type and bracket type.
; There you can press  Z to select the number for positioning or deleting the tuplet
; The smallest notelength of total tuplet length is an eight note (n : 44), biggest a whole (n : 77)
; eight note (n : 44)			3:44  5:44  6:44  7:44
; dotted eight note (n : 4.)		2:4.  4:4.  5:4.
; quarter note (n : 55)			3:55  5:55  6:55  7:55  9:55
; dotted quarter note (n : 5.)		2:5.  4:5.  5:5.  7:5.  8:5.
; half note (n : 66)			3:66  5:66  7:66  9:66
; dotted half note (n : 6.)		4:6.  5:6.  7:6.  8:6.
; whole (n : 77)			3:77  5:77  7:77  9:77.
; workaround for tuplets crossing barline: join measure with the next, add barline, add 1 to next measurenumber

~z & n::							; input note patterns
Send {Volume_Mute}						; Mute/unmute the master volume
Tooltip, Rhythmic Patterns.`nHelp = ?`nPress Z when ready., ToolT_F8_X, 40, 2	; position (*change*?)
Send n
Loop
{
    Input, Duration, L4, {Tab}{Enter}{Escape}{Left}{Right}{Up}{Down}{PgUp}{PgDn}{Del}{End}, z,+,n,r,?
,11,22,33,44,55,66,77,1.,2.,3.,4.,5.,6.,7.
,1t,2t,3t,4t,5t,6t,7t
,1-1,1-2,1-3,1-4,1-5,1-6,1-7
,2-1,2-2,2-3,2-4,2-5,2-6,2-7
,3-1,3-2,3-3,3-4,3-5,3-6,3-7
,4-1,4-2,4-3,4-4,4-5,4-6,4-7
,5-1,5-2,5-3,5-4,5-5,5-6,5-7
,6-1,6-2,6-3,6-4,6-5,6-6,6-7
,7-1,7-2,7-3,7-4,7-5,7-6,7-7
,1;1,1;2,1;3,1;4,1;5,1;6,1;7
,2;1,2;2,2;3,2;4,2;5,2;6,2;7
,3;1,3;2,3;3,3;4,3;5,3;6,3;7
,4;1,4;2,4;3,4;4,4;5,4;6,4;7
,5;1,5;2,5;3,5;4,5;5,5;6,5;7
,6;1,6;2,6;3,6;4,6;5,6;6,6;7
,7;1,7;2,7;3,7;4,7;5,7;6,7;7
,3:44,5:44,6:44,7:44,9:44
,2:4.,4:4.,5:4.,7:4.,9:4.
,3:55,5:55,6:55,7:55,9:55
,2:5.,4:5.,5:5.,7:5.,8:5.
,3:66,5:66,7:66,9:66
,4:6.,5:6.,7:6.,8:6.
,3:77,5:77,7:77,9:77

    If (ErrorLevel = "Max")
    {
        MsgBox, 4144, Rhythmic Patterns, No valid input!
        Continue
    }
    If (A_Index = 1)
        DurationOld := ""
    If (Duration = "r")
        Duration := DurationOld
    If (Duration = "z")
        Break
    If (ErrorLevel = "EndKey:Escape")
        Break
    If (ErrorLevel = "EndKey:Left")
        Send {left}
    If (ErrorLevel = "EndKey:Right")
        Send {right}
    If (ErrorLevel = "EndKey:Up")
        Send {up}
    If (ErrorLevel = "EndKey:Down")
        Send {down}
    If (ErrorLevel = "EndKey:PgUp")
        Send {PgUp}
    If (ErrorLevel = "EndKey:PgDn")
        Send {PgDn}
    If (ErrorLevel = "EndKey:Tab")
        Send ^z
    If (ErrorLevel = "EndKey:Enter")
    {
        Send n					; to prevent adding notes by click
        Sleep, 50
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        if ErrorLevel
        {
            MsgBox, 4144, Add Accidentals, Mousemove to note.`n`nNo note found!
                Continue
        }
        Click, %ElementX%, %ElementY%
        Send n
    }
    If (Duration = "+")
    {
        Send {left 2}				; if tied note crosses barline press left arrow first
        Send +{=}
    }
    If (Duration = "n")
        Send n
    If Duration contains :			; Tuplet creation
        Goto, TupletCreation
    If Duration in 1t,1.,11,1-1,1-2,1-3,1-4,1-5,1-6,1-7,1;1,1;2,1;3,1;4,1;5,1;6,1;7
        Send 1
    If Duration in 2t,2.,22,2-1,2-2,2-3,2-4,2-5,2-6,2-7,2;1,2;2,2;3,2;4,2;5,2;6,2;7
        Send 2
    If Duration in 3t,3.,33,3-1,3-2,3-3,3-4,3-5,3-6,3-7,3;1,3;2,3;3,3;4,3;5,3;6,3;7
        Send 3
    If Duration in 4t,4.,44,4-1,4-2,4-3,4-4,4-5,4-6,4-7,4;1,4;2,4;3,4;4,4;5,4;6,4;7
        Send 4
    If Duration in 5t,5.,55,5-1,5-2,5-3,5-4,5-5,5-6,5-7,5;1,5;2,5;3,5;4,5;5,5;6,5;7
        Send 5
    If Duration in 6t,6.,66,6-1,6-2,6-3,6-4,6-5,6-6,6-7,6;1,6;2,6;3,6;4,6;5,6;6,6;7
        Send 6
    If Duration in 7t,7.,77,7-1,7-2,7-3,7-4,7-5,7-6,7-7,7;1,7;2,7;3,7;4,7;5,7;6,7;7
        Send 7
    If (InStr(Duration, ".")) || (InStr(Duration, ";"))
        Send .
    If Duration contains 1,2,3,4,5,6,7,.
        Send b
    If Duration contains t
        Send +{=}
    If Duration contains -1,-2,-3,-4,-5,-6,-7,;1,;2,;3,;4,;5,;6,;7
    {
        If Duration contains -1,;1
            Send 1
        If Duration contains -2,;2
            Send 2
        If Duration contains -3,;3
            Send 3
        If Duration contains -4,;4
            Send 4
        If Duration contains -5,;5
            Send 5
        If Duration contains -6,;6
            Send 6
        If Duration contains -7,;7
            Send 7
        Send +{=}
    }
    TupletCreation:
    {
        If Duration contains :44,4.
            Send 4
        If Duration contains :55,5.
            Send 5
        If Duration contains :66,6.
            Send 6
        If Duration contains :77
            Send 7
        Sleep, 100
        If InStr(Duration, ".")
            Send .
        If Duration contains 2:
        {
            Send ^{2}
            Sleep, 50
            Send {b 2}
        }
        If Duration contains 3:
        {
            Send ^{3}
            Sleep, 50
            Send {b 3}
        }
        If Duration contains 4:
        {
            Send ^{4}
            Sleep, 50
            Send {b 4}
        }
        If Duration contains 5:
        {
            Send ^{5}
            Sleep, 50
            Send {b 5}
        }
        If Duration contains 6:
        {
            Send ^{6}
            Sleep, 50
            Send {b 6}
        }
        If Duration contains 7:
        {
            Send ^{7}
            Sleep, 50
            Send {b 7}
        }
        If Duration contains 8:
        {
            Send ^{8}
            Sleep, 50
            Send {b 8}
        }
        If Duration contains 9:
        {
            Send ^{9}
            Sleep, 50
            Send {b 9}
        }
    }
    If (Duration = "?")
        MsgBox, 4096, Note Patterns`, Rhythmic Patterns,
(
In a treble clef staff the notes are created on the middle line.
The pitch is then b4. The actual octave depends on the preceding note.

	      One note     Dotted       Tied	Or

64th		11	1.	1t	1-1
32nd		22	2.	2t	2-2
16th		33	3.	3t	3-3
Eight		44	4.	4t	4-4
Quarter		55	5.	5t	5-5
Half		66	6.	6t	6-6
Whole		77	7.	7t	7-7

TIED NOTES

Tied to	64th	32nd	16th	eight	quarter	half	whole

64th	1-1	1-2	1-3	1-4	1-5	1-6	1-7
32nd	2-1	2-2	2-3	2-4	2-5	2-6	2-7
16th	3-1	3-2	3-3	3-4	3-5	3-6	3-7
Eight	4-1	4-2	4-3	4-4	4-5	4-6	4-7
Quarter	5-1	5-2	5-3	5-4	5-5	5-6	5-7
Half	6-1	6-2	6-3	6-4	6-5	6-6	6-7
Whole	7-1	7-2	7-3	7-4	7-5	7-6	7-7

If the first note must be dotted replace the hyphen by a semicolon.
E.g. dotted eight tied to 16th is 4;3 - dotted quarter tied to 32th is 5;2
If the second note is dotted enter its duration and press +
If the second note crosses a barline press left and then +

TUPLETS		2, 3, 4, 5, 6, 7, 8, 9 notes in the time of one

Eight			3:44	5:44	6:44	7:44	9:44
Eight dotted		2:4.	4:4.	5:4.	7:4.	9:4.
Quarter			3:55	5:55	6:55	7:55	9:55
Quarter dotted		2:5.	4:5.	5:5.	7:5.	8:5.
Half			3:66	5:66	7:66	9:66
Half dotted		4:6.	5:6.	7:6.	8:6.
Whole			3:77	5:77	7:77	9:77

Delete last note	From current position	Delete
Create a rest	Enter duration		End
Edit tuplet	Macrogroup F3		WIN + U
Beam properties	Macrogroup F3 and F9	Z + B

Repeat last command			R
Next note				Right
Previous note				Left
Pitch down				Down
Pitch up					Up
Next Page				Page Down
Previous Page				Page Up
Mouse to selected note			Enter
Undo					Tab
Exit macro				Escape	Z
)
    DurationOld := Duration
    If (ErrorLevel = "EndKey:Delete")
    {
        Send {left}
        Send {del}
    }
    If (ErrorLevel = "EndKey:End")
    {
        Send {left}
        Send {del}
        Send {right}
    }
}
Send n
Sleep, 50
Tooltip, , , , 2			; close tooltip (2)
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Rhythmic Patterns, Last note not found.
    Return
}
Click, %ElementX%, %ElementY%
Send {Volume_Mute}
Return

; ♣======================================= ADD ACCIDENTALS ========================================

; https://w3c.github.io/smufl/gitbook/tables/gould-arrow-quartertone-accidentals-24-edo.html
; Elaine Gould, Behind Bars, pp 94-98
; checks first for notes, then for accidentals to make () or [] possible

~z & x::				; add accidentals
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if ErrorLevel
{
    MsgBox, 4112, Add Accidentals, No note selected!
    Return
}
Send {Volume_Mute}			; Mute/unmute the master volume
Tooltip, Accidentals.`nHelp = ?`nPress Z when ready., ToolT_F8_X, 40, 3	; position (*change*?)

PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Add Accidentals, No note found!
    Return
}
Click, %ElementX%, %ElementY%
Loop
{
    Input, Accidental, L4, {Escape}{Enter}{Up}{Down}{Left}{Right}{PgUp}{PgDn},z,r,?
,!,@,#,ss,ff,nf,ns
,1ff,1fn,1sn,1ss,3ff,3fbb,3sx,3ss,5fbb,5sx
,uf,df,un,nd,su,ds,xu,dx,bbu,dbb

    If (ErrorLevel = "Max")
    {
        MsgBox, 4144, Accidentals, No valid input!
        Continue
    }
    If (ErrorLevel = "EndKey:Escape")
        Break
    If (ErrorLevel = "EndKey:Left")
        Send {left}
    If (ErrorLevel = "EndKey:Right")
        Send {right}
    If (ErrorLevel = "EndKey:Up")
        Send {up}
    If (ErrorLevel = "EndKey:Down")
        Send {down}
    If (ErrorLevel = "EndKey:PgUp")
        Send {PgUp}
    If (ErrorLevel = "EndKey:PgDn")
        Send {PgDn}
    If (ErrorLevel = "EndKey:Enter")
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
            MsgBox, 4144, Add Accidentals, Mousemove to note.`n`nNo note found!
                Continue
        }
        Click, %ElementX%, %ElementY%
    }
    If (A_Index = 1)
        AccidentalOld := ""
    If (Accidental = "?")
    MsgBox, 4097, Accidentals - shortcuts,
(
Gould arrow U/D quartertone accidentals (24-EDO)

Quarter-tone flat			UF	↑♭	1FF
Three-quarter-tones flat		DF	↓♭	3FF
Quarter-tone sharp		UN	↑♮	1SN
Quarter-tone flat			ND	♮↓	1FN
Three-quarter-tones sharp		SU	♯↑	3SS
Quarter-tone sharp		DS	↓♯	1SS
Five-quarter-tones sharp		XU	×↑	5SX
Three-quarter-tones sharp		DX	↓×	3SX
Three-quarter-tones flat		BBU	♭↑♭	3FBB
Five-quarter-tones flat		DBB	↓♭♭	5FBB

Flat					!
Natural					@
Sharp					#
Double sharp				SS
Double flat				FF
Natural Flat				NF
Natural Sharp				NS

Repeat last command			R
Next note				Right
Previous note				Left
Pitch down				Down
Pitch up					Up
Next Page				Page Down
Previous Page				Page Up
Mouse to selected note			Enter
Exit macro				Escape	Z

Macrogoup F3
From note to accidental			Win + X
To toggle size accidental
To add brackets or parentheses
)
    IfMsgBox, Cancel
        Break
    If (Accidental = "z")
        Break
    If (Accidental = "r")
        Accidental := AccidentalOld
    If Accidental in !,@,#,ss,ff,nf,ns
,1ff,1fn,1sn,1ss,3ff,3fbb,3sx,3ss,5fbb,5sx
,uf,df,un,nd,su,ds,xu,dx,bbu,dbb
    {
        Send ^{F9}				; MSc shortcut, Palette Search (Ctrl + F9)
        Sleep, 100
        If (Accidental = "!")			; glyph 080, Flat    
            Send x-1-
        If (Accidental = "@")			; glyph 081, Natural
            Send x-2-
        If (Accidental = "#")			; glyph 082, Sharp
            Send x-3-
        If (Accidental = "ss")			; glyph 083, Double sharp
            Send x-4-
        If (Accidental = "ff")			; glyph 084, Double flat
            Send x-5-
        If (Accidental = "nf")			; glyph 085, Natural Flat
            Send x-6-
        If (Accidental = "ns")			; glyph 086, Natural Sharp
            Send x-7-
;        If (Accidental = "*[]")		; glyph 087, Add brackets to accidental
;            Send x-8-
;        If (Accidental = "*()")		; glyph 088, Add parentheses to element
;            Send x-9-
        If Accidental in 1ff,uf			; ↑♭ - Gould Quarter-tone flat
            Send x-10-
        If Accidental in 3ff,df			; ↓♭ - Gould Three-quarter-tones flat
            Send x-11-
        If Accidental in 1sn,un			; ↑♮ - Gould Quarter-tone sharp
            Send x-12-
        If Accidental in 1fn,nd			; ♮↓ - Gould Quarter-tone flat
            Send x-13-
        If Accidental in 3ss,su			; ♯↑ - Gould Three-quarter-tones sharp
            Send x-14-
        If Accidental in 1ss,ds			; ↓♯ - Gould Quarter-tone sharp
            Send x-15-
        If Accidental in 5sx,xu			; ×↑ - Gould Five-quarter-tones sharp
            Send x-16-
        If Accidental in 3sx,dx			; ↓× - Gould Three-quarter-tones sharp
            Send x-17-
        If Accidental in 3fbb,bbu		; ♭↑♭ - Gould Three-quarter-tones flat
            Send x-18-
        If Accidental in 5fbb,dbb		; ↓♭♭ - Gould Five-quarter-tones flat
            Send x-19-

        Sleep, 100
        Send ^!p				; MSc user defined shortcut 'Apply current palette element'
        Sleep, 200
        Continue
    }
    AccidentalOld := Accidental
}
Tooltip, , , , 3				; close tooltip (3)
Send {Volume_Mute}
Return

; ♣========================== CREATE REST/RHYTHMIC PATTERNS ==============================

; especially in time signatures with 8 as denominator the colored rests can facilitate the beaming pattern

z & r::						; create colored rest/rhythmic patterns
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit.
    Return
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
    MsgBox, 4144, Rest Templates, Color not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Sleep, 50
InputBox, R_Pattern, Create Colored Rest Templates, , , W_IB, H_IB, IB_X, IB_Y, , , Enter Time Signature   ? for Help			;  (*change*?) InputBox positioned in Inspector area
; InputBox, R_Pattern, Create Colored Rest Templates, , , W_IB, H_IB, ElementX+100, ElementY-120, , , Enter Time Signature   ? for Help	;  (*change*?) InputBox positioned near the mouse
if ErrorLevel					; when Cancel is pressed
    Return

If (R_Pattern = "?") || (R_Pattern = "Enter Time Signature   ? for Help")
{
    MsgBox, 4096, Colored Rest Templates,
(
The Time Signature must already exist.
32 Measures will be filled with colored rests
to indicate the beaming pattern.
Select a rest duration measure.
Enter a TimeSignature in the Inputbox.

Colored rests in		on beat

2+3/8			1, 3
3+2/8			1, 4
6/8			1, 4
9/8			1, 4, 7
3+2+2+3/8		1, 4, 6, 8
12/8			1, 4, 7, 10

3/4			1, 2, 3
4/4			1, 2, 3, 4
5/4			1, 2, 3, 4, 5

After note input reset the color
of the remaining rests:
Make a range selection and press Y + R.
)
    Return
}
If R_Pattern not in 2+3/8,3+2/8,6/8,9/8,3+2+2+3/8,12/8,3/4,4/4,5/4
{
    MsgBox, 4144, Rest Templates, No valid command.`nThe macro will exit.
    Return
}
Send n
Sleep, 50
If R_Pattern in 2+3/8,3+2/8,3+2+2+3/8,6/8,9/8,12/8
    Send 4					; 8th note
If R_Pattern in 3/4,4/4,5/4
    Send 3					; 16th note
Sleep, 50
If R_Pattern in 2+3/8,3+2/8,3+2+2+3/8,6/8,9/8,12/8
    Send {0 3}					; 5 8th rests created in 5-10/8 - 3 8th rests created in 6-9-12/8
If R_Pattern in 3/4,4/4,5/4
    Send {0 4}					; 4 16th rests created
Sleep, 50
Send n
Sleep, 50
Send ^{left}
Sleep, 50

Click, %IN_012_X%, %IN_012_Y%			; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%				; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#ff00ff				; select left color (1) magenta 
Sleep, 50
Send {Enter}
Sleep, 100

If R_Pattern in 3/4,4/4,5/4,6/8,9/8,12/8
    Goto, FinishRestPatterns1

If R_Pattern in 2+3/8
    Send {right 2}
If R_Pattern in 3+2/8,3+2+2+3/8
    Send {right 3}
Sleep, 50

Loop
{
    If (A_Index = 4)
        Break
    If (A_Index = 2)				; for 3+2+2+3/8
    {
        Send {right}
        Sleep, 50
        Send n
        Sleep, 50
        Send 4
        Sleep, 50
        Send {0 5}
        Sleep, 100
        Send n
        Sleep, 50
        Send {left 3}
        Sleep, 50
    }
    If (A_Index = 3)				; for 3+2+2+3/8
    {
        Send {right 2}
        Sleep, 50
    }
    Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
    Sleep, 200
    Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
    Sleep, 100
    Send ^a
    Sleep, 50
    Send {Raw}#ff00ff				; select left color (1) magenta 
    Sleep, 50
    Send {Enter}
    Sleep, 100
    If R_Pattern in 2+3/8,3+2/8
        Break
}
Send ^{left}					; to first beat
Sleep, 50
Send ^+{right}					; measure selected
Goto, FinishRestPatterns2

FinishRestPatterns1:
CoordMode, Mouse, Screen
If R_Pattern in 6/8,9/8,12/8
    Send +{right 2}				; three rests in 6-9-12/8
If R_Pattern in 3/4,4/4,5/4
    Send +{right 3}				; four rests in 3-4-5/4
Sleep, 100
If (R_Pattern = "3/4")
    Send {r 95}					; 32 measures in 3/4  96x4
If (R_Pattern = "4/4")
    Send {r 127}				; 32 measures in 4/4  132x4
If (R_Pattern = "5/4")
    Send {r 159}				; 32 measures in 5/4  160x4
If (R_Pattern = "6/8")
    Send {r 63}					; 32 measures in 6/8  64x3
If (R_Pattern = "9/8")
    Send {r 95}					; 32 measures in 9/8  96x3
If (R_Pattern = "12/8")
    Send {r 127}				; 32 measures in 12/8  128x3
FinishRestPatterns2:
If R_Pattern in 2+3/8,3+2/8,3+2+2+3/8		; 32 measures in 5-10/8
    Send {r 31}
Sleep, 100
Send {Escape}
Return

; ♣========================== NOTE INPUT === PITCH BEFORE DURATION ================================

; After pressing the Shift Key 5 times a window can appear: Turn on Sticky Keys?
; In Settings -> Ease of Access -> Use Sticky Keys: uncheck 'Allow the shortcut key to start Sticky Keys.
; Or change {RShift} in some other key - but *not* in {RAlt} on keyboards with AltGr.

~z & p::					; pitch before duration input
CoordMode, Tooltip, Screen
ChordMode := 0
SetNormalMode := 1
Loop,
{
    If (A_Index = 1)
        Goto, StartChordModeScreen
    Tooltip, Pitch before duration..Active!...Press Q to suspend...Escape to exit., ToolT_F6_X, 22, 4		; (*change*?)
    Input, Note, L1, {Tab}{Escape}{Left}{Right}{Up}{Down}{PgUp}{PgDn}{Delete}{Home}{End}{Enter}{LAlt}{LShift}{RShift}{LControl}{RControl}{NumpadDot}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{NumpadEnter}{NumpadAdd}{NumpadSub}, a,b,c,d,e,f,g,.,1,2,3,4,5,6,7,8,9,n,q,r,t,y,?
    If (Note = "?") {
        MsgBox, 4097, Pitch before Duration,
(
Normal Mode		Left Control
Chord Mode		Right Control
Diatonic pitch up		Up
Diatonic pitch down	Down
Pitch up			Numpad Add
Pitch down		Numpad Subtract
Pitch up octave		PageUp
Pitch down octave		PageDown
Create notes and tie	T + duration
Toggle tie between notes	Y
To next note/rest		Right
To previous note/rest	Left
To next measure		End
To previous measure	Home
To next element		Right Shift
To previous element	Left Shift
Delete			Delete
Escape			Left Alt
Undo			TAB
Mouse to selected note	Enter
Mouse back to this note	Numpad Enter
Suspend macro		Q
Activate macro		CapsLock
Exit macro		Escape

Enter pitches abcdefg	A B C D E F G
Add pitches Chord M	A B C D E F G
Add interval Chord M	Numpad 1 2 3 4 5 6 7 8 9
Enter duration		1 2 3 4 5 6 7 8 9
Enter duration Normal M	Numpad 1 2 3 4 5 6 7 8 9
Enter rest		R + duration
Augmentation dot		.		period
Double augmentation dot	Numpad .	period
)
        IfMsgBox, Cancel
            Goto, FinishPitchBefDur
        Continue
    }
    If (ErrorLevel = "EndKey:Escape")
        Break
    If (ErrorLevel = "EndKey:Tab")
        Send ^z					; undo
    If (ErrorLevel = "Max") {
        MsgBox, 4144, Pich before Duration, Invalid command!, 1
        Continue
    }
    If (ErrorLevel = "EndKey:LAlt")
        Send {Escape}
    If (ErrorLevel = "EndKey:RShift")		; mainly to delete unwanted ties
        Send !{right}
    If (ErrorLevel = "EndKey:LShift")		; mainly to delete unwanted ties
        Send !{left}
    If (Note = "y") {				; toggle tie
        Send +{=}
        Continue
    }
    If (Note = "t") {				; create and tie to next chord
        If (ChordMode = 0) {
            Send {left}
            Sleep, 100
        }
	(ErrorLevel := "EndKey:Enter")
    }
    If (ErrorLevel = "EndKey:Enter")		; get position selected element
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
            MsgBox, 4144, Pitch before Duration, Mousemove to note.`n`nNo note found!
                Continue
        }
        Click, %ElementX%, %ElementY%		; mouse to selected element
    }
    If (Note = "t") {				; create and tie
        ToolTip, Ties. Enter duration.`nPress CapsLock., ElementX, ElementY - 100, 8	; (*change*?)
        Send n
        Sleep, 50
        Keywait, CapsLock, d    		; enter duration
        Keywait, CapsLock, u
        Send +{=}
        Sleep, 50
        Send n
        ToolTip, , , , 8			; close ToolTip (8)
        SetNormalMode := 1			; switch to normal mode
    }
    If (ErrorLevel = "EndKey:Enter")
        Continue
    If (ErrorLevel = "EndKey:NumpadEnter")	; retrieve earlier mouse position
        Click, %ElementX%, %ElementY%
    If (Note = "q")				; suspend macro
    {
        ToolTip, , , , 6			; close tooltip (6)
        ToolTip, , , , 7			; close tooltip (7)
        Sleep, 100
        Tooltip, Pitch before duration.....Suspended.......Press CapsLock to activate., ToolT_F6_X, 22, 5	; (*change*?) Y = 22
        Keywait, CapsLock, d    
        Keywait, CapsLock, u			; back to macro
        If (ChordMode = 1)
            ToolTip, ChordMode..............To activate Normal Mode press Right Control., ToolT_F6_X, 44, 6	; (*change*?) Y = 44
        If (ChordMode = 0)
            ToolTip, Normal Mode................To activate Chord Mode press Left Control., ToolT_F6_X, 44, 7	; (*change*?) Y = 44
        Tooltip, , , , 5			; close Tooltip (5)
        Continue
    }
    If (ErrorLevel = "EndKey:LControl")
    {
        ChordMode := 1
        Send {left}
        ToolTip, , , , 7			; close tooltip (7)
        ToolTip, ChordMode..............To activate Normal Mode press Right Control., ToolT_F6_X, 44, 6	; (*change*?)
        Continue
    }
    StartChordModeScreen:
    If (ErrorLevel = "EndKey:RControl") || (SetNormalMode = 1)
    {
        ChordMode := 0
        If (A_Index > 1)
            Send {right}
        ToolTip, , , , 6			; close tooltip (6)
        ToolTip, Normal Mode................To activate Chord Mode press Left Control., ToolT_F6_X, 44, 7	; (*change*?)
        SetNormalMode := 0
        Continue
    }
    If (ErrorLevel = "EndKey:Left") {
        Send {left}
        Continue
    }
    If (ErrorLevel = "EndKey:Right") || (Note = "r") {
        Send {right}
        Continue
    }

    If (ErrorLevel = "EndKey:NumpadAdd") {	; chromatically
        Send {up}
        Continue
    }
    If (ErrorLevel = "EndKey:NumpadSub") {	; chromatically
        Send {down}
        Continue
    }
    If (ErrorLevel = "EndKey:Up") {		; diatonically
        Send +!{up}
        Continue
    }
    If (ErrorLevel = "EndKey:Down") {		; diatonically
        Send +!{down}
        Continue
    }
    If (ErrorLevel = "EndKey:PgUp") {		; octave up
        If (ChordMode = 0)
            Send {left}
        Send ^{up}
        If (ChordMode = 0)
            Send {right}
        Continue
    }
    If (ErrorLevel = "EndKey:PgDn") {		; octave down
        If (ChordMode = 0)
            Send {left}
        Send ^{down}
        If (ChordMode = 0)
            Send {right}
        Continue
    }
    If (ErrorLevel = "EndKey:Delete") {		; delete
        Send {delete}
        Continue
    }
    If (ErrorLevel = "EndKey:Home") {		; to previous measure
        Send ^{left}
        Continue
    }
    If (ErrorLevel = "EndKey:End") {		; to next measure
        Send ^{right}
        Continue
    }
    If (ChordMode = 0)
    {
        If (Note = "n")
            Send n
        If (Note = "a")
            Send a
        If (Note = "b")
            Send b
        If (Note = "c")
            Send c
        If (Note = "d")
            Send d
        If (Note = "e")
            Send e
        If (Note = "f")
            Send f
        If (Note = "g")
            Send g
        Sleep, 50
        If Note in a,b,c,d,e,f,g
        {
            Send {right}
            Sleep, 50
            Send n
            Sleep, 50
            Continue
        }
    }
    If (ChordMode = 1)
    {
        If (Note = "a")
            Send +a
        If (Note = "b")
            Send +b
        If (Note = "c")
            Send +c
        If (Note = "d")
            Send +d
        If (Note = "e")
            Send +e
        If (Note = "f")
            Send +f
        If (Note = "g")
            Send +g
        If note in a,b,c,d,e,f,g
        {
            Sleep, 50
            Send n
            Sleep, 50
            Continue
        }
        If (ErrorLevel = "EndKey:Numpad1")
            Send !1				; enter unisono above
        If (ErrorLevel = "EndKey:Numpad2")
            Send !2				; enter second above
        If (ErrorLevel = "EndKey:Numpad3")
            Send !3				; enter third above
        If (ErrorLevel = "EndKey:Numpad4")
            Send !4				; enter fourth above
        If (ErrorLevel = "EndKey:Numpad5")
            Send !5				; enter fifth above
        If (ErrorLevel = "EndKey:Numpad6")
            Send !6				; enter sixth above
        If (ErrorLevel = "EndKey:Numpad7")
            Send !7				; enter seventh above
        If (ErrorLevel = "EndKey:Numpad8")
            Send !8				; enter octave above
        If (ErrorLevel = "EndKey:Numpad9")
            Send !9				; enter ninth above
        If (ErrorLevel = "EndKey:Numpad0") || (ErrorLevel = "EndKey:Numpad1")
|| (ErrorLevel = "EndKey:Numpad2") || (ErrorLevel = "EndKey:Numpad3") || (ErrorLevel = "EndKey:Numpad4")
|| (ErrorLevel = "EndKey:Numpad5") || (ErrorLevel = "EndKey:Numpad6") || (ErrorLevel = "EndKey:Numpad7")
|| (ErrorLevel = "EndKey:Numpad8") || (ErrorLevel = "EndKey:Numpad9")
        {
            Sleep, 50
            Continue
        }
    }
    If (ErrorLevel = "EndKey:Numpad0") || (ErrorLevel = "EndKey:Numpad1")
|| (ErrorLevel = "EndKey:Numpad2") || (ErrorLevel = "EndKey:Numpad3") || (ErrorLevel = "EndKey:Numpad4")
|| (ErrorLevel = "EndKey:Numpad5") || (ErrorLevel = "EndKey:Numpad6") || (ErrorLevel = "EndKey:Numpad7")
|| (ErrorLevel = "EndKey:Numpad8") || (ErrorLevel = "EndKey:Numpad9")
    {
        If (ChordMode = 0)
        {
            Send {left}
            If (ErrorLevel = "EndKey:Numpad1")
                Send 1				; hemidemisemiquaver - 64th note
            If (ErrorLevel = "EndKey:Numpad2")
                Send 2				; demisemiquaver - 32th note
            If (ErrorLevel = "EndKey:Numpad3")
                Send 3				; semiquaver - 16th note
            If (ErrorLevel = "EndKey:Numpad4")
                Send 4				; quaver - eighth note
            If (ErrorLevel = "EndKey:Numpad5")
                Send 5				; crotchet - quarter note
            If (ErrorLevel = "EndKey:Numpad6")
                Send 6				; minim - half note
            If (ErrorLevel = "EndKey:Numpad7")
                Send 7				; semibreve - whole note
            If (ErrorLevel = "EndKey:Numpad8")
                Send 8				; breve - double whole note
            If (ErrorLevel = "EndKey:Numpad9")
                Send 9				; longa
            Sleep, 50
            Send {right}
        }
    }
    If (Note = ".") || (Note = "1") || (Note = "2") || (Note = "3") || (Note = "4") || (Note = "5")
|| (Note = "6") || (Note = "7") || (Note = "8") || (Note = "9") || (ErrorLevel = "EndKey:NumpadDot")
    {
        If (ChordMode = 0)
            Send {left}
        Sleep, 50
        If (Note = "9")
            Send 9				; longa
        If (Note = "8")
            Send 8				; breve - double whole note
        If (Note = "7")
            Send 7				; semibreve - whole note
        If (Note = "6")
            Send 6				; minim - half note
        If (Note = "5")
            Send 5				; crotchet - quarter note
        If (Note = "4")
            Send 4				; quaver - eighth note
        If (Note = "3")	
            Send 3				; semiquaver - 16th note
        If (Note = "2")	
            Send 2				; demisemiquaver - 32th note
        If (Note = "1")	
            Send 1				; hemidemisemiquaver - 64th note
        If (Note = ".")
            Send .				; augmentationdot 1
        If (ErrorLevel = "EndKey:NumpadDot")
            Send !.				; augmentationdot 2
        Sleep, 50
        If (ChordMode = 0)
            Send {right}
    }
}
FinishPitchBefDur:
Tooltip, , , , 4				; close Tooltip (4)
Tooltip, , , , 6				; close Tooltip (6)
Tooltip, , , , 7				; close Tooltip (7)
Return

; ♣=======================================================================================
