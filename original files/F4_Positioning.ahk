#NoEnv					; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn					; Enable warnings to assist with detecting common errors.
SendMode Input				; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%		; Ensures a consistent starting directory.
#SingleInstance force			; Replaces script (Reloads).
#Persistent				; to make it run indefinitely
#IfWinActive ahk_exe S:\MuseScore 3.6 portable\MuseScorePortable\App\MuseScore\bin\MuseScore3.exe	; Enables Hotkeys when MuseScore3 Window is Active
#Include Coordinates.ahk	; All coordinates are managed in this external file
				; The Include directive causes the script to behave as though
				; the specified file's contents are present at this exact position

; Replace the path S:\etc. with your location of MuseScore3.exe


~[ & F4::
CoordMode, Tooltip, Screen
Tooltip, F4  Positioning, ToolT_F4_X, 0, 1		; tooltip (1) Positioning
Return

~] & F4::
MsgBox, 4132, Positioning, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 4::						; Info Positioning (1) Offsets
MsgBox, 4096, F4:  General Positioning      [ + 4,
(
CHORD X-offset

0.50 sp to the left			CapsLock + NumPad 4  (Left)
0.50 sp to the right		CapsLock + NumPad 6  (Right)
0.10 sp to the left			CapsLock + Left
0.10 sp to the right		CapsLock + Right
0.05 sp to the left			CapsLock + Up
0.05 sp to the right		CapsLock + Down

ELEMENTS			Stepsize 0.5 sp

Set X-offset 			LButton + X   and Wheel
Set Y-offset			LButton + Y   and Wheel
Back to canvas			Z
Set X-offset (2)			WIN + MouseWheel
Set Y-offset (2)			CapsLock + MouseWheel

ELEMENTS MICRO POSITIONING X/Y Offsets

0.01 left/right/higher/lower		NumPadSub    + L/R/U/D
0.03 left/right/higher/lower		NumPadAdd    + L/R/U/D
0.05 left/right/higher/lower		NumPadEnter  + L/R/U/D
0.25 sp up			NumPadEnter + NumPadAdd
0.25 sp down			NumPadEnter + NumPadSub

LEADING SPACE - NOTES and RESTS	Stepsize 0.1 sp

To segment leading space		WIN + [
Back to canvas			Z
Reset segment leading space	WIN + ]

GENERIC MICRO POSITIONING	[ + G	Info

MASK ELEMENTS

Mask elements partially		, + .	comma+period
Set stacking order			, + /
See F1 - Search and Select
how to find white elements

Ties				[ + T
Beams				[ + B
Stems & Align			[ + L
Copy Positions			[ + Y
Numeric Fields			[ + G
)
Return

; ♣================================================================================================

~[ & l::						; Positioning (2)
MsgBox, 4096, F4:  Stemlength and Alignment      [ + L,
(
Stems , tails, flags, hooks. Dotted notes colliding with tails.

ADJUST STEMLENGTH

Mico navigation from note to stem		WIN + E
Increase stemlength 0.25 sp			NumPadEnter  + Up
Decrease stemlength 0.25 sp		NumPadEnter  + Down

ONE NOTE *
Increase stemlength 0.25 sp			\ + 0
Increase stemlength 0.50 sp			\ + =
Decrease stemlength 0.25 sp		\ + 9
Decrease stemlength 0.50 sp		\ + -

RANGE same voice # - zoom 60`% - 200`%
Increase stemlength 0.25 sp			\ + P
Increase stemlength 0.50 sp			\ + ]
Decrease stemlength 0.25 sp		\ + O
Decrease stemlength 0.50 sp		\ + [

*  Select a note and go with colorsearch to the note.
# Select the first note. Press the hotkey.
   Make the range. Position mouse on stem and press Z.
   Next: press U(pstem) if first note is U or D(ownstem) when D.

Reset stemlength range:
Select first stem, shiftclick last stem		Ctrl + CapsLock
Reset stemlength one note			\ + /

ALIGN ELEMENTS

Similar					CapsLock + F10
Same subtype				CapsLock + F11

Ties				[ + T
Beams				[ + B
Copy Positions			[ + Y
Numeric Fields			[ + G
Positioning General		[ + 4
)
Return

; ♣=    ================================= BEAMS ===================================================

~[ & b::						; Positioning (3) Beams
MsgBox, 4096, F4:  Positioning - Beams      [ + B,
(
SET BEAM POSITION -  See also alternative method  [ + G

Select beamed note. Mouse cursor can be anywhere.
With macrogroup F3 Navigation active:

From note to beam			WIN + B
To beam handles				TAB
Change in MS-units			up/down
Back to note				Z

MICRO ADJUSTMENT

FIRST key
Left Handle	(X)			F2
Right Handle	(Y)			F3

SECOND key
stepsize = 0.01 sp
1,2,3...10 steps higher			1,2,3...0
1,2,3...10 steps lower		 Numpad1,2,3...0
25 steps higher				up
5 steps higher				right
25 steps lower				down		
5 steps lower				left

Make single beam horizontal#		CapsLock + H
Make beams of same voice horizontal *	CapsLock + I
Reset single beam #			CapsLock + J
Reset beams of selected voice in range *	CapsLock + K
# Select note
* Select range and put mouse on beam

Select beamed note:
Copy custom beam position			P + F9
Paste custom beam position		P + F10
Beamdistance - Copy grow L/R		P + -
Beamdistance - Paste grow L/R		P + =
NB: Grow hotkeys in 'Numeric Fields'

SET BEAM PROPERTIES
In macrogroup F5				Z + B

Ties					[ + T
Stems & Align				[ + L
Copy Positions				[ + Y
Numeric Fields				[ + G
Positioning General			[ + 4
)
Return

; ====================================== TIES ===========================================

~[ & t::					; Info MORE for F10 - Positioning (4) Ties
						; see pdf for pictures
MsgBox, 4096,  F4:  Positioning - Ties      [ + T,
(
Adjust ties of dotted notes - select note

Upstem notes		FIRST key F5
Downstem notes		FIRST key F3

Topnote			T	Y
Bottomnote		B	V	C
Spacenote downtie	S
Spacenote uptie		W
Linenote downtie		L
Linenote uptie		O
Mirrored linenote		M
Mirrored spacenote	N
Innernote left of stem	]   clusters	
Innernote right of stem	[   clusters

Flip and adjust		X
Tie 3 units up		U
Tie 3 units down		D
Change curvature		F
Reset tie			R
Move augm. dot		.   period
Reset augm. dot		,   comma

Change tie length - Left F3 + key  Right F5 + key
2 shorter			I
2 longer			P
5 shorter			-
5 longer			=

Beams				[ + B
Stems & Align			[ + L
Copy Positions			[ + Y
Numeric Fields			[ + G
Positioning General		[ + 4
)
Return

; ♣==================================== COPY POSITIONS ============================================

~[ & y::					; Positioning (5) and Copy
MsgBox, 4096, F4:  Copy Positions      [ + Y,
(
ELEMENTS - note selected

Copy X- and Y- offset		P + F11
Paste  X- and Y- offset		P + F12

BEAMS - note selected

Copy custom beam position		P + F9
Paste custom beam position	P + F10
Copy custom beam position		M + LButton
Paste custom beam position	M + RButton
Copy Grow			P + -
Paste Grow			P + =
Copy Grow			P + LButton
Paste Grow			P + RButton

STYLE → PAGE SPACE SETTINGS
All values of 'Disable vertical position of staves'

Copy style page sp. settings		P + F5
Paste style page sp. settings	P + F6

STYLE → HEADER and FOOTER

Copy style header/ footer		P + F7
Paste style header/footer		P + F8

Ties				[ + T
Beams				[ + B
Stems & Align			[ + L
Numeric Fields			[ + G
Positioning General		[ + 4
)
Return

; ♣================================ GENERIC NUMERIC COMMANDS ======================================

~[ & g::					; Positioning (6) Generic numeric commands
MsgBox, 4096, F4:  Numeric Fields Navigation and Input      [ + G,
(
NAVIGATION

Minimum distance			M + D
X-offset element			M + X
Y-offset element			M + Y
Stacking order			M + Z
Segment leading space		M + L
X-offset chord			M + C
Y-offset chord			M + U
Velocity amount			M + V
Beam left handle (X)		M + B
Beam right handle (Y)		M + N
Beam grow left			M + ,
Beam grow right			M + .
Reset Parallel Beams 1.00 sp		M + /
Parallel Beams 1.16 sp		M + [
Parallel Beams 1.25 sp		M + ]
Text font size			M + T
Walk fields			TAB	Shift + TAB

NUMERIC INPUT

Add 0.01, 0.02, 0.03	NumpadAdd + Numpad 1,2,3
Add 0.10, 0.20, 0.30	NumpadAdd + Numpad 4,5,6
Add 1.00, 2.00, 3.00	NumpadAdd + Numpad 7,8,9
Add 10.00		NumpadAdd + Numpad 0

Subtract 0.01..10.00	NumpadSub + Numpad 1...0

Copy Positions			[ + Y
Ties				[ + T
Beams				[ + B
Stems & Align			[ + L
Positioning General		[ + 4
)
Return

; ♣============================= NAVIGATION to NUMERIC FIELDS =====================================

; From element to numeric field
; change value in big steps with arrow up/down or use the NumPad commands for (very) small steps

~m & d::				; Minimum distance input field OVERLAP - ELEMENT
Field := "min_dist"
Goto, NavNumField
~m & x::				; X-offset - OVERLAP - ELEMENT
Field := "El_X_Off"
Goto, NavNumField
~m & y::				; Y-offset - OVERLAP - ELEMENT
Field := "El_Y_Off"
Goto, NavNumField
~m & z::				; Stacking order (Z) - OVERLAP - ELEMENT
Field := "StackingOrder"
Goto, NavNumField
~m & l::				; Segment leading space rectangle - SEGMENT
Field := "SegmLeadSp"
Goto, NavNumField
~m & c::				; Chord X-offset - CHORD
Field := "Chord_X_Off"
Goto, NavNumField
~m & u::				; Chord Y-offset - CHORD
Field := "Chord_Y_Off"
Goto, NavNumField
~m & v::				; Velocity amount input field - NOTE + PLAY
Field := "Vel_Amount"
Goto, NavNumField
~m & b::				; Beam Position X = left handle rectangle
Field := "BeamPos_Left"
Goto, NavNumField
~m & n::				; Beam Position Y = right handle rectangle
Field := "BeamPos_Right"
Goto, NavNumField
~m & ,::				; Beam Grow Left
Field := "BeamGrow_Left"
Goto, NavNumField
~m & .::				; Beam Grow Right
Field := "BeamGrow_Right"
Goto, NavNumField
~m & [::				; Parallel Beams set beam distance 1.16	
Field := "BeamDist_Big"
Goto, NavNumField
~m & ]::
Field := "BeamDist_Huge"		; Parallel Beams set beam distance 1.25	
Goto, NavNumField
~m & /::				; Reset Parallel Beams (set beam distance 1.00)
Field := "BeamDist_Reset"
Goto, NavNumField
~m & t::				; Text Font size - TEXT
Field := "Text_Size"
Goto, NavNumField

NavNumField:
CoordMode, Tooltip, Screen
Gosub, InspectorCheck
ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
If (ErrorLevel = 0)			; if nothing selected
{
    MsgBox, 4144, Numeric Fields, Nothing selected!`nSelect something and try again.
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_List_Selection.png
If (ErrorLevel = 0)			; there is a list selection
{
    MsgBox, 4144, Numeric Fields, You made a list selection.`nThis hotkey works only`non individual elements.`nSelect something and try again.
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)			; there is a range selection
{
    MsgBox, 4144, Numeric Fields, You made a range selection.`nThis hotkey works only on individual elements.`nSelect something and try again.
    Return
}
MouseGetPos, StartX, StartY
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
    MsgBox, 4144, Searching for selected element, The position of the element`ncould not be determined.`nTry a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
Loop, 30					; check inspector sections - if collapsed unfold: ▼ instead of ►
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
If (Field = "min_dist")
    Click, %IN_017_X%, %IN_017_Y%		; I(017) Minimum distance input field OVERLAP - ELEMENT
If (Field = "El_X_Off")
    Click, %IN_020_X%, %IN_020_Y%		; I(020) X-offset - OVERLAP - ELEMENT
If (Field = "El_Y_Off")
    Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
If (Field = "StackingOrder")
    Click, %IN_023_X%, %IN_023_Y%		; I(023) Stacking order (Z) - OVERLAP - ELEMENT
If (Field = "SegmLeadSp")
{
    ImageSearch, , , IM_14_X1, IM_14_Y1, IM_14_X2, IM_14_Y2, *40 IM_14_Inspector_Segment.png
    If ErrorLevel				; no note, rest, barline, timesig or clef
    {
        MsgBox, 4144, Set segment leading space,
(
Leading space cannot be set for this element!
It can only be set for notes, rests, barlines,
clefs and time signatures.
Select one of these and try again.
)
        Return
    }
    Click, %IN_025_X%, %IN_025_Y%		; I(025) Segment leading space rectangle - SEGMENT
}
If Field in Chord_X_Off,Chord_Y_Off,Vel_Amount
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel
    {
        MsgBox, 4144, Navigation Numeric Fields, This hotkey works only`nif there is a note selected!`nSelect a note and try again.
        Return
    }
}
If Field in BeamPos_Left,BeamPos_Right,BeamGrow_Left,BeamGrow_Right,BeamDist_Big,BeamDist_Huge,BeamDist_Reset
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel
    {
        ImageSearch, , , IM_26_X1, IM_26_Y1, IM_26_X2, IM_26_Y2, *40 IM_26_Inspector_Beam_Section_active.png
        If ErrorLevel
        {
            MsgBox, 4144, Navigation Numeric Fields, This hotkey works only`nif there is a note or beam selected!`nSelect a note or beam and try again.
            Return
        }
    }
}
If (Field = "Chord_X_Off")
    Click, %IN_027_X%, %IN_027_Y%		; I(027) Chord X-offset - CHORD (to the right of X-key)
If (Field = "Chord_Y_Off")
    Click, %IN_028_X%, %IN_028_Y%		; I(028) Chord Y-offset - CHORD (to the right of Y-key)
If Field in Vel_Amount,BeamPos_Left,BeamPos_Right,BeamGrow_Left,BeamGrow_Right,BeamDist_Big,BeamDist_Huge,BeamDist_Reset
{
    ImageSearch, , , IM_25_X1, IM_25_Y1, IM_25_X2, IM_25_Y2, *40 IM_25_Play_ticked.png
    If ErrorLevel
    {
        MsgBox, 4144, Numeric Fields, 'Play' of this note is not ticked!`nMake sure 'Play' is ticked for all notes`nyou want to edit.`n`nSwitch 'Play' on with WIN + O to enable editing.
        Return
    }
}
If (Field = "Vel_Amount")
    Click, %IN_049_X%, %IN_049_Y%		; I(049) Velocity amount input field - NOTE + PLAY
If (Field = "Text_Size")
{
    ImageSearch, , , IM_17_X1, IM_17_Y1, IM_17_X2, IM_17_Y2, *40 IM_17_Inspector_Text.png
    If ErrorLevel				; if no text (one of many styles)
    {
        MsgBox, 4144, Text Font Size, This element is not a text!`nSelect a text and try again.
        Return
    }
    Click, %IN_073_X%, %IN_073_Y%		; I(073) Text Font size - TEXT
}
If Field in BeamPos_Left,BeamPos_Right,BeamGrow_Left,BeamGrow_Right,BeamDist_Big,BeamDist_Huge,BeamDist_Reset
{
    ImageSearch, , , IM_08_X1, IM_08_Y1, IM_08_X2, IM_08_Y2, *40 IM_08_Inspector_Select_Beam.png
    If ErrorLevel				; if the image is not recognized
    {
        MsgBox, 4144, Numeric Field Beam,
(
This element has no beam!
If the note has a beam then one of the submenus
in the Inspector is collapsed. Unfold it with Z + I ▼
Or 'Play' in the Inspector is unticked.
Switch it on with WIN + O to enable editing.
)
        Return
    }
    Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
    Sleep, 100
    ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png
    If ErrorLevel				; if the image is not recognized
    {
        Click, %IN_062_X%, %IN_062_Y%		; I(062) Beam Custom position tick box - NOTE IF BEAM IS SELECTED
        Sleep, 50
        Send {right}				; activates beam also for F2 and F3 (+number) commands
        Sleep, 50
    }
    Loop					; Beam Settings
    {
        If (A_Index = 1)
            Goto, BeamingFirstTime
        Tooltip, 
(
Edit beam:  Press X, Y, L, R, [ or ].	X-Y handles	L-R grow.
The brackets set the parallel beamdistance:  [ = 1.16	] = 1.25
Useful for some 32nd and 64th beams.  Press Z to exit the macro.
), ElementX-120, ElementY - 150, 2	; (*change*?)

        Input, Field, l1, {CapsLock}{Escape}, l,r,x,y,z,[,]
        If (ErrorLevel = "Max")
            MsgBox, 4144, Beam Tuning,
(
No valid command!

Beam left handle		X
Beam right handle		Y
Grow left		L
Grow right		R
Parallel Beams 1.16	[
Parallel Beams 1.25	]
), 3
        If (ErrorLevel = "EndKey:Escape") || (Field = "z")
            Break
        BeamingFirstTime:
        If (Field = "BeamPos_Left") || (Field = "x")
            Click, %IN_064_X%, %IN_064_Y%		; I(064) Beam Position X = left handle rectangle
        If (Field = "BeamPos_Right") || (Field = "y")
            Click, %IN_065_X%, %IN_065_Y%		; I(065) Beam Position Y = right handle rectangle
        If  Field in BeamGrow_Left,l,[,],BeamDist_Big,BeamDist_Huge,BeamDist_Reset
            Click, %IN_102_X%, %IN_102_Y%		; I(102) Beam Grow Left
        If (Field = "BeamDist_Reset")
        {
            Send {BS 4}
            Send 1.00
            Sleep, 50
        }
        If (Field = "BeamDist_Big")
        {
            Send {BS 4}
            Send 1.16
            Sleep, 50
        }
        If (Field = "BeamDist_Huge") || (Field = "]")
        {
            Send {BS 4}
            Send 1.25
            Sleep, 50
        }
        If  Field in BeamGrow_Right,r,[,],BeamDist_Big,BeamDist_Huge,BeamDist_Reset
            Click, %IN_103_X%, %IN_103_Y%		; I(103) Beam Grow Right
        If (Field = "BeamDist_Reset")
        {
            Send {BS 4}
            Send 1.00
            Sleep, 50
        }
        If (Field = "BeamDist_Big") || (Field = "[")
        {
            Send {BS 4}
            Send 1.16
            Sleep, 50
        }
        If (Field = "BeamDist_Huge") || (Field = "]")
        {
            Send {BS 4}
            Send 1.25
            Sleep, 50
        }
        KeyWait, CapsLock, u
        Tooltip,
(
⁞	Change values:	Big steps: Up/Down.		 ⁞
⁞	Small steps: End → Numpad Add/Subtract + number.	 ⁞
⁞		When ready press CapsLock.		 ⁞			
), ElementX-120, ElementY - 150, 3
        KeyWait, CapsLock, d
        KeyWait, CapsLock, u
        Tooltip, , , , 3			; end of tooltip (3)
    }
    Tooltip, , , , 2				; end of tooltip (2)
}
If Field in BeamPos_Left,BeamPos_Right,BeamGrow_Left,BeamGrow_Right,BeamDist_Reset,l,r,x,y,z
    Goto, FinishNumericFields			; skip next PixelSearch
Tooltip, Change value with arrow up/down.`nOr use the Numpad commands for small changes.`nNumpadAdd/Subtract + Number.`nPress Z when ready., ElementX-120, ElementY - 150, 16	; (*change*?)
Keywait, z, d					; after positioning press Z
Tooltip, , , , 16				; end of tooltip (16)
						; search needed when elements are displaced
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
If ErrorLevel
{
    MsgBox, 4144, Search last selected element, Its color was not found.`nTry a higher zoom factor.
       ElementX := StartX
    ElementY := StartY
}
FinishNumericFields:
Click, %ElementX%, %ElementY%
Return


; ♣=============================== NUMERIC INPUT ADD and SUBTRACT =================================

; NumLock must be on!
; these are generic commands, working on numeric fields having two decimals
; NB: there is no selection of numeric fields!
; when the cursor is on the Canvas the macro exits with a warning
; idem when there is nothing selected or the screen is not in the defined state
; TIP: use the hotkeys in combination with memorypoints - F9 - for other numeric rectangles
; e.g. the tuning or the aperture ('height') of a hairpin
; the time stretch of an articulation or a fermata
; or in text line details the placement of begin/continue/end text
; often the step unit of the arrows is too big, necessitating typing the decimals
; these commands make this easier

~NumpadAdd & Numpad1::
    NumAddition := "1"			; adds 0.01
    Goto, ChangeValueAdd
~NumpadAdd & Numpad2::
    NumAddition := "2"			; adds 0.02
    Goto, ChangeValueAdd
~NumpadAdd & Numpad3::
    NumAddition := "3"			; adds 0.03
    Goto, ChangeValueAdd
~NumpadAdd & Numpad4::
    NumAddition := "10"			; adds 0.10
    Goto, ChangeValueAdd
~NumpadAdd & Numpad5::
    NumAddition := "20"			; adds 0.20
    Goto, ChangeValueAdd
~NumpadAdd & Numpad6::
    NumAddition := "30"			; adds 0.30
    Goto, ChangeValueAdd
~NumpadAdd & Numpad7::
    NumAddition := "100"		; adds 1.00
    Goto, ChangeValueAdd
~NumpadAdd & Numpad8::
    NumAddition := "200"		; adds 2.00
    Goto, ChangeValueAdd
~NumpadAdd & Numpad9::
    NumAddition := "300"		; adds 3.00
    Goto, ChangeValueAdd
~NumpadAdd & Numpad0::
    NumAddition := "1000"		; adds 10.00
Goto, ChangeValueAdd
ChangeValueAdd:
Gosub, InspectorCheck
ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
If (ErrorLevel = 0)
{
    MsgBox, 4112, Numeric Input, Nothing selected!.`nThe macro will exit.
    Return
}
MouseGetPos, StartX, StartY
If (StartX < Def_Insp_Width)		; prevents inpredictability if the mouse operates on the canvas
{
    MsgBox, 4112, Numeric Input Location Check, The mouse is not in the Inspector Area.`nSelect a numeric input field.`nFor info press [ + G`n`nThe macro will exit.
        Return
}
clipboard =   				; Empty the clipboard
Sleep, 50
Send ^a					; select value of selected input field
Sleep, 100
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)			; some element was selected but the click was not on a numeric input field
{
    Send {Escape}			; Control + A has selected all. Deselect
    Sleep, 50
    MsgBox, 4112, Numeric Input, No fitting input field selected!.`nThe macro will exit., 3
    Return
}
Sleep, 50
SendEvent ^c  				; copy value (SendEvent necessary. Not just Send)
ClipWait
If (NumAddition = "1")    
    ClipNew := Clipboard + 0.01
If (NumAddition = "2")
    ClipNew := Clipboard + 0.02
If (NumAddition = "3")
    ClipNew := Clipboard + 0.03
If (NumAddition = "10")
    ClipNew := Clipboard + 0.10
If (NumAddition = "20")
    ClipNew := Clipboard + 0.20
If (NumAddition = "30")
    ClipNew := Clipboard + 0.30
If (NumAddition = "100")
    ClipNew := Clipboard + 1.00
If (NumAddition = "200")
    ClipNew := Clipboard + 2.00
If (NumAddition = "300")
    ClipNew := Clipboard + 3.00
If (NumAddition = "1000")
    ClipNew := Clipboard + 10.00
Add_Offset := Round(ClipNew, 2)		; Number rounded to 2 decimal places
ClipNew := Add_Offset
Clipboard = %ClipNew%
Send ^a
Sleep, 50
Send ^v
Return

~NumpadSub & Numpad1::
    NumSubtract := "1"			; subtracts 0.01
    Goto, ChangeValueSub
~NumpadSub & Numpad2::
    NumSubtract := "2"			; subtracts 0.02
    Goto, ChangeValueSub
~NumpadSub & Numpad3::
    NumSubtract := "3"			; subtracts 0.03
    Goto, ChangeValueSub
~NumpadSub & Numpad4::
    NumSubtract := "10"			; subtracts 0.10
    Goto, ChangeValueSub
~NumpadSub & Numpad5::
    NumSubtract := "20"			; subtracts 0.20
    Goto, ChangeValueSub
~NumpadSub & Numpad6::
    NumSubtract := "30"			; subtracts 0.30
    Goto, ChangeValueSub
~NumpadSub & Numpad7::
    NumSubtract := "100"		; subtracts 1.00
    Goto, ChangeValueSub
~NumpadSub & Numpad8::
    NumSubtract := "200"		; subtracts 2.00
    Goto, ChangeValueSub
~NumpadSub & Numpad9::
    NumSubtract := "300"		; subtracts 3.00
    Goto, ChangeValueSub
~NumpadSub & Numpad0::
    NumSubtract := "1000"		; subtracts 10.00
    Goto, ChangeValueSub
ChangeValueSub:
Gosub, InspectorCheck
ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
If (ErrorLevel = 0)
{
    MsgBox, 4112, Numeric Input, Nothing selected!.`nThe macro will exit.
    Return
}
MouseGetPos, StartX, StartY
If (StartX < Def_Insp_Width)		; prevents inpredictability if the mouse operates on the canvas
{
    MsgBox, 4112, Numeric Input Location Check, The mouse is not in the Inspector Area.`nSelect a numeric input field.`nThe macro will exit.
        Return
}
clipboard =   				; Empty the clipboard
Sleep, 50
Send ^a					; select value of selected input field
Sleep, 100
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)			; some element was selected but the click was not on a numeric input field
{
    Send {Escape}			; Control + A has selected all. Deselect
    Sleep, 50
    MsgBox, 4112, Numeric Input, No fitting input field selected!.`nThe macro will exit., 3
    Return
}
Sleep, 50
SendEvent ^c  				; copy value (SendEvent necessary. Not just Send)
ClipWait
If (NumSubtract = "1")
    ClipNew := Clipboard - 0.01
If (NumSubtract = "2")
    ClipNew := Clipboard - 0.02
If (NumSubtract = "3")
    ClipNew := Clipboard - 0.03
If (NumSubtract = "10")
    ClipNew := Clipboard - 0.10
If (NumSubtract = "20")
    ClipNew := Clipboard - 0.20
If (NumSubtract = "30")
    ClipNew := Clipboard - 0.30
If (NumSubtract = "100")
    ClipNew := Clipboard - 1.00
If (NumSubtract = "200")
    ClipNew := Clipboard - 2.00
If (NumSubtract = "300")
    ClipNew := Clipboard - 3.00
If (NumSubtract = "1000")
    ClipNew := Clipboard - 10.00
Subtract_Offset := Round(ClipNew, 2)		; Number rounded to 2 decimal places
ClipNew := Subtract_Offset
Clipboard = %ClipNew%
Send ^a
Sleep, 50
Send ^v
Return

; ♣=======================leading space for NOTES or RESTS=========================================

#[::					; fast access Set segment leading space
CoordMode, Tooltip, Screen
Gosub, InspectorCheck
ImageSearch, , , IM_14_X1, IM_14_Y1, IM_14_X2, IM_14_Y2, *40 IM_14_Inspector_Segment.png
If ErrorLevel				; no note, rest, barline, timesig or clef
{
    MsgBox, 4144, Set segment leading space failed,
(
Leading space can only be set for notes,
rests, barlines, clefs and time signatures.
Select one of these and try again.
)
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
    MsgBox, 4144, Set segment leading space, Element not found.`nMaybe it is too small to be detected.`nYou could try a higher zoom factor.
    Return
}
Click, %ElementX%, %ElementY%
MouseGetPos, StartX, StartY		; original position
Click, %IN_025_X%, %IN_025_Y%		; I(025) Segment leading space rectangle
Tooltip, Set segment leading space.`nUse arrowkeys or`ngeneric numeric commands.`nPress Z when ready, StartX, StartY - 100, 3		; (*change*?)
Keywait, z, D				; after pressing Z the mouse selects the displaced element
Tooltip, , , , 3			; end of tooltip (3)
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
MsgBox, 4144, Set segment leading space, Element not found.`nMaybe it is too small to be detected.`nYou could try a higher zoom factor.
Click, %ElementX%, %ElementY%
; Send {Escape}
Return

#]::					; reset Segment leading space
Gosub, InspectorCheck
ImageSearch, , , IM_14_X1, IM_14_Y1, IM_14_X2, IM_14_Y2, *40 IM_14_Inspector_Segment.png
If ErrorLevel				; no note, rest, barline, timesig or clef
{
    MsgBox, 4144, Reset segment leading space,
(
Leading space cannot be reset for this element.
It can only be set and reset for notes, rests,
barlines, clefs and time signatures.
Select one of these and try again.
)
    Return
}
Click, %IN_026_X%, %IN_026_Y%		; I(026) Reset (025) Segment leading space
Sleep, 200
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
MsgBox, 4144, Reset segment Leading Space, Element not found.`nMaybe it is too small to be detected.`nYou could try a higher zoom factor.
Click, %ElementX%, %ElementY%
Return


; ♣==================================== X OFFSET - CHORD ==========================================

~CapsLock & Numpad4::			; X-offset CHORD 0.50 sp to the left
    ShiftX := "50L"			; NumpadLeft
    Goto, ChangeShiftChord
~CapsLock & left::			; X-offset CHORD 0.10 sp to the left
    ShiftX := "10L"
    Goto, ChangeShiftChord
~CapsLock & up::			; X-offset CHORD 0.05 sp to the left
    ShiftX := "5L"
    Goto, ChangeShiftChord
~CapsLock & Numpad6::			; X-offset CHORD 0.50 sp to the right
    ShiftX := "50R"			; NumpadRight
    Goto, ChangeShiftChord
~CapsLock & right::			; X-offset CHORD 0.10 sp to the right
    ShiftX := "10R"
    Goto, ChangeShiftChord
~CapsLock & down::			; X-offset CHORD 0.05 sp to the right
    ShiftX := "5R"
    Goto, ChangeShiftChord
ChangeShiftChord:
Gosub, InspectorCheck
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel			; no note found
{
    MsgBox, 4144, Change X-Offset Chord , No note selected!`nThe macro will exit.
    Return
}
MouseGetPos, StartX, StartY		; original position
clipboard =   				; Empty the clipboard
Click, %IN_027_X%, %IN_027_Y%		; I(027) Chord X-offset
Sleep, 100
Send ^a
SendEvent ^c 	 			; SendEvent necessary. Not just Send
ClipWait
If (ShiftX = "50L")
    ClipNew := Clipboard - 0.50
If (ShiftX = "10L")
    ClipNew := Clipboard - 0.10
If (ShiftX = "5L")
    ClipNew := Clipboard - 0.05
If (ShiftX = "50R")
    ClipNew := Clipboard + 0.50
If (ShiftX = "10R")
    ClipNew := Clipboard + 0.10
If (ShiftX = "5R")
    ClipNew := Clipboard + 0.05
X_Offset := Round(ClipNew, 2)		; Number rounded to 2 decimal places
ClipNew := X_Offset
Clipboard = %ClipNew%
Send ^a
Sleep, 50
Send ^v
Send {Escape}
Sleep, 50
MouseMove, StartX, StartY
Return


; ♣================================= X/Y OFFSET - ELEMENTS ========================================

~LButton & x::				; fast access X-offset ELEMENTS
Gosub, InspectorCheck
Keywait, LButton
MouseGetPos, StartX, StartY		; original position
Tooltip, X-Offset element.`nPress Z when ready, StartX, StartY - 120, 4		; (*change*?)
Click, %IN_020_X%, %IN_020_Y%		; I(020) X-offset - OVERLAP - ELEMENT					; change offset with MouseWheel
Keywait, z, D
Tooltip, , , , 4			; end of tooltip (4)
MouseMove, StartX, StartY		; back to original position
Send {Escape}
Sleep, 100
Return


~LButton & y::				; fast access Y-offset ELEMENTS
Gosub, InspectorCheck
Keywait, LButton
MouseGetPos, StartX, StartY		; original position
Tooltip, Y-Offset element.`nPress Z when ready, StartX, StartY - 120, 5		; (*change*?)
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Keywait, z, D
Tooltip, , , , 5			; end of tooltip (5)
MouseMove, StartX, StartY		; back to original position
Send {Escape}
Sleep, 100
Return

; Vertical position higher. Alternative for individual elements (with arrow key up/)
; Very Useful to align elements of the same type or subtype when arrowkeys don't work
; Press Escape to select the element(s) again

~CapsLock & WheelUp::
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY		; original position
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Send {down}
MouseMove, StartX, StartY		; back to its original position
Send {Escape}
Sleep, 100
Return

; Vertical position lower. Alternative for individual elements (with arrow key down)
; Very Useful to align elements of the same type or subtype when arrowkeys don't work
; Press Escape to select the element(s) again

~CapsLock & WheelDown::
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY		; original position
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Send {up}
MouseMove, StartX, StartY		; back to its original position
Send {Escape}
Sleep, 100
Return

#WheelUp::
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY		; original position
Click, %IN_020_X%, %IN_020_Y%		; I(020) X-offset - OVERLAP - ELEMENT
Send {down}
MouseMove, StartX, StartY		; back to its original position
Send {Escape}
Sleep, 100
Return

#Wheeldown::
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY		; original position
Click, %IN_020_X%, %IN_020_Y%		; I(020) X-offset - OVERLAP - ELEMENT
Send {up}
MouseMove, StartX, StartY		; back to its original position
Send {Escape}
Sleep, 100
Return

; ♣================================== OFFSET ELEMENT ==============================================

~NumpadEnter & NumpadAdd::		; Y-OFFSET Element 0.25 sp up
Offset := "25up"
Goto, StartOffset_F4
~NumpadEnter & NumpadSub::		; Y-OFFSET Element 0.25 sp down
Offset := "25down"
Goto, StartOffset_F4
~NumpadEnter & Up::			; Y-OFFSET Element 0.05 sp up
					; when stem selected - O.25 sp longer 
Offset := "5up"
Goto, StartOffset_F4
~NumpadEnter & Down::			; Y-OFFSET Element 0.05 sp down
					; when stem selected - O.25 sp shorter
Offset := "5down"
Goto, StartOffset_F4
~NumpadAdd & Up::			; Y-OFFSET Element 0.03 sp up
Offset := "3up"
Goto, StartOffset_F4
~NumpadAdd & Down::			; Y-OFFSET Element 0.03 sp down
Offset := "3down"
Goto, StartOffset_F4
~NumpadSub & Up::			; Y-OFFSET Element 0.01 sp up
Offset := "1up"
Goto, StartOffset_F4
~NumpadSub & Down::			; Y-OFFSET Element 0.01 sp down
Offset := "1down"
Goto, StartOffset_F4
~NumpadEnter & Left::			; X-OFFSET Element 0.05 sp to the left
Offset := "5left"
Goto, StartOffset_F4
~NumpadEnter & Right::			; X-OFFSET Element 0.05 sp to the right
Offset := "5right"
Goto, StartOffset_F4
~NumpadAdd & Left::			; X-OFFSET Element 0.03 sp to the left
Offset := "3left"
Goto, StartOffset_F4
~NumpadAdd & Right::			; X-OFFSET Element 0.03 sp to the right
Offset := "3right"
Goto, StartOffset_F4
~NumpadSub & Left::			; X-OFFSET Element 0.01 sp to the left
Offset := "1left"
Goto, StartOffset_F4
~NumpadSub & Right::			; X-OFFSET Element 0.01 sp to the right
Offset := "1right"
Goto, StartOffset_F4

StartOffset_F4:
StemLengthChange := 0

Gosub, InspectorCheck
MouseGetPos, StartX, StartY
If Offset in 5up,5down
{
    ImageSearch, , , IM_21_X1, IM_21_Y1, IM_21_X2, IM_21_Y2, *40 IM_21_Inspector_Stem_section_open.png
    If (Errorlevel = 0)
        StemLengthChange := 1
}
clipboard =   				; Empty the clipboard
If (StemLengthChange = 1)
{
    Click, %IN_058_X%, %IN_058_Y%	; I(058) Stem Length change
    Goto, SkipUpDownLeftRight
}
If Offset in 25up,25down,5up,5down,3up,3down,1up,1down
    Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
If Offset in 5left,5right,3left,3right,1left,1right
    Click, %IN_020_X%, %IN_020_Y%		; I(020) X-offset - OVERLAP - ELEMENT
SkipUpDownLeftRight:
Sleep, 50
Send ^a
SendEvent ^c  				; SendEvent necessary. Not just Send
ClipWait
If (StemLengthChange = 1) && (Offset = "5up")
{
    ClipNew := Clipboard + 0.25
    Goto, SkipHorVer
}
If (StemLengthChange = 1) && (Offset = "5down")
{
    ClipNew := Clipboard - 0.25
    Goto, SkipHorVer
}
If (Offset = "25up")
    ClipNew := Clipboard - 0.25
If (Offset = "25down")
    ClipNew := Clipboard + 0.25
If (Offset = "5up")
    ClipNew := Clipboard - 0.05
If (Offset = "5down")
    ClipNew := Clipboard + 0.05
If (Offset = "3up")
    ClipNew := Clipboard - 0.03
If (Offset = "3down")
    ClipNew := Clipboard + 0.03
If (Offset = "1up")
    ClipNew := Clipboard - 0.01
If (Offset = "1down")
    ClipNew := Clipboard + 0.01
If (Offset = "5right")
    ClipNew := Clipboard + 0.05
If (Offset = "5left")
    ClipNew := Clipboard - 0.05
If (Offset = "3right")
    ClipNew := Clipboard + 0.03
If (Offset = "3left")
    ClipNew := Clipboard - 0.03
If (Offset = "1right")
    ClipNew := Clipboard + 0.01
If (Offset = "1left")
    ClipNew := Clipboard - 0.01
SkipHorVer:
This_Offset := Round(ClipNew, 2)		; Number rounded to 2 decimal places
ClipNew := This_Offset
Clipboard = %ClipNew%
Send ^a
Sleep, 50
If (StemLengthChange = 1)
    Sleep, 50
Send ^v
Send {Escape}
Sleep, 50
If (StemLengthChange = 0)
    MouseMove, StartX, StartY
Return

; ♣=============================== COPY GROW - COPY BEAM POSITION =================================

~m & LButton::				; copy custom X/Y position
~p & F9::				; copy beam X left handle and Y right handle
Beamedit := "anglecopy"
Goto, BeamCopy
~p & LButton::
~p & -::				; copy grow left and right
Beamedit := "growcopy"
Goto, BeamCopy

BeamCopy:
Gosub, InspectorCheck
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if (ErrorLevel = 2) {
    MsgBox, 4144, Copy Beam Custom Position, Can't determine if there is a note selected!`nThe macro will exit.,
    Return
}
if (ErrorLevel = 1) {
    MsgBox, 4144, Copy Beam Custom Position, No note selected!`nThe macro will exit.,
    Return
}
if (ErrorLevel = 0) {
    Goto, CheckCopyCustomBeam
}
CheckCopyCustomBeam:
Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
Sleep, 100
ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png
if (ErrorLevel = 2) {
    MsgBox, 4144, Copy Beam Custom Position, Can't determine if this beam position is customized!`nThe macro will exit.,
    Return
}
if (ErrorLevel = 1)			; if beam is not customized
{
    Click, %IN_062_X%, %IN_062_Y%	; I(062) Beam Custom position tick box ticked
    Sleep, 100				; make customized so that the position can be copied
}
if (ErrorLevel = 0)
    Goto, CopyBeamPos

CopyBeamPos:
clipboard =   				; Empty the clipboard
Loop, 2
{
    if (A_Index = 1) and (Beamedit = "anglecopy")
        Click, %IN_064_X%, %IN_064_Y%	; I(064) Beam Position X = left handle rectangle
    if (A_Index = 1) and (Beamedit = "growcopy")
        Click, %IN_102_X%, %IN_102_Y%	; I(102) Beam Grow Left
    if (A_Index = 2) and (Beamedit = "anglecopy")
        Click, %IN_065_X%, %IN_065_Y%	; I(065) Beam Position Y = right handle rectangle
    if (A_Index = 2) and (Beamedit = "growcopy")
        Click, %IN_103_X%, %IN_103_Y%	; I(103) Beam Grow Right
    Sleep, 100
    Send ^{a}
    ClipboardText = %Clipboard%  	; remove formatting
    SendEvent ^c  			; SendEvent necessary. Not just Send
    ClipWait
    ClipNew = %Clipboard%
    if (A_Index = 1) {
    Clipboard = %ClipboardText%%ClipNew%
    Goto, XBeamLeftHandle
    }
    Clipboard = %ClipboardText%`n`r%ClipNew%
    XBeamLeftHandle:
    ClipboardText =  			; clear the variable
}
Click, %StartX%, %StartY%
Return

~m & RButton::				; paste custom X/Y position
~p & F10::				; paste beam X left handle en Y right handle
Beamedit := "anglepaste"
Goto, BeamPaste
~p & RButton::
~p & =::				; paste grow left and right
Beamedit := "growpaste"
Goto, BeamPaste

BeamPaste:
Gosub, InspectorCheck
CoordMode, Mouse, Screen
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if (ErrorLevel = 2) {
    MsgBox, 4144, Paste Beam Custom Position, Can't determine if there is a note selected!`nThe macro will exit.,
    Return
}
if (ErrorLevel = 1) {
    MsgBox, 4144, Paste Beam Custom Position, No note selected!`nThe macro will exit.,
    Return
}
if (ErrorLevel = 0) {
    Goto, CheckPasteCustomBeam
}
CheckPasteCustomBeam:
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
    Return
}
Click,  %StartX%, %StartY%
Sleep, 100
Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
Sleep, 200
ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png
if (ErrorLevel = 2) {
    MsgBox, 4112, Beam Custom Position, Can't determine if Beam Custom Position is ticked.`nThe macro will exit.,
    Return
}
if (ErrorLevel = 1) {
    Click, %IN_062_X%, %IN_062_Y%	; I(062) Beam Custom position tick box
    Sleep, 50
    Goto, PasteBeamPos
}
if (ErrorLevel = 0) {
    Goto, PasteBeamPos
}
PasteBeamPos:
Loop, parse, clipboard, `n, `r
{
    if (A_Index = 1) and (Beamedit = "anglepaste")
        Click, %IN_064_X%, %IN_064_Y%	; I(064) Beam Position X = left handle rectangle
    if (A_Index = 1) and (Beamedit = "growpaste")
        Click, %IN_102_X%, %IN_102_Y%	; I(102) Beam Grow Left
    if (A_Index = 2) and (Beamedit = "anglepaste")
        Click, %IN_065_X%, %IN_065_Y%	; I(065) Beam Position Y = right handle rectangle
    if (A_Index = 2) and (Beamedit = "growpaste")
        Click, %IN_103_X%, %IN_103_Y%	; I(103) Beam Grow Right
    Sleep, 100
    Send ^{a}
    Sleep, 100
    Send %A_LoopField%
    Sleep, 200
    If (A_Index = 2)
    Break
}
Click, %StartX%, %StartY%
Return

; ♣============= ADJUST BEAMS ===== MICRO ADJUST ==== BEAM LEFT/RIGHT HANDLE ======================

; press first WIN + B to select a beam;  'custom position' will be activated
; if you select a note and give a command a warning appears
; F2 + 1,2,3,...0 = left handle (X) up 1,2,3,...10
; F2 + NumPad1,2,3...0 = left handle (X) down 1,2,3,...10
; F2 arrow up/right = up 25	F2 + down/left = down 25
; idem F3 + 1,2,3...0 and arrows for the right handle (Y)
; F3 + NumPad1,2,3...0 = right handle (Y) down 1,2,3...10

~F2 & 1::				; Beam Left Handle 0.01 sp higher
Beamdistance := "l1h"			; L1H
Goto, SetBeamDistance
~F2 & 2::				; Beam Left Handle 0.02 sp higher
Beamdistance := "l2h"			; L2H
Goto, SetBeamDistance
~F2 & 3::				; Beam Left Handle 0.03 sp higher
Beamdistance := "l3h"			; L3H
Goto, SetBeamDistance
~F2 & 4::				; Beam Left Handle 0.04 sp higher
Beamdistance := "l4h"			; L4H
Goto, SetBeamDistance
~F2 & 5::				; Beam Left Handle 0.05 sp higher
~F2 & right::				; Beam Left Handle 0.05 sp higher
Beamdistance := "l5h"			; L5H
Goto, SetBeamDistance
~F2 & 6::				; Beam Left Handle 0.06 sp higher
Beamdistance := "l6h"			; L6H
Goto, SetBeamDistance
~F2 & 7::				; Beam Left Handle 0.07 sp higher
Beamdistance := "l7h"			; L7H
Goto, SetBeamDistance
~F2 & 8::				; Beam Left Handle 0.08 sp higher
Beamdistance := "l8h"			; L8H
Goto, SetBeamDistance
~F2 & 9::				; Beam Left Handle 0.09 sp higher
Beamdistance := "l9h"			; L9H
Goto, SetBeamDistance
~F2 & 0::				; Beam Left Handle 0.10 sp higher
Beamdistance := "l10h"			; L10H
Goto, SetBeamDistance
~F2 & -::				; Beam Grow Left & Right 1.16
Beamdistance := "big"			; BIG
Goto, SetBeamDistance
~F2 & =::				; Beam Grow Left & Right 1.25
Beamdistance := "huge"			; HUGE
Goto, SetBeamDistance
~F2 & l::				; Beam Grow Left
Beamdistance := "grow_L"		; Grow_ L
Goto, SetBeamDistance
~F2 & r::				; Beam Grow Right
Beamdistance := "grow_R"		; Grow_ R
Goto, SetBeamDistance
~F2 & up::				; Beam Left Handle 0.25 sp higher
Beamdistance := "l25h"			; L25H
Goto, SetBeamDistance
~F2 & NumPad1::				; Beam Left Handle 0.01 sp lower
Beamdistance := "l1l"			; L1L
Goto, SetBeamDistance
~F2 & NumPad2::				; Beam Left Handle 0.02 sp lower
Beamdistance := "l2l"			; L2L
Goto, SetBeamDistance
~F2 & NumPad3::				; Beam Left Handle 0.03 sp lower
Beamdistance := "l3l"			; L3L
Goto, SetBeamDistance
~F2 & NumPad4::				; Beam Left Handle 0.04 sp lower
Beamdistance := "l4l"			; L4L
Goto, SetBeamDistance
~F2 & NumPad5::				; Beam Left Handle 0.05 sp lower
~F2 & left::				; Beam Left Handle 0.05 sp lower
Beamdistance := "l5l"			; L5L
Goto, SetBeamDistance
~F2 & NumPad6::				; Beam Left Handle 0.06 sp lower
Beamdistance := "l6l"			; L6L
Goto, SetBeamDistance
~F2 & NumPad7::				; Beam Left Handle 0.07 sp lower
Beamdistance := "l7l"			; L7L
Goto, SetBeamDistance
~F2 & NumPad8::				; Beam Left Handle 0.08 sp lower
Beamdistance := "l8l"			; L8L
Goto, SetBeamDistance
~F2 & NumPad9::				; Beam Left Handle 0.09 sp lower
Beamdistance := "l9l"			; L9L
Goto, SetBeamDistance
~F2 & NumPad0::				; Beam Left Handle 0.10 sp lower
Beamdistance := "l10l"			; L10L
Goto, SetBeamDistance
~F2 & down::				; Beam Left Handle 0.25 sp lower
Beamdistance := "l25l"			; L25L
Goto, SetBeamDistance
~F3 & 1::				; Beam Right Handle 0.01 sp higher
Beamdistance := "r1h"			; R1H
Goto, SetBeamDistance
~F3 & 2::				; Beam Right Handle 0.02 sp higher
Beamdistance := "r2h"			; R2H
Goto, SetBeamDistance
~F3 & 3::				; Beam Right Handle 0.03 sp higher
Beamdistance := "r3h"			; R3H
Goto, SetBeamDistance
~F3 & 4::				; Beam Right Handle 0.04 sp higher
Beamdistance := "r4h"			; R4H
Goto, SetBeamDistance
~F3 & 5::				; Beam Right Handle 0.05 sp higher
~F3 & right::				; Beam Right Handle 0.05 sp higher
Beamdistance := "r5h"			; R5H
Goto, SetBeamDistance
~F3 & 6::				; Beam Right Handle 0.06 sp higher
Beamdistance := "r6h"			; R6H
Goto, SetBeamDistance
~F3 & 7::				; Beam Right Handle 0.04 sp higher
Beamdistance := "r7h"			; R7H
Goto, SetBeamDistance
~F3 & 8::				; Beam Right Handle 0.08 sp higher
Beamdistance := "r8h"			; R8H
Goto, SetBeamDistance
~F3 & 9::				; Beam Right Handle 0.09 sp higher
Beamdistance := "r9h"			; R9H
Goto, SetBeamDistance
~F3 & 0::				; Beam Right Handle 0.10 sp higher
Beamdistance := "r10h"			; R10H
Goto, SetBeamDistance
~F3 & up::				; Beam Right Handle 0.25 sp higher
Beamdistance := "r25h"			; R25H
Goto, SetBeamDistance
~F3 & NumPad1::				; Beam Right Handle 0.01 sp lower
Beamdistance := "r1l"			; R1L
Goto, SetBeamDistance
~F3 & NumPad2::				; Beam Right Handle 0.02 sp lower
Beamdistance := "r2l"			; R2L
Goto, SetBeamDistance
~F3 & NumPad3::				; Beam Right Handle 0.03 sp lower
Beamdistance := "r3l"			; R3L
Goto, SetBeamDistance
~F3 & NumPad4::				; Beam Right Handle 0.04 sp lower
Beamdistance := "r4l"			; R4L
Goto, SetBeamDistance
~F3 & NumPad5::				; Beam Right Handle 0.05 sp lower
~F3 & left::				; Beam Right Handle 0.05 sp lower
Beamdistance := "r5l"			; R5L
Goto, SetBeamDistance
~F3 & NumPad6::				; Beam Right Handle 0.06 sp lower
Beamdistance := "r4l"			; R6L
Goto, SetBeamDistance
~F3 & NumPad7::				; Beam Right Handle 0.07 sp lower
Beamdistance := "r7l"			; R7L
Goto, SetBeamDistance
~F3 & NumPad8::				; Beam Right Handle 0.08 sp lower
Beamdistance := "r8l"			; R8L
Goto, SetBeamDistance
~F3 & NumPad9::				; Beam Right Handle 0.09 sp lower
Beamdistance := "r9l"			; R9L
Goto, SetBeamDistance
~F3 & NumPad0::				; Beam Right Handle 0.10 sp lower
Beamdistance := "r10l"			; R10L
Goto, SetBeamDistance
~F3 & down::				; Beam Right Handle 0.25 sp lower
Beamdistance := "r25l"			; R25L
Goto, SetBeamDistance

SetBeamDistance:
Gosub, InspectorCheck
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If (ErrorLevel = 0)
{
    MsgBox, 4144, Set Beam, You selected a note.`nBut with a note selected`npress first WIN + B to select a beam`nand set its position.`nThe macro will exit.
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)
{
    MsgBox, 4112, Set Beam, You selected a range.`nSelect a beamed note and try again.`nThe macro will exit.
    Return
}
CoordMode, Mouse, Screen
clipboard =   				; Empty the clipboard
If Beamdistance in l1h,l2h,l3h,l4h,l5h,l6h,l7h,l8h,l9h,l10h,l25h,l1l,l2l,l3l,l4l,l5l,l6l,l7l,l8l,l9l,l10l,l25l
    Click, %IN_064_X%, %IN_064_Y%	; I(064) Beam Position X = left handle rectangle
If Beamdistance in r1h,r2h,r3h,r4h,r5h,r6h,r7h,r8h,r9h,r10h,r25h,r1l,r2l,r3l,r4l,r5l,r6l,r7l,r8l,r9l,r10l,r25l
    Click, %IN_065_X%, %IN_065_Y%	; I(065) Beam Position Y = right handle rectangle
Sleep, 200				; especially tuplets need more time
Send ^a
Sleep, 150				; response time statusbar
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)
{
    MsgBox, 4112, Set Beam Protection, Something went wrong.`nPress Z.`nThe macro will exit.
    Return
}
SendEvent ^c  				; SendEvent necessary. Not just Send
ClipWait
If (Beamdistance = "l1h") || (Beamdistance = "r1h")
    ClipNew := Clipboard - 0.01
If (Beamdistance = "l2h") || (Beamdistance = "r2h")
    ClipNew := Clipboard - 0.02
If (Beamdistance = "l3h") || (Beamdistance = "r3h")
    ClipNew := Clipboard - 0.03
If (Beamdistance = "l4h") || (Beamdistance = "r4h")
    ClipNew := Clipboard - 0.04
If (Beamdistance = "l5h") || (Beamdistance = "r5h")
    ClipNew := Clipboard - 0.05
If (Beamdistance = "l6h") || (Beamdistance = "r6h")
    ClipNew := Clipboard - 0.06
If (Beamdistance = "l7h") || (Beamdistance = "r7h")
    ClipNew := Clipboard - 0.07
If (Beamdistance = "l8h") || (Beamdistance = "r8h")
    ClipNew := Clipboard - 0.08
If (Beamdistance = "l9h") || (Beamdistance = "r9h")
    ClipNew := Clipboard - 0.09
If (Beamdistance = "l10h") || (Beamdistance = "r10h")
    ClipNew := Clipboard - 0.10
If (Beamdistance = "l25h") || (Beamdistance = "r25h")
    ClipNew := Clipboard - 0.25
If (Beamdistance = "l1l") || (Beamdistance = "r1l")
    ClipNew := Clipboard + 0.01
If (Beamdistance = "l2l") || (Beamdistance = "r2l")
    ClipNew := Clipboard + 0.02
If (Beamdistance = "l3l") || (Beamdistance = "r3l")
    ClipNew := Clipboard + 0.03
If (Beamdistance = "l4l") || (Beamdistance = "r4l")
    ClipNew := Clipboard + 0.04
If (Beamdistance = "l5l") || (Beamdistance = "r5l")
    ClipNew := Clipboard + 0.05
If (Beamdistance = "l6l") || (Beamdistance = "r6l")
    ClipNew := Clipboard + 0.06
If (Beamdistance = "l7l") || (Beamdistance = "r7l")
    ClipNew := Clipboard + 0.07
If (Beamdistance = "l8l") || (Beamdistance = "r8l")
    ClipNew := Clipboard + 0.08
If (Beamdistance = "l9l") || (Beamdistance = "r9l")
    ClipNew := Clipboard + 0.09
If (Beamdistance = "l10l") || (Beamdistance = "r10l")
    ClipNew := Clipboard + 0.10
If (Beamdistance = "l25l") || (Beamdistance = "r25l")
    ClipNew := Clipboard + 0.25
Position_XY := Round(ClipNew, 2)
ClipNew := Position_XY
Clipboard = %ClipNew%
SendEvent ^a
Sleep, 50
SendEvent ^v
Sleep, 50
Send {Escape}
Sleep, 50
Return


; ♣================================ MAKE BEAMS HORIZONTAL =========================================

~CapsLock & h::				; make single beam horizontal
Gosub, InspectorCheck
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
MsgBox, 4112, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
Click, %ElementX%, %ElementY%
Sleep, 50
ImageSearch, , , IM_08_X1, IM_08_Y1, IM_08_X2, IM_08_Y2, *40 IM_08_Inspector_Select_Beam.png
If ErrorLevel				; if the image is not recognized
{
    MsgBox, 4144, Make beam horizontal,
(
This element has no beam!
If the note has a beam then one of the submenus
in the Inspector is collapsed. Unfold it with Z + I ▼
Or 'Play' in the Inspector is unticked.
Switch it on with WIN + O to enable editing.
)
    Return
}
Click, %IN_054_X%, %IN_054_Y%			; I(054) Select beam
Sleep, 100					; determine if Force horizontal is ticked.
ImageSearch, Tick_X, Tick_Y, Hor_X1, Hor_Y1, Hor_X2, Hor_Y2, *80 CTS_Checked_ticked_sign.png
If (ErrorLevel = 0)				; if Force hor. is ticked
{
    Click, %IN_061_X%, %IN_061_Y%		; I(061) Reset (060) Horizontal Beams - NOTE IF BEAM IS SELECTED
    Sleep, 250					; determine experimentally
    ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png	; the prior reset turns this field black, so *40 suffices
    If (ErrorLevel = 0)				; if Beam Cus Pos is ticked NB:
    {						; NB: in manual Inspector setting TWO ticks are impossible. But via AHK beam settings it's possible
        Click, %IN_062_X%, %IN_062_Y%		; I(062) set Beam Custom position off - NOTE IF BEAM IS SELECTED
        Sleep, 50
    }
;    Click, %StartX%, %StartY%			; back to position of selected note
    Click, %ElementX%, %ElementY%
    Return
}
If (ErrorLevel = 1)				; if Force hor. is unticked
{
    ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png
    If (ErrorLevel = 0)				; if Beam Custom Position is ticked
    {
        Click, %IN_062_X%, %IN_062_Y%		; I(062) set Beam Custom position off - NOTE IF BEAM IS SELECTED
        Sleep, 50
    }
    Click, %IN_060_X%, %IN_060_Y%		; I(060) Beam Force horizontal
    Sleep, 50
}
; Click, %StartX%, %StartY%			; back to position of selected note
Click, %ElementX%, %ElementY%
Return

; Make range selection and put mouse on beam

~CapsLock & i::				; make beams of same voice in range horizontal
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
Gosub, InspectorCheck
Click, right
Sleep, 50
Send {down 6}
Sleep, 150
Send {right}
Sleep, 50
Send {up}
Sleep, 50
Send {Enter}				; opens select with more options
Sleep, 200				; increase sleeptime if needed
CoordMode, Mouse, Window
Click, %WS_04_X%, %WS_04_Y%		; (WS_04) Same voice
Sleep, 100
Click, %WS_03_X%, %WS_03_Y%		; (WS_03) In selection
Sleep, 100
Send {Enter}				; OK
CoordMode, Mouse, Screen		; determine if one or more beams are customized
Sleep, 300
ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png
if (ErrorLevel = 0)
{
    Click, %IN_063_X%, %IN_063_Y%	; I(063) Reset (062) Beam Custom position
    Sleep, 100
}
Click, %IN_060_X%, %IN_060_Y%		; I(060) Beam Force horizontal
MouseMove, StartX, StartY		; back to position of last selected note
Return


; ♣================================== RESET BEAM - RESET BEAMS ====================================

; simple alternative with Ctrl + R or Ctrl + CapsLock
; Reset single beam - any voice. Note in any voice selected.

~CapsLock & j::				; Reset single beam - any voice. Note in any voice selected.
MouseGetPos, StartX, StartY
Gosub, InspectorCheck
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
MsgBox, 4112, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
Sleep, 100
Send ^{r}
Sleep, 50
Click, %ElementX%, %ElementY%
Return

; reset the beams of selected voice in a range and return to a note
; make range selection and put mouse on a beam of the right voice

~CapsLock & k::				; reset beams in range - only of selected voice
Gosub, InspectorCheck
MouseGetPos, LastX, LastY
Click, right
Sleep, 50
Send {down 6}
Sleep, 150
Send {right}
Sleep, 50
Send {up}
Sleep, 50
Send {Enter}				; opens select with more options
Sleep, 200				; increase sleeptime if needed
CoordMode, Mouse, Window
Click, %WS_04_X%, %WS_04_Y%		; (WS_04) Same voice
Sleep, 100
Click, %WS_03_X%, %WS_03_Y%		; (WS_03) In selection
Sleep, 100
Send {Enter}				; OK
Sleep, 100
Send ^{r}
Sleep, 100
Click, %LastX%, %LastY%			; back to position of last selected note
Sleep, 50
Send !{right}
Return


; ♣================================= CHANGE STEMLENGTH ============================================

~\ & l::			; stem selected - change stemlength - exit with Z
Gosub, InspectorCheck
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %NoteX%, %NoteY%
MouseGetPos, StartX, StartY
Click, %IN_058_X%, %IN_058_Y%		; I(058) Stem Length change
Sleep, 1200				; time to prevent retriggering z
Keywait, z, down			; in the meantime: type a number, use arrowkeys etc.
Send {Escape}
Sleep, 50
Click, %StartX%, %StartY%
Send {right}				; from stem to note
Return


/*
For the hotkeys in this section operating on a range:
Press Hotkey, Make selection, Press Z, In Inputbox press U or D
so that the macro can move the mouse on a stem.

There are two special lines:
if (StemDirection = "u") and if (StemDirection = "d")
Here you have to determine the offsets of the mouse (from note to stem) with PixMousing.
The offset influences the zoom range.
For upstems: works from zoom 80% to 200%
For downstems: works from zoom 60% to 190%
These lines are marked with (#)

To help you to memorize the hotkey combinations:
Form of \ key associated with pipe '|' (stemlike)
Keylayout US QWERTY:
9 0 - =		one note	- + - +		0.25  0.25  0.50  0.50
o p [ ]		range		- + - +		0.25  0.25  0.50  0.50

PM: Range selection in voice 2,3,4 will not work if the Statusbar says:
"Rest; Duration: Measure; Voice: 1;" This is the centered whole measure rest.
This situation is extremely rare.
There is no problem if the Statusbar says: "Rest; Duration: Whole; Voice: 1;"
PM: When the selection causes a screenshift the macro will not work!
*/

\ & p::					; increase stems of notes same voice in range with 0.25 sp
Stemlength := "r25plus"
Goto, SLprocessF4
~\ & ]::				; increase stems of notes same voice in range with 0.50 sp
Stemlength := "r50plus"
Goto, SLprocessF4
~\ & o::				; decrease stems of notes same voice in range with 0.25 sp
Stemlength := "r25min"
Goto, SLprocessF4
~\ & [::				; decrease stems of notes same voice in range with 0.50 sp
Stemlength := "r50min"
Goto, SLprocessF4
~\ & 0::				; increase stemlength one note with 0.25 sp
Stemlength := "25plus"
Goto, SLprocessF4
~\ & =::				; increase stemlength of one note with 0.5 sp
Stemlength := "50plus"
Goto, SLprocessF4
~\ & 9::				; decrease stemlength one note with 0.25 sp
Stemlength := "25min"
Goto, SLprocessF4
~\ & -::				; decrease stemlength of one note with 0.5 sp
Stemlength := "50min"
Goto, SLprocessF4
SLprocessF4:
Gosub, InspectorCheck
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, StartX, StartY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %StartX%, %StartY%
If Stemlength in 25plus,50plus,25min,50min	; if single note
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If ErrorLevel
    {
        MsgBox, 4144, Set Stemlength, No note selected.`nThe macro will exit.
        Return
    }
    Click, %IN_052_X%, %IN_052_Y%		; I(052) Select stem
    Sleep, 100
    Click, %IN_058_X%, %IN_058_Y%		; I(058) Stem Length change
    Sleep, 100
    Goto, SingleNoteStemLength			; skip range operations
}
Tooltip, Change stemlength. NB:Zoomfactor < 200!`nSelect range and press Z when ready, StartX - 100, StartY - 80, 6	; (*change*?)
Keywait, z, down,				; macro continues after pressing Z
Tooltip, , , , 6				; end of tooltip (6)
InputBox, StemDirection, Stemdirection,
(
First note has an upstem:	enter U
First note has a downstem:	enter D
)
, , W_IB, 150, IB_X, IB_Y, , , Enter U or D	; 150 is height (*change*?)
if ErrorLevel
{
    Click, %StartX%, %StartY%			; back to its original position
    Return
}
if (StemDirection = "u")
    MouseMove, StartX + 4, StartY - 15	; (#) offset determines zoom range - find with PixMousing (*change*?)
if (StemDirection = "d")
    MouseMove, StartX - 7, StartY + 15	; (#) offset determines zoom range - find with PixMousing (*change*?)
Click, right
Sleep, 100				; additional sleeptime increases stability
Send {down 6}
Sleep, 150				; important!
Send {right}
Sleep, 50
Send {up}
Sleep, 50
Send {Enter}				; opens Select with more options
Sleep, 200				; increase sleeptime if needed
CoordMode, Mouse, Window
Click, %WS_04_X%, %WS_04_Y%		; (WS_04) Same voice
Sleep, 50
Click, %WS_03_X%, %WS_03_Y%		; (WS_03) In selection
Sleep, 50
Send {Enter}				; OK
CoordMode, Mouse, Screen
Click, %IN_058_X%, %IN_058_Y%		; I(058) Stem Length change
Sleep, 50
SingleNoteStemLength:
Send ^{a}
Sleep, 50
Send ^c
Sleep, 50
If (Stemlength = "r25plus") || (Stemlength = "25plus")
    StemLength := clipboard+=0.25
If (Stemlength = "r50plus") || (Stemlength = "50plus")
    StemLength := clipboard+=0.50
If (Stemlength = "r25min") || (Stemlength = "25min")
    StemLength := clipboard-=0.25
If (Stemlength = "r50min") || (Stemlength = "50min")
    StemLength := clipboard-=0.50
Send %StemLength%
Send ^v
Send {Escape}				; to deactivate Length change stem input field
Sleep, 50
MouseMove, StartX, StartY + 4		; back to its original position
Click
Return

; ♣=========================== RESET STEMLENGTH ONE NOTE ==========================================

; alternative: Left Alt + Left Win + e: to stem: reset with Ctrl + CapsLock (= Ctrl + R)
; PM: reset in range with Ctrl + CapsLock (= Ctrl + R)

~\ & /::				; reset stemlength one note
Gosub, InspectorCheck
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4112, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is no note selected.`nOr you could try a higher zoom factor.
    Return
}
Click, %NoteX%, %NoteY%
Sleep, 150
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
If ErrorLevel
{
    MsgBox, 4144, Set Stemlength, No note selected.`nThe macro will exit.
    Return
}
Click, %IN_052_X%, %IN_052_Y%		; I(052) Select stem
Sleep, 200
Click, %IN_059_X%, %IN_059_Y%		; I(059) Reset (058) Length change stems
Sleep, 100
MouseMove, NoteX, NoteY + 4		; back to original position
Click
Return

; ♣===================================== MASKING TEXT =============================================

; Collision avoidance by masking text. Hide elements partially
; The macro creates text in a rectangular frame and a border of 1.4 sp.
; The stacking order of the text is set to 950. (Z1=950)
; This means that only slurs (Z=900) will be hidden by the surface of the text.
; All other elements have a higher stacking order. (see table in next hotkey)
; For instance dynamics cut through by the slur (Z2=3100) will remain visible.
; For partially covering an element with a default Z higher than 950:
; decrease its stacking rate (Z2) lower than 950 or increase Z1 of the masking text to more than Z2.
; select in any voice a note or a rest 

~, & .::				; create masking text
Gosub, InspectorCheck
Send ^{t}
Sleep, 100
Send {.}
Sleep, 100
Send {Escape}
Sleep, 100
Send {=}				; turns off automatic placement
Sleep, 50
Click, %IN_079_X%, %IN_079_Y%		; I(079) Text Frame
Sleep, 100
; Send c				; selects circle
Send r					; selects rectangle
Sleep, 100
Send {Enter}
Click, %IN_081_X%, %IN_081_Y%		; I(081) Text Thickness rectangle
Loop, 13
{
    Send {up}				; thickness 1.40 sp
    Sleep, 50
}
Click, %IN_082_X%, %IN_082_Y%		; I(082) Text Margin rectangle
Send {down}				; to 0.00 sp
Sleep, 50
Click, %IN_073_X%, %IN_073_Y%		; I(073) Text Font size
Loop, 8
{
    Send {down}				; to 2.00 pt
    Sleep, 50
}
Sleep, 50
Click, %IN_080_X%, %IN_080_Y%		; I(080) Text Border rectangle
Sleep, 500				; opens ColorPicker
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; HTML: #RGB rectangle
Sleep, 100
Send ^a
Sleep, 50
Send {Raw}#ffffff			; pure white
Sleep, 50
Send {Enter}
Sleep, 100
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Send {Escape}
Loop, 9					; change number to change height (*change*?)
{
    Send ^{down}			; move masking text down
    Sleep, 50
}
Send ^{right}
Sleep, 50
Click, %IN_023_X%, %IN_023_Y%		; I(023) Stacking order (Z) - OVERLAP
Send {BS 4}
Sleep, 50
Send 950				; to cover only slurs. see table stacking order
Sleep, 100				; now trying to steer the mouse back to the element
Return

~, & /::					; inspector: element, set stacking order
Keywait, `,					; escapesign ` is needed to interpret the comma literally
MouseGetPos, StartX, StartY			; timer needed for positioning MsgBox
Gosub, InspectorCheck
SetTimer, MoveBoxStackingOrder, -50
MsgBox, 4096, Stacking order,
(
Accidental		1600
Ambitus			2200
Arpeggio		1500
Articulation		2800
Barline			1100
Beam			3200
Bend			4800
Breathmarks		2500
Caesura			2500
Change instrument	4400
Clef			2000
Cresc. - Dim		5100
D.C			3700
D.S			3700
Dynamic			3100
Fall etc.			3000
Fermata			2900
Fingering		3800
Flag			3300
Fretboard diagram	4700
Glissando		6100
Hairpin			5100
Hook/Flag		3300
Instrument names		  800
Key signature		2100
Ledgerlines		1700
Line			5700
Minus sign measure	1099
mf + hairpin		5100
Note anchored line	5700
Note dot			6600
Noteheads		1900
Ornament		2800
Ottava's			5200
Palm mute		5600
Parenthesis		 500
Pedal lines		5900
Rehearsal mark		4300
Repeat measure sign	2600
Rest			2400
RH fingering		2800
Sawtooth		5500
Segno			3600
Slide etc.			3000
Slur			  900
Stafflines		1200
Staff text			4100
Stem			1800
System text		4200
Tempo			4000
Text line			5700
Thumb pos		2800
Tie			1000
Time signature		2300
Title text			  600
Tremolo			6700
Tremolobar		4900
Trill lines			5300
Volta			5800
)
Click, %IN_023_X%, %IN_023_Y%			; I(023) Stacking order (Z) - OVERLAP
						; change value with arrowkeys or mousewheel
Tooltip, Press Z when ready, IN_023_X - 100, IN_023_Y - 40, 10		; (*change*?)
Keywait, z, d
Tooltip, , , , 10				; end of tooltip (10)
Click, up, left
MouseMove, StartX, StartY
Return

MoveBoxStackingOrder:				; positioning MsgBox
WinMove, ahk_class #32770, , 0, 0, 220, 885	; top left screen (0, 0) - width (220) and height (885)(*change*?)
Return						; coordinates  determined with PixMousing

; ♣====================================== ALIGN ===================================================
; ALIGN - two commands
; aligns similar elements resp. elements of the same subtype
; action: select range and right click an element (no note)
; Align elements with arrowkeys up/down or mousewheel
; The AP toggle is here ON. Notice the difference when OFF -> add semicolon and space in (1), (2) and (3)

~CapsLock & F10::			; horizontal alignment of similar elements
Gosub, InspectorCheck
MsgBox, 65, Align similar elements,
(
Press OK, select the range and right click
one of the elements you want to align.`n
Align elements with the up/down arrowkeys,`none of the NumPad commands`nor the mousewheel.
)
IfMsgBox, Cancel
	Return
Send {Volume_Mute}			; Mute/unmute the master volume
KeyWait, RButton, D
Sleep, 300
Send {down 6}
Send {right}
Send {down 2}
Send {Enter}
Sleep, 100
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Send {Volume_Mute}			; Mute/unmute the master volume
Return

~CapsLock & F11::			; horizontal alignment of similar elements of the same subtype
Gosub, InspectorCheck
MsgBox, 65, Align elements of the same subtype,
(
Press OK, select the range and right click
one of the elements you want to align.`n
Align elements with the up/down arrowkeys,`none of the NumPad commands`nor the mousewheel.
)
IfMsgBox, Cancel
	Return
Send {Volume_Mute}			; Mute/unmute the master volume
KeyWait, RButton, D
Sleep, 300
Send {down 6}
Send {right}
Send {up}
Send {Enter}				; opens Select with more options
CoordMode, Mouse, Window
Sleep, 100				; increase sleeptime if necessary
Click, %WS_01_X%, %WS_01_Y%		; (WS_01) Same subtype
Sleep, 50
Click, %WS_03_X%, %WS_03_Y%		; (WS_03) In selection
Sleep, 50
Click, %WS_11_X%, %WS_11_Y%		; (WS_11) OK
Sleep, 100
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Send {Volume_Mute}			; Mute/unmute the master volume
Return

; ==================== COLLISION AVOIDANCE ===== TIES, DOTS =======================================

; The default up/down tie direction follows a rule which is
; NOT recommended by Gould. In her book 'Behind Bars' p. 65 she decribes this rule:
; "Ties for notes on and above the middle staveline curve upwards, ties for notes
; below the middle line curve downwards."

~F5 & b::			; upstem bottom tie - line notes (b1)
Send ^!{down}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 3}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}			; under left bottom note
Sleep, 50
Send {Tab}			; right handle
Sleep, 50
Send {right 7}			; under right bottom note
Sleep, 50
Send {Tab 2}			; mid curvature
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & v::			; upstem bottom - space notes (b2)
Send ^!{down}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 8}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}			; under left bottom note
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 7}			; right handle
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {down 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & c::			; upstem bottom tie - chord with mirrored head (b3)
Send ^!{down}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 3}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}			; under left bottom note
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & t::			; upstem topnote non mirrored (t1)
Send ^!{up}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up 4}
Sleep, 50
Send {Tab 2}			; right handle
Sleep, 50
Send {right 7}			; under right bottom note
Sleep, 50
Send {Tab 2}			; mid curvature
Sleep, 50
Send {up 2}
Sleep, 50
Send !{left}			; back to note
Sleep, 50
Return

~F5 & y::			; upstem mirrored topnote (t2)
Send ^!{up}
Sleep, 50
Send !{right}			; fgbc
Sleep, 50
Send ^r
Sleep, 100
Send {up 5}			; if no 16 th in other staff
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}
Sleep, 50
Send {Tab 3}
Sleep, 50
Send {up 3}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & s::			; upstem - spacenote - downtie
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 4}			; tie under dot
Sleep, 50
Send {Tab}
Send {right 8}			; left handle
Sleep, 50
Send {Tab}			; right handle
Sleep, 50
Send {left}
Sleep, 50
Send {Tab 2}			; mid curvature
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & w::			; upstem - spacenote - uptie
Send !{right}
Sleep, 50
Send ^r
Sleep, 150			; !!!
Send {up 4}			; tie next to dot
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 8}			; left handle
Sleep, 50
Send {Tab}			; right handle
Sleep, 50
Send {left}
Sleep, 50
Send {Tab 2}			; mid curvature
Sleep, 50
Send {up 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & l::			; upstem - linenote - down tie
Send !{right}			; curve down
Sleep, 50
Send ^r
Sleep, 100
Send {up 5}			; vertical displacement 5 up
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab}
Sleep, 50
Send {left}
Sleep, 50
Send {Tab 2}			; mid curvature
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & o::			; upstem - linenote - up tie - curve up
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up 5}			; vertical displacement 5 up
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {up 2}			; 2 higher
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & n::			; upstem adjacent notes - mirrored secunde spacenote
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}
Sleep, 50
Send {Tab 3}
Sleep, 50
Send {up 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & m::			; upstem adjacent notes - mirrored secunde linenote
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up 3}
Send {Tab}			; left handle
Sleep, 50
Send {left 7}
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {up 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & ]::			; upstem innernote (not mirrored) - downtie
Send !{right}			; fgbc like
Sleep, 50
Send ^r
Sleep, 100
Send {up 10}			; 10 higher
Sleep, 50
Send {Tab}
Sleep, 50
Send ^{right 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & [::			; upstem mirrored innernote downtie - default curvature
Send !{right}			; cegab like - treats a
Sleep, 50
Send ^r
Sleep, 100
Send {up}
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab}
Sleep, 50
Send {left 12}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & f::			; flatten upties - enlarge curve down-ties
Send !{right}
Sleep, 50
Send {Tab 4}
Sleep, 50
Send {down}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & -::			; tie rightside - 5 shorter
Send !{right}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {left 5}			; right handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & =::			; tie rightside - 5 longer
Send !{right}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {right 5}			; right handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & p::			; tie rightside - 2 longer
Send !{right}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {right 2}			; right handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & i::			; tie rightside - 2 shorter
Send !{right}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {left 2}			; right handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & b::			; downstem bottom tie - linenote
Send ^!{down}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 3}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 8}			; under left bottom note
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {down 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & v::			; downstem bottom tie - spacenote
Send ^!{down}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 7}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}			; under left bottom note
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {down 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & c::			; downstem bottom tie - mirrored note
Send ^!{down}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 7}
Sleep, 50
Send {right 4}
Sleep, 50
Send {Tab}
Sleep, 50
Send {left 4}
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 3}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {down 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & t::			; downstem topnote (for line- and spacenotes)
Send ^!{up}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up 3}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}
Sleep, 50
Send {Tab}			; right handle
Sleep, 50
Send {right 7}
Sleep, 50
Send {Tab 3}
Sleep, 50
Send {up 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & y::			; downstem topnote (1/8)
Send ^!{up}
Sleep, 50
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up 8}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {left 7}
Sleep, 50
Send {Tab}			; right handle
Sleep, 50
Send {right 7}
Sleep, 50
Send {Tab 3}
Sleep, 50
Send {up 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & s::			; downstem - spacenote - down tie
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {up 2}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & w::			; downstem- spacenote - uptie
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 3}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab 3}			; mid curvature
Sleep, 50
Send {up 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & l::			; downstem linenote down tie
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab 3}
Sleep, 50
Send {down 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & o::			; downstem - linenote - up tie
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 2}
Sleep, 50
Send {Tab}			; left handle
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab 3}
Sleep, 50
Send {up 2}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & n::			; downstem adjacent notes - mirrored secunde spacenote
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {right 7}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & m::			; downstem adjacent notes - mirrored secunde linenote
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send {down 3}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {right 7}
Sleep, 50
Send {Tab 2}
Sleep, 50
Send {down 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & ]::			; downstem innernote downtie
Send !{right}			; gacd like - treats c
Sleep, 50
Send ^r
Sleep, 100
Send {up}
Sleep, 50
Send {Tab}
Sleep, 50
Send ^{right 2}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & [::			; downstem innernote uptie - default curvature
Send !{right}			; gacd like - treats a
Sleep, 50
Send ^r
Sleep, 100
Send {down}
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 8}
Sleep, 50
Send {Tab}
Sleep, 50
Send {left 12}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & u::			; tie 3 higher
~F5 & u::			; tie 3 higher
Send !{right}
Sleep, 50
Send {up 3}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & d::			; tie 3 lower
~F5 & d::			; tie 3 lower
Send !{right}
Sleep, 50
Send {down 3}
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & f::			; flatten downties - enlarge curve-up ties
Send !{right}
Sleep, 50
Send {Tab 4}
Sleep, 50
Send {up}			; mid curvature
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & -::			; tie leftside - 5 shorter
Send !{right}
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 5}			; left handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & =::			; tie leftside - 5 longer
Send !{right}
Sleep, 50
Send {Tab}
Sleep, 50
Send {left 5}			; left handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & p::			; tie leftside - 2 longer
Send !{right}
Sleep, 50
Send {Tab}
Sleep, 50
Send {left 2}			; left handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & i::			; tie leftside - 2 shorter
Send !{right}
Sleep, 50
Send {Tab}
Sleep, 50
Send {right 2}			; left handle
Sleep, 50
Send !{left}
Sleep, 50
Return

~F3 & x::			; flip tie
Send !{right}
Sleep, 50
Send {up 3}
Sleep, 50
Send x				; flip tie
Sleep, 50
Send !{left}
Sleep, 50
Return

~F5 & x::			; flip tie
Send !{right}
Sleep, 50
Send {down 8}
Sleep, 50
Send x				; flip tie
Sleep, 50
Send !{left}
Sleep, 50
Return

; ♣================================ MOVE AUGMENTATION DOT =========================================

~F3 & .::			; move dot in chord with seconds 1.2 sp left
~F5 & .::			; move dot in chord with seconds 1.2 sp left
Gosub, InspectorCheck
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
If ErrorLevel
{
MsgBox, Note not found
Return
}
Click, %IN_051_X%, %IN_051_Y%	; I(051) Select augm. dot 1
Sleep, 200
Click, %IN_020_X%, %IN_020_Y%	; I(020) X-offset - OVERLAP - ELEMENT
Sleep, 50
Send ^{a}
Sleep, 50
Send -1.2
Sleep, 50
MouseMove, NoteX, NoteY + 4
Click
Return

~F3 & ,::			; reset dot
~F5 & ,::			; reset dot
Gosub, InspectorCheck
PixelSearch, NoteX, NoteY, CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, ColorV1, , Fast RGB	; voice 1
If ErrorLevel
{
MsgBox, Note not found
Return
}
Click, %IN_051_X%, %IN_051_Y%	; I(051) Select augm. dot 1
Sleep, 200
Click, %IN_022_X%, %IN_022_Y%	; I(022) Reset (020) en (021) X/Y Offset
Sleep, 50
MouseMove, NoteX, NoteY + 4
Click
Return

~F3 & r::			; reset tie
~F5 & r::			; reset tie
Send !{right}
Sleep, 50
Send ^r
Sleep, 100
Send !{left}
Sleep, 50
Return

; ♣======================= COPY X and Y OFFSETS for ELEMENTS ======================================

~p & F11::				; copy X- and Y- Offsets of element
CoordMode, Mouse, Window
Gosub, InspectorCheck
MouseGetPos, StartX, StartY
clipboard =   				; Empty the clipboard
Loop, 2
{
    if (A_Index = 1)
        MouseMove, %IN_020_X%, %IN_020_Y%	; I(020) X-offset - OVERLAP - ELEMENT
    if (A_Index = 2)
        MouseMove, %IN_021_X%, %IN_021_Y%	; I(021) Y-offset - OVERLAP - ELEMENT
    Click
    Sleep, 50
    Send {left}
    Sleep, 50
    Send ^{a}
    ClipboardText = %Clipboard%  	; remove formatting
    SendEvent ^c  			; SendEvent necessary. Not just Send
    ClipWait
    ClipNew = %Clipboard%
    if (A_Index = 1)
    {
        Clipboard = %ClipboardText%%ClipNew%
        Goto, XOffsetElement
    }
    Clipboard = %ClipboardText%`n`r%ClipNew%
    XOffsetElement:
    ClipboardText =  			; clear the variable
}
Click, StartX, StartY
Return

~p & F12::				; paste X- and Y- Offsets of element
CoordMode, Mouse, Window
MouseGetPos, StartX, StartY
Loop, parse, clipboard, `n, `r
{
    If (A_Index = 1)
        MouseMove, %IN_020_X%, %IN_020_Y%	; I(020) X-offset - OVERLAP - ELEMENT
    If (A_Index = 2)
        MouseMove, %IN_021_X%, %IN_021_Y%	; I(021) Y-offset - OVERLAP - ELEMENT
    Click
    Sleep, 50
    Send ^{a}
    Sleep, 50
    Send %A_LoopField%
    Sleep, 200
    If (A_Index = 2)
        Break
}
Click, StartX, StartY
Return

; ♣=============================== TRANSFER HEADER & FOOTER INFO ==================================

~p & F7::			; copy from: style header and footer texts
CoordMode, Mouse, Window
Gosub, InspectorCheck
Send !{o}
Sleep, 300
Send {Enter}
Sleep, 1000
Winmove, Style, , , , % WSTYWidth, % WSTYHeight
Send {h}
Sleep, 300
clipboard =   			; Empty the clipboard
Loop, 12
{
    if (A_Index = 1)
        MouseMove, STY_14X, STY_14Y		; (STY_14) Left Odd Header topleft
    if (A_Index = 2)
        MouseMove, STY_15X, STY_15Y		; (STY_15) Left Even Header topleft
    if (A_Index = 3)
        MouseMove, STY_16X, STY_16Y		; (STY_16) Middle Odd Header topleft
    if (A_Index = 4)
        MouseMove, STY_17X, STY_17Y		; (STY_17 Middle Even Header topleft
    if (A_Index = 5)
        MouseMove, STY_18X, STY_18Y		; (STY_18) Right Odd Header topleft
    if (A_Index = 6)
        MouseMove, STY_19X, STY_19Y		; (STY_19) Right Even Header topleft
    if (A_Index = 7)
        MouseMove, STY_20X, STY_20Y		; (STY_20) Left Odd Footer topleft
    if (A_Index = 8)
        MouseMove, STY_21X, STY_21Y		; (STY_21) Left Even Footer topleft
    if (A_Index = 9)
        MouseMove, STY_22X, STY_22Y		; (STY_22) Middle Odd Footer topleft
    if (A_Index = 10)
        MouseMove, STY_23X, STY_23Y		; (STY_23) Middle Even Footer topleft
    if (A_Index = 11)
        MouseMove, STY_24X, STY_24Y		; (STY_24) Right Odd Footer topleft
    if (A_Index = 12)
        MouseMove, STY_25X, STY_25Y		; (STY_25) Right Even Footer topleft
    Click
    Sleep, 50
    Send ^a
    Sleep, 100
    ClipboardText = %Clipboard%  	; remove formatting
    Sendevent ^{c}
    ClipWait
    ClipNew = %Clipboard%
    if (A_Index = 1)
    {
        Clipboard = %ClipboardText%%ClipNew%
        Goto, PageLeftOddHeader
    }
    Clipboard = %ClipboardText%`n`r%ClipNew%
    PageLeftOddHeader:
    ClipboardText =  			; clear the variable
    MsgBox, 4096, Copy Header and Footer,
(
This is field %A_Index%.
Press OK when the field is selected.
)
    if (A_Index = 12)
        Break
}
CoordMode, Mouse, Screen
Send {Escape}
Sleep, 100
Return

~p & F8::			; paste style header and footer texts
CoordMode, Mouse, Window
Gosub, InspectorCheck
Send !{o}
Sleep, 300
Send {Enter}
Sleep, 1000
Winmove, Style, , , , % WSTYWidth, % WSTYHeight
Send {h}
Sleep, 300
Loop, parse, clipboard, `n, `r
{
    if (A_Index = 1)
        MouseMove, STY_14X, STY_14Y		; (STY_14) Left Odd Header topleft
    if (A_Index = 2)
        MouseMove, STY_15X, STY_15Y		; (STY_15) Left Even Header topleft
    if (A_Index = 3)
        MouseMove, STY_16X, STY_16Y		; (STY_16) Middle Odd Header topleft
    if (A_Index = 4)
        MouseMove, STY_17X, STY_17Y		; (STY_17 Middle Even Header topleft
    if (A_Index = 5)
        MouseMove, STY_18X, STY_18Y		; (STY_18) Right Odd Header topleft
    if (A_Index = 6)
        MouseMove, STY_19X, STY_19Y		; (STY_19) Right Even Header topleft
    if (A_Index = 7)
        MouseMove, STY_20X, STY_20Y		; (STY_20) Left Odd Footer topleft
    if (A_Index = 8)
        MouseMove, STY_21X, STY_21Y		; (STY_21) Left Even Footer topleft
    if (A_Index = 9)
        MouseMove, STY_22X, STY_22Y		; (STY_22) Middle Odd Footer topleft
    if (A_Index = 10)
        MouseMove, STY_23X, STY_23Y		; (STY_23) Middle Even Footer topleft
    if (A_Index = 11)
        MouseMove, STY_24X, STY_24Y		; (STY_24) Right Odd Footer topleft
    if (A_Index = 12)
        MouseMove, STY_25X, STY_25Y		; (STY_25) Right Even Footer topleft
    Click
    Sleep, 50
    Send ^{a}
    Sleep, 70
    Send {del}
    Sleep, 50
    Send %A_LoopField%
    Sleep, 50
    MsgBox, 4096, Copy Header and Footer,
(
This is field %A_Index%.
Press OK when the copy is ready.
Text: %A_LoopField%
)
    If (A_Index = 12)
        Break
}
Click, %STY_01X%, %STY_01Y%		; (STY_01) OK
Sleep, 100
Return

; ♣=============================== TRANSFER STYLE - ALL PAGE SPACE SETTINGS =======================

~p & F5::			; copy from: style page sp. settings and last system fill treshold
				; work with clipboard: add delimiter and marked text to existing clipboard content
CoordMode, Mouse, Window
Gosub, InspectorCheck
Send !{o}
Sleep, 300
Send {Enter}
Sleep, 1000
Winmove, Style, , , , % WSTYWidth, % WSTYHeight
Send {down}
Sleep, 300
clipboard =   				; Empty the clipboard.
Loop, 9
{
    if (A_Index = 1)
        Click, %STY_04X%, %STY_04Y%	; (STY_04) Music top margin rectangle
    if (A_Index = 2)
        Click, %STY_05X%, %STY_05Y%	; (STY_05) Music bottom margin rectangle
    if (A_Index = 3)
        Click, %STY_06X%, %STY_06Y%	; (STY_06) Staff distance rectangle
    if (A_Index = 4)
        Click, %STY_07X%, %STY_07Y%	; (STY_07) Grand staff distance rectangle
    if (A_Index = 5)
        Click, %STY_09X%, %STY_09Y%	; (STY_09) Max. system distance rectangle
    if (A_Index = 6)
        Click, %STY_08X%, %STY_08Y%	; (STY_08) Min. system distance rectangle
    if (A_Index = 7)
        Click, %STY_10X%, %STY_10Y%	; (STY_10) Vertical frame top margin rectangle
    if (A_Index = 8)
        Click, %STY_11X%, %STY_11Y%	; (STY_11) Vertical frame bottom margin rectangle
    if (A_Index = 9)
        Click, %STY_12X%, %STY_12Y%	; (STY_12) Last system fill threshold rectangle	
    Sleep, 50
    ; Send {left}
    ; Sleep, 50
    Send ^{a}
    ClipboardText = %Clipboard%  	; remove formatting
    SendEvent ^{c}  			; SendEvent necessary. Not just Send
    ClipWait
    ClipNew = %Clipboard%
    if (A_Index = 1) {
        Clipboard = %ClipboardText%%ClipNew%
        Goto, MusicTopMargin
        }
    Clipboard = %ClipboardText%`n`r%ClipNew%
    MusicTopMargin:
    ClipboardText =  			; clear the variable
    if (A_Index = 9)
        Break
}
CoordMode, Mouse, Screen
Send {Escape}
Sleep, 100
MsgBox, 4160, Copy spatium settings titleframe and treshold.,
(
Copying from the source part is finished.
Select now the destination parts
and press P + F6 to copy all data.
)
Return

~p & F6::			; copy to: style page sp. settings and last system fill treshold
CoordMode, Mouse, Window
Gosub, InspectorCheck
Send !{o}
Sleep, 300
Send {Enter}
Sleep, 1000
Winmove, Style, , , , % WSTYWidth, % WSTYHeight
Send {down}
Sleep, 300
Loop, parse, clipboard, `n, `r
{
    If (A_Index = 1)
    {
        Click, %STY_04X%, %STY_04Y%	; (STY_04) Music top margin rectangle
        Sleep, 50
        Send ^a
        Sleep, 50
        Send {del}
        Sleep, 50
        Send %A_LoopField%
        Click, %STY_08X%, %STY_08Y%	; (STY_08) Min. system distance rectangle
        Send ^a
        Sleep, 100
        Send 0.0			; Min. system distance set at zero
        Sleep, 100			; to prevent malfunctioning max distance
        Continue
        }
    If (A_Index = 2)
        Click, %STY_05X%, %STY_05Y%	; (STY_05) Music bottom margin rectangle
    If (A_Index = 3)
        Click, %STY_06X%, %STY_06Y%	; (STY_06) Staff distance rectangle
    If (A_Index = 4)
        Click, %STY_07X%, %STY_07Y%	; (STY_07) Grand staff distance rectangle
    If (A_Index = 5)
    {
        Click, %STY_09X%, %STY_09Y%	; (STY_09) Max. system distance rectangle
        Send ^a
        Sleep, 150
        Send {Del}
        Sleep, 150
        Send %A_LoopField%
        Sleep, 100
        Continue
    }
    If (A_Index = 6)
        Click, %STY_08X%, %STY_08Y%	; (STY_08) Min. system distance rectangle
    If (A_Index = 7)
        Click, %STY_10X%, %STY_10Y%	; (STY_10) Vertical frame top margin rectangle
    If (A_Index = 8)
        Click, %STY_11X%, %STY_11Y%	; (STY_11) Vertical frame bottom margin rectangle
    If (A_Index = 9)
        Click, %STY_12X%, %STY_12Y%	; (STY_12) Last system fill threshold rectangle	

    Sleep, 50
    Send ^{a}
    Sleep, 50
    Send %A_LoopField%
    Sleep, 100
    If (A_Index = 9)
    Break
}
Send {Enter}
Sleep, 100
Return

; ♣================================== SUBROUTINE ==================================================

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