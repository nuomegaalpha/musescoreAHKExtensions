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

~[ & F9::
CoordMode, Tooltip, Screen
Tooltip, F9  Specials, ToolT_F9_X, 0, 1		; tooltip (1) Specials
Return

~] & F9::
MsgBox, 4132, Specials, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 9::
MsgBox, 4096, F9: Specials      [ + 9,
(
Filter staccato			Z + .
Break staccato loop		Z + ,
Tempo changes			Z + K
Mask measures			Z + M
Set pedal lines			Z + L
Copy part name			Z + J
Create cue #			Z + Q
Add special characters		Z + H
Add graphic accidentals		Z + G
to ornaments

#  after Z + F: Filter cue material
in macro group F1

NAVIGATION

To masking white			ALT + W
To selected invisible element	ALT + B
To unselected invisible element	ALT + N
To handles (e.g. of hairpin)		ALT + M
Set memorypoint		M + F1, F2, F3 ... F12
Select memorypoint	M + 1,2,3,4,5,6,7,8,9,0,-,=
)
Return

; ♣===================== STACCATO FILTERING ==== KEEP/DELETE STAACATO =============================

; Recognition of staccato: ALL forms of staccato are recognized via Statusbar_tacca.png
; normal staccato, Staccatissimo, Staccatissimo Wedge, Staccatissimo Stroke, Accent-Staccato,
; Marcato-Staccato, soft accent staccato, soft accent tenuto staccato, tenuto staccato

~z & ,::				; break staccato loop
BreakStaccatoLoop = 1
Return					; to exit the loop

~z & .::				; Keep/Delete staccato notes (and delete/keep non staccato)
Gosub, InspectorCheck
MsgBox, 4129, Keep/Delete Staccato notes,
(
Status Keep	Notes without staccato will be deleted
Status Delete	Notes with staccato  will be deleted

Execute the macro on a copy of the passage.
All types of staccato are recognized.
To optimize performance make the other staves invisible.

Press OK.
Press K or D to enter the status.
Select the first note and press Z.

To exit the loop press Z + ,
)
IfMsgBox, Cancel
    Return
Send {Volume_Mute}			; Mute/unmute the master volume
CoordMode, Mouse, Screen
Tooltip, Keep/Delete Staccato Notes`nPress K or D, ToolT_F5_X, 0, 2
Input, StaccatoStatus, L1, , k,d
Keywait, z, D
Tooltip, , , , 2			; close tooltip (2)
Tooltip, Press Z + ] to stop the loop, ToolT_F5_X, 0, 3
BreakStaccatoLoop := 0
Loop
{
    if (BreakStaccatoLoop = 1)
    break
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel = 1			; element is rest
    {
        Send {right}
        Sleep, 100			; to create time to update statusbar
        Continue			; jump to top of loop
    }
    If ErrorLevel = 0			; element is note
    {
        Send !{right}
        Sleep, 150
    }
    If (StaccatoStatus = "k")
    {
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_tacca.png
        If ErrorLevel = 0		; note with staccato
        {
            Send !{left}
            Sleep, 100			; back to the note
            Send {right}		; to the next note or rest
            Sleep, 100
            Continue
        }
        If ErrorLevel = 1		; note without staccato
        {
            Send !{left}
            Sleep, 50
            Send +{left}
            Sleep, 50
            Send +{right}
            Sleep, 50
            Send {Del}			; delete the note and everything attached to it
            Sleep, 50
            Send {right}
            Sleep, 150
            Continue
        }
    }
    If (StaccatoStatus = "d")
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_tacca.png
    If ErrorLevel = 1			; note without staccato
    {
        Send !{left}
        Sleep, 100			; back to the note
        Send {right}			; to the next note or rest
        Sleep, 100
        Continue
    }
    If ErrorLevel = 0			; note with staccato    
    {
        Send !{left}
        Sleep, 50
        Send +{left}
        Sleep, 80
        Send +{right}
        Sleep, 80
        Send {Del}			; delete the note and everything attached to it
        Sleep, 50
        Send {right}
        Sleep, 150
    }
}
Tooltip, , , , 3			; close tooltip (3)
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
MsgBox, 4144, Keep/Delete Staccato notes, Selected element can't be clicked.
Send {Volume_Mute}			; Mute/unmute the master volume
Return
}
Click, %ElementX%, %ElementY%
Send {Volume_Mute}			; Mute/unmute the master volume
Return

; ♣=================================== SET PEDAL LINES ============================================

~z & l::				; set pedal lines consecutively
Key_L_Alt := 0
Key_Tab := 0
MouseGetPos, StartX, StartY
MsgBox, 4097, Pedal Lines,
(
Select a range  and press	Z

Start-release			SR
Start-continue			SC
Continue-continue		CC or CapsLock
Continue-release			CR
Ped start-asterisk			PA
Ped start-release			PR

Range selection to next first beat	Z
followed by 			TAB
and a Pedal line command

Change initial range		ALT
Change range and press		Z    

To exit the loop press		Z
followed by 			X  or  Escape

During the loop the sound is muted.
)
IfMsgBox, Cancel
    Return
Send {Volume_Mute}			; Mute/unmute the master volume
Tooltip,
(
Pedal lines: Select range. Press Z.
Enter SR, SC, CC, CR, PA, or PR.
For a line of one whole measure:
press TAB and enter command.
Instead of CC CapsLock can be used.
To exit the loop: press Z and then X
), ToolT_F9_X - 53, 22, 4			; 53 to the left of Tooltip, 22 = height (*change*?)
Loop
{
    If (Key_L_Alt = 1)
        Goto, SkipPixPed
    If (A_Index > 1)			; skip first selection
    {
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        Click, %ElementX%, %ElementY%
        Sleep, 50
    }
    If (A_Index = 1)
    {
    ElementX := StartX
    ElementY := StartY
    }
    SkipPixPed:
    If (Key_L_Alt = 1)
        Send {RAlt}
    Tooltip, Select range and Press Z.`nOr press Z and TAB., ElementX, ElementY - 100, 5		; (*change*?)
    Keywait, z, d			; set range of ped line and press Z
    Tooltip, , , , 5			; close tooltip (5)
    ToolTip, Enter line command`nor Press ALT`nto change the selection., ElementX, ElementY - 100, 7	; (*change*?)
    SkipKeyWaitPedZ:
    If (Key_Tab = 1)
    {
        Sleep, 600
        Tooltip, , , , 6			; close tooltip (6)
    }
    Key_Tab := 0
    Input, PedLine, L2, {LAlt}{RAlt}{Tab}{CapsLock}{Escape}, cc,cr,pa,pr,sc,sr,x
    ToolTip, , , , 7				; close tooltip (7)
    If (ErrorLevel = "EndKey:Tab")
    {
        Tooltip, Enter ped. line command,  ElementX, ElementY - 100, 6
        Send ^+{right 2}			; selection from current measure
        Sleep, 50
        Send ^+{left}
        Sleep, 50
        Send +{right}				; to beat one of the next measure
        Sleep, 50
        Key_Tab := 1
        Goto, SkipKeyWaitPedZ
    }
    If (ErrorLevel = "EndKey:LAlt") || (ErrorLevel = "EndKey:RAlt")	; if selection (e.g. with TAB) must be changed
    {
        Key_L_Alt := 1
        Continue
    }
    If (ErrorLevel = "EndKey:CapsLock")
        PedLine := "cc"
    If PedLine not in cc,cr,pa,pr,sc,sr,x,m
    {
        MsgBox, 4144, Set Pedal Lines,
(
No valid command! Select range. Press Z.
Enter SR, SC, CC, CR, PA, or PR.
)
        Key_L_Alt := 0
        Continue
    }
    If PedLine in cc,cr,pa,pr,sc,sr
    {
        Send ^{F9}			; MSc shortcut, Palette Search (Ctrl + F9)
        Sleep, 100
        If (PedLine = "pr")		; glyph 256, Ped start stop
            Send l-17
        If (PedLine = "pa")		; glyph 257, Ped start asterisk
            Send l-18
        If (PedLine = "sr")		; glyph 258, Pedline start-release
            Send l-19
        If (PedLine = "sc")		; glyph 259, Pedline start-continue
            Send l-20
        If (PedLine = "cc")		; glyph 260, Pedline continue-continue
            Send l-21
        If (PedLine = "cr")		; glyph 261, Pedline continue-release
            Send l-22
        Sleep, 100
        Send ^!p			; MSc user defined shortcut 'Apply current palette element'
        Sleep, 100
        Send {right}			; deselect range
        Sleep, 150
        Send {left}			; back to last note of former range
        Sleep, 150			; otherwise PixelSearch selects topleft corner of selection
        Key_L_Alt := 0
    }
    If (PedLine = "x") || (ErrorLevel = "EndKey:Escape")
        Break
}
Tooltip, , , , 4			; close tooltip (4)
Send {Volume_Mute}			; Mute/unmute the master volume
Return

; ♣=============================== MEMORY POINTS on SAME SCREEN ===================================

; NB: the coordinates are lost when you exit the macrogroup
; examples of hotspots: a triangle to open and close frequently used palettes
; a rectangle for operations like tuning and its reset button
; the begin text of Text Line Details, the time stretch of fermatas
; the aperture ('height')of a hairpin 
; in general all inspector items you will use frequently during a session

~m & F1::MouseGetPos, MemPoint1X, MemPoint1Y	; set memorypoint spot 1
~m & 1::Click, %MemPoint1X%, %MemPoint1Y%	; select spot 1
~m & F2::MouseGetPos, MemPoint2X, MemPoint2Y
~m & 2::Click, %MemPoint2X%, %MemPoint2Y%
~m & F3::MouseGetPos, MemPoint3X, MemPoint3Y
~m & 3::Click, %MemPoint3X%, %MemPoint3Y%
~m & F4::MouseGetPos, MemPoint4X, MemPoint4Y
~m & 4::Click, %MemPoint4X%, %MemPoint4Y%
~m & F5::MouseGetPos, MemPoint5X, MemPoint5Y
~m & 5::Click, %MemPoint5X%, %MemPoint5Y%
~m & F6::MouseGetPos, MemPoint6X, MemPoint6Y
~m & 6::Click, %MemPoint6X%, %MemPoint6Y%
~m & F7::MouseGetPos, MemPoint7X, MemPoint7Y
~m & 7::Click, %MemPoint7X%, %MemPoint7Y%
~m & F8::MouseGetPos, MemPoint8X, MemPoint8Y
~m & 8::Click, %MemPoint81X%, %MemPoint8Y%
~m & F9::MouseGetPos, MemPoint9X, MemPoint9Y
~m & 9::Click, %MemPoint9X%, %MemPoint9Y%
~m & F10::MouseGetPos, MemPoint10X, MemPoint10Y
~m & 0::Click, %MemPoint10X%, %MemPoint10Y%
~m & F11::MouseGetPos, MemPoint11X, MemPoint11Y
~m & -::Click, %MemPoint11X%, %MemPoint11Y%
~m & F12::MouseGetPos, MemPoint12X, MemPoint12Y
~m & =::Click, %MemPoint12X%, %MemPoint12Y%

; ♣==================================== COLOR SEARCH SPECIALS =====================================

; Alt + W clicks the pure white of masked elements
; Alt + N color of unselected invisible element- also to grey square aperture - change aperture with up/down 
; Alt + M moves mouse to reddish color handles. E.g. of note anchored line, hairpins, TAB thru handles 
; Alt + B  color of selected invisible elements

~!w::						; selection pure white needs extra steps
CoordMode, Mouse, Screen
Gosub,InspectorCheck
MouseGetPos, StartX, StartY
Loop, 31					; finding an empty spot on the canvas to click
{
    MouseGetPos, EmptyX, EmptyY
    PixelSearch, EmptyX, EmptyY, EmptyX - 10, EmptyY - 10, EmptyX, EmptyY, ColorCanvas, , Fast RGB
    Click, %EmptyX%, %EmptyY%
    Sleep, 100
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png		; NB no *40 shades
    if (Errorlevel = 0)
    Break
    if (A_Index > 15)
    Goto, SearchUnderStart
    if (Errorlevel = 1)
    Continue
    SearchUnderStart:
        {
        MouseMove, StartX, StartY
        Loop
            {
                MouseGetPos, EmptyX, EmptyY
                PixelSearch, EmptyX, EmptyY, EmptyX - 10, EmptyY + 10, EmptyX, EmptyY + 15, ColorCanvas, , Fast RGB
                Click, %EmptyX%, %EmptyY%
                Sleep, 100
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
                if (Errorlevel = 1)
                Continue
                if (Errorlevel = 0)
                Break
                if (A_Index = 15)
                Break
            }
            Break
        }
}
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffffff, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Search Color Pure White, Color not found.
    Return
}
else
Click, %ElementX%, %ElementY%
Return

~!b::			; to color selected invisible elements
PixelSearch, Element1X, Element1Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorSelectedInvisible, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Search Color Invisible, Color of selected invisible elements.`nColor not found.
    Return
}
else
ElementX2 := Element1X + 2
ElementY2 := Element1Y + 4
Click, %ElementX2%, %ElementY2%
Return

~!n::			; to color unselected invisible elements and little grey square in handles without click
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorHandleGrey, , Fast RGB
if ErrorLevel
{
MsgBox, 4112, Search Color grey handles and 'Invisible' unselected,
(
This is the color of grey handles in e.g. hairpins
and also that of unselected invisible elements.

Color not found.
)
    Return
}
else
Click, %ElementX%, %ElementY%
Return


~!m::			; to color voice 4 (= also of handles) - but without click
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Search Color Handles, Handles are the hotspots of lines.`nColor not found.
    Return
}
else
MouseMove, ElementX, ElementY
; Click, %ElementX%, %ElementY%
Return

; ♣==================================== MASK (part of) STAFF=======================================

; masking measures is usually done after finishing the score and the stretch is fixed
; a whole staff can be masked when there are linebreaks fixing the layout
; masking measures, or parts of it - can occur frequently in preparing educational material
; another usecase: in an MuseScore ossia the left barline is missing; start the ossia one measure earlier,
; put an invisible, inaudible note in it and mask this measure but not the barline
; use Pix Mousing to position the handles with pix precision

; enter 2 notes on the middle staff line - make them stemless (WIN + R) and switch play off (WIN + O)
; select the first note and control-click the second
; create a note anchored line and select a L/R handle with Alt + M
; set the memorypoints of the L and R handle
; color handles is 0xc31989 (is voice 4 color)

; ♣=====================================  MASK MEASURES ===========================================

~z & m::				; mask measures or staff - fully or partially
Gosub, InspectorCheck
MsgBox, 4097, Mask measures,
(
Take care that the measures remain free,
not covered by messageboxes and windows!

Create two quarter notes on the middle line.
Between these notes only rests are allowed.
Leave note input mode and select the last note.
Next press Z.

A note anchored line will be added in between.
Its width will cover the height of the staff.
Its color will be pure white.
Width and color are set by the macro.

Start and endpoint will determine the masked surface.
The actual length of the line you have to adjust yourself
with PixelMousing, which will start automatically.
Pressing CapsLock toggles its coordinates tooltip.
)
IfMsgBox, Cancel
    Return
If !WinExist("PixelMousing")
{
    Run, PixelMousing.ahk, , UseErrorLevel
    if (ErrorLevel = "Error")
    {
        MsgBox, 4112, Start PixelMousing,
(
PixelMousing could not be launched.
Check name and location of the file.
)
        Return
    }
}
Keywait, z, d
PixelSearch, Note2X, Note2Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
; now comes a check if all note sections in the Inspector are unfolded, ▼ instead of ►
; collapsed sections will be unfolded
Loop, 30
{
    ImageSearch, TrX, TrY, IM_18_X1, IM_18_Y1, IM_18_X2, IM_18_Y2, IM_18_Inspector_Triangle_Closed.png
    If (ErrorLevel = 0)
    {
        MouseMove, TrX + TriAngleOffset_X, TrY + TriAngleOffset_Y
        Click
        Sleep, 50
        Continue
    }
    If (ErrorLevel = 1)
        Break
}
Click, %Note2X%, %Note2Y%
Sleep, 50
Click, %IN_032_X%, %IN_032_Y%		; I(032) CHORD, tickbox stemless
Sleep, 50
Click, %IN_046_X%, %IN_046_Y%		; I(046) Note play tick box
Sleep, 50
Click, %Note2X%, %Note2Y%
Loop					; from second to first note and determine its position
{
    Send {left}
    Sleep, 150
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
PixelSearch, Note1X, Note1Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
Click, %Note1X%, %Note1Y%
Sleep, 50
Click, %IN_032_X%, %IN_032_Y%		; I(032) CHORD, tickbox stemless
Sleep, 50
Click, %IN_046_X%, %IN_046_Y%		; I(046) Note play tick box
Sleep, 50
Click, %Note1X%, %Note1Y%
Sleep, 50
Send ^{click, %Note2X%, %Note2Y%}
Sleep, 50
Send !a
Sleep, 50
Send l
Sleep, 50
Send {up}
Sleep, 50
Send {enter}				; creates note anchored line
Sleep, 50
MsgBox, 4161, Mask measures, Click the note anchored line.
IfMsgBox, Cancel
    Return
Loop,
{
    Keywait, Lbutton, D
    Sleep, 250				; time for MuseScore to show 'Line' ▼
    ImageSearch, , , IM_23_X1, IM_23_Y1, IM_23_X2, IM_23_Y2, *40 IM_23_Line_triangle_section_open.png
    If (ErrorLevel = 1)
    {
        MsgBox, 4145, Mask measures,
(
You did not click the note anchored line!
Try again.
)
        IfMsgBox, Cancel
            Return
    }
    If (ErrorLevel = 0)
    Break
}
Sleep, 100
Send {tab}				; selects left handle of nal
Sleep, 200				; to color voice 4 (is also that of handles) without click
PixelSearch, LeftHandleX, LeftHandleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
If ErrorLevel
{
    MsgBox, 4161, Mask Measures, Position left handle not found.
    IfMsgBox, Cancel
        Return
}
Send {tab}				; selects right handle of nal
Sleep, 200
PixelSearch, RightHandleX, RightHandleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
If ErrorLevel
{
    MsgBox, 4161, Mask Measures, Position right handle not found
    IfMsgBox, Cancel
        Return
}
Click, %IN_101_X%, %IN_101_Y%,		; I(101) Line Thickness rectangle
Sleep, 50
Send ^a
Send 4.5				; this thickness covers the staffwidth
Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#ffffff			; select color pure white
Sleep, 50
Send {Enter}
Sleep, 100
CoordMode, Mouse, Screen
MsgBox, 4161, Mask Measures,
(
Verify that PixelMousing is running.
Make the mousecoordinates visible with CapsLock
to be sure that PixelMousing is active.
Otherwise start it with [ + /
Press Z when ready.
)
IfMsgBox, Cancel
    Return
Keywait, z, d
Send {tab}				; activates left handle
Sleep, 200
MouseMove, LeftHandleX, LeftHandleY
Click, D
MsgBox, 4160, Mask Measures - finetuning,
(
Select first the left handle with TAB.
The right handle must NOT be visible.
Move next the left handle with the arrowkeys.
For bigger steps use / + L and / + R.

Press Z when ready.
)
Keywait, z, d
Click, U
Sleep, 50
Send {tab}
Sleep, 200
MouseMove, RightHandleX, RightHandleY
Click, D
Sleep, 50
MsgBox, 4160, Mask Measures - finetuning,
(
Select now the right handle with TAB.
The left handle must NOT be visible.
Move next the right handle with / + arrowkeys.
For bigger steps use / + L and / + R.

Press Z when ready.
)
Keywait, z, d
Click, U
Sleep, 50
MsgBox, 4160, Mask Measures - finalizing,
(
Set the stacking order of the line.
Elements covered by the line but with
a higher stacking order will be visible.

Press Z when ready.
)
Click, %IN_023_X%, %IN_023_Y%,		; I(023) Stacking order (Z) - OVERLAP
Keywait, z, d
Send {Escape}
Sleep, 50
Click, %Note2X%, %Note2Y%
; Click, %RightHandleX%, %RightHandleY%
Return

; ♣======================================= TEMPO CHANGES ==========================================

; in tempotrack no rests! switch 'play' off
; of markeer eerst en laatste noot (probleem met screenshift...)

~z & k::			; tempo changes
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Gosub, InspectorCheck
StopChangeTempo := 0
InputBox, Tempo, Tempo Changes, Enter start tempo and tempo change.`nSelect start note of the tempo track. Press Z., , W_IB, H_IB + 40, IB_X, IB_Y, , , Help = ?	;  (*change*?) NB: H_IB + 40 ?
If ErrorLevel					; when Cancel is pressed
    Return
If Tempo in ?,Help = ?
{
    Loop
    {
        MsgBox, 4097, Tempo Changes,
(
Create a Tempo Stafff.

Set the tempo staff temporarily as highest staff.
Take care that the window Select Color will not
cover this staff.

The tempochanges in a passage are attached
to the notes of a tempo staff. This makes subtle
accelerandos and ritardandos possible.
The tempo staff has to contain only notes.
There must be one rest at the end of the passage.
The tempo changes end on this rest.
Notes and rest are in voice 1.
Choose a zoomfactor that makes the whole passage
fit on one screen in Continuous View.
Then the macro can make the tempochanges invisible
and the notes of the tempostaff small and inaudible.
Execution will work more stable when there are
less staves visible.

Eight note - Quaver		4
Dotted				4.
Quarter note - Crotchet	 	5
Dotted				5.
Half note -Minim			6
Dotted				6.

Input start tempo and the change in tempo.
E.g.	5.=90+0.15 for an accelerando.
Or	4=132-1.33 for a ritardando.

Press OK.
Select in the tempostaff the first note of the passage
and press Z.
)
    IfMsgBox, Cancel
        Return
    InputBox, Tempo, Tempo Changes, Enter start tempo and tempo change.`nSelect start note of the tempo track. Press Z., , W_IB, H_IB + 40, IB_X, IB_Y, , , Help = ?	;  (*change*?) NB: H_IB + 40 ?
    If ErrorLevel					; when Cancel is pressed
        Return
    If tempo not in ?,Help = ?
        Break
    }
}
Send {Volume_Mute}			; Mute/unmute the master volume
KeyWait, z, d
MouseGetPos, StartX, StartY

Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 150				; 
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (Errorlevel = 0)
{
    MsgBox, 4144, Tempo Changes, Something went wrong!`nPossibly the window Select Color`ncovered the tempo staff.`nMove it out of the way and try again.`nThe macro will exit.
    Send {Volume_Mute}			; Mute/unmute the master volume
    Click, %StartX%, %StartY%
    Return
}
Send {Raw}#aa55ff			; select color medium purple 0xaa55ff
Sleep, 50
Send {Enter}
Sleep, 50
CoordMode, Mouse, Screen
Position := 0
Loop, Parse, Tempo, =+-					; the delimiters are =, + and -
{
    Position += StrLen(A_LoopField) + 1			; retrieve the delimiter (=, - or +) found by the parsing loop
    SeparatorTempo := SubStr(Tempo, Position, 1)
    If (A_Index = 1)
    {
        Notevalue := A_LoopField
;        MsgBox, Notevalue is %Notevalue%		; for testing
        Send ^{F9}					; Palette Search (*PS)
        Sleep, 100
        If (Notevalue = "4")
            Send m-3					; glyph 404, Eight =80
        If (Notevalue = "4.")
            Send m-6					; glyph 405, Eight dotted =80
        If (Notevalue = "5")
            Send m-2					; glyph 402, Quarter =80
        If (Notevalue = "5.")
            Send m-5					; glyph 403, Quarter dotted =80
        If (Notevalue = "6")
            Send m-1					; glyph 400, Half note =80
        If (Notevalue = "6.")
            Send m-4					; glyph 401, Half note dotted =80
        Sleep, 100
        Send ^!p					; MSc user defined shortcut 'Apply current palette element'
        Sleep, 200
    }
    If (A_Index = 2)
    {
	NumericSign := SeparatorTempo			; only in this pass + or - can be found
        StartTempo := A_LoopField
; MsgBox, StartTempo is %StartTempo%			; for testing
; MsgBox, NumericSign is %NumericSign%			; for testing
        Click, %IN_104_X%, %IN_104_Y%			; I(104) Tempo text - Tickbox Follow text
        Sleep, 50
        Click, %IN_105_X%, %IN_105_Y%			; I(105) Tempo amount - Numeric input rectangle
        Sleep, 50
        Send {left}
        Send {BS 6}
        Send %StartTempo%				; moet ook naar 1e lus als A_Index = 3
        Sleep, 50
        Send {Escape}
    }
    If (A_Index = 3)
    {
        ChangeTempo := A_LoopField			; only in this pass ChangeTempo can be found
;        MsgBox, ChangeTempo is %ChangeTempo%		; for testing
        Loop
        {
            Send !{right}
            Sleep, 150
            ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Rest.png
            If (ErrorLevel = 0)				; rest found
            {
                StopChangeTempo := 1
                Break
            }
            If (ErrorLevel = 1)
            {
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
;                If (ErrorLevel = 0)			; element is note
;                    Continue
                If (ErrorLevel = 1)			; barline
                    Continue
            }
;            If (StopChangeTempo := 1)
;                Break
            Send ^!p					; attaches the original tempo
            Sleep, 200                
            Click, %IN_104_X%, %IN_104_Y%		; I(104) tempo text - tickbox Follow text
            Sleep, 50
            Click, %IN_105_X%, %IN_105_Y%		; I(105) tempo amount - Numeric input rectangle
            Sleep, 50
            Send {left}
            Send {BS 6}					; clears fixed value of each new Tempo input
            If (A_Index = 1)
                Clipboard := StartTempo
            ClipWait
            If (NumericSign = "+")
                ClipNew := Clipboard + ChangeTempo
            If (NumericSign = "-")
                ClipNew := Clipboard - ChangeTempo
            TempoRounded := Round(ClipNew, 2)		; tempo rounded to 2 decimal places
            ClipNew := TempoRounded
            Clipboard = %ClipNew%
;                MsgBox, Clipboard is %Clipboard%
            Send ^a
            Sleep, 50
            Send ^v
            Sleep, 50
            Send {Escape}				; selects last tempo
        }
        If (A_Index = 3)
            Break
    }
}
clipboard =   						; Empty the clipboard
Loop
{
    Send !{left}
    Sleep, 150
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
}
Click, %IN_012_X%, %IN_012_Y%				; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%					; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#ffaa7f					; select color light salmon 0xffaa7f
Sleep, 50
Send {Enter}
Sleep, 50
CoordMode, Mouse, Screen

Send {Escape}
Sleep, 100
PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
if ErrorLevel
{
    MsgBox, 4144, In search of left element, The color was not found.`nPossibly the window Select Color`ncovered the note.`nOr the element is off screen.`nSet the range manually with H + =.
    Return
}
Send {Click %MediumPurpleX%, %MediumPurpleY%}
Sleep, 50
PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB
if ErrorLevel
{
    MsgBox, 4144, In search of right element, The color was not found.`nPossibly the window Select Color`ncovered the note.`nOr the element is off screen.`nSet the range manually with H + =.
    Send {Volume_Mute}					; Mute/unmute the master volume
    Return
}
Send +{Click %LightSalmonX%, %LightSalmonY%}
Sleep, 100
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4144, Search for tempo, Tempo not found. Make them invisible manually.
    Send {Volume_Mute}					; Mute/unmute the master volume
    Return
}
MouseMove, ElementX, ElementY				; to highest tempochange
Click, right						; executing each line takes about 30 ms
Sleep, 150
Loop, 6
{							; additional sleeptime increases stability
Send {down}
Sleep, 50
}
Sleep, 100						; important!
Send {right}
Sleep, 350						; increase sleeptime if needed
Send {down}
Sleep, 100
Send {down}						; all tempo changes in range selected
Sleep, 100
Send {Enter}						; OK
Sleep, 100
Send v							; tempo changes invisible
Sleep, 50
Send {Click %MediumPurpleX%, %MediumPurpleY%}
Sleep, 50
Send +{Click %LightSalmonX%, %LightSalmonY%}		; select notes of tempo passage
Sleep, 100
Click, %IN_007_X%, %IN_007_Y%				; I(007) Select Notes
Sleep, 100
Click, %IN_046_X%, %IN_046_Y%				; I(046) Note play tick box - play off
Sleep, 100
Click, %IN_030_X%, %IN_030_Y%				; I(030) Chord tickbox Small
Sleep, 100
Send {Click %MediumPurpleX%, %MediumPurpleY%}
Sleep, 50
Send +{Click %LightSalmonX%, %LightSalmonY%}		; select notes of tempo passage
Sleep, 100
Click, %IN_002_X%, %IN_002_Y%				; I(002) rectangular Set Color = Reset Color - ELEMENT GROUP
Sleep, 50
Click %LightSalmonX%, %LightSalmonY%
Send {Volume_Mute}					; Mute/unmute the master volume
Return

; ♣======================================== MAKE CUE ==============================================

; the macro operates best in Continuous View
; it works on a cue passage which you have already copied to its destination
; usually this passage will be created via the Selection Filter (Z + F) in macrogroup F1
; and first and last element are colored as Colored Range pair #4
; the passage must be in voice 1
; exchange voice 1 and 2 - user defined shortcut Ctrl + Shift + \ (*change*?)
; if there are dynamics in the cue (unusual) their textsize has to be decreased separately
; range select -> mousepos. on dynamic -> M + T

~z & q::					; create cue
SkipInstrumentName := 0
clipboard := ""					; empty the clipboard
Send {Volume_Mute}				; Mute/unmute the master volume
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    MsgBox, 4112, Inspector Check, The Canvas is not in the defined state.`nThe macro will exit.
    Goto, FinishCueCreate
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
If ErrorLevel
{
    MsgBox, 4144, Create Cue,No note or rest selected`nSelect a note or rest and try again.
    Goto, FinishCueCreate
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
    MsgBox, 4099, Create Cue, Searching for a note or rest.`nNothing found.`nTry a higher zoom factor.
    Goto, FinishCueCreate
}
Click, %ElementX%, %ElementY%
Sleep, 50

MsgBox, 4099, Create Cue,
(
Is the cue passage a colored range?

The macro works on a passage which you
have already copied to its destinaton.
If you have created the passage with
Z + F its range is already colored.
Press Yes.

If the range is not colored press No.
Next select the first note or rest
of the range and press Z.
)
IfMsgBox, Cancel
    Goto, FinishCueCreate
IfMsgBox, Yes
{
    Send {Escape}
    Sleep, 50
    Goto, SkipCueColRange
}
Loop
{
    Keywait, z, d
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
    {
        If (ErrorLevel = 1)
        {
            MsgBox, 4144, Create Cue - Select first note or rest, You did not select a note or rest!`nSelect a note or rest and Press Z again.
            Continue
        }
        If (ErrorLevel = 0)
            Break
    }
}
Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#aa55ff			; select color medium purple 0xaa55ff
Sleep, 50
Send {Enter}
Sleep, 200
CoordMode, Mouse, Screen
MsgBox, 4161, Create Cue, Select the last note or rest of the range.`nPress Z when ready.
IfMsgBox, Cancel
{
    Send {Escape}			; deselect to show medium purple
    Sleep, 150				; needed for larger scores
    PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
    Click, %MediumPurpleX%, %MediumPurpleY%
    Sleep, 50
;    MsgBox, MediumPurple selected?	; for testing
    Click, %IN_013_X%, %IN_013_Y%	; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
        Goto, FinishCueCreate
}
Loop
{
    Keywait, z, d
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
    {
        If (ErrorLevel = 1)
        {
            MsgBox, 4144, Create Cue - Select last note or rest, You did not select a note or rest!`nSelect a note or rest and Press Z again.
            Continue
        }
        If (ErrorLevel = 0)
            Break
    }
}
Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#ffaa7f			; select color light salmon 0xffaa7f
Sleep, 50
Send {Enter}
Sleep, 200
CoordMode, Mouse, Screen
SkipCueColRange:			; if cue material is already in colored range
PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
Send {Click %MediumPurpleX%, %MediumPurpleY%}
Sleep, 150
PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB
Send +{Click %LightSalmonX%, %LightSalmonY%}
Sleep, 150

ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If Errorlevel
{
    MsgBox, 4144, Create Cue, No range selected!`nThe colorsearch failed.`nTry a higher zoom factor.`nThe macro will exit.
    Goto, FinishCueCreate
}
Send ^+{\}					; exchange voice 1 and 2 - user defined shortcut Ctrl + Shift + \ (*change*?)
Sleep, 50
Send ^+{\}					; exchange voice 1 and 2 - user defined shortcut Ctrl + Shift + \ (*change*?)
Sleep, 50
; MsgBox, delay after voice exchange		; for testing
Click, %IN_007_X%, %IN_007_Y%			; I(007) Select Notes - ELEMENT GROUP
Sleep, 100
Click, %IN_046_X%, %IN_046_Y%			; I(046) Note play tick box
Sleep, 100
Click, %IN_030_X%, %IN_030_Y%			; I(030) Chord tickbox Small
Sleep, 50
Send {Escape}					; deselect range to show colors
Sleep, 200					; needed for dense scores
; MsgBox, delay after deselect range to colors	; for testing

PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB
Click %LightSalmonX%, %LightSalmonY%		; last element of range SMALL 'chords'
Sleep, 50

; MsgBox, 4148, , delay - last element of range SMALL 'chords'?		; for testing
; IfMsgBox, No
;    Goto, FinishCueCreate

Send !{right}
Sleep, 50
Loop
{
    Send !{left}
    Sleep, 150
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
    {
        PixelSearch, RangeRestX, RangeRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        Sleep, 50
        Break
    }
}
PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
Send {Click %MediumPurpleX%, %MediumPurpleY%}
Sleep, 150
Send +{Click %LightSalmonX%, %LightSalmonY%}	; selects passage
Sleep, 250					; needed for dense scores
MouseMove, RangeRestX, RangeRestY

; MsgBox, 4148, , Rest selected?		; for testing
; IfMsgBox, No
;     Goto, FinishCueCreate

Click, right
Sleep, 50
Send {up 4}
Sleep, 50
Send {enter}
Sleep, 100
Send {up}
Send {enter}					; window select
Sleep, 100
CoordMode, Mouse, Window
Click, %WS_04_X%, %WS_04_Y%			; (WS_04) Same voice Window Select
Sleep, 50
Click, %WS_03_X%, %WS_03_Y%			; (WS_03) In selection Window Select
Sleep, 50					; rests in voice 1 selected
Send {enter}
Sleep, 100
CoordMode, Mouse, Screen
Click, %IN_021_X%, %IN_021_Y%			; I(021) Y-offset - OVERLAP - ELEMENT
Sleep, 50
Send {up 3}
Sleep, 50
Click, %IN_070_X%, %IN_070_Y%			; I(070) Rest tickbox small
Sleep, 50
MsgBox, 4161, Create Cue - copy part name,
(
Select a note in the source staff and Press Z.
The instrumentname is copied.

To paste the name in the cue passage:
Select the first note or rest and press Z.
Take care that the cue passage is fully visible.
)
IfMsgBox, Cancel
{
    SkipInstrumentName := 1
    Goto, MedPurpleSearch
}
Keywait, z, d
Click, right
Send {down}
Send {Enter}
Sleep, 100
Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
Sleep, 100
CoordMode, Mouse, Window
Click, %WSPP_04X%, %WSPP_04Y%			; (WSPP_04) Lower right corner of Long instrument name
; Click, %WSPP_05X%, %WSPP_05Y%			; (WSPP_05) Lower right corner of Short instrument name
Sleep, 50
Send ^a
Sleep, 50
Send ^c
Sleep, 50
ClipNew := Clipboard
Click, %WSPP_08X%, %WSPP_08Y%			; ; (WSPP_08) OK
Sleep, 100
CoordMode, Mouse, Screen
Clipboard := "[" ClipNew "]"
Tooltip, Copy instrument name`nTake care that the cue passage`nin the destination staff is visible.`nSelect start of cue.`nPress Z when ready., MediumPurpleX, MediumPurpleY - 100, 5	; - 100 is 100 higher (*change*?)
Keywait, z, d
Tooltip, , , , 5				; close tooltip (5)
Sleep, 50
MedPurpleSearch:				; preparing reset colored range when adding instrument name is skipped
PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB	; establishing new coordinates (smallnotes and after possible screenshift)
If (SkipInstrumentName = 1)
    Goto, LightSalmonSearch
Click, %MediumPurpleX%, %MediumPurpleY%
Sleep, 200
; MsgBox, Medium Purple clicked?		; for testing
Send ^t
Sleep, 150
Send ^v						; paste name at start of cue
Sleep, 50
Send {Escape}
LightSalmonSearch:
If (SkipInstrumentName = 1)
{
    Send {Escape}				; to deselect first element of cue, turns medium purple
    Sleep, 150
}
PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB	; establishing new coordinates (smallnotes and after possible screenshift)
If Errorlevel					; if light salmon not found
{
;    MsgBox, Color right element not found	; for testing
    Send {Escape}				; to deselect last element of cue, turns light salmon
    Sleep, 50
    PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB	; small notes on new position need new coordinates
}
Send {Click %MediumPurpleX%, %MediumPurpleY%}
; MsgBox, First cue element selected?		; for testing
Sleep, 150
Send +{Click %LightSalmonX%, %LightSalmonY%}	; selects passage
Sleep, 250					; 250 needed for dense scores
; MsgBox, Cue passage selected?			; for testing
Click, %IN_002_X%, %IN_002_Y%			; I(002) rectangle Set Color = Reset Color
Sleep, 200
Click, %MediumPurpleX%, %MediumPurpleY%
Sleep, 50

FinishCueCreate:
Send {Volume_Mute}				; Mute/unmute the master volume
Return


; ♣===================================== COPY PART NAME ============================================

~z & j::						; copy instrument name (for cues)
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
clipboard := ""						; empty the clipboard
MsgBox, 4097, Copy Part Name, Select a note in the source staff`nand press Z.
IfMsgBox, Cancel
    Return
KeyWait, z, d
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4144, Copy Part Name, Note not found.`nMay be there is no note selected in voice 1.`nOr try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Click, right
Send {down}
Send {Enter}
Sleep, 100
Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
Sleep, 100
CoordMode, Mouse, Window
Click, %WSPP_04X%, %WSPP_04Y%			; (WSPP_04) Lower right corner of Long instrument name
Sleep, 50
Send ^a
Sleep, 50
Send ^c
Sleep, 50
ClipNew := Clipboard
Click, %WSPP_08X%, %WSPP_08Y%			; (WSPP_08) OK
Sleep, 100
Clipboard := "[" ClipNew "]"
CoordMode, Mouse, Screen
Tooltip, Copy part name`nSelect start of cue.`nPress Z., ElementX, ElementY - 100, 6	; (*change*?)
KeyWait, z, d
Tooltip, , , , 6				; close tooltip (6)
Send ^t
Sleep, 100
Send ^v
Sleep, 50
Send {Escape}
Sleep, 100
Loop
{
    Send !{right}
    Sleep, 300
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
}
Send {left}
Return

; ♣================================== ACCIDENTALS IN ORNAMENTS ====================================

; note selected and its ornament attached
; for the size of the Window Special Characters and the other data see F9 Reference 
; to determine the width of the window see F9 Reference (triangles next to Unicode Characters JUST disappear)
; topleft special character is a (big) flat. the small accidentals are in fields 4,5,6,7 and 8
; determine the width of the Special Character field.
; the numeric values of the accidentals presuppose the default min. distance of the ornament (0.50)

~z & g::						; graphic accidentals in ornaments
UpperNo := 0
LowerNo := 0
Send {Volume_Mute}					; Mute/unmute the master volume
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    MsgBox, 4112, Inspector Check, The Canvas is not in the defined state.`nThe macro will exit.
    Goto, FinishAccOr
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    MsgBox, 4144, Accidentals to Ornaments, ⁞  No note selected!`n⁞  The macro will exit.
    Goto, FinishAccOr
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
    MsgBox, 4144, Accidentals to Ornaments, ⁞  Note not found.`n⁞  Try a higher zoomfacor.`n⁞  The macro will exit.
    Goto, FinishAccOr
}
Click, %ElementX%, %ElementY%


; InputBox, AccidentalOrnament, Add Graphic Accidentals to Ornaments, , , W_IB, H_IB, IB_X, IB_Y, , , Enter above/below accidental    ? for Help
InputBox, AccidentalOrnament, Add Graphic Accidentals to Ornaments, , , W_IB, H_IB, ElementX+100, ElementY-120, , , Enter above/below accidental    ? for Help	; (*change*?)
if ErrorLevel			; when Cancel is pressed
    Goto, FinishAccOr		; exits the macro

If (AccidentalOrnament = "?") || (AccidentalOrnament = "Enter above/below accidental    ? for Help")
{
    MsgBox, 4096, Add Accidentals to Ornaments,
(
Enter first the accidental positioned above
the ornament and then the one below.
Separate the two by a comma.

Sharp		S
Flat		F
Natural		N
Double sharp	DS
Double flat	DF
No accidental	0	(zero)

E.g.   0,S   or   F,N

Entering only one command puts the
accidental above the ornament.

Some wider ornaments are not centered
on the note. They need a small X-offset.
)
    Goto, FinishAccOr				; exits the macro
}

If AccidentalOrnament not in s,f,n,ds,df,?
,s,,f,s,,n,s,,ds,s,,df,s,,0
,f,,s,f,,n,f,,ds,f,,df,f,,0
,n,,s,n,,f,n,,ds,n,,df,n,,0
,ds,,s,ds,,f,ds,,n,ds,,df,ds,,0
,df,,s,df,,f,df,,n,df,,ds,df,,0
,0,,s,0,,f,0,,n,0,,ds,0,,df,0,,0
{
    MsgBox, 4144, Accidentals to Ornaments, ⁞  No valid command!`n⁞  The macro will exit.
    Return
}

Loop, Parse, AccidentalOrnament, `,
{
;    MsgBox, The content of pass %A_Index% is %A_Loopfield%	:for testing
    If (A_Index = 3)
        Break
    If ((A_Index = 1) and (A_Loopfield = "0"))
        {
            UpperNo := 1			; no accidental above
;            MsgBox, UpperNo is %UpperNo%
        }
    If (A_Index = 2) and (A_Loopfield = "0")
        {
            LowerNo := 1			; no accidental below
;            MsgBox, LowerNo is %LowerNo%
        }
    If (A_Loopfield = "0")
        Continue
    Send ^t
    Sleep, 300
    Send {F2}					; window special charcters WSC
    Sleep, 200
    WinActivate, Special Characters
    Sleep, 200
    WinMove, Special Characters, , , , WSC_Width, WSC_Height
    Sleep, 200
    CoordMode, Mouse, Window
    Click, %WSC_01X%, %WSC_01Y%			; (WSC_01) Tab Common Symbols
    Sleep, 200					; to land in the right submenu

    If (A_Loopfield = "f")
    {
        Flat_X := WSC_02X + WSC_FieldWidth * 3
        Click, %Flat_X%, %WSC_02Y%
    }
    If (A_Loopfield = "n")
    {
        Natural_X := WSC_02X + WSC_FieldWidth * 4
        Click, %Natural_X%, %WSC_02Y%
    }
    If (A_Loopfield = "s")
    {
        Sharp_X := WSC_02X + WSC_FieldWidth * 5
        Click, %Sharp_X%, %WSC_02Y%
    }
    If (A_Loopfield = "df")
    {
        DoubleFlat_X := WSC_02X + WSC_FieldWidth * 6
        Click, %DoubleFlat_X%, %WSC_02Y%
    }
    If (A_Loopfield = "ds")
    {
        DoubleSharp_X := WSC_02X + WSC_FieldWidth * 7
        Click, %DoubleSharp_X%, %WSC_02Y%
    }
    Sleep, 200
    Send {F2}
    Sleep, 200
    Send {Escape}
    Sleep, 100
    If (A_Index = 1)
    {
        CoordMode, Mouse, Screen
        Click, %IN_017_X%, %IN_017_Y%			; I(017) Minimum distance input field OVERLAP - ELEMENT
        Sleep, 50
        Send ^a
        Send 0.20
        Sleep, 50
        Click, %IN_020_X%, %IN_020_Y%			; I(020) X-offset - OVERLAP - ELEMENT
        Sleep, 50
        Send ^a
        Send 0.50
        Sleep, 50
        Click, %IN_021_X%, %IN_021_Y%			; I(021) Y-offset - OVERLAP - ELEMENT
        Sleep, 50
        Send ^a
        Send -2.00
        Sleep, 100
        Send {Escape}
        Sleep, 300
        Loop
        {
            Sleep, 500
            ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
            If (Errorlevel = 1)
            {
                Send !{left}
                Continue
            }
            If (Errorlevel = 0)
                Break
        }
    }
    If (A_Index = 2)
    {
        CoordMode, Mouse, Screen

        If ((UpperNo = 0) and (LowerNo = 0))		; if accidentals above and below ornament
        {
            Click, %IN_017_X%, %IN_017_Y%		; I(017) Minimum distance input field OVERLAP - ELEMENT
            Sleep, 50
            Send ^a
            Sleep, 50
            Send -4.00
        }
        Click, %IN_020_X%, %IN_020_Y%			; I(020) X-offset - OVERLAP - ELEMENT
        Sleep, 50
        Send ^a
        Send 0.52
        Sleep, 50
        Click, %IN_021_X%, %IN_021_Y%			; I(021) Y-offset - OVERLAP - ELEMENT
        Sleep, 50
        Send ^a
        Sleep, 50
        If ((UpperNo = 0) and (LowerNo = 0))		; if accidentals above and below ornament
            Send -1.00
        If (UpperNo = 1)				; if only accidental below
            Send -1.50
        Sleep, 50

        If (UpperNo = 1)				; if only accidental below
        {
            Click, %IN_017_X%, %IN_017_Y%		; I(017) Minimum distance input field OVERLAP - ELEMENT
            Sleep, 50
            Send ^a
            Sleep, 50
            Send -3.00					; orig
            Sleep, 50
        }
        Send {Escape}
        Sleep, 50
        Loop
        {    
            Send !{left}
            Sleep, 500
            ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
            If (Errorlevel = 1)
                Continue
            If (Errorlevel = 0)			; note selected
                Break
        }
    }
}
Loop						; check!!!
{
    Send !{right}
    Sleep, 250					; was 200
    ImageSearch, , , IM_24_X1, IM_24_Y1, IM_24_X2, IM_24_Y2, *40 IM_24_Ornament_triangle_section_open.png
    If (Errorlevel = 1)
        Continue
    If (Errorlevel = 0)				; ornament selected
        Break
}
If ((UpperNo = 1) and (LowerNo = 0))		; if only accidental below
{
    Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
    Sleep, 50
    Send ^a
    Send -1.00
    Sleep, 50
    Send {Escape}
    Sleep, 50
}
Loop
{    
    Send !{left}
    Sleep, 200
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (Errorlevel = 1)
        Continue
    If (Errorlevel = 0)				; note selected
        Break
}
FinishAccOr:
Send {Volume_Mute}				; Mute/unmute the master volume
Return

; ♣======================================== SPECIAL CHARACTERS ===================================

~z & h::					; add special characters from common symbols
TextExist := 0
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseGetPos, StartX, StartY
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    MsgBox, 4112, Inspector Check, The Canvas is not in the defined state.`nThe macro will exit.
    Goto, FinishSpecChar
}
ImageSearch, , , IM_17_X1, IM_17_Y1, IM_17_X2, IM_17_Y2, *40 IM_17_Inspector_Text.png
If (ErrorLevel = 1)				; no edit of existing text
    TextExist := 0
If (ErrorLevel = 0)				; edit of existing text
{
    TextExist := 1
    Send {bs}					; in text deletes the just entered z
    Sleep, 50
    ; InputBox, SpecChar, Add Special Characters, , , W_IB, H_IB, IB_X, IB_Y, , , Enter shortcut    ? for Help
    InputBox, SpecChar, Add Special Characters, , , W_IB, H_IB, StartX+100, StartY-120, , , Enter shortcut    ? for Help	; (*change*?)
    If ErrorLevel				; when Cancel is pressed
        Goto, FinishSpecChar			; exits the macro
    Goto, EditTextSpecChar
}
If (TextExist = 0)
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 0)
        Goto, CreateNewText
    If (ErrorLevel = 1)
    {
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png        
        If (ErrorLevel = 0)
            Goto, CreateNewText
        If (ErrorLevel = 1)
        {
            MsgBox, 4144, Add Special Characters, No note or rest selected.`nSelect a note or rest and try again.`nThe macro will exit.
            Goto, FinishSpecChar
        }
    }
}
CreateNewText:
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
        MsgBox, 4144, Add Special Characters, ⁞  Note or rest not found.`n⁞  Try a higher zoomfacor.`n⁞  The macro will exit.
        Goto, FinishSpecChar
    }
    Click, %ElementX%, %ElementY%
    Sleep, 50


    ; InputBox, SpecChar, Add Special Characters, , , W_IB, H_IB, IB_X, IB_Y, , , Enter shortcut    ? for Help			; in Inspector
    InputBox, SpecChar, Add Special Characters, , , W_IB, H_IB, ElementX+100, ElementY-120, , , Enter shortcut    ? for Help	; near the mouse (*change*?)
    If ErrorLevel				; when Cancel is pressed
        Goto, FinishSpecChar			; exits the macro
    If (SpecChar = "?") || (SpecChar = "Enter shortcut    ? for Help")
        Goto, EditTextSpecChar
}

EditTextSpecChar:

If (SpecChar = "?") || (SpecChar = "Enter shortcut    ? for Help")
{
    Loop
    {
        MsgBox, 4096, Add Special Characters,
(
Big Flat			BF
Big Natural		BN
Big Sharp		BS
Small Flat		F
Small Natural		N
Small Sharp		S
Small Double Flat		DF
Small Double Sharp	DS

Whole note/rest		7	7R
Half note/rest		6	6R
Quarter note/rest		5	5R
Eight note/rest		4	4R
16th note/rest		3	3R
32nd note/rest		2	2R
64th note/rest		1	1R
128th note/rest		0	0R

Segno			$
Segno serpent		$$
Coda			C
Square Coda		SC
Repeat last measure	./.
Repeat last 2 measures	.//.
Repeat last 4 measures	.////.

Elision			E
Narrow Elision		NE
Wide Elision		WE
Dynamics p,m,f,n,r,s,z	*p,*m,*f,*n,*r,*s,*z

Finger substitution above	FSA
Finger substitution below	FSB

1/4,1/2,3/4,1/3,2/3,1/5,2/5,3/5,4/5,1/6,5/6,1/8,3/8,5/8,7/8

Use a high zoomfactor for small characters.
After entering the symbol as an independent text
you can immediately change its font size
and position with the arrowkeys.
Confirm each step by pressing Z.
)
        ; InputBox, SpecChar, Add Special Characters, , , W_IB, H_IB, IB_X, IB_Y, , , Enter shortcut    ? for Help
        InputBox, SpecChar, Add Special Characters, , , W_IB, H_IB, StartX+100, StartY-120, , , Enter shortcut    ? for Help	; near the mouse (*change*?)
        If ErrorLevel				; when Cancel is pressed
            Goto, FinishSpecChar		; exits the macro
        If (SpecChar = "?") || (SpecChar = "Enter shortcut    ? for Help")
            Continue
        If SpecChar not in ?, Enter shortcut    ? for Help
            Break
    }
}

If SpecChar not in .,0,1,2,3,4,5,6,7,0r,1r,2r,3r,4r,5r,6r,7r,bf,bn,bs,f,n,s,df,ds,$,$$,c,sc
,./.,.//.,.////.,gclef,fclef,cclef,ne,e,we,*p,*m,*f,*n,*r,*s,*z,cr,x,fsb,fsa
,1/4,1/2,3/4,1/3,2/3,1/5,2/5,3/5,4/5,1/6,5/6,1/8,3/8,5/8,7/8

; alphabetically
; *f,*m,*n,*p,*r,*s,*z,
; ,$,$$,.,./.,.//.,.////.,0,1,2,3,4,5,6,7,
; ,0r,1r,2r,3r,4r,5r,6r,7r
; ,bf,bn,bs,c,cclef,cr,df,ds,e,f,fclef,fsa,fsb,gclef,n,ne,s,sc,we,x
; ,1/4,1/2,3/4,1/3,2/3,1/5,2/5,3/5,4/5,1/6,5/6,1/8,3/8,5/8,7/8

{
    MsgBox, 4144, Add Special Characters, ⁞  No valid command!`n⁞  The macro will exit.
    Goto, FinishSpecChar			; exits the macro
}

If (TextExist = 0)
{
    Send ^t
    Sleep, 100					; was 200
}

Send {F2}					; window special charcters WSC
Sleep, 200
WinActivate, Special Characters
Sleep, 100
WinMove, Special Characters, , , , WSC_Width2, WSC_Height2
Sleep, 100
; MsgBox, SHOW window - highest row end at eighth rest?
CoordMode, Mouse, Window
Click, %WSC_01X%, %WSC_01Y%			; (WSC_01) Tab Common Symbols
Sleep, 50


Col_1_X := WSC_02X
Col_2_X := Col_1_X + WSC_FieldWidth

; MsgBox, the content of Col_2_X is %Col_2_X% must be 72

Col_3_X := Col_2_X + WSC_FieldWidth
Col_4_X := Col_3_X + WSC_FieldWidth
Col_5_X := Col_4_X + WSC_FieldWidth
Col_6_X := Col_5_X + WSC_FieldWidth
Col_7_X := Col_6_X + WSC_FieldWidth
Col_8_X := Col_7_X + WSC_FieldWidth
Col_9_X := Col_8_X + WSC_FieldWidth
Col_10_X := Col_9_X + WSC_FieldWidth
Col_11_X := Col_10_X + WSC_FieldWidth
Col_12_X := Col_11_X + WSC_FieldWidth
Col_13_X := Col_12_X + WSC_FieldWidth
Col_14_X := Col_13_X + WSC_FieldWidth
Col_15_X := Col_14_X + WSC_FieldWidth
Col_16_X := Col_15_X + WSC_FieldWidth
Col_17_X := Col_16_X + WSC_FieldWidth
Col_18_X := Col_17_X + WSC_FieldWidth
Col_19_X := Col_18_X + WSC_FieldWidth
Col_20_X := Col_19_X + WSC_FieldWidth
Col_21_X := Col_20_X + WSC_FieldWidth

; MsgBox, the content of Col_21X is %Col_21_X% must be ...

Row_1_Y := WSC_02Y
Row_2_Y := Row_1_Y + WSC_FieldHeight
Row_3_Y := Row_2_Y + WSC_FieldHeight
Row_4_Y := Row_3_Y + WSC_FieldHeight
Row_5_Y := Row_4_Y + WSC_FieldHeight
Row_6_Y := Row_5_Y + WSC_FieldHeight
Row_7_Y := Row_6_Y + WSC_FieldHeight

; MsgBox, The content of SpecChar is %SpecChar%		; for testing

If (SpecChar = "bf")					; big flat
    Click, %Col_1_X%, %Row_1_Y%
If (SpecChar = "bn")					; big natural
    Click, %Col_2_X%, %Row_1_Y%
If (SpecChar = "bs")					; big sharp
    Click, %Col_3_X%, %Row_1_Y%
If (SpecChar = "f")					; small flat
    Click, %Col_4_X%, %Row_1_Y%
If (SpecChar = "n")					; small natural
    Click, %Col_5_X%, %Row_1_Y%
If (SpecChar = "s")					; small sharp
    Click, %Col_6_X%, %Row_1_Y%
If (SpecChar = "df")					; small double flat
    Click, %Col_7_X%, %Row_1_Y%
If (SpecChar = "ds")					; small double sharp
    Click, %Col_8_X%, %Row_1_Y%
If (SpecChar = "7")					; whole note
    Click, %Col_9_X%, %Row_1_Y%
If (SpecChar = "6")					; half note
    Click, %Col_10_X%, %Row_1_Y%
If (SpecChar = "5")					; quarter note
    Click, %Col_11_X%, %Row_1_Y%
If (SpecChar = "4")					; eigth note
    Click, %Col_12_X%, %Row_1_Y%
If (SpecChar = "3")					; 16th note
    Click, %Col_13_X%, %Row_1_Y%
If (SpecChar = "2")					; 32nd note
    Click, %Col_14_X%, %Row_1_Y%
If (SpecChar = "1")					; 64th note
    Click, %Col_15_X%, %Row_1_Y%
If (SpecChar = "0")					; 128th note
    Click, %Col_16_X%, %Row_1_Y%
If (SpecChar = ".")					; augmentation dot
    Click, %Col_17_X%, %Row_1_Y%
If (SpecChar = "7r")					; rest duration measure - whole rest
    Click, %Col_18_X%, %Row_1_Y%
If (SpecChar = "6r")					; half rest
    Click, %Col_19_X%, %Row_1_Y%
If (SpecChar = "5r")					; quarter rest
    Click, %Col_20_X%, %Row_1_Y%
If (SpecChar = "4r")					; eight rest
    Click, %Col_21_X%, %Row_1_Y%
If (SpecChar = "3r")					; 16th rest
    Click, %Col_1_X%, %Row_2_Y%
If (SpecChar = "2r")					; 32nd rest
    Click, %Col_2_X%, %Row_2_Y%
If (SpecChar = "1r")					; 64th rest
    Click, %Col_3_X%, %Row_2_Y%
If (SpecChar = "0r")					; 128th rest
    Click, %Col_4_X%, %Row_2_Y%
If (SpecChar = "$")					; segno
    Click, %Col_5_X%, %Row_2_Y%
If (SpecChar = "c")					; coda
    Click, %Col_6_X%, %Row_2_Y%
If (SpecChar = "$$")					; segno serpent
    Click, %Col_7_X%, %Row_2_Y%
If (SpecChar = "sc")					; square coda
    Click, %Col_8_X%, %Row_2_Y%
If (SpecChar = "./.")					; repeat last measure
    Click, %Col_9_X%, %Row_2_Y%
If (SpecChar = ".//.")					; repeat last two measures
    Click, %Col_10_X%, %Row_2_Y%
If (SpecChar = ".////.")				; repeat last four measures
    Click, %Col_11_X%, %Row_2_Y%
If (SpecChar = "gclef")					; G clef
    Click, %Col_12_X%, %Row_2_Y%
If (SpecChar = "fclef")					; F clef
    Click, %Col_13_X%, %Row_2_Y%
If (SpecChar = "cclef")					; F clef
    Click, %Col_14_X%, %Row_2_Y%
If (SpecChar = "ne")					; narrow elision
    Click, %Col_15_X%, %Row_2_Y%
If (SpecChar = "e")					; elision
    Click, %Col_16_X%, %Row_2_Y%
If (SpecChar = "we")					; wide elision
    Click, %Col_17_X%, %Row_2_Y%
If (SpecChar = "*p")					; dynamic - piano
    Click, %Col_18_X%, %Row_2_Y%
If (SpecChar = "*m")					; dynamic - mezzo
    Click, %Col_19_X%, %Row_2_Y%
If (SpecChar = "*f")					; dynamic - forte
    Click, %Col_20_X%, %Row_2_Y%
If (SpecChar = "*n")					; dynamic - niente
    Click, %Col_21_X%, %Row_2_Y%
If (SpecChar = "*r")					; dynamic - rinforzando
    Click, %Col_1_X%, %Row_3_Y%
If (SpecChar = "*s")					; dynamic - sforzato
    Click, %Col_2_X%, %Row_3_Y%
If (SpecChar = "*z")					; dynamic - z
    Click, %Col_3_X%, %Row_3_Y%
If (SpecChar = "cr")					; copyright sign
    Click, %Col_5_X%, %Row_3_Y%
If (SpecChar = "x")					; X
    Click, %Col_8_X%, %Row_4_Y%
If (SpecChar = "1/4")					; 1/4
    Click, %Col_3_X%, %Row_7_Y%
If (SpecChar = "1/2")					; 1/2
    Click, %Col_4_X%, %Row_7_Y%
If (SpecChar = "3/4")					; 3/4
    Click, %Col_5_X%, %Row_7_Y%
If (SpecChar = "1/3")					; 1/3
    Click, %Col_6_X%, %Row_7_Y%
If (SpecChar = "2/3")					; 2/3
    Click, %Col_7_X%, %Row_7_Y%
If (SpecChar = "1/5")					; 1/5
    Click, %Col_8_X%, %Row_7_Y%
If (SpecChar = "2/5")					; 2/5
    Click, %Col_9_X%, %Row_7_Y%
If (SpecChar = "3/5")					; 3/5
    Click, %Col_10_X%, %Row_7_Y%
If (SpecChar = "4/5")					; 4/5
    Click, %Col_11_X%, %Row_7_Y%
If (SpecChar = "1/6")					; 1/6
    Click, %Col_12_X%, %Row_7_Y%
If (SpecChar = "5/6")					; 5/6
    Click, %Col_13_X%, %Row_7_Y%
If (SpecChar = "1/8")					; 1/8
    Click, %Col_14_X%, %Row_7_Y%
If (SpecChar = "3/8")					; 3/8
    Click, %Col_15_X%, %Row_7_Y%
If (SpecChar = "5/8")					; 5/8
    Click, %Col_16_X%, %Row_7_Y%
If (SpecChar = "7/8")					; 7/8
    Click, %Col_17_X%, %Row_7_Y%
If (SpecChar = "fsb")					; finger substitution below
    Click, %Col_18_X%, %Row_7_Y%
If (SpecChar = "fsa")					; finger substitution above
    Click, %Col_19_X%, %Row_7_Y%

Sleep, 100
CoordMode, Mouse, Window
If (TextExist = 0)
{
    Send {F2}						; closes window Special Characters
    Sleep, 100
    Send {Escape}
    Sleep, 50
    Click, %IN_073_X%, %IN_073_Y%	; I(073) Text Font size - TEXT
    Tooltip, Set fontsize with arrow up/down.`nPress Z when ready., ElementX+100, ElementY-100, 7	; (*change*?)
    KeyWait, z, d
    Tooltip, , , , 7				; close tooltip (7)
    PixelSearch, CharacterX, CharacterY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, CharacterX, CharacterY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, CharacterX, CharacterY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, CharacterX, CharacterY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
    if ErrorLevel
    {
        MsgBox, 4144, Add Special Characters, ⁞  Character not found.`n⁞  Try a higher zoomfacor.`n⁞  The macro will exit.
        Goto, FinishSpecChar
    }
    Click, %CharacterX%, %CharacterY%
    Sleep, 50
    Tooltip, Position the character with the arrow keys.`nPress Z when ready., CharacterX+100, CharacterY-100, 8	; (*change*?)
    KeyWait, z, d
    Tooltip, , , , 8				; close tooltip (8)
    Click, %ElementX%, %ElementY%
    Return
}
FinishSpecChar:
Send {F2}
Return

; ♣====================================== SUBROUTINE ==============================================

InspectorCheck:
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    Send {Click}
    Sleep, 100
    Send {Escape}				; to suppress the contextual menu
    Sleep, 50
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit., 1
    Exit
}
Return

; ♣================================================================================================