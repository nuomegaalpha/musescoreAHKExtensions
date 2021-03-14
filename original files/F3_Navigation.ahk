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

; ♣================================================================================================

~[ & F3::
CoordMode, Tooltip, Screen
Tooltip, F3  Navigation, ToolT_F3_X, 0, 1		; tooltip (1) Navigation
Return


~] & F3::
MsgBox, 4132, Navigation, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 3::
MsgBox, 4096, F3: Navigation      [ + 3,
(
GLOBAL NAVIGATION

To the first empty measure			Z + TAB
after the last non-empty measure *
Skip notes and go				M + TAB
To the next empty measure
Skip whole measure rests and go		CapsLock + TAB
to the next note in staff

* As of MSc 3.5 there is a shortcut
  'Go to first empty trailing measure'.

Score - select first element			\ + Home
Score - select last element			\ + End

Continuous View - to highest staff	 	\ + Up
Continuous View - to lowest staff		\ + Down
Page View - to highest staff	 		\ + PageUp
Page View - to lowest staff			\ + PageDown

Select first note or rest 
Next screen highest staff	  		\ + Right
Previous screen highest staff	  	\ + Left

Scroll up #				Z + Up
Scroll down #				Z + Down
Scroll left #				Z + Left
Scroll right #				Z + Right

# Master commands

Micro Navigation Info			[ + I
)
Return
					
~[ & i::
MsgBox, 4096, F3: Micro Navigation      [ + I,
(
NB: If an Inspector section of an element is collapsed
expand it to its ▼ state	Z + I

Accidental *		Win + X
Articulation		Win + A
Augmentation dot *	Win + .    √
Barline			Alt + Win + B
Beam §			Win + B   √
Bend *			Ctrl + Win + B
Chord toggle tie		Win + C
Chord small ®		Alt + Win + C
Dynamic			Win + D
Fingering		Win + F
Fix to line * ®		Alt + Win + X
Fretboard Diagram	Win + Q
Grace note		Win + G
Hairpin			Win + H
Hook, Flag, Tail		Win + K   √
Note			Win + N
Note head group ®	Win + J
Note small ®		Alt + Win + N
Note stemless ®		Alt + Win + S
Ornament		Win + O
Play toggle ®		Alt + Win + O
Rest small ®		Alt + Win + R
Slur			Win + S
Stem #			Win + E   √
Style			Win + Y
Symbol			Win + M
Text *			Win + T
Text frame		Alt + Win + F
Text Reset 		Alt + Win + T
Tie ҂			Win + I
Tremolo			Win + W
Tuplet *			Win + U   √
Velocity Loop *		Win + V
Velocity Break Loop	Alt + Win + V

* Set properties
® Also in range
√ Only when 'Play' is ticked!
# Stemlength +/- 0.25 sp	NumPadEnter + Up/Down
# Stemlength more	Macrogroup F4
§ Beaming more		Macrogroup F4
҂ Adjust ties		Macrogroup F4

GENERAL

Tune position		Macrogroup F4
Numeric fields		Macrogroup F4
)
Return

; ♣================================== GLOBAL NAVIGATION ===========================================

; as of MuseScore 3.5 there is a new shortcut 'Go to first empty trailing measure'.

~z & Tab::				; to the first empty measure after the last non-empty measure
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Send {Volume_Mute}			; mute/unmute the master volume
Send ^+{end}
Sleep, 100
Send {right}				; select last full measure rest
Sleep, 100
Loop
{
    If Mod(A_Index, 50) = 0		; each time after another 50 measures
    {
        MsgBox, 4132, Navigate to note, Only empty measures found.`nContinue?
        IfMsgBox, Yes			; only many empty measures
            Continue
        IfMsgBox, No
            Break
    }
    Send ^{left}
    Sleep, 100
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest_Duration_Measure.png
    If (ErrorLevel = 0)
    Continue
    If (ErrorLevel = 1)
    Break
}
Send {Volume_Mute}			; mute/unmute the master volume
Send ^{right}
Sleep, 100
PixelSearch, MeasureRestX, MeasureRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
MsgBox, 4112, Navigating to a full measure rest, The rest was not found.
else
Click, %MeasureRestX%, %MeasureRestY%
Return

~m & Tab::				; to the first next empty measure
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Send {Volume_Mute}			; mute/unmute the master volume
Loop
{
    Send ^{right}
    Sleep, 100
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest_Duration_Measure.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
Send {Volume_Mute}			; mute/unmute the master volume
PixelSearch, MeasureRestX, MeasureRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Navigating to a full measure rest, The rest was not found.
    Return
}
Click, %MeasureRestX%, %MeasureRestY%
Return

; press the hotkey with measure rest selected

~CapsLock & Tab::			; to next note in staff skipping whole measure rests
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Send {Volume_Mute}			; mute/unmute the master volume
Loop
{
    If Mod(A_Index, 50) = 0		; each time after another 50 measures
    {
        MsgBox, 4132, Navigate to next note, Continue?
        IfMsgBox, Yes
            Continue
        IfMsgBox, No
            Break
    }
    Send ^{right}
    Sleep, 100
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest_Duration_Measure.png
    If (ErrorLevel = 0)
    Continue
    If (ErrorLevel = 1)

    Break
}
Send {Volume_Mute}			; mute/unmute the master volume
PixelSearch, FirstFoundNoteX, FirstFoundNoteY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Navigating to the first note, After skipping the empty measures no note was found.
    Return
}
Click, %FirstFoundNoteX%, %FirstFoundNoteY%
Return

~\ & Home::				; to first measure of score and select first element
PixelSearch, NoteRestX, NoteRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Navigation to a selected note or rest, There is no note or rest selected in voice 1.`nOr the element is too small to be recognized.`nSelect a note or rest in voice 1 and try again.
    Return
}
else
{
Click, %NoteRestX%, %NoteRestY%
Sleep, 50
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if (ErrorLevel = 1)
    Goto, SearchRestHome
if (ErrorLevel = 0)
    Goto, FinishHomeSelection
SearchRestHome:
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
if (ErrorLevel = 1) {
    MsgBox, 4112, Navigation to first element, No note or rest selected.`nSelect a note or rest in voice 1 and try again.
    Return
}
if (ErrorLevel = 0) {
    Goto, FinishHomeSelection
}
FinishHomeSelection:
Send ^+{Home}
Sleep, 150
Send {left}
Sleep, 100
PixelSearch, NoteRestX, NoteRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
Click, %NoteRestX%, %NoteRestY%
Return

~\ & End::					; to last measure of score and select last element
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, NoteRestX, NoteRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel {
MsgBox, 4112, Navigation to a selected note or rest, There is no note or rest selected in voice 1.`nOr the element is too small to be recognized.`nSelect a note or rest in voice 1 and try again.
Return
}
else
{
Click, %NoteRestX%, %NoteRestY%
Sleep, 50
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if (ErrorLevel = 1)
    Goto, SearchRestEnd
if (ErrorLevel = 0)
    Goto, FinishEndSelection
SearchRestEnd:
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
if (ErrorLevel = 1) {
MsgBox, 4112, To last element, No note or rest selected.`nSelect a note or rest in voice 1 and try again.
Return
}
if (ErrorLevel = 0)
    Goto, FinishEndSelection
FinishEndSelection:
Sleep, 100
Send ^+{End}
Sleep, 100
Send {right}
Sleep, 100
PixelSearch, NoteRestX, NoteRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
Click, %NoteRestX%, %NoteRestY%
Return

; ♣================ CONTINUOUS VIEW - FROM HIGHEST TO LOWEST STAFF & VV ===========================

; click a note or rest in the highest staff
; an element in the lowest cq highest staff will be selected

~\ & Down::					; from highest to lowest staff in continuous view
FindOffset_H_to_L := 1				; 1 shows info screen, 0 skips this screen
CoordMode, Mouse, Screen			; command causes fast screenshift
CoordMode, Pixel, Screen			; works usually in Page View as well
PixelSearch, StartX, StartY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
MouseMove, StartX, StartY
Send ^{left}
Sleep, 50
Send ^+{right 3}
Send +{right}
Sleep, 50
Send +{Down 40}					; 40 + 1 staves in this example
Sleep, 100
Send {WheelDown 40}
Sleep, 200
PixelSearch, SelectionFrameX, SelectionFrameY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
MouseMove, SelectionFrameX, SelectionFrameY + SelFrameDownOff_Y	; move the mouse SelFrameDownOff_Y px lower than selection
If (FindOffset_H_to_L = 0)
    Goto, Skip_H_to_L_message
MsgBox, 4404, Finding two numbers - from highest to lowest staff,
(
First: in Coordinates.ahk enter the value 0 (zero)
for the variable 'SelFrameDownOff_Y'.
See also the Reference section of the F3-macro group.
Save Coordinates.ahk. Reload the F3-macro group and
repeat the command  \ + Down.

PixelSearch searches the blue color of the selection frame.
Because the offset is zero it steers the mouse to the
highest blue point af the left border of the frame.

Determine now the correct offset.
This is the vertical distance between the mouse position
and the optimal drag point.

The optimal drag point must be considerably lower than the
selection frame to prevent unpredictable shifts of all
selected elements. Take also into account the extra height
occupied by dynamics etc. under the lowest staff.

Measure with PixelMousing the vertical distance between
the current mouse position and your optimal drag point.
This distance is 'SelFrameDownOff_Y'.
Enter your value of 'SelFrameDownOff_Y' in Coordinates.ahk
and save this file.
This is the first number.

Now you can determine the second number.
Reload the F3-macro group. Repeat the command  \ + Down.
Drag the Canvas from your optimal drag point until the
lowest staff is just above the lower border of the Canvas.
Make a note of the Y-coordinate of the mouse.
This is 'CanvasDown_Y'.
Replace the value of 'CanvasDown_Y' in Coordinates.ahk
with the number found by you.
By these two offsets the macro can drag the Canvas safely
down while the lowest staff still will be visible.

You can switch this message off once you have found the numbers.

Do you want to continue?
)
IfMsgBox, No
    Return
Skip_H_to_L_message:
Sleep, 100
Send {Click, down}
Sleep, 50
MouseMove, SelectionFrameX, CanvasDown_Y, 10	; drag canvas down to CanvasDown_Y (drag speed = 10)
Sleep, 100					; mouse must move to a spot just above lower border of Canvas
Send ^{left 3}
Sleep, 100
Send {click, up}
Sleep, 200
PixelSearch, SelectedX, SelectedY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
Click, %SelectedX%, %SelectedY%
Return

; click a note or rest in the lowest staff

~\ & Up::					; from lowest to highest staff in continuous view
FindOffset_L_to_H := 1				; 1 shows info screen, 0 skips this screen
CoordMode, Mouse, Screen			; command causes fast screenshift
CoordMode, Pixel, Screen			; works usually in Page View as well but be careful!
PixelSearch, StartX, StartY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
MouseMove, StartX, StartY
Send ^{left}
Sleep, 50
Send ^+{right 3}
Send +{right}
Sleep, 50
Send +{Up 40}					; 40 + 1 staves in this example
Sleep, 100
Send {WheelUp 40}
Sleep, 200
PixelSearch, SelectionFrameX, SelectionFrameY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
MouseMove, SelectionFrameX, SelectionFrameY - SelFrameUpOff_Y	; move to SelFrameUpOff_Y px higher than selection
If (FindOffset_L_to_H = 0)
    Goto, Skip_L_to_H_message
MsgBox, 4404, Finding two numbers - from lowest to highest staff,
(
First: in Coordinates.ahk enter the value 0 (zero)
for the variable 'SelFrameUpOff_Y'.
See also the Reference section of the F3-macro group.
Save Coordinates.ahk. Reload the F3-macro group and
repeat the command  \ + Up.

PixelSearch searches the blue color of the selection frame.
Because the offset is zero it steers the mouse to the
highest blue point af the left border of the frame.

Determine now the correct offset.
This is the vertical distance between the mouse position
and the optimal drag point.

The optimal drag point must be considerably higher than the
selection frame to prevent unpredictable shifts of all
selected elements. Take also into account the extra height
occupied by texts etc. above the highest staff.

Measure with PixelMousing the vertical distance between
the current mouse position and your optimal drag point.
This distance is 'SelFrameUpOff_Y'.
Enter your value of 'SelFrameUpOff_Y' in Coordinates.ahk
and save this file.
This is the first number.

Now you are ready to determine the second number.
Reload the F3-macro group and repeat the command  \ + Up.
Drag the Canvas from your optimal drag point until the
highest staff is just under the upper border of the Canvas.
Make a note of the Y-coordinate of the mouse.
This is 'CanvasUp_Y'
Replace the value of 'CanvasUp_Y' in Coordinates.ahk
with the number found by you.
By entering these two numbers the macro can drag the Canvas safely
up while the highest staff still will be visible.

You can switch this message off once you have found the numbers.

Do you want to continue?
)
IfMsgBox, No
    Return
Skip_L_to_H_message:
Sleep, 100
Send {Click, down}
Sleep, 50
MouseMove, SelectionFrameX, CanvasUp_Y, 10	; drag canvas up to CanvasUp_Y (drag speed = 10) 
Sleep, 100					; mouse must move to a spot just below upper border of Canvas
Send ^{left 3}
Sleep, 100
Send {click, up}
Sleep, 200
PixelSearch, SelectedX, SelectedY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
Click, %SelectedX%, %SelectedY%
Return

; ♣=================== PAGE VIEW - FROM HIGHEST TO LOWEST STAFF & VV ==============================

~\ & PgDn::					; to lowest staff in page view
Send ^{left}
Sleep, 100
Send ^+{right}
Sleep, 100
Send +{right}
Sleep, 100
Send +{down 40}					; in this example max 41 staves
Sleep, 300
Send {left}
Sleep, 600					; 600 !!
Send {WheelDown}
PixelSearch, NoteRestX, NoteRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
Click, %NoteRestX%, %NoteRestY%
Return


~\ & PgUp::					; to highest staff in page view
Send ^{left}
Sleep, 100
Send ^+{right}
Sleep, 100
Send +{right}
Sleep, 100
Send +{up 40}					; in this example max 41 staves
Sleep, 300
Send {left}
Sleep, 600					; 600 !!
Send {WheelUp}
PixelSearch, NoteRestX, NoteRestY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
Click, %NoteRestX%, %NoteRestY%
Return

; ♣======= PAGE WIDTH to next/previous page and SELECT FIRST NOTE/REST IN TOP STAFF ===============

; Canvas Navigation Area: a surface at the topleft of the canvas.
; This surface covers the first bars of the highest system on the screen.
; This will be lasso selected by the navigation commands \ + Left  and \ + Right.
; The commands combine PageUp and PageDown with the actual selection of something
; So there is no loss of focus

~\ & right::					; to next page in page width and select first note/rest in top staff
Send {PgDn}
Sleep, 200
Send +{Click, %CNA_X1%, %CNA_Y1%, down}		; shiftclick left top corner of area & keep down
Sleep, 50
Send +{Click, %CNA_X2%, %CNA_Y2%, down }	; shiftclick right bottom corner of area & keep down
Send {Click, up}				; area selected
Sleep, 50
Send {right}
Sleep, 50
Send ^{left}
Return

~\ & left::					; to previous page in page width and select first note/rest in top staff
Send {PgUp}
Sleep, 200
Send +{Click, %CNA_X1%, %CNA_Y1%, down}		; shiftclick left top corner of area & keep down
Sleep, 50
Send +{Click, %CNA_X2%, %CNA_Y2%, down }	; shiftclick right bottom corner of area & keep down
Send {Click, up}				; area selected
Sleep, 50
Send {right}
Sleep, 50
Send ^{left}
Return

; ♣========================================= PLAY =================================================

!#o::					; toggle play tickbox off/on - single note or range
Gosub, InspectorCheck			; subroutine at end of script
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    If (ErrorLevel = 0)			; if range selection
    {
        MouseGetPos, StartX, StartY
        ElementX := StartX
        ElementY := StartY
        Goto, NotePlayToggle
    }
    If (ErrorLevel = 1)
    {
    MsgBox, 4144, Element search, No note or range selected. Try again.,
    Return
    }
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
    MsgBox, 4144, Search for voice 1234 element, Color not found.`nTry a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Goto, NotePlayTick
NotePlayToggle:
Click, %IN_007_X%, %IN_007_Y%			; I(007) Select Notes - ELEMENT GROUP
Sleep, 100
NotePlayTick:
Click, %IN_046_X%, %IN_046_Y%			; I(046) Note play tick box
Sleep, 50
Click, %ElementX%, %ElementY%
Return

; ♣======================================= FIX TO LINE ============================================

!#x::						; fix to line
MouseGetPos, StartX, StartY
Gosub, InspectorCheck				; subroutine at end of script
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)
{
    Click, %IN_007_X%, %IN_007_Y%		; I(007) Select Notes - ELEMENT GROUP
    Sleep, 100
    Goto, RangeSelFixToLine
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    MsgBox, 4244, No note selected!`nSelect a note with Color Select.
    Return
}
RangeSelFixToLine:
Click, %IN_044_X%, %IN_044_Y%			; I(044) Note Fix to line tick box
Sleep, 50
Click, %IN_045_X%, %IN_045_Y%			; I(045) Fix to linenumber rectangle
Sleep, 50
Tooltip, Fix to line.`nChange line number.`nPress Z when ready., Startx, StartY - 100, 3
KeyWait, z, d
Tooltip, , , , 3				; close tooltip (3)
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Fix to Line, Note not found.
    Return
}
Click, %ElementX%, %ElementY%
Return

; ♣======================================= BEAM ===================================================
; for micro positioning of the beam use the commands in the macrogroup F4 Positioning
; use the arrowkeys for positioning in units of 0.25 sp
; with downstems often a second pass of the beamsearch is necessary
; in the first pass a stem can be hit; this triggers a search from bottom to top and right to left
; in cross staff beaming the most left AND the most right stem is hit

#b::						; from note to beam
ReverseBeamSearch := 0
CrosStaffBeaming := 0
Gosub, InspectorCheck				; subroutine at end of script
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Select Beam, Nothing selected!
    Return
}
Click, %ElementX%, %ElementY%
ImageSearch, , , IM_08_X1, IM_08_Y1, IM_08_X2, IM_08_Y2, *40 IM_08_Inspector_Select_Beam.png
If ErrorLevel					; if the image is not recognized
{
    MsgBox, 4144, Select Beam,
(
This element has no beam!
If the note has a beam then one of the submenus
in the Inspector is collapsed. Unfold it with Z + I ▼
Or 'Play' in the Inspector is unticked.
Switch it on with ALT + WIN + O to enable editing.
)
    Click, %ElementX%, %ElementY%
    Return
}
Click, %IN_054_X%, %IN_054_Y%			; I(054) Select beam
Sleep, 200
PixelSearch, BeamX, BeamY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, BeamX, BeamY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, BeamX, BeamY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, BeamX, BeamY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Select Beam, Beam not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %BeamX%, %BeamY%
Sleep, 200
Send {Up}					; to activate the beam custom position
Send {Down}					; neutralize first change
ImageSearch, , , IM_21_X1, IM_21_Y1, IM_21_X2, IM_21_Y2, *40 IM_21_Inspector_Stem_section_open.png
If (ErrorLevel = 0)
    ReverseBeamSearch := 1

If (ReverseBeamSearch = 1)
{
    Click, %ElementX%, %ElementY%
    Sleep, 50
    Click, %IN_054_X%, %IN_054_Y%			; I(054) Select beam
    Sleep, 200						; Reversed Beam Search Area
    PixelSearch, BeamX, BeamY, CSA_X2, CSA_Y2, CSA_X1, CSA_Y1, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, BeamX, BeamY, CSA_X2, CSA_Y2, CSA_X1, CSA_Y1, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, BeamX, BeamY, CSA_X2, CSA_Y2, CSA_X1, CSA_Y1, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, BeamX, BeamY, CSA_X2, CSA_Y2, CSA_X1, CSA_Y1, ColorV4, , Fast RGB	; voice 4
    if (ErrorLevel = 1)
    {
        MsgBox, 4144, Searching for a beam, Cross-staff beam search failed.`nThe macro will exit.
        Click, %ElementX%, %ElementY%
        Return
    }
    Click, %BeamX%, %BeamY%
    Sleep, 200
    Send {Up}					; to activate the beam custom position
    Send {Down}					; neutralize first change
    ImageSearch, , , IM_21_X1, IM_21_Y1, IM_21_X2, IM_21_Y2, *40 IM_21_Inspector_Stem_section_open.png
    If (ErrorLevel = 0)				; cross-staff beaming
    {
        CrosStaffBeaming := 1
        Beam2X := BeamX - 6			; 6 px to the left to hit the beam (*change*?)
    }
}
If (CrosStaffBeaming = 1)
{
    Click, %Beam2X%, %BeamY%
    Send {Up}					; to activate the beam custom position
    Send {Down}					; neutralize first change
}
; to outcomment the tooltip, remove semicolon and space before /*
; /*
Tooltip,
(
For finetuning macrogroup F4 must be active. Attention: in F2/F3 combis: use ONLY number or arrowkeys as second key.
To set 'Grow': see Info  [ + G and  [ + B .  To set beamproperties and grouping: use Z + B in F5.
---------------------------------------------------------------------------------------------------------------------------------
Beam handle		TAB			Stepsize 0.25 sp		Up/Down
---------------------------------------------------------------------------------------------------------------------------------
Fine tune L (X)		F2 + 1,2,3...0		Fine tune R (Y)		F3 + 1,2,3...0
Increase x 0.01		F2 or F3 + Numpad keys	Decrease x 0.01		F2 or F3 + Number keys
Increase 0.25/0.05.	F2 or F3 + Down/Left	Decrease 0.25/0.05.	F2 or F3 + Up/Right
---------------------------------------------------------------------------------------------------------------------------------
Press Z when ready.	Reset Beam with Control + CapsLock		To suppress this tooltip search for '#b'.
)
, A_Screenwidth / 2.4, 0, 2		; (*change*?)
; */
; to outcomment the tooltip, remove semicolon and space before */

Keywait, z, d				; after positioning press Z
Tooltip, , , , 2			; end of tooltip (2)
Click, %ElementX%, %ElementY%
Return

; ♣============================ VELOCITY USER/OFFSET and RESET ====================================

; change velocity with arrow up/down or mousewheel
; arrow right: to next note
; for all notes: 'Play' must be ticked!

!#v::					; break velocity loop
BreakVelocityLoopA := 1			; after this command: press right arrow
Return					; to exit the loop

#v::					; from  note to velocity - loop
MouseGetPos, StartX, StartY
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Velocity Search Note, Element not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    MsgBox, 4144, Velocity Navigation, No note selected!
    Return
}
ImageSearch, , , IM_25_X1, IM_25_Y1, IM_25_X2, IM_25_Y2, *40 IM_25_Play_ticked.png
If ErrorLevel
{
    MsgBox, 4144, Velocity Navigation, 'Play' of this note is not ticked!`nMake sure 'Play' is ticked for all notes`nyou want to edit.
    Return
}
InputBox, VelType, Velocity Type, , , W_IB, H_IB, IB_X, IB_Y, , , User = U  Offset = O  RO  RK  Help = ?	;  (*change*?) 
if ErrorLevel				; when Cancel is pressed
{
    Click, %StartX%, %StartY%
        Return
}
If (VelType = "?")
{
    MsgBox, 4160, Velocity,
(
Velocity type User		U
Velocity type Offset	O
To next note		Right
Enter values		Up, Down or Wheel
Exit velocity loop		Alt + Win + V
and then			Right

Reset Velocity *

And reset type to Offset	RO
And keep type		RK

* single note or range
To reset a range select the first note,
enter RO or RK, select the range and press Z .
)
    InputBox, VelType, Velocity Type, , , W_IB, H_IB, IB_X, IB_Y, , , User = U   Offset = O   RO   RK		;  (*change*?) 
    if ErrorLevel				; when Cancel is pressed
    {
        Click, %StartX%, %StartY%
        Return
    }
}
; SkipMsgBoxVel:
If (VelType = "ro") || (VelType = "rk")
{
    WinActivate, MuseScore3.exe
    Tooltip, Reset Velocity.`nMake Selection.`nPress Z when ready., StartX+60, StartY-100, 3	; (*change*?)
    KeyWait, z, d
    Tooltip, , , , 3			; end of tooltip (3)
    Click, %IN_007_X%, %IN_007_Y%	; I(007) Select Notes - ELEMENT GROUP
    Sleep, 100
    Click, %IN_050_X%, %IN_050_Y%	; I(050) Reset (049) Velocity amount
    Sleep, 100
    If (VelType = "ro")
    {
        Click, %IN_048_X%, %IN_048_Y%	; I(048) Reset Velocity Type (to Offset)
        Sleep, 100
    }
    Click, %StartX%, %StartY%
    Return
}
If (VelType = "u") || (VelType = "o")
{
    Tooltip, To next note →`nExit: Alt + Win + V and →, IN_047_X - 162, IN_047_Y - 50, 4	; tooltip (4) Info (*change*?) position relative to IN_047
    BreakVelocityLoopA := 0
    Loop
    {
        If (BreakVelocityLoopA = 1)
        {
            Sleep, 50
            break
        }
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
        If (ErrorLevel = 1)
        {
            Send {right}			; next note or rest in same voice
            Sleep, 150
            Continue
        }
        If (ErrorLevel = 0)
        {
            Click, %IN_047_X%, %IN_047_Y%	; I(047) Velocity Type ▼ rectangle
            If (VelType = "u")			; user velocity
                Send {down}
            If (VelType = "o")			; offset velocity
                Send {up}
            Send {Enter}
            Sleep, 50
            Click, %IN_049_X%, %IN_049_Y%	; I(049) Velocity amount input field
            Send {BS 4}				; clears field
            Sleep, 50
            If (VelType = "u")			; user velocity
            {
            If (A_Index = 1)			; first time only
                Send 64
            }
            Send ^v				; paste previous velocity
            Sleep, 50
            Clipboard =				; empty the clipboard
            Sleep, 50				; change velocity with arrows or wheel
            Keywait, right, D			; after a break press right arrow to exit the loop
            Send ^a
            Sleep, 50
            Send ^c
            ClipWait
            Send {Escape}
            Sleep, 50
            Send {right}
            Sleep, 150
        }
    }
}
Tooltip, , , , 4				; end of tooltip (4)
CoordMode, Pixel, Screen			; back to the same voice
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
MsgBox, 4144, Velocity, Note not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
MouseMove, ElementX, ElementY + 3	; to prevent selection adjacent note in another voice
Clipboard =				; empty the clipboard
Click
Return

; ♣============================ SYSTEMTEXT and STAFFTEXT ==========================================

; text properties: bold, italic, underlined, fontsize

#t::						; from  note or rest to text
Gosub, InspectorCheck				; subroutine at end of script
ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
If (ErrorLevel = 0)
{
    MsgBox, 4144, Micro Navigation - Text, Nothing selected!
    Return
}
Else
{
    CoordMode, Mouse, Screen		; any voice Colorsearch works from 130%
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
        MsgBox, 4144, Micro Navigation, Nothing found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
        Return
    }
}
Click, %ElementX%, %ElementY%
Loop, 20				; allow some elements in other voices as well
{
    Send !{right}			; takes some time
    Sleep, 200				; also the system needs time to show statusbar
    ImageSearch, , , IM_17_X1, IM_17_Y1, IM_17_X2, IM_17_Y2, *40 IM_17_Inspector_Text.png
    If (ErrorLevel = 1)			; NB: Statusbar_Text includes Staff and Systext - Inspectortext includes staff/system/lyrics/fingering/tempo/dynamics etc. With some special characters tThe statusbar is displaced.
        Continue
    If (ErrorLevel = 0)
    {
        InputBox, TextAttributes1, Bold`, Italic`, Underlined`, Textsize`, or Z,
(
Examples: u or b,14 or 16,i or i,15,u,b
)
 , , W_IB_TA, H_IB_TA, IB_X, IB_Y, , , Enter comma separated TextAttributes or Z
        if ErrorLevel				; when Cancel is pressed
        {
            Click, %ElementX%, %ElementY%
            Return
        }
        Loop, Parse, TextAttributes1, `,
        {
            If (A_Index > 4)
                break
            If (A_LoopField = "z")
                break
            If A_LoopField in b,i,u
            {
                Click, %IN_072_X%, %IN_072_Y%		; I(072) Horizontal Scrollbar Right
                Sleep, 50
            }
            If (A_LoopField = "b")
                Click, %IN_075_X%, %IN_075_Y%		; I(075) Text Bold
            If (A_LoopField = "i")
                Click, %IN_076_X%, %IN_076_Y%		; I(076) Text Italic
            If (A_LoopField = "u")
                Click, %IN_077_X%, %IN_077_Y%		; I(077) Text Underlined
            If A_LoopField is integer
            {
                Click, %IN_071_X%, %IN_071_Y%		; I(071) Horizontal Scrollbar Left
                Sleep, 50
                Click, %IN_073_X%, %IN_073_Y%		; I(073) Text size - NB: hotspot to the right of 'pt'
                Sleep, 50
                Send {left}				; passes 'pt'
                Send {BS 5}
                Send %A_LoopField%
                Send {Escape}
            }
        Click, %IN_071_X%, %IN_071_Y%			; I(071) Horizontal Scrollbar Left
        Sleep, 50
        }
        PixelSearch, TextX, TextY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, TextX, TextY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, TextX, TextY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, TextX, TextY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        if ErrorLevel
        {
            MsgBox, 4144, Micro Navigation, Text not found.`nTry a zoom factor above 140`%.`nThis is relative to a normal staff at 100`% scaling.,
            Click, %ElementX%, %ElementY%
            Return
        }
        MouseMove, TextX, TextY
        Return
    }
}
Sleep, 100				; when after 20 elements the caret still does not land on a staff text
MsgBox, 4144, Micro Navigation, Text not found.
Click, %ElementX%, %ElementY%
Return

					; with staff or system text selected (no dynamics which have a different text inspector)
!#t::					; reset text properties B,I,U and size
Gosub, InspectorCheck			; subroutine at end of script
    ImageSearch, , , IM_17_X1, IM_17_Y1, IM_17_X2, IM_17_Y2, *40 IM_17_Inspector_Text.png
    If (ErrorLevel = 1)			; NB: Statusbar_Text includes Staff and Systext - Inspectortext includes staff/system/lyrics/fingering/tempo/dynamics etc.
{
    MsgBox, 4144, Micro Navigation, No text selected!
    Return
}
MouseGetPos, StartX, StartY
Click, %IN_074_X%, %IN_074_Y%		; I(074) Reset Text size
Sleep, 50
Click, %IN_072_X%, %IN_072_Y%		; I(072) Horizontal Scrollbar Right
Sleep, 50
Click, %IN_078_X%, %IN_078_Y%		; I(078) Reset Text Properties - (but e.g. dynamics are underlined. repeat the hotkey to remove the underlining)
Sleep, 50
Click, %IN_071_X%, %IN_071_Y%		; I(071) Horizontal Scrollbar Left
Sleep, 50
; MouseMove, StartX, StartY
Click, %StartX%, %StartY%
Return

; ♣======================================= TEXT FRAME =============================================

!#f::					; set text frame
Gosub, InspectorCheck			; subroutine at end of script
ImageSearch, , , IM_17_X1, IM_17_Y1, IM_17_X2, IM_17_Y2, *40 IM_17_Inspector_Text.png
If ErrorLevel				; if no text
{
    MsgBox, 4144, Set text frame, No text selected!`nThe macro will exit.
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
    MsgBox, 4144, Text search, Color not found.`nTry a higher zoom factor.
    Return
}
Click, %IN_079_X%, %IN_079_Y%			; I(079) Text Frame - TEXT (list)
Tooltip, Choose Frame Type.`nPress Z when ready, ElementX, ElementY - 100, 5	; (*change*?)
Keywait, z, D					; do something and when ready press Z
Tooltip, , , , 5				; end of tooltip (5)
Send {enter}
Click, %ElementX%, %ElementY%
Return

; ♣================================== FRETBOARD DIAGRAM ===========================================

#q::					; from  note or rest to fretboard diagram
Gosub, InspectorCheck			; subroutine at end of script
Loop, 20				; allow some elements in other voices as well
    {
    Send !{right}			; takes some time
    Sleep, 180				; system and statusbar
    ImageSearch, , , IM_22_X1, IM_22_Y1, IM_22_X2, IM_22_Y2, *40 IM_22_Inspector_Fretboard_Diagram.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
    }
MouseMove, IN_098_X, IN_098_Y		; I(098) Fretboard Diagram, spot under 'Multiple Dots'
Tooltip, Press Z when ready, IN_098_X, IN_098_Y + 200, 6	; (*change*?)
Keywait, z, d
Tooltip, , , , 6			; end of tooltip (6)
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
    {
    MsgBox, 4144, Micro Navigation, No fretboard diagram found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Return
    }
Click, %ElementX%, %ElementY%
Return

; ♣========================================= SLUR =================================================
; From  any element to  slur
; If no slur is hit: cursor returns to note

#s::					; from  note or rest to slur - any voice Colorsearch works from 130%
Gosub, InspectorCheck			; subroutine at end of script
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
If (ErrorLevel = 0)
{
MsgBox, 4144, Micro Navigation, Nothing selected!
Return
}
Else
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
    MsgBox, 4144, Micro Navigation, No slur found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Return
    }
Click, %ElementX%, %ElementY%

Loop, 20				; allow some elements in other voices as well
    {
    Send !{right}			; takes some time
    Sleep, 180				; system and statusbar
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Slur.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
    }
Sleep, 100
If (ErrorLevel = 1)			
    {
    MsgBox, 4144, Micro Navigation, No slur found.,
    Return
    }
If (ErrorLevel = 0)			; color of slurs is color of their voice
    {
    PixelSearch, SlurX, SlurY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, SlurX, SlurY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, SlurX, SlurY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, SlurX, SlurY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
    if ErrorLevel
        {
        MsgBox, 4144, Micro Navigation, The slur was not recognized.`nTry a zoom factor above 140`%.`nThis is relative to a normal staff at 100`% scaling.,
        Click, %ElementX%, %ElementY%
        Return
        }
    MouseMove, SlurX, SlurY
    Click, 2
    Return
    }
}

; ♣========================================== BARLINE =============================================

; go with #n - WIN + N - to a note or rest. Next press ALT + WIN + B

!#b::					; barline
Gosub, InspectorCheck			; subroutine at end of script
ImageSearch, , , IM_14_X1, IM_14_Y1, IM_14_X2, IM_14_Y2, *40 IM_14_Inspector_Segment.png
If (ErrorLevel = 0)				; note, rest, barline, timesig, keysig or clef
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Barline.png
    If (ErrorLevel = 0)
        Goto, SearchBarline			; from barline to barline
    If (ErrorLevel = 1)
    {
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
        If (ErrorLevel = 0)
            Goto, SearchBarline
        If (ErrorLevel = 1)
        {
            ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png            
            If (ErrorLevel = 0)
                Goto, SearchBarline
            If (ErrorLevel = 1)
            {
                ImageSearch, , , IM_28_X1, IM_28_Y1, IM_28_X2, IM_28_Y2, *40 IM_28_TimeSig_triangle_section_open.png
                If (ErrorLevel = 0)
                    Goto, SearchBarline
                If (ErrorLevel = 1)
                {
                    ImageSearch, , , IM_29_X1, IM_29_Y1, IM_29_X2, IM_29_Y2, *40 IM_29_KeySig_triangle_section_open.png
                    If (ErrorLevel = 0)
                        Goto, SearchBarline
                    If (ErrorLevel = 1)
                    {
                        ImageSearch, , , IM_27_X1, IM_27_Y1, IM_27_X2, IM_27_Y2, *40 IM_27_Clef_triangle_section_open.png
                        If (ErrorLevel = 0)
                            Goto, SearchBarline
                    }
                }
            }
        }
    }
}
If (ErrorLevel = 1)
{
    MsgBox, 4144, Search barline, Barline not found.`nPress first WIN + N to select a note or rest.`nNext press ALT + WIN + B again.
    Return
}
SearchBarline:
{
    Send ^{right}				; to beat one of next measure and check
    Sleep, 100
    Send !{left}
    Sleep, 180
    Loop
    {
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Barline.png
        If (ErrorLevel = 1)
        {
            Send !{left}			; to previous element: clef? timesig? keysig?
            Sleep, 250
            Continue
        }
        If (ErrorLevel = 0)
            Break
    }
}
Return

; ♣=========================================== BEND ===============================================

; The coordinates of the Bend-rectangle are *not* checked in the utility Z+U->CCC Check coordinates.

^#b::					; micro navigation to bend
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, No element found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 20				; allow some elements in other voices as well
{
    Send !{right}			; takes some time
    Sleep, 180				; system and statusbar
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Bend.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
Sleep, 100
If (ErrorLevel = 1)			
{
    MsgBox, 4144, Micro Navigation, Bend not found.,
    Return
}
If (ErrorLevel = 0)			; color of bend is voice color
{
PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
    {
    MsgBox, 4144, Micro Navigation, The bend was not recognized.`nTry a zoom factor of at least 100`%.`nThis is relative to a normal staff at 100`% scaling.,
    Click, %ElementX%, %ElementY%
    Return
    }
}
Click, %X%, %Y%				; found bend pos
Sleep, 50
Click, %IN_106_X%, %IN_106_Y%		; I(106) Bend Type rectangle
Tooltip, Bend Properties.`nPress Z when ready, IN_106_X, IN_106_Y - 60, 9	; (*change*?
Keywait, z, d
Tooltip, , , , 9			; end of tooltip (9)
Click, %ElementX%, %ElementY%
Return

; ♣========================================== DYNAMIC =============================================

; From  any element to  dynamic 
; If no dynamic is hit: caret stops at a note


#d::					; from  note or rest to dynamic- position dynamic - any voice Colorsearch works from 130%
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, No element found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 20				; allow some elements in other voices as well
{
    Send !{right}			; takes some time
    Sleep, 180				; system and statusbar
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Dynamic.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
Sleep, 100
If (ErrorLevel = 1)			
{
    MsgBox, 4144, Micro Navigation, No Dynamic found.,
    Return
}
If (ErrorLevel = 0)			; color of dynamics is color of their voice
{
PixelSearch, DynamicX, DynamicY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, DynamicX, DynamicY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, DynamicX, DynamicY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, DynamicX, DynamicY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
    {
    MsgBox, 4144, Micro Navigation, The dynamic was not recognized.`nTry a zoom factor above 130`%.`nThis is relative to a normal staff at 100`% scaling.,
    Click, %ElementX%, %ElementY%
    Return
    }
}
Click, %DynamicX%, %DynamicY%
Return

; ♣============================================ TIE ===============================================

#i::					; from  note or rest to tie
Loop, 20				; allow some elements in other voices as well
    {
    Send !{right}			; takes some time
    Sleep, 180				; system and statusbar
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_TieStart.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
    }
Return


; ♣======================================== HAIRPIN ===============================================
; From  any element to hairpin
; hairpin elements include (de)crescendo lines with text line details
; If no hairpin is hit: caret returns to point of departure.
; If a hairpin is hit: after editing - there is no need to press Escape. So leave the handles
; visible. Caret moves to next note.

#h::					; from  note to hairpin - any voice Colorsearch works from 130%
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, Element not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Else
{
    Click, %ElementX%, %ElementY%
    Loop, 20				; allow some elements in other voices as well
    {
        Send !{right}			; takes some time
        Sleep, 400			; and the system needs time to show statusbar
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Hairpin.png
        If (ErrorLevel = 1)
            Continue
        If (ErrorLevel = 0)
            Break
    }
}
Sleep, 100
If (ErrorLevel = 1)			
{
    MsgBox, 4144, Micro Navigation , Hairpin not found.,
    Click, %ElementX%, %ElementY%
    Return
}
If (ErrorLevel = 0)			; color hairpin is color of its voice
{
    PixelSearch, HairPinX, HairPinY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, HairPinX, HairPinY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, HairPinX, HairPinY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, HairPinX, HairPinY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
    if ErrorLevel
    {
        MsgBox, 4144, Navigation, The hairpin was not recognized.`nTry a zoom factor above 130`%.`nThis is relative to a normal staff at 100`% scaling.,
        Click, %ElementX%, %ElementY%
        Return
    }
}
MouseMove, HairPinX, HairPinY
Click
Return

; ♣====================================== FLAG - HOOK =============================================

; From note to flag

#k::						; from  note to flag
Gosub, InspectorCheck				; subroutine at end of script
MouseGetPos, StartX, StartY			; original position
ImageSearch, , , IM_05_X1, IM_05_Y1, IM_05_X2, IM_05_Y2, *40 IM_05_Inspector_Flag.png
If (ErrorLevel = 1)			
{
    MsgBox, 4144, Micro Navigation , Flag not found.,
    Click, %StartX%, %StartY%
    Return
}
Click, %IN_053_X%, %IN_053_Y%			; I(053) Select flag
Sleep, 200
Click, %IN_021_X%, %IN_021_Y%			; I(021) Y-offset - OVERLAP
Tooltip, Press Z when ready, StartX, StartY - 100, 7	; (*change*?)
Keywait, z, D					; do something and when ready press Z
Tooltip, , , , 7				; end of tooltip (7)
Click, %StartX%, %StartY%			; back to its original position
Return

; ♣======================================= TREMOLO ================================================

; From  any element to tremolo - edit tremolo and press Z to quit
; If no tremolo is hit: caret stops at a note without the need to press Z
; About StatusBar_Tremolo.png: to ensure that the same image serves all 4 kinds of tremolo:
; exclude the colon from the image

#w::					; from  note to tremolo - any voice Colorsearch works from 130%
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, Element not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 20				; allow some elements in other voices as well
{
    Send !{right}			; takes some time for
    Sleep, 100				; system and statusbar
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Tremolo.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
Return

; ♣================================= ARTICULATION and ORNAMENT ====================================

; at a zoomfactor of 90% and higher the staccato dot is recognized.
; at a zoomfactor of 130% and higher the thin tenuto glyph is recognized.
; From  any element to an articulation to finetune its position
; If no articulation is hit: caret returns to the point of departure
; Step with the command thru stacked articulations
; The caret stops when - after a few steps - a note is hit
; If no articulation is hit: the cursor returns to the point of departure


#a::					; from  note to articulation including ornaments
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, Element not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 20				; allow some elements in other voices as well
{
    Send !{right}			; takes some time
    Sleep, 250				; system and statusbar
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Articulation.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
Return
; ♣======================================= ORNAMENTS ==============================================

#o::					; from  note to ornament
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, Element not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 20				; allow some elements in other voices as well
{
    Send !{right}			; takes some time
    Sleep, 250				; system and statusbar
    ImageSearch, , , IM_24_X1, IM_24_Y1, IM_24_X2, IM_24_Y2, *40 IM_24_Ornament_triangle_section_open.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
}
Return

; ♣====================================== GRACE NOTES =============================================

; to grace note - in a series of grace notes only the first will be recognized
; go to the next with right and colorsearch
; recognises also acciaccatura and appoggiatura

#g::					; to grace note - if more grace notes only the first will be recognized - position grace note -> Z
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, Element not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 12
{					; if not on a note go to a note or rest
    Send !{right}			; go max 12 times to next element
    Sleep, 250
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel			; no note found
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
    If ErrorLevel
        Continue
    Else Break				; note or rest found	
}
Loop, 20				; max 20 times from note to note
{
    Send {right}			; with Alt + right cursor skips grace notes
    Sleep, 150
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Grace_Note.png
    If ErrorLevel			; no grace note found
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Acciaccatura.png
    If ErrorLevel			; no acciaccatura found
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Appoggiatura.png
    If ErrorLevel			; no appoggiatura found
    Continue
    Else Break				; grace note or acciaccatura or appoggiatura found
}
Sleep, 230
If (ErrorLevel = 1)			
{
    MsgBox, 4096, Micro Navigaton, No Grace note found.,
    Click, %ElementX%, %ElementY%
    Return
}
If (ErrorLevel = 0)			; color of grace note is color of their voice
{
    PixelSearch, GraceNoteX, GraceNoteY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, GraceNoteX, GraceNoteY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, GraceNoteX, GraceNoteY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, GraceNoteX, GraceNoteY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
    if ErrorLevel
    {
        MsgBox, 4144, Micro Navigation, The grace note was not recognized.`nTry a zoom factor above 140`%.`nThis is relative to a normal staff at 100`% scaling.,
        Click, %ElementX%, %ElementY%
        Return
    }
}
Click, %GraceNoteX%, %GraceNoteY%
Return

; ♣===================== MICRO NAVIGATION - FROM NOTE TO ACCIDENTAL ===============================

#x::					; from note to accidental
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Micro Navigation, The element was not found.`nMaybe there was nothing selected.`nOr you could try a higher zoom factor.
}
MouseMove, ElementX, ElementY + 4	; +4 lower to prevent hitting a third in another voice (*change*?)
Click
Loop
{
    ElementX := --ElementX
    PixelSearch, CanvasX, CanvasY, ElementX - 2, ElementY + 3, ElementX - 1, ElementY + 4, ColorCanvas, , Fast RGB	; (*change*?)
    MouseMove, CanvasX, CanvasY
    If (ErrorLevel = 0)
        Break
    If (ErrorLevel = 1)
    {
        PixelSearch, CanvasX, CanvasY, ElementX - 2, ElementY + 1, ElementX - 1, ElementY + 2, ColorCanvas, , Fast RGB	; (*change*?)
        MouseMove, CanvasX, CanvasY
        If (ErrorLevel = 1)
        Continue
        If (ErrorLevel = 0)
        Break
    }
}
Loop
{
    CanvasX := --CanvasX
    PixelSearch, AccidentalX, AccidentalY, CanvasX - 1, CanvasY - 3, CanvasX, CanvasY, 0x000000, , Fast RGB
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Break
    if (A_Index > 35)
    {
    MsgBox, 4144, Micro Navigation, Accidental not found.
    MouseMove, ElementX, ElementY + 4			; +4 lower to prevent hitting a third in another voice (*change*?)
    Click
    Return
    }
}
Click, %AccidentalX%, %AccidentalY%
Loop
{
    InputBox, Accidental, Accidental Properties   Help = ?, , , W_IB, H_IB, IB_X, IB_Y, , , Enter S, P, B or N	Size - Bracket type
    if ErrorLevel				; when Cancel is pressed
    {
        Click, %ElementX%, %ElementY%
        Return
    }
    If (Accidental = "?")
        MsgBox, 4160, Accidental,
(
Bracket Type

Parenthesis		P
Bracket			B
None			N

Small toggle		S
Return to Accidental	Z
Exit macro		X
Back to note		→
)
    If (Accidental = "z")
        Return
    If (Accidental = "x")
        Break
    If (Accidental = "Enter S, P, B or N	Size - Bracket type")
        Return
    If (Accidental = "s")
    {
        Click, %IN_089_X%, %IN_089_Y%		; I(089) Accidental Size tickbox - toggle
        Sleep, 100
    }
    If (Accidental = "p") || (Accidental = "b") || (Accidental = "n")
    {
        Click, %IN_090_X%, %IN_090_Y%		; I(090) Accidental Bracket type rectangle
        Sleep, 100
        If (Accidental = "p")
            Send p				; accidentaL type parenthesis
        If (Accidental = "b")
            Send b				; accidentaL type bracket
        If (Accidental = "n")
            Send n				; accidentaL type none
        Sleep, 50
        Send {enter}
    }
}
Click, %ElementX%, %ElementY%
Return

; ♣===================== MICRO NAVIGATION - FROM ELEMENT TO ITS STYLE PAGE ========================

; mouse on element - to style page of selected element
; mouse on time signature - to time signature properties
; mouse on flag - flip direction
; exceptions: tremolo, notedot

#y::		; to style page of selected element
Click, right
Send {up 2}
Send {enter}
Sleep, 600
Winmove, Style, , , , % WSTYWidth, % WSTYHeight
Return

; ♣========================== MICRO NAVIGATION - FROM ELEMENT TO SYMBOL ===========================

#m::				; from something near to symbol
Loop, 8
{
    Send !{right}
    Sleep, 400
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Symbol.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
}
CoordMode, Mouse, Screen	; any voice Colorsearch works from 130%
CoordMode, Pixel, Screen
CoordMode, Tooltip, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, Symbol not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Sleep, 50
Send {Click 2}			; doubleclick makes arrow positioning possible
Sleep, 100
; MsgBox, Symbol selected?	; for testing
Tooltip, Position symbol with arrowkeys.`nPress Z when ready`nTo delete the symbol:`nPress Win + CapsLock`, Delete and then Z, ElementX, ElementY - 120, 8	; tooltip (8) (*change*?) ElementY - 120 is height tooltip
Keywait, z, d
Tooltip, , , , 8		; close tooltip (8)
Send {Escape}			; ends sticky doubleclick
Sleep, 50
Loop, 8				; back to note
{
    Send !{left}
    Sleep, 300
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
}
Return

; ♣======================= MICRO NAVIGATION - FROM ELEMENT TO TUPLET ==============================

#u::						; from note to tuplet - - set type: bracket or number
Gosub, InspectorCheck				; subroutine at end of script
Loop, 20
{
    Send !{right}
    Sleep, 100
    ImageSearch, , , IM_06_X1, IM_06_Y1, IM_06_X2, IM_06_Y2, *40 IM_06_Inspector_Tuplet.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
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
    MsgBox, 4112, Micro Navigation, The tuplet was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
; Sleep, 100					; check: tuplet note selected?
Click, %IN_055_X%, %IN_055_Y%			; I(055) Select tuplet
Sleep, 400
Loop
{
    InputBox, Tuplet, Tuplet Number & Bracket type   Help  ?, , , W_IB, H_IB, IB_X, IB_Y, , , Number type #, R, N    Bracket type A, B, 0	;  (*change*?) 
    if ErrorLevel					; when Cancel is pressed
    {
        Click, %ElementX%, %ElementY%
        Return
    }
    If (Tuplet = "Number type #, R, N     Bracket type A, B, 0")
    {
        Click, %ElementX%, %ElementY%
        Return
    }
    If (Tuplet = "?")
    {
        MsgBox, 4160, Tuplet,
(
Number Type

Number		#
Ratio		R
None		N

Bracket Type

Auto		A
Bracket		B
None		0

Return to Tuplet	Z
for positioning
or deleting
)
    IfMsgBox, OK
        Continue
    }
    If (Tuplet = "#") || (Tuplet = "n") || (Tuplet = "r")
    {
    Click, %IN_067_X%, %IN_067_Y%		; I(067) Tuplet number type
    Sleep, 50
    }
    If (Tuplet = "#")
        Send {up 2}				; number type Number
    If (Tuplet = "n")
        Send {down 2}				; number type None
    If (Tuplet = "r")
        Send r					; number type Ratio
    If (Tuplet = "a") || (Tuplet = "b") || (Tuplet = "0")
    {
        Click, %IN_068_X%, %IN_068_Y%		; I(068) Tuplet bracket type
        Sleep, 50
    }
    If (Tuplet = "a") 
        Send a
    If (Tuplet = "b") 
        Send b
    If (Tuplet = "0") 
        Send n
    If Tuplet in #,n,r,a,b,0
    {
        Sleep, 100
        Send {enter}
    }
    If (Tuplet = "z")
        Break
}
Tooltip, Tuplet Properties.`nPress Z when ready, ElementX, ElementY - 100, 9	; (*change*?
Keywait, z, d
Tooltip, , , , 9			; end of tooltip (9)
Click, %ElementX%, %ElementY%
Return

; ♣======================= MICRO NAVIGATION - FROM ELEMENT TO FINGERING ===========================

; The search area of IM_20 is rather big, the same word has another position when string number is selected
; NB: the lute fingering is for MuseScore an articulation

#f::					; from note to fingering
Gosub, InspectorCheck			; subroutine at end of script
Loop, 8
{
    Send !{right}
    Sleep, 200
    ImageSearch, , , IM_20_X1, IM_20_Y1, IM_20_X2, IM_20_Y2, *40 IM_20_Inspector_Fingering.png
    If (ErrorLevel = 1)
        Continue
    If (ErrorLevel = 0)
        Break
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
    MsgBox, 4144, Micro Navigation, Fingering not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Return

; ♣============================= MICRO NAVIGATION - FROM NOTE TO STEM =============================

; PLAY must be on. If not ▼ Chord changes in ► Chord!
; ImageSearch, , , IM_04_X1, IM_04_Y1, IM_04_X2, IM_04_Y2, IM_04_Inspector_Stem.png

						; from  note to stem  -> Z (for finetuning position,
#e::						; to see properties and reset with Ctrl+R) master - stemlength change +/- 0.25 sp: NumpadEnter + up/down
Gosub, InspectorCheck				; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Micro Navigation, The element was not found.`nMaybe there was nothing selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    MsgBox, 4144, Inspector Note Check - Stems, Selected element is no note!`nThe macro will exit.
    Return
}
Loop, 30					; unfold collapsed sections of the inspector, from ► to ▼
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
ImageSearch, , , IM_04_X1, IM_04_Y1, IM_04_X2, IM_04_Y2, *40 IM_04_Inspector_Stem.png
If ErrorLevel					; 'Play' is off. This changes position of image
{
    MsgBox, 4144, Inspector Stem Check, This hotkey will only select a stem`nif 'Play' of its note is ticked!`nPress Alt + Win + O to toggle play.`nThe macro will exit.
    Return
}
ImageSearch, , , IM_08_X1, IM_08_Y1, IM_08_X2, IM_08_Y2, *40 IM_08_Inspector_Select_Beam.png
If (ErrorLevel = 0)
{
    MsgBox, 4144, Stem Check - Beamed note, This note has a beam!`nThe hotkey will only select`nstems of unbeamed notes.`nThe macro will exit.
    Return
}
Click, %IN_052_X%, %IN_052_Y%			; I(052) Select stem
Sleep, 200
Click, %IN_058_X%, %IN_058_Y%			; I(058) Stem Length change
; SplashImage, ReadyZ_notes.jpg, b1 zh100 zw-1, , , ReadyZ_notes
; SplashImage, MuseScore_logo_round.jpg, b1 fm8 wm1000 ctff0000, , When ready`nPress Z, Press Z, Arial
; WinMove, ReadyZ_notes, , IN_058_X, IN_058_Y - 100	; - 100 means 100 px higher (*change*?)
; WinMove, Press Z, , IN_058_X, IN_058_Y - 120	; - 120 means 120 px higher (*change*?)
; Sleep, 1000					; shows for 1 second
; SplashImage, Off
Tooltip, Change stemlength with arrowkeys`nor numeric commands in group F4.`nPress Z when ready, ElementX, ElementY - 100, 10	; (*change*?)
Keywait, z, D					; do something and when ready press Z
Tooltip, , , , 10				; end of tooltip (10)
Click, %ElementX%, %ElementY%			; back to its original position
Return

; ♣=================== MICRO NAVIGATION - FROM NOTE TO STEM - TIE CHORDS ==========================

#c::					; chords tie toggle
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Search for voice 1234 element, Color not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if (ErrorLevel = 1)
{
    MsgBox, 4144, Toggle Tie Chords, Selected element is not a note!
    Return
}
Click, %IN_052_X%, %IN_052_Y%		; I(052) Select stem
Sleep, 100
Send +{=}				; to (un)tie duration next chord
Click, %ElementX%, %ElementY%
Return

; ♣================================= TOGGLE NOTES STEMLESS ========================================

!#s::					; toggle note(s) stemless - single note or range F3
Gosub, InspectorCheck			; subroutine at end of script
MouseGetPos, StartX, StartY
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If (ErrorLevel = 1)			; if no note
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    If (ErrorLevel = 0)			; if range selection
    {
        ElementX := StartX
        ElementY := StartY
        Goto, ChordStemlessToggle
    }
    If (ErrorLevel = 1)
    {
    MsgBox, 4144, Element search, No note or range selected. Try again.,
    Return
    }
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
    MsgBox, 4144, Search for voice 1234 element, Color not found.`nTry a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Goto, ChordStemlessTick
ChordStemlessToggle:
Click, %IN_007_X%, %IN_007_Y%		; I(007) Select Notes - ELEMENT GROUP
Sleep, 100
ChordStemlessTick:
Click, %IN_032_X%, %IN_032_Y%		; I(032) CHORD, tickbox stemless
Sleep, 50
Click, %ElementX%, %ElementY%
Return

; ♣==================== MICRO NAVIGATION - FROM NOTE TO AUGMENTATION DOT ==========================

#.::					; from note in any voice to augmentation dot
Gosub, InspectorCheck			; subroutine at end of script
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Micro Navigation, Note not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Send {left}				; necessary if note itself is dotted
Sleep, 50
Loop, 20				; max 20 times from note to note
{
    Send {right}
    Sleep, 200
    ImageSearch, , , IM_07_X1, IM_07_Y1, IM_07_X2, IM_07_Y2, IM_07_Inspector_AugmentationDot1.png
    If (ErrorLevel = 1)			; dot not found
    Continue
    If (ErrorLevel = 0)			; dot found
    Break
}
ImageSearch, , , IM_07_X1, IM_07_Y1, IM_07_X2, IM_07_Y2, IM_07_Inspector_AugmentationDot1.png
If (ErrorLevel = 1)			; dot not found
{
    MsgBox, 4144, Augmentation Dot 1, Dot not found.`nNext time try a higher zoom factor.`nThe macro will exit.
    Click, %ElementX%, %ElementY%
    Return
} 
Click, %IN_051_X%, %IN_051_Y%			; I(051) Select augm. dot 1
Sleep, 200
MouseMove, IN_056_X, IN_056_Y			; I(056) Note Dot Dot position
Loop
{
    InputBox, DotVar, Augmentation Dot Position   Help  ?, , , W_IB, H_IB, IB_X, IB_Y, , , Position Auto Top Bottom Enter A, T or B	;  (*change*?) 

    if ErrorLevel				; when Cancel is pressed
    {
        Click, %ElementX%, %ElementY%
        Return
    }
    If Dotvar not in a,b,t,z,?,Position Auto Top Bottom Enter A,, T or B
        MsgBox, 4144, Augmentation Dot, No valid command!
    If (Dotvar = "Position Auto Top Bottom Enter A, T or B") || (Dotvar = "?")
    MsgBox, 4160, Augmentation Dot,
(
Position

Auto		A
Bottom		B
Top		T

Return to dot	Z
Dot to note	→	
)
    Click
    Sleep, 50
    If (Dotvar = "a")
        Send a
    If (Dotvar = "b")
        Send b
    If (Dotvar = "t")
        Send t
    Sleep, 100
    Send {enter}
    If (Dotvar = "z")
        Break
}
If (Dotvar = "z")
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
        MsgBox, 4112, Micro Navigation, Dot not found.`nTry a higher zoom factor.
        Return
    }
    Click, %ElementX%, %ElementY%
}
Return

; ♣============================= MICRO NAVIGATION - TO NOTE HEAD GROUP ========================----

#j::					; navigation to note headgroup choose from list
Gosub, InspectorCheck			; subroutine at end of script
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    If (ErrorLevel = 0)			; if range selection
    {
        MouseGetPos, StartX, StartY
        ElementX := StartX
        ElementY := StartY
        Goto, NoteHeadGroupRange
    }
    If (ErrorLevel = 1)
    {
    MsgBox, 4144, Navigation to note head group, No note or range selected. Try again.`nThe macro will exit.
    Return
    }
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
    MsgBox, 4144, Navigation to note head group, Element not found.`nTry a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Goto, NoteHeadGroupSingle
NoteHeadGroupRange:
Click, %IN_007_X%, %IN_007_Y%			; I(007) Select Notes - ELEMENT GROUP
Sleep, 100
NoteHeadGroupSingle:
Click, %IN_038_X%, %IN_038_Y%			; I(038) Note Headgroup - NOTE (list)
Sleep, 50
Tooltip, Choose note head symbol with arrowkeys`nor letters.`nPress Z when ready., ElementX, ElementY - 100, 11	; (*change*?)
Keywait, z, d
Send {enter}
Tooltip, , , , 11				; end of tooltip (11)
Click, %ElementX%, %ElementY%
Return

; ♣========================== MICRO NAVIGATION - MAKE CHORD/NOTE/REST SMALL =======================

; when changing the size of a single note or rest there is a danger of losing focus
; a timed MsgBox resolves this
; when makinge a range selection of only one note or rest there's no problem

!#c::						; make chord small	(also in range)
RangeSelSize := 0
SmallNoteSize := "chord"
Goto, StartSizeNote
!#n::						; make note small	(also in range)
RangeSelSize := 0
SmallNoteSize := "note"
Goto, StartSizeNote
!#r::						; make rest small	(also in range)
RangeSelSize := 0
SmallNoteSize := "rest"
Goto, StartSizeNote

StartSizeNote:
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
If (SmallNoteSize = "note") || (SmallNoteSize = "chord")
    Send {Volume_Mute}				; Mute/unmute the master volume
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel				; if 'Inspector' is not in the correct spot
{
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit.
    Goto, FinishSmallNoteRestSize
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)			; if range selection
{
    RangeSelSize := 1
    MouseGetPos, StartX, StartY
    ElementX := StartX			; assign MousePosX to ElementX 
    ElementY := StartY			; assign MousePosY to ElementY
    Goto, ChordNoteRestSmallRange	; skip pixelsearch
}

If (ErrorLevel = 1)			; if not a range selection
    Goto, DetermineNoteOrRest

DetermineNoteOrRest:
If (SmallNoteSize = "note") || (SmallNoteSize = "chord")
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
    {
        If (SmallNoteSize = "chord")
        {
            MsgBox, 4144, Make chord small, No note selected.`nSelect a note and try again.
            Goto, FinishSmallNoteRestSize
        }
        If (SmallNoteSize = "note")
        {
            MsgBox, 4144, Make note small, No note selected.`nSelect a note and try again.
            Goto, FinishSmallNoteRestSize
        }
    }
    If (ErrorLevel = 0)
        Goto, NoteRestChordPixel
}
If (SmallNoteSize = "rest")
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Rest.png
    If (ErrorLevel = 1)
    {
        MsgBox, 4144, Make rest small, No rest selected.`nSelect a rest and try again.
        Goto, FinishSmallNoteRestSize
    }
    If (ErrorLevel = 0)
        Goto, NoteRestChordPixel
}
NoteRestChordPixel:
Sleep, 100
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
If ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
If ErrorLevel
{
    MsgBox, 4144, Make chord`, note or rest small, Its color was not found.`nTry a higher zoom factor.
        Goto, FinishSmallNoteRestSize
}
else
{
Click, %ElementX%, %ElementY%
If (RangeSelSize = 0)
    Goto, ChordNoteRestSmallSingle
}
ChordNoteRestSmallRange:
If (SmallNoteSize = "chord") || (SmallNoteSize = "note")
    Click, %IN_007_X%, %IN_007_Y%		; I(007) Select Notes - ELEMENT GROUP
If (SmallNoteSize = "rest")
    Click, %IN_009_X%, %IN_009_Y%		; I(009) Select Rests - ELEMENT GROUP
Sleep, 200					; was 50
ChordNoteRestSmallSingle:
If (SmallNoteSize = "chord")
    Click, %IN_030_X%, %IN_030_Y%		; I(030) Chord tickbox Small - CHORD (toggle)
If (SmallNoteSize = "note")
    Click, %IN_036_X%, %IN_036_Y%		; I(036) Note tickbox Small - NOTE (toggle)
If (SmallNoteSize = "rest")
    Click, %IN_070_X%, %IN_070_Y%		; I(070) Rest tickbox Small - REST (toggle)
Sleep, 50					; was 100

If (RangeSelSize = 0)				; again PixelSearch. Size change could cause displacement
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
        MsgBox, 4144, Make chord`, note or rest small, Its color was not found.`nTry a higher zoom factor.
            Goto, FinishSmallNoteRestSize
    }
}
Click, %ElementX%, %ElementY%
Sleep, 50
FinishSmallNoteRestSize:
If (SmallNoteSize = "note") || (SmallNoteSize = "chord")
    Send {Volume_Mute}				; Mute/unmute the master volume
Return

; ♣============================ MICRO NAVIGATION - FROM ELEMENT TO NOTE ===========================

#n::					; from element to note
Gosub, InspectorCheck			; subroutine at end of script
ImageSearch, , , IM_14_X1, IM_14_Y1, IM_14_X2, IM_14_Y2, *40 IM_14_Inspector_Segment.png
If (ErrorLevel = 0)				; note, rest, barline, keysig, timesig or clef
{
;    MsgBox, This element is a note, rest, barline, keysig, timesig or clef!	; for testing
    Send {Escape}				; needed if doubleclicked
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 0)
    {
        Send !{right}
        Send !{left}
        Return
    }
    If (ErrorLevel = 1)
        Goto, NoteRestLoop
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Beam.png
If (ErrorLevel = 0)
    Goto, FromBeamToNote
NoteRestLoop:
Send {Escape}				; needed if element is doubleclicked or in edit mode	
Loop, 8
{
    Send !{right}
    Sleep, 50
    Sleep, 200				; accounts also for one or more articulations
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
    {
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
        If (ErrorLevel = 1)
            Continue
        If (ErrorLevel = 0)
            Break
    }
    If (ErrorLevel = 0)
        Break
}
Return
FromBeamToNote:					; from beam to note in zoom 130% and higher
CoordMode, Mouse, Screen			; up- and downstem ascending beams with little slant are tricky
CoordMode, Pixel, Screen
PixelSearch, BeamX, BeamY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, BeamX, BeamY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, BeamX, BeamY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, BeamX, BeamY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Navigation to beam, The beam was not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
Send {Escape}					; deselect beam
MouseMove, BeamX, BeamY

; (1) Downstem ascending or descending beam	; zoom 100-400
MouseMove, 0, -25, , R				; 25 px up (*change*?)
Click
Sleep, 200
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Stem.png
If (ErrorLevel = 0)
Goto, FinishBeamNoteSearch
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If (ErrorLevel = 0)				; downstem short little slant
    Return

; (2) Upstem descending beam			; zoom 130-400
MouseMove, 0, 50, , R				; 50 px down = 25 under topcorner  (*change*?)
Click
Sleep, 200
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Stem.png
If (ErrorLevel = 0)
Goto, FinishBeamNoteSearch

; (3) Upstem ascending beam			; zoom 130-400
MouseMove, 1, 0, , R				; 1 px right  (*change*?)
Click
Sleep, 200
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Stem.png
If (ErrorLevel = 0)
Goto, FinishBeamNoteSearch
If (ErrorLevel = 1)				; zoom 130-150
MouseMove, 1, 0, , R				; 1 px more right  (*change*?)
Click						; this type can be tricky, especially with little slant on a short last stem
Sleep, 200
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Stem.png
If (ErrorLevel = 1)
{
    MouseGetPos, SomeWhereX, SomeWhereY
    X1 := SomeWhereX - 10			;  (*change*?)
    Y2 := SomeWhereY + 10			;  (*change*?)
    PixelSearch, NoteheadX, NoteheadY, X1, SomeWhereY, SomeWhereX, Y2, 0x000000, , Fast RGB		; black notehead
    MouseMove, NoteheadX, NoteheadY
    Sleep, 50
    Send {Escape}
    Sleep, 100
    Send {Escape}
    Sleep, 100
    Click
    Sleep, 100
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Stem.png
    If (ErrorLevel = 0)
        Goto, FinishBeamNoteSearch
    Send ^r					; reset position sticky note
    If (ErrorLevel = 1)
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
        If (ErrorLevel = 0)			; if range selected (downstem ascending, little slant)
            Send ^{left}
    Return
}
FinishBeamNoteSearch:
Loop, 10
{
    Send !{right}
    Sleep, 200
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)
    Continue
    If (ErrorLevel = 0)
    Send {left}
    Break
}
; Send {Volume_Mute}				; Mute/unmute the master volume
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
