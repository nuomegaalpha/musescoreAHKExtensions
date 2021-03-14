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


/*
; Replace the path S:\etc. with your location of MuseScore3.exe
; ColorSearch and Select. This macro group assumes a DEFINED STATE. Find it with ♣ and Ctrl + F
; places to change are marked (*change*?)
*/

; ♣================================================================================================

~[ & F1::
CoordMode, Tooltip, Screen
Tooltip, F1  Search and Select, ToolT_F1_X, 0, 1		; tooltip (1) Search and Select 
Return

~] & F1::
MsgBox, 4132, Color Search and Select, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 1::		; general info group F1 + rightclick selection commands (contextual menu)
MsgBox, 4096, F1:  Search and Select      [ + 1,
(
Select all ELEMENTS except notes and rests

For		Press	plus	All similar	Same subtype

Range		Control		RightButton #	MidButton
Score		Left Shift		RightButton	MidButton
System √		Right Shift	RightButton	MidButton
Staff		CapsLock	RightButton	MidButton
Voice		Alt		RightButton *	MidButton *
Staff+Voice	Win		RightButton	MidButton

Action - score, voice, system or staff: click an element.
Action - range: don't click the element but position the mouse on it

# Click an element + hotkey opens the Window Select
* Also for voice in range. Action as in range
√ In Page View. In Continuous View it operates on score.

Elements include Beams, Flags, Dots and Stems

NB: Prevent Nothing Selected -> dan toch DEF STATE
--------------------------------------------------------------------------------------------
Select all NOTES of the same	In Range/Score¬	In Staff

Duration				] + D		[ + D
Pitch				] + P		[ + P
Notename			] + N		[ + N
Voice				] + V		[ + V

		Action-range/score:		Action-staff:
		Select range or all and		Click a note of
		Position mouse on note		the right type
		(or rest for duration)

Select only all noteheads or only all rests in range	] + H

Notes include Noteheads, Grace Notes and Rests

Select all noteheads in range			M + H
Select all grace notes in range			M + G
Select all rest in range				M + R
--------------------------------------------------------------------------------------------
INPUTBOXES

Color Search and Select				Z + C
Selection Filter					Z + F
--------------------------------------------------------------------------------------------
MORE INFO Color Search and Select			[ + C
)
Return

~[ & c::		; to selected voice element + colored range commands: set, reset, go to left/right, select range
MsgBox, 4096, F1:  Search and Select      [ + C,
(
INSTANT SELECTION
Mouse moves to selected element in voice and clicks it 

Voice 1				Alt + Z
Voice 2				Alt + X
Voice 3				Alt + C
Voice 4				Alt + D
Voice 1234			Alt + S

COLORED RANGE - 4 pairs

With the 'liberated keys' H, J, K, and L
Range 1-2 managed by prefix	L
Range 3-4 managed by prefix	K
Range 5-6 managed by prefix	J
Range 7-8 managed by prefix	H

Set 1 (left)			L + [
Set 2 (right)			L + ]
Reset  1-2			L + -
Select 1-2			L + =
Go to 1				L + L MouseButton
Go to 2				L + R MouseButton
Select 1-2			L + Mid Button

With the 'liberated key' Y
Set 1...8				Y + F1...F8
Go to 1...8			Y + 1...8
Select range 1-2			Y + 9
Select range 3-4			Y + 0
Select range 5-6			Y + -
Select range 7-8			Y + =

GENERAL

Colorpicker			Y + C
Reset Range Colors		Y + R
Reset Note Color			Y + N
General Reset Elements		Y + S
with/without Style Button

INPUTBOXES

Color Search and Select		Z + C
Selection Filter			Z + F
)
Return

; ♣========================= SELECT ELEMENTS == in contextual menu 6 x down =======================

~^RButton::			; Range > all similar
Select_CM := "ras"		; CM for contextual menu
Goto, ContextMenu
~<+RButton::			; Score > all similar (Left Shift)
Select_CM := "scas"
Goto, ContextMenu
~>+RButton::			; Same system > all similar (Right Shift)
Select_CM := "sysas"
Goto, ContextMenu
~!RButton::			; Range > similar > same voice
Select_CM := "rassv"
Goto, ContextMenu
~CapsLock & RButton::		; Staff > all similar
Select_CM := "stas"
Goto, ContextMenu
#RButton::			; Staff > all similar > same voice
Select_CM := "stassv"
Goto, ContextMenu
~^MButton::			; Range > same subtype
Select_CM := "rsst"
Goto, ContextMenu
~<+MButton::			; Score > same subtype (Left Shift)
Select_CM := "scsst"
Goto, ContextMenu
~>+MButton::			; Same system > same subtype (Right Shift)
Select_CM := "ssyssst"
Goto, ContextMenu
~!MButton::			; Range > same subtype > same voice
Select_CM := "rsstsv"
Goto, ContextMenu
~CapsLock & MButton::		; Staff > same subtype
Select_CM := "stsst"
Goto, ContextMenu
#MButton::			; Staff > same subtype > same voice
Select_CM := "stsstsv"
Goto, ContextMenu

ContextMenu:
CoordMode, Mouse, Screen
Gosub, InspectorCheck		; see subroutine at end of script
ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
; ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
If (Errorlevel = 0)
{
MsgBox, 4112, Selection Status, Nothing selected!`nThe macro will exit.
    Return
}
MouseGetPos, StartX, StartY	; original mouse position is stored
Click, right			; executing each line takes about 30 ms

If Select_CM in ras
    Sleep, 150
If Select_CM in scas,stas,stassv,rsst,scsst,stsst,stsstsv
    Sleep, 50
If Select_CM in sysas,rassv,ssyssst,rsstsv
    Sleep, 600
Loop, 6
{
    Send {down}
    Sleep, 50
}
Sleep, 100		; important!
Send {right}
If Select_CM in ras
{
    Sleep, 350
    Send {down}
    Sleep, 100
    Send {down}
    Sleep, 100
}
If Select_CM in scas
    Sleep, 100
If Select_CM in sysas,rassv,stassv,rsstsv,stsst,stsstsv
{
    Sleep, 50
    Send {up}
    Sleep, 50
}
If Select_CM in stas
{
    Sleep, 50
    Send {down}
    Sleep, 50
}
If Select_CM in rsst,scsst,ssyssst
{
    Sleep, 200
    Send {up}
    Sleep, 50
}					; protection against rightclick on note or rest
If Select_CM in ras
    ImageSearch, , , StartX, StartY - RC_CM_Y1, StartX + RC_CM_X2, StartY + RC_CM_Y2, Remove_Selected_Range_Blue.png
If Select_CM in scas
    ImageSearch, , , StartX, StartY - RC_CM_Y1, StartX + RC_CM_X2, StartY + RC_CM_Y2, Swap_with_Clipboard_Blue.png
If Select_CM in sysas,rassv,stassv,rsst,scsst,ssyssst,rsstsv,stsst,stsstsv
    ImageSearch, , , StartX, StartY - RC_CM_Y1, StartX + RC_CM_X2, StartY + RC_CM_Y2, Paste_Blue.png
If Select_CM in stas
    ImageSearch, , , StartX, StartY - RC_CM_Y1, StartX + RC_CM_X2, StartY + RC_CM_Y2, Delete_Blue.png

If (ErrorLevel = 0) {
    ToolTip, Element Check. This hotkey is`nNOT for notes or rests!`nPress Z., StartX, StartY - 50, 2	; (*change*?)
    KeyWait, z, d
    ToolTip, , , , 2			; close tooltip (2)    
    Send {escape}
    Return
}

If Select_CM in sysas,rassv,stassv,rsst,scsst,ssyssst,rsstsv,stsst,stsstsv
{
    Send {Enter}			; opens Window Select
    Sleep, 200
    CoordMode, Mouse, Window
    If Select_CM in sysas,ssyssst
        Click, %WS_05_X%, %WS_05_Y%	; (WS_05) Window Select Same system
    If Select_CM in stassv,stsst,stsstsv
    {
        Click, %WS_02_X%, %WS_02_Y%	; (WS_02) Window Select Same staff
        Sleep, 50
    }
    If Select_CM in ssyssst
        Sleep, 50
    If Select_CM in rsst,scsst,ssyssst,rsstsv,stsst,stsstsv
        Click, %WS_01_X%, %WS_01_Y%	; (WS_01) Window Select Same subtype
    If Select_CM in rsstsv,stsstsv,rsst
        Sleep, 50
    If Select_CM in rassv,stassv,rsstsv,stsstsv
        Click, %WS_04_X%, %WS_04_Y%	; (WS_04) Window Select Same voice
    If Select_CM in rassv,stassv,rsstsv
        Sleep, 50
    If Select_CM in rassv,stassv,rsst,rsstsv
        Click, %WS_03_X%, %WS_03_Y%	; (WS_03) Window Select In selection
    Sleep, 50
    Send {Enter}			; OK
}

If Select_CM in ras,scas,stas
    Send {Enter}			; OK
CoordMode, Mouse, Screen
MouseMove, StartX, StartY		; back to original position
Return

; ♣===================== SELECT NOTES ======== in contextual menu 4 x up ==========================

; 4 x up - Closing bracket: Range - Opening bracket: Staff

~] & d::			; Range > all notes with the same duration
Select_NR_CM := "rd"
Goto, ContextMenu_NR
~] & p::			; Range > all notes with the same pitch
Select_NR_CM := "rp"
Goto, ContextMenu_NR
~] & n::			; Range > all notes with the same note name
Select_NR_CM := "rn"
Goto, ContextMenu_NR
~] & v::			; Range > all notes of the same voice
Select_NR_CM := "rv"
Goto, ContextMenu_NR
~] & h::			; Range > only the noteheads or only the rests
Select_NR_CM := "nhr"
Goto, ContextMenu_NR
~[ & d::			; Staff > all notes with the same duration
Select_NR_CM := "sd"
Goto, ContextMenu_NR
~[ & p::			; Staff > all notes with the same pitch
Select_NR_CM := "sp"
Goto, ContextMenu_NR
~[ & n::			; Staff > all notes with the same note name
Select_NR_CM := "sn"
Goto, ContextMenu_NR
~[ & v::			; Staff > all notes of the same voice
Select_NR_CM := "sv"
Goto, ContextMenu_NR

ContextMenu_NR:

CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY	; original mouse position is stored
Click, right
Sleep, 50
Send {up}			; executing each line adds 30 ms of sleep
Sleep, 50
Send {up}			; this delay is needed when many notes are selected
Sleep, 50
Send {up}			; executing each line takes about 30 ms
Sleep, 50
Send {up}
Sleep, 50
Send {right}
Sleep, 50
If Select_NR_CM in nhr
{
    Send {down  2}
    Goto, FinishSelect_NR_CM
}
Send {up}
Sleep, 50
Send {Enter}			; opens Window Select Notes
Sleep, 200			; increase sleeptime if needed
CoordMode, Mouse, Window

If Select_NR_CM in rd,sd
    Click, %WSN_05X%, %WSN_05Y%	; (WSN_05) Window Select Notes Same duration
If Select_NR_CM in rp,sp
    Click, %WSN_02X%, %WSN_02Y%	; (WSN_02) Window Select Notes Same pitch
If Select_NR_CM in rn,sn
    Click, %WSN_06X%, %WSN_06Y%	; (WSN_06) Window Select Notes Same note name
If Select_NR_CM in rv,sv
    Click, %WSN_09X%, %WSN_09Y%	; (WSN_09) Window Select Notes Same voice
Sleep, 50
If Select_NR_CM in rd,rp,rn,rv
    Click, %WSN_08X%, %WSN_08Y%	; (WSN_08) Window Select Notes In selection
If Select_NR_CM in sd,sp,sn,sv
    Click, %WSN_07X%, %WSN_07Y%	; (WSN_07) Window Select Notes Same staff

FinishSelect_NR_CM:
Sleep, 50
Send {Enter}			; OK
CoordMode, Mouse, Screen
MouseMove, StartX, StartY	; back to original position
Return

; ♣=============================== COLOR SEARCH and SELECT ========================================

; ♣================================== SEARCH VOICE COLORS =========================================

~!s::					; Search color all voices and click found element
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
MsgBox, 4144, Search for voice 1234 element, Color not found. Maybe there is no element selected.`nMaybe the selected element is set invisible.`nWith small elements you could try a higher zoom factor.
Click, %ElementX%, %ElementY%
Return

~!z::					; Search color voice 1 and click found element
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
MsgBox, 4144, Search for voice 1 element, Color not found. Maybe there is no element selected.`nMaybe the selected element is set invisible.`nWith small elements you could try a higher zoom factor.
Return
}
MouseMove, ElementX, ElementY + 4	; 4 pixels lower to prevent hitting third in another voice (*change*?)
Click
Return

~!x::					; Search color voice 2 and click found element
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB
if ErrorLevel
MsgBox, 4144, Search for voice 2 element, Color not found. Maybe there is no element selected.`nMaybe the selected element is set invisible.`nWith small elements you could try a higher zoom factor.
else
{
    MouseMove, ElementX, ElementY + 4	; 4 pixels lower to prevent hitting third in another voice (*change*?)
    Click
    Return
}
Return

~!c::					; Search color voice 3 and click found element
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB
if ErrorLevel
MsgBox, 4144, Search for voice 3 element, Color not found. Maybe there is no element selected.`nMaybe the selected element is set invisible.`nWith small elements you could try a higher zoom factor.
else
{
    MouseMove, ElementX, ElementY + 4	; 4 pixels lower to prevent hitting third in another voice (*change*?)
    Click
    Return
}
Return

~!d::					; Search color voice 4 and click found element
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB
if ErrorLevel
MsgBox, 4144, Search for voice 4 element,  Color not found. Maybe there is no element selected.`nMaybe the selected element is set invisible.`nWith small elements you could try a higher zoom factor.
else
{
    MouseMove, ElementX, ElementY + 4	; 4 pixels lower to prevent hitting third in another voice (*change*?)
    Click
    Return
}
Return

; ♣=============================== RESET COLOR and COLORPICKER ====================================

; Reset color of single elements with a Style button somewhere in the Inspector: Y + S
; Reset color of notes and other single elements without a Style button: Y + N
; Reset color in range: Y + R

~y & s::				; Reset Color by sending 'black' to ColorPicker
CoordMode, Mouse, Screen		; at least one style button in the inspector	
MouseGetPos, StartX, StartY
Gosub, InspectorCheck			; see subroutine at end of script
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)				; range selected
{
    MsgBox, 4144, Reset Color,
(
This command resets the color
of any single element.
To reset a range use Y + R.
The macro will exit.
)
    Return
}
Gosub, PickColor				; see subroutine at end of script
Send {Raw}#000000				; black
Sleep, 50
Send {Enter}
CoordMode, Mouse, Screen
MouseMove, StartX, StartY
Return

; Reset color of elements without a Style button in the Inspector
; select the first note with Color Select. Alt + Z,X,C,D or S
; then the mouse can return to the first note

~y & n::					; Notes - reset color
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
Gosub, InspectorCheck				; see subroutine at end of script
Click, %IN_013_X%, %IN_013_Y%			; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
Sleep, 50
Click, %StartX%, %StartY%
Return

~y & r::					; Range - reset color
CoordMode, Mouse, Screen			; when the range is filled with rests
MouseGetPos, StartX, StartY
Gosub, InspectorCheck				; see subroutine at end of script
ImageSearch, , , IM_13_X1, IM_13_Y1, IM_13_X2, IM_13_Y2, *40 IM_13_Inspector_Element.png
If (ErrorLevel = 0)				; in this case the range contains only rests
    Click, %IN_013_X%, %IN_013_Y%		; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
If (ErrorLevel = 1)				; the range contains at least one note
    Click, %IN_002_X%, %IN_002_Y%		; I(002) rectangular Set Color = Reset Color - ELEMENT GROUP
Sleep, 50
Click, %StartX%, %StartY%
Return

~y & c::					; colorpicker - color one element
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY			; subroutine Inspector Check will not work here
; Gosub, InspectorCheck
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    Send {Click}
    Sleep, 100
    Send {Escape}				; to suppress the contextual menu
    Sleep, 50
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit.
    Sleep, 50
    WinActivate, Inspector Check
    if GetKeyState("Enter") || GetKeyState("Escape")
    {
        Send {Escape}				; again to suppress the contextual menu
        Sleep, 50
        Return
    }
}
else
ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
If (Errorlevel = 0)
{
    MsgBox, 4112, Colorpicker - Status, Nothing selected!`nThe macro will exit.
        Return
}
ImageSearch, , , IM_02_X1, IM_02_Y1, IM_02_X2, IM_02_Y2, IM_02_Inspector_Empty_Surface.png
If (Errorlevel = 0)
{
MsgBox, 4144, Colorpicker - Status,
(
You made a range selection or selected something
which can't be colored!

To color elements in a range use Z + C.
Or use one of the selection commands from group F1.
The macro will exit.
)
    Return
}
Gosub, PickColor				; see subroutine at end of script
Tooltip, Select Color. OK. Press Z when ready., RGB_X - 300, RGB_Y + 28, 2		; (*change*?)
KeyWait, z, d
Tooltip, , , , 2				; close tooltip (2)
Click, %StartX%, %StartY%
Return

; ♣================================== APPLY COLORS - SHORTCUT LIST=================================

; For ColorScheme see bottom of script
; SHORTCUTLIST
; ,1,2,3,4,5,6,7,8,a,b,c,d,e,f,g,ab,bb,cb,db,eb,fb,gb,lbc
; , 1, 2, 3, 4, 5, 6, 7, 8, a, b, c, d, e, f, g, ab, bb, cb, db, eb, fb, gb
; ,=1,=2,=3,=4,=5,=6,=7,=8,=a,=b,=c,=d,=e,=f,=g,=ab,=bb,=cb,=db,=eb,=fb,=gb
; ,12,34,56,78
; ,[]mt,[]123,[]1,[]2,[]3,[]4,[]5,[]6,[]7,[]8,[abc],[]a,[]b,[]c,[]d,[]e,[]f,[]g,[]bwc,[]ab,[]bb,[]cb,[]db,[]eb,[]fb,[]gb,[]lbc
; ,/\mt,/\1,/\2,/\3,/\4,/\5,/\6,/\7,/\8,/\a,/\b,/\c,/\d,/\e,/\f,/\g,/\ab,/\bb,/\cb,/\db,/\eb,/\fb,/\gb,/\lbc
; ,v1,v2,v3,v4,=v1,=v2,=v3,=v4, v1, v2, v3, v4,[]v1,[]v2,[]v3,[]v4,/\v1,/\v2,/\v3,/\v4
; ,?,??


~z & Pause::					; break loop score search all colors
BreakColorSearchLoop = 1
MsgBox, 4160, Search Score Color, You terminated the search., 2	; timed MsgBox
Return

; ♣======================================= APPLY COLORS ===========================================

~z & c::					; apply colors
NothingSelected := 0
ColorRangeSelection := 0
ElementX := 1
ElementY := 1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseGetPos, StartX, StartY			; position mouse
Gosub, InspectorCheck				; see subroutine at end of script
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
If (ErrorLevel = 0)				; range selected
    ColorRangeSelection := 1			; now we can use this setting further on
If (ErrorLevel = 1)				; look for some selected element
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
    If (ErrorLevel = 0)			; nothing selected
        NothingSelected := 1		; now we can use this setting further on
    If (ErrorLevel = 1)			; something selected, search screen and click the element
    {
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        If ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        If ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        If ErrorLevel
        PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        If ErrorLevel
        {
            MsgBox, 4112, Searching for an element in any voice, Color not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.
            Return
        }
        Click, %ElementX%, %ElementY%
    }
}

InputBox, ApplyColor, Apply Colors, , , W_IB, H_IB, IB_X, IB_Y, , , Help = 1 or 2 questionmarks			;  (*change*?) InputBox positioned in Inspector area
; InputBox, ApplyColor, Apply Colors, , , W_IB, H_IB, StartX, StartY - 120, , , Help = 1 or 2 questionmarks	;  (*change*?) InputBox positioned near the mouse
If ErrorLevel					; when Cancel is pressed
    Return

If (ApplyColor = "?") || (ApplyColor = "Help = 1 or 2 questionmarks")
{
MsgBox, 4096, F1:  Apply Colors:  Z + C → ?      General Info,
(
Applications of colored notes (or elements).
A well known application is the use of colored notes in education.
Each pitch has got its own color.
This makes for 7 colors associated with the tones A, B, C, D, E, F and G. 
For this purpose the macro has two sets of 'tone colors'.
- Notes colored following the ColorNotes plugin: ColorNotes_tpc.qml
- Notes colored following the Boomwhackers convention BWC.

The commands of AutoHotKey make many more applications possible.
Guided by the voice color the mouse can click any selected element.
A colored note can be searched on the screen or in the score.
A 'left' and a 'right' colored note can be used for range selections.
The note color can be used as a marker. E.g all notes of a certain color
have comments attached. Another color can refer to musical ideas.
In short: a color can refer to its own category of attached elements.
We can set, search and select a total of 26 colors + 2 specials.

Colorgroup #1	4 voice colors		V1  V2  V3  V4
Colorgroup #2	8 colors in 4 pairs		1-2  3-4  5-6  7-8
Colorgroup #3	7 'tone colors'		A  B  C  D  E  F  G
Colorgroup #4	7 BWC 'tone colors'	AB  BB  CB  DB  EB  FB  GB

Normally we will use V1, V2, V3 and V4 for instant selection.
And the pairs of group #2 for repeated range selection.
Probably we will only use the groups #2, #3 and #4 as markers.

Finally there are two specialised colors. (1) LBC, the LayoutBreakColor,
to search for spacers, layout breaks and the + or - sign of irregular
measures. (2) MT, pure white used for Masking Text. The macro makes it
possible to search for this 'invisble' color on a page or in the score.

For the commands to set a masking text see macrogroups F4 and F9.

ColorNotes plugin: ColorNotes_tpc.qml
https://musescore.org/en/project/colornotestpc

Technical Info
The AHK command PixelSearch searches for a specific color in a defined
area, the 'Canvas Search Area' CSA. It does this on the current screen,
on more pages or in the whole score. The search goes from left to right
row by row. That means if there is more than one matching pixel the
highest will be found. In some search situations this favors Continuous
View. When the color is found the mouse clicks the element. The color
of notes - headtype quarter note - is found even at small zoomfactors.
Text is easier found when bold. Smaller or thinner elements like the
+ or - sign are only found at higher zoomfactors.

Info InputBox Z + C commands	  		??
Info Hotkey commands				[ + C
)
    Return
}

If (ApplyColor = "??")
{
MsgBox, 4096, F1:  Apply Colors:  Z + C → ??      Shortcuts,
(
Colorgroup #1	4 voice colors		V1, V2, V3, V4
Colorgroup #2	8 colors in 4 pairs		1-2  3-4  5-6  7-8
Colorgroup #3	7 'tone colors'		A, B, C, D, E, F, G
Colorgroup #4	7 BWC 'tone colors'	AB, BB, CB, DB, EB, FB, GB
Specials: LBC, LayoutBreakColor  and MT, pure white Masking Text

In InputBox enter:

SET COLOR SINGLE ELEMENT
Enter colorname		V1, V2, V3, V4, 1, 2, 3, 4, 5, 6, 7, 8, LBC, MT
			A, B, C, D, E, F, G, AB, BB, CB, DB, EB, FB, GB

SET COLOR RANGE
Color Noteheads		Same as above	colorname only
Color all similar *		Enter   !		before the colorname
Color same subtype	Enter   =		before the colorname

* E.g. beams, stems, articulations

SEARCH COLOR ON SCREEN
Search color		Enter   [ ]		before the colorname

Search the whole color family - reset possible
A, B, C, D, E, F, G		[ ]ABC
BWC colors		[ ]BWC
1.....8			[ ]123

SEARCH COLOR IN SCORE - reset possible
Search score		Enter  / \		before the colorname
Stop Score Search		Z + Pause

COLORED RANGE with color pairs 12 - 34 - 56 - 78

			Selection		Reset
In InputBox		Enter		Enter
Range 1			12		R12
Range 2			34		R34
Range 3			56		R56
Range 4			78		R78

Info General					?
Info Hotkey commands				[ + C
)
    Return
}

If (NothingSelected = "1")
Goto, SearchColorNothingSelected		; skip 'Set Color' when nothing is selected

If Instr(ApplyColor, "=")			; if there is an = sign in the command
{
    MsgBox, 4404, Color all elements of the same subtype,
(
With this command you can color all elements
of the same subtype in a range.

Position the mousepointer on the right element.

Continue?
)
    IfMsgBox, No
        Return
    Click, right
    Sleep, 50
    Loop, 6
    {
        Send {down}
        Sleep, 50
    }
    Sleep, 100					; important!
    Send {right}
    Sleep, 200					; increase sleeptime if needed
    Send {up}					; shortest way
    Sleep, 50
    Send {Enter}				; opens Window Select with more options
    Sleep, 200					; increase sleeptime if needed
    CoordMode, Mouse, Window
    Click, %WS_01_X%, %WS_01_Y%			; (WS_01) Window Select same subtype
    Sleep, 50
    Click, %WS_03_X%, %WS_03_Y%			; (WS_03) Window Select in selection
    Sleep, 50
    Send {Enter}				; OK
    Sleep, 100
    Goto, SkipSelectNoteheads
}

If Instr(ApplyColor, "!")			; if there is an exclamation mark in the command
{
    MsgBox, 4404, Color alle similar elements but notes and rests,
(
With this command you can color all similar elements
in a range except notes and rests.

Position the mousepointer on the right element.

Continue?
)
    IfMsgBox, No
        Return
    Click, right				; contextual menu
    Sleep, 150					; additional sleeptime increases stability
    Loop, 6
    {
        Send {down}				; 6 x down for all elements but notes and rests
        Sleep, 50
    }
    Sleep, 100					; important!
    Send {right}
    Sleep, 350					; increase sleeptime if needed
    Send {down}
    Sleep, 100
    Send {down}
    Sleep, 100
    Send {Enter}				; OK
    Sleep, 100
    Goto, SkipSelectNoteheads
}

; next 2 lines: the commands will select ranges 1-2,3-4,5-6,7-8 so it must skip selecting all noteheads in a range
; this makes it possible to jump from one selection to another e.g. from 1-2 to 7-8

If (ApplyColor = "12") || (ApplyColor = "34") || (ApplyColor = "56") || (ApplyColor = "78")
Goto, SkipSelectNoteheads

If (ColorRangeSelection = 1)			; select all noteheads in a range
{
    MsgBox, 4404, Color Range,
(
This command colors
the noteheads in a range.
The mousepointer must be
positioned on one of its notes.
If not, do it now!

Continue?
)
    IfMsgBox, No
        Return
    Click, right
    Sleep, 50
    Loop, 4
    {
        Send {up}    			; executing each line adds 30 ms of sleep
        Sleep, 50
    }
    Send {right}
    Sleep, 50
    Send {down 2}
    Sleep, 50
    Send {Enter}			; all similar elements in the range
    Sleep, 200			        ; increase sleeptime if needed
}

SkipSelectNoteheads:

; ♣======================================== SET COLORS ============================================

If ApplyColor in 1,2,3,4,5,6,7,8,a,b,c,d,e,f,g,ab,bb,cb,db,eb,fb,gb,lbc,mt
,=1,=2,=3,=4,=5,=6,=7,=8,=a,=b,=c,=d,=e,=f,=g,=ab,=bb,=cb,=db,=eb,=fb,=gb,=lbc,=mt
,!1,!2,!3,!4,!5,!6,!7,!8,!a,!b,!c,!d,!e,!f,!g,!ab,!bb,!cb,!db,!eb,!fb,!gb,!lbc,!mt
,v1,v2,v3,v4,=v1,=v2,=v3,=v4,!v1,!v2,!v3,!v4
{
    Gosub, PickColor				; see subroutine at end of script
; #ffffff is pure white, usually for masking text
; Commands to set masking text in the macrogroups F4 and F9
    If (ApplyColor = "mt") ||	(ApplyColor = "=mt") || (ApplyColor = "!mt")	; pure white
        Send {Raw}#ffffff							; AHK 0xffffff
    If (ApplyColor = "v1") || (ApplyColor = "=v1") || (ApplyColor = "!v1")	; voice 1(*change*?)
        Send {Raw}#0065bf							; AHK 0x0065bf	Strong blue
    If (ApplyColor = "v2") || (ApplyColor = "=v2") || (ApplyColor = "!v2")	; voice 2(*change*?)
        Send {Raw}#007f00							; AHK 0x007f00	Dark lime green
    If (ApplyColor = "v3") || (ApplyColor = "=v3") || (ApplyColor = "!v3")	; voice 3(*change*?)
        Send {Raw}#c53f00							; AHK 0xc53f00	Strong orange
    If (ApplyColor = "v4") || (ApplyColor = "=v4") || (ApplyColor = "!v4")	; voice 4(*change*?)
        Send {Raw}#c31989							; AHK 0xc31989	 Strong pink
    If (ApplyColor = "1") || (ApplyColor = "=1") || (ApplyColor = "!1")		; colorpair 1-2 left
        Send {Raw}#ff00ff							; set left color Magenta
    If (ApplyColor = "2") || (ApplyColor = "=2") || (ApplyColor = "!2")		; colorpair 1-2 right
        Send {Raw}#00ff00							; set right color Lime
    If (ApplyColor = "3") || (ApplyColor = "=3") || (ApplyColor = "!3")		; colorpair 3-4 left
        Send {Raw}#0000ff							; set left color Blue
    If (ApplyColor = "4") || (ApplyColor = "=4") || (ApplyColor = "!4")		; colorpair 3-4 right
        Send {Raw}#ffaa00							; set right color Orange half tone
    If (ApplyColor = "5") || (ApplyColor = "=5") || (ApplyColor = "!5")		; colorpair 5-6 left
        Send {Raw}#ff0000							; set left color Red
    If (ApplyColor = "6") || (ApplyColor = "=6") || (ApplyColor = "!6")		; colorpair 5-6 right
        Send {Raw}#aaaa00							; set right color Dark yellow
    If (ApplyColor = "7") || (ApplyColor = "=7") || (ApplyColor = "!7")		; colorpair 7-8 left
        Send {Raw}#aa55ff							; set left color Medium purple
    If (ApplyColor = "8") || (ApplyColor = "=8") || (ApplyColor = "!8")		; colorpair 7-8 right
        Send {Raw}#ffaa7f							; set right color Light salmon
    If (ApplyColor = "a") || (ApplyColor = "=a") || (ApplyColor = "!a")		; color note A - see colorscheme end of script
        Send {Raw}#b30fc8							; Electric violet
    If (ApplyColor = "b") || (ApplyColor = "=b") || (ApplyColor = "!b")		; color note B
        Send {Raw}#919cb4							; Grayish blue
    If (ApplyColor = "c") || (ApplyColor = "=c") || (ApplyColor = "!c")		; color note C
        Send {Raw}#00d100							; Strong lime green
    If (ApplyColor = "d") || (ApplyColor = "=d") || (ApplyColor = "!d")		; color note D
        Send {Raw}#ffff00							; Pure (or mostly pure) yellow
    If (ApplyColor = "e") || (ApplyColor = "=e") || (ApplyColor = "!e")		; color note E
        Send {Raw}#006cc8							; Strong blue
    If (ApplyColor = "f") || (ApplyColor = "=f") || (ApplyColor = "!f")		; color note F
        Send {Raw}#fda900							; Pure (or mostly pure) orange
    If (ApplyColor = "g") || (ApplyColor = "=g") || (ApplyColor = "!g")		; color note G
        Send {Raw}#fa1000							; Pure (or mostly pure) red
    If (ApplyColor = "ab") || (ApplyColor = "=ab") || (ApplyColor = "!ab")	; color note A - BWC - see colorscheme end of script
        Send {Raw}#5040a0							; Crail
    If (ApplyColor = "bb") || (ApplyColor = "=bb") || (ApplyColor = "!bb")	; color note B - BWC
        Send {Raw}#d020a0							; Strong pink
    If (ApplyColor = "cb") || (ApplyColor = "=cb") || (ApplyColor = "!cb")	; color note C - BWC
        Send {Raw}#e01040							; Vivid red
    If (ApplyColor = "db") || (ApplyColor = "=db") || (ApplyColor = "!db")	; color note D - BWC
        Send {Raw}#f09010							; Vivid orange
    If (ApplyColor = "eb") || (ApplyColor = "=eb") || (ApplyColor = "!eb")	; color note E - BWC
        Send {Raw}#fcfc00							; Pure (or mostly pure) yellow
    If (ApplyColor = "fb") || (ApplyColor = "=fb") || (ApplyColor = "!fb")	; color note F - BWC
        Send {Raw}#90e040							; Bright green
    If (ApplyColor = "gb") || (ApplyColor = "=gb") || (ApplyColor = "!gb")	; color note G - BWC
        Send {Raw}#00a0a0							; Dark cyan
    If (ApplyColor = "lbc") || (ApplyColor = "=lbc") || (ApplyColor = "!lbc")	; LayoutBreakColor
        Send {Raw}#a0a0a4							; Dark grayish blue

    Sleep, 100
    Send {Enter}
    Sleep, 100						; (*change*?) 
    CoordMode, Mouse, Screen
    If (ColorRangeSelection = 1)
    Click, %StartX%, %StartY%
    If (ColorRangeSelection = 0)
    Click, %ElementX%, %ElementY%
    Return
}

SearchColorNothingSelected:

; ♣============= SEARCH PAGE OR SCORE === RESET COLOR SINGLE NOTE or ELEMENT in Score =============


If ApplyColor in []mt,[]1,[]2,[]3,[]4,[]5,[]6,[]7,[]8,[]a,[]b,[]c,[]d,[]e,[]f,[]g,[]ab,[]bb,[]cb,[]db,[]eb,[]fb,[]gb,[]lbc
,[]v1,[]v2,[]v3,[]v4
,/\mt,/\1,/\2,/\3,/\4,/\5,/\6,/\7,/\8,/\a,/\b,/\c,/\d,/\e,/\f,/\g,/\ab,/\bb,/\cb,/\db,/\eb,/\fb,/\gb,/\lbc
,/\v1,/\v2,/\v3,/\v4

; search score - prefix /\
; search screen - prefix []

{
    ColorX := 1				; assigns default value (prevents warning at Cancel)
    ColorY := 1				; assigns default value (prevents warning at Cancel)
    ScreenNumber := 1			; assigns value (prevents warning)
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen
    Send {Escape}
    Sleep, 200				; long sleep makes finding new color possible when another colored note was selected

    If ApplyColor in /\mt,/\v1,/\v2,/\v3,/\v4,/\1,/\2,/\3,/\4,/\5,/\6,/\7,/\8,/\a,/\b,/\c,/\d,/\e,/\f,/\g,/\ab,/\bb,/\cb,/\db,/\eb,/\fb,/\gb,/\lbc
    {
        InputBox, ScreenNumber, ScreenCount,
(
All elements lower than the mouse position
will be detected if they are not too small.
If there are more elements of the same color
the highest one will be found.

Enter the number of screens to search.
Press OK, position the mouse and click.
To stop the search earlier press Z + Pause
)
, , 300, 250, StartX + 40, StartY - 80, , , # screens to search - Stop earlier: Z+ Pause	;  (*change*?) here the InputBox is positioned near the mouse - size is 300, 250
        If ErrorLevel					; when Cancel is pressed
            Return

        KeyWait, LButton, D
        MouseGetPos, StartX, StartY
        Click, up
        CSA_X1 := 0					; searches from most left to border canvas/inspector
        CSA_Y1 := StartY        			; everything from this height and lower
    }
    BreakColorSearchLoop := 0
    Loop, %ScreenNumber%
    {
        if (BreakColorSearchLoop = 1)
            break

        If (ApplyColor = "[]mt") || (ApplyColor = "/\mt")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffffff, , Fast RGB	; pure white for masking text
; Y2 is on the test screen just above the Palette separator which happens to be also pure white
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, 992, 0xffffff, , Fast RGB	; pure white for masking text
        If (ApplyColor = "[]v1") || (ApplyColor = "/\v1")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1 - Strong blue (*change*?)
        If (ApplyColor = "[]v2") || (ApplyColor = "/\v2")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2 - Dark lime green (*change*?)
        If (ApplyColor = "[]v3") || (ApplyColor = "/\v3")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3 - Strong orange (*change*?)
        If (ApplyColor = "[]v4") || (ApplyColor = "/\v4")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4 - Strong pink (*change*?)
        If (ApplyColor = "[]1") || (ApplyColor = "/\1")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB	; 1 - Magenta
        If (ApplyColor = "[]2") || (ApplyColor = "/\2")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB	; 2 - Lime
        If (ApplyColor = "[]3") || (ApplyColor = "/\3")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB	; 3 - Blue
        If (ApplyColor = "[]4") || (ApplyColor = "/\4")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa00, , Fast RGB	; 4 - Orange half tone
        If (ApplyColor = "[]5") || (ApplyColor = "/\5")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB	; 5 - Red
        If (ApplyColor = "[]6") || (ApplyColor = "/\6")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaaaa00, , Fast RGB	; 6 - Dark yellow
        If (ApplyColor = "[]7") || (ApplyColor = "/\7")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB	; 7 - Medium purple
        If (ApplyColor = "[]8") || (ApplyColor = "/\8")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB	; 8 - Light salmon
        If (ApplyColor = "[]a") || (ApplyColor = "/\a")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xb30fc8, , Fast RGB	; A Electric violet
        If (ApplyColor = "[]b") || (ApplyColor = "/\b")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x919cb4, , Fast RGB	; B Grayish blue
        If (ApplyColor = "[]c") || (ApplyColor = "/\c")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00d100, , Fast RGB	; C Strong lime green
        If (ApplyColor = "[]d") || (ApplyColor = "/\d")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffff00, , Fast RGB	; D Pure (or mostly pure) yellow
        If (ApplyColor = "[]e") || (ApplyColor = "/\e")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x006cc8, , Fast RGB	; E Strong blue
        If (ApplyColor = "[]f") || (ApplyColor = "/\f")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xfda900, , Fast RGB	; F Pure (or mostly pure) orange
        If (ApplyColor = "[]g") || (ApplyColor = "/\g")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xfa1000, , Fast RGB	; G Pure (or mostly pure) red
        If (ApplyColor = "[]ab")|| (ApplyColor = "/\ab")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x5040a0, , Fast RGB	; A Crail - BWC
        If (ApplyColor = "[]bb")|| (ApplyColor = "/\bb")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xd020a0, , Fast RGB	; B Strong pink - BWC
        If (ApplyColor = "[]cb") || (ApplyColor = "/\cb")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xe01040, , Fast RGB	; C Vivid red - BWC
        If (ApplyColor = "[]db") || (ApplyColor = "/\db")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xf09010, , Fast RGB	; D Vivid orange - BWC
        If (ApplyColor = "[]eb") || (ApplyColor = "/\eb")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xfcfc00, , Fast RGB	; E Pure (or mostly pure) yellow - BWC
        If (ApplyColor = "[]fb") || (ApplyColor = "/\fb")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x90e040, , Fast RGB	; F Bright green - BWC
        If (ApplyColor = "[]gb") || (ApplyColor = "/\gb")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00a0a0, , Fast RGB	; G Dark cyan - BWC
        If (ApplyColor = "[]lbc") || (ApplyColor = "/\lbc")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorLBC, , Fast RGB	; Dark grayish blue. - LayoutBreakColor (*change*?)
        If ApplyColor in []mt,[]v1,[]v2,[]v3,[]v4,[]1,[]2,[]3,[]4,[]5,[]6,[]7,[]8,[]a,[]b,[]c,[]d,[]e,[]f,[]g,[]ab,[]bb,[]cb,[]db,[]eb,[]fb,[]gb,[]lbc
        {
        If (ErrorLevel = 1)
            {
                MsgBox, 4112, Search Color on screen, Color not found.
                    Break
            }
        If (ErrorLevel = 0)
            {
                SplashImage, MuseScore_logo.jpg, b zw-1 zh25, , , SearchResult
                WinMove, SearchResult, , ColorX, ColorY
                Sleep, 600
                SplashImage, Off
                Click, %ColorX%, %ColorY%			; click note of searched color or layoutbreakcolor
                Break
            }
        }
        If ApplyColor in /\mt,/\v1,/\v2,/\v3,/\v4,/\1,/\2,/\3,/\4,/\5,/\6,/\7,/\8,/\a,/\b,/\c,/\d,/\e,/\f,/\g,/\ab,/\bb,/\cb,/\db,/\eb,/\fb,/\gb,/\lbc
        {
            if (ErrorLevel = 1)
            {
                Send {PgDn}
                Sleep, 100
                Continue
            }
            if (ErrorLevel = 0)
            {
;                MsgBox, 4160, Score Search, Color found	; for testing
                Click, %ColorX%, %ColorY%
                SplashImage, MuseScore_logo.jpg, b zw-1 zh25, , , SearchResult
                WinMove, SearchResult, , ColorX, ColorY
                Sleep, 1000
                SplashImage, Off
                MsgBox, 4388, Search Color, Reset Color?
                IfMsgBox, Yes
                {
                    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
                    If (Errorlevel = 0)
                    {
                        Click, %IN_013_X%, %IN_013_Y%	; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
                        Sleep, 50
                    }
                    If (Errorlevel = 1)
                    {

; if selection got lost in the process:

                        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
                        If (Errorlevel = 0)
                        {
                            MsgBox, 4112, Reset Color, Selection Failed!`nAutoReset is too risky.`nReset the element manually.
                            Return
                        }
                        If (Errorlevel = 1)
                        {
                            Gosub, PickColor			; see subroutine at end of script
                            Send {Raw}#000000			; black
                            Sleep, 50
                            Send {Enter}
                            CoordMode, Mouse, Screen
                        }
                    }
                }
                IfMsgBox, No
                    Break
            }
        }
    }
    If ApplyColor in []mt,[]v1,[]v2,[]v3,[]v4,[]1,[]2,[]3,[]4,[]5,[]6,[]7,[]8,[]a,[]b,[]c,[]d,[]e,[]f,[]g,[]ab,[]bb,[]cb,[]db,[]eb,[]fb,[]gb,[]lbc
        Return
    If ApplyColor in /\mt,/\v1,/\v2,/\v3,/\v4,/\1,/\2,/\3,/\4,/\5,/\6,/\7,/\8,/\a,/\b,/\c,/\d,/\e,/\f,/\g,/\ab,/\bb,/\cb,/\db,/\eb,/\fb,/\gb,/\lbc
    {
        Click, %ColorX%, %ColorY%			; click note of searched color or layoutbreakcolor
        Return
    }
}

; ♣===================== SEARCH 1,2,3,4,5,6,7,8 == ON SCREEN ===  optional RESET ==================

If (ApplyColor = "[]123")		; Search colors 1,2,3,4,5,6,7,8 on screen
{
    ColorX := 1				; assigns default value (prevents warning at Cancel)
    ColorY := 1				; assigns default value (prevents warning at Cancel)
    Send {Escape}
    Sleep, 50
    Loop,
    {
;        InputBox, ApplyLoopColor, Search Colors, , , W_IB, H_IB, StartX , StartY - 80, , , Enter A,B,C,D,E,F or G	;  (*change*?) here the InputBox is positioned near the mouse
        InputBox, ApplyLoopColor, Search Screen Colors, , , W_IB, H_IB, IB_X, IB_Y, , , Enter 1, 2, 3, 4, 5, 6, 7 or 8	;  (*change*?) here the InputBox is positioned in the Inspector area
        If ErrorLevel				; when Cancel is pressed
            Break
        Send {Escape}				; makes reselection same color possible
        Sleep, 50
        If (ApplyLoopColor = "1")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB	; 1 - Magenta
        If (ApplyLoopColor = "2")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB	; 2 - Lime
        If (ApplyLoopColor = "3")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB	; 3 - Blue
        If (ApplyLoopColor = "4")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa00, , Fast RGB	; 4 - Orange half tone
        If (ApplyLoopColor = "5")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB	; 5 - Red
        If (ApplyLoopColor = "6")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaaaa00, , Fast RGB	; 6 - Dark yellow
        If (ApplyLoopColor = "7")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB	; 7 - Medium purple
        If (ApplyLoopColor = "8")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB	; 8 - Light salmon

        If (Errorlevel = 0)
        {
            Click, %ColorX%, %ColorY%
            SplashImage, MuseScore_logo.jpg, b zw-1 zh25, , , SearchResult
            WinMove, SearchResult, , ColorX, ColorY
            Sleep, 500
            SplashImage, Off

            If (ApplyLoopColor = "1")
                MsgBox, 4388, Search Color 1, Color 1 found.`nReset Color?
            If (ApplyLoopColor = "2")
                MsgBox, 4388, Search Color 2, Color 2 found.`nReset Color?
            If (ApplyLoopColor = "3")
                MsgBox, 4388, Search Color 3, Color 3 found.`nReset Color?
            If (ApplyLoopColor = "4")
                MsgBox, 4388, Search Color 4, Color 4 found.`nReset Color?
            If (ApplyLoopColor = "5")
                MsgBox, 4388, Search Color 5, Color 5 found.`nReset Color?
            If (ApplyLoopColor = "6")
                MsgBox, 4388, Search Color 6, Color 6 found.`nReset Color?
            If (ApplyLoopColor = "7")
                MsgBox, 4388, Search Color 7, Color 7 found.`nReset Color?
            If (ApplyLoopColor = "8")
                MsgBox, 4388, Search Color 8, Color 8 found.`nReset Color?

            IfMsgBox, Yes
            {
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
                If (Errorlevel = 1)
                {
                    Gosub, PickColor			; see subroutine at end of script
                    Send {Raw}#000000			; black
                    Sleep, 50
                    Send {Enter}
                    CoordMode, Mouse, Screen
                    Continue
                }
                If (Errorlevel = 0)
                    Goto, ResetColor12345678
            }
            IfMsgBox, No
                Continue
        }
        If (Errorlevel = 1)
        {
            If (ApplyLoopColor = "1")
                MsgBox, 4164, Search Color 1, Color 1 not found.`nContinue?
            If (ApplyLoopColor = "2")
                MsgBox, 4164, Search Color 2, Color 2 not found.`nContinue?
            If (ApplyLoopColor = "3")
                MsgBox, 4164, Search Color 3, Color 3 not found.`nContinue?
            If (ApplyLoopColor = "4")
                MsgBox, 4164, Search Color 4, Color 4 not found.`nContinue?
            If (ApplyLoopColor = "5")
                MsgBox, 4164, Search Color 5, Color 5 not found.`nContinue?
            If (ApplyLoopColor = "6")
                MsgBox, 4164, Search Color 6, Color 6 not found.`nContinue?
            If (ApplyLoopColor = "7")
                MsgBox, 4164, Search Color 7, Color 7 not found.`nContinue?
            If (ApplyLoopColor = "8")
                MsgBox, 4164, Search Color 8, Color 8 not found.`nContinue?

            IfMsgBox, No
                Break
            IfMsgBox, Yes
                Continue
        }
        ResetColor12345678:
        Click, %IN_013_X%, %IN_013_Y%	; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
        Sleep, 50
        Click, %ColorX%, %ColorY%
        Sleep, 50
        Continue
    }
    Click, %ColorX%, %ColorY%
    Return
}

; ♣===================== SEARCH A,B,C,D,E,F,G == ON SCREEN == optional RESET ======================

If (ApplyColor = "[]abc")		; Search colors of abcdefg on screen
{
    ColorX := 1				; assigns default value (prevents warning at Cancel)
    ColorY := 1				; assigns default value (prevents warning at Cancel)
    Send {Escape}
    Sleep, 50
    Loop
    {
;        InputBox, ApplyLoopColor, Search Screen Colors, , , W_IB, H_IB, StartX , StartY - 80, , , Enter A,B,C,D,E,F or G	;  (*change*?) here the InputBox is positioned near the mouse
        InputBox, ApplyLoopColor, Search Screen Colors, , , W_IB, H_IB, IB_X, IB_Y, , , Enter A, B, C, D, E, F or G		;  (*change*?) here the InputBox is positioned in the Inspector
        If ErrorLevel				; when Cancel is pressed
            Break
        Send {Escape}				; makes reselection same color possible
        Sleep, 50
        If (ApplyLoopColor = "a")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xb30fc8, , Fast RGB	; A Electric violet
        If (ApplyLoopColor = "b")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x919cb4, , Fast RGB	; B Grayish blue
        If (ApplyLoopColor = "c")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00d100, , Fast RGB	; C Strong lime green
        If (ApplyLoopColor = "d")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffff00, , Fast RGB	; D Pure (or mostly pure) yellow
        If (ApplyLoopColor = "e")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x006cc8, , Fast RGB	; E Strong blue
        If (ApplyLoopColor = "f")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xfda900, , Fast RGB	; F Pure (or mostly pure) orange
        If (ApplyLoopColor = "g")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xfa1000, , Fast RGB	; G Pure (or mostly pure) red
        If (Errorlevel = 0)
        {
            Click, %ColorX%, %ColorY%
            SplashImage, MuseScore_logo.jpg, b zw-1 zh25, , , SearchResult
            WinMove, SearchResult, , ColorX, ColorY
            Sleep, 500
            SplashImage, Off

            If (ApplyLoopColor = "a")
                MsgBox, 4388, Search Color A, Color A found.`nReset Color?
            If (ApplyLoopColor = "b")
                MsgBox, 4388, Search Color B, Color B found.`nReset Color?
            If (ApplyLoopColor = "c")
                MsgBox, 4388, Search Color C, Color C found.`nReset Color?
            If (ApplyLoopColor = "d")
                MsgBox, 4388, Search Color D, Color D found.`nReset Color?
            If (ApplyLoopColor = "e")
                MsgBox, 4388, Search Color E, Color E found.`nReset Color?
            If (ApplyLoopColor = "f")
                MsgBox, 4388, Search Color F, Color F found.`nReset Color?
            If (ApplyLoopColor = "g")
                MsgBox, 4388, Search Color G, Color G found.`nReset Color?
            IfMsgBox, Yes
            {
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
                If (Errorlevel = 1)
                {
                    Gosub, PickColor			; see subroutine at end of script
                    Send {Raw}#000000			; black
                    Sleep, 50
                    Send {Enter}
                    CoordMode, Mouse, Screen
                    Continue
                }
                If (Errorlevel = 0)
                Goto, ResetColorABCDEFG
            }
            IfMsgBox, No
            Continue
        }
        If (Errorlevel = 1)
        {
            If (ApplyLoopColor = "a")
                MsgBox, 4164, Search Color A, Color A not found.`nContinue?
            If (ApplyLoopColor = "b")
                MsgBox, 4164, Search Color B, Color B not found.`nContinue?
            If (ApplyLoopColor = "c")
                MsgBox, 4164, Search Color C, Color C not found.`nContinue?
            If (ApplyLoopColor = "d")
                MsgBox, 4164, Search Color D, Color D not found.`nContinue?
            If (ApplyLoopColor = "e")
                MsgBox, 4164, Search Color E, Color E not found.`nContinue?
            If (ApplyLoopColor = "f")
                MsgBox, 4164, Search Color F, Color F not found.`nContinue?
            If (ApplyLoopColor = "g")
                MsgBox, 4164, Search Color G, Color G not found.`nContinue?
                IfMsgBox, No
                    Break
                IfMsgBox, Yes
                    Continue
        }
        ResetColorABCDEFG:
        Click, %IN_013_X%, %IN_013_Y%	; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
        Sleep, 50
        Click, %ColorX%, %ColorY%
        Sleep, 50
        Continue
    }
    Click, %ColorX%, %ColorY%
    Return
}

; ====== BOOMWHACKERS CONVENTION == SEARCH A,B,C,D,E,F,G of BWC on SCREEN == optional Reset========

If (ApplyColor = "[]bwc")		; Search colors of BWC abcdefg on screen
{
    ColorX := 1				; assigns default value (prevents warning at Cancel)
    ColorY := 1				; assigns default value (prevents warning at Cancel)
    Send {Escape}
    Sleep, 50
    Loop,
    {
;        InputBox, ApplyLoopColor, Search BWC Colors on Screen, , , W_IB, H_IB, StartX, StartY - 80, , , Enter A,B,C,D,E,F or G	;  (*change*?) here the InputBox is positioned near the mouse
        InputBox, ApplyLoopColor, Search BWC Colors on Screen, , , W_IB, H_IB, IB_X, IB_Y, , , Enter A, B, C, D, E, F or G		;  (*change*?) here the InputBox is positioned near the mouse
        If ErrorLevel				; when Cancel is pressed
            Break
        Send {Escape}				; makes reselection same color possible
        Sleep, 50
        If (ApplyLoopColor = "a")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x5040a0, , Fast RGB	; A Crail - BWC
        If (ApplyLoopColor = "b")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xd020a0, , Fast RGB	; B Strong pink - BWC
        If (ApplyLoopColor = "c")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xe01040, , Fast RGB	; C Vivid red - BWC
        If (ApplyLoopColor = "d")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xf09010, , Fast RGB	; D Vivid orange - BWC
        If (ApplyLoopColor = "e")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xfcfc00, , Fast RGB	; E Pure (or mostly pure) yellow - BWC
        If (ApplyLoopColor = "f")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x90e040, , Fast RGB	; F Bright green - BWC
        If (ApplyLoopColor = "g")
            PixelSearch, ColorX, ColorY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00a0a0, , Fast RGB	; G Dark cyan - BWC
        If (Errorlevel = 0)
        {
            Click, %ColorX%, %ColorY%
            SplashImage, MuseScore_logo.jpg, b zw-1 zh25, , , SearchResult
            WinMove, SearchResult, , ColorX, ColorY
            Sleep, 500
            SplashImage, Off

            If (ApplyLoopColor = "a")
                MsgBox, 4420, Search BWC-Color A, Color A found.`nReset Color?
            If (ApplyLoopColor = "b")
                MsgBox, 4420, Search BWC-Color B, Color B found.`nReset Color?
            If (ApplyLoopColor = "c")
                MsgBox, 4420, Search BWC-Color C, Color C found.`nReset Color?
            If (ApplyLoopColor = "d")
                MsgBox, 4420, Search BWC-Color D, Color D found.`nReset Color?
            If (ApplyLoopColor = "e")
                MsgBox, 4420, Search BWC-Color E, Color E found.`nReset Color?
            If (ApplyLoopColor = "f")
                MsgBox, 4420, Search BWC-Color F, Color F found.`nReset Color?
            If (ApplyLoopColor = "g")
                MsgBox, 4420, Search BWC-Color G, Color G found.`nReset Color?

            IfMsgBox, Yes
            {
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
                If (Errorlevel = 1)
                {
                    Gosub, PickColor			; see subroutine at end of script
                    Send {Raw}#000000			; black
                    Sleep, 50
                    Send {Enter}
                    CoordMode, Mouse, Screen
                    Continue
                }
                If (Errorlevel = 0)
                Goto, ResetBWCColorABCDEFG
           }
            IfMsgBox, No
            Continue
        }
        If (Errorlevel = 1)
        {
            If (ApplyLoopColor = "a")
                MsgBox, 4164, Search BWC-Color A, Color A not found.`nContinue?
            If (ApplyLoopColor = "b")
                MsgBox, 4164, Search BWC-Color B, Color B not found.`nContinue?
            If (ApplyLoopColor = "c")
                MsgBox, 4164, Search BWC-Color C, Color C not found.`nContinue?
            If (ApplyLoopColor = "d")
                MsgBox, 4164, Search BWC-Color D, Color D not found.`nContinue?
            If (ApplyLoopColor = "e")
                MsgBox, 4164, Search BWC-Color E, Color E not found.`nContinue?
            If (ApplyLoopColor = "f")
                MsgBox, 4164, Search BWC-Color F, Color F not found.`nContinue?
            If (ApplyLoopColor = "g")
                MsgBox, 4164, Search BWC-Color G, Color G not found.`nContinue?
            IfMsgBox, No
                Break
            IfMsgBox, Yes
                Continue
        }
        ResetBWCColorABCDEFG:
        Click, %IN_013_X%, %IN_013_Y%	; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
        Sleep, 50
        Click, %ColorX%, %ColorY%
        Sleep, 50
        Continue
    }
    Click, %ColorX%, %ColorY%
    Return
}

; ♣======================== SELECT RANGE BETWEEN PAIRS== RESET RANGE COLORS =======================

If ApplyColor in 12,34,56,78,r12,r34,r56,r78
{
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen
    Send {Escape}
    Sleep, 100
    If (ApplyColor = "r12") || (ApplyColor = "12")
        PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
    If (ApplyColor = "r34") || (ApplyColor = "34")
        PixelSearch, BlueX, BlueY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB
    If (ApplyColor = "r56") || (ApplyColor = "56")
        PixelSearch, RedX, RedY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB
    If (ApplyColor = "r78") || (ApplyColor = "78")
        PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
    if ErrorLevel
    {
        If (ApplyColor = "r12") || (ApplyColor = "12")
            MsgBox, 4112, Searching left note of pair 1-2, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        If (ApplyColor = "r34") || (ApplyColor = "34")
            MsgBox, 4112, Searching left note of pair 3-4, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        If (ApplyColor = "r56") || (ApplyColor = "56")
            MsgBox, 4112, Searching left note of pair 5-6, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        If (ApplyColor = "r78") || (ApplyColor = "78")
            MsgBox, 4112, Searching left note of pair 7-8, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        Return
    }
    else
    {
        If (ApplyColor = "r12") || (ApplyColor = "12")
            Send {Click %MagentaX%, %MagentaY%}
        If (ApplyColor = "r34") || (ApplyColor = "34")
            Send {Click %BlueX%, %BlueY%}
        If (ApplyColor = "r56") || (ApplyColor = "56")
            Send {Click %RedX%, %RedY%}
        If (ApplyColor = "r78") || (ApplyColor = "78")
            Send {Click %MediumPurpleX%, %MediumPurpleY%}
    }
    Sleep, 50
    If (ApplyColor = "r12") || (ApplyColor = "12")
        PixelSearch, LimeX, LimeY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB
    If (ApplyColor = "r34") || (ApplyColor = "34")
        PixelSearch, OrangeX, OrangeY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa00, , Fast RGB
    If (ApplyColor = "r56") || (ApplyColor = "56")
        PixelSearch, DarkYellowX, DarkYellowY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaaaa00, , Fast RGB
    If (ApplyColor = "r78") || (ApplyColor = "78")
        PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB
    if ErrorLevel
    {
        If (ApplyColor = "r12") || (ApplyColor = "12")
            MsgBox, 4112, Searching right note of pair 1-2, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        If (ApplyColor = "r34") || (ApplyColor = "34")
            MsgBox, 4112, Searching right note of pair 3-4, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        If (ApplyColor = "r56") || (ApplyColor = "56")
            MsgBox, 4112, Searching right note of pair 5-6, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        If (ApplyColor = "r78") || (ApplyColor = "78")
            MsgBox, 4112, Searching right note of pair 7-8, The color was not found.`nMaybe the note is off screen.`nOr try a higher zoom factor.
        Return
    }
    else
    {
        If (ApplyColor = "r12") || (ApplyColor = "12")
            Send +{Click %LimeX%, %LimeY%}			; selects the range
        If (ApplyColor = "r34") || (ApplyColor = "34")
            Send +{Click %OrangeX%, %OrangeY%}			; selects the range
        If (ApplyColor = "r56") || (ApplyColor = "56")
            Send +{Click %DarkYellowX%, %DarkYellowY%}		; selects the range
        If (ApplyColor = "r78") || (ApplyColor = "78")
            Send +{Click %LightSalmonX%, %LightSalmonY%}	; selects the range
    }
    If ApplyColor in 12,34,56,78
        Return
    If ApplyColor in r12,r34,r56,r78
    {
        Sleep, 100
        Click, %IN_002_X%, %IN_002_Y%				; I(002) rectangular Set Color = Reset Color - ELEMENT GROUP
        Sleep, 50
        If (ApplyColor = "r12")
            Click, %MagentaX%, %MagentaY%
        If (ApplyColor = "r34")
            Click, %OrangeX%, %OrangeY%
        If (ApplyColor = "r56")
            Click, %RedX%, %RedY%
        If (ApplyColor = "r78")
            Click, %LightSalmonX%, %LightSalmonY%
        Return
    }
}
Return

; ♣====================== COLORED RANGE ===== SELECTION PAIR 1/2/3/4 ==============================
; of course the selection will only succeed if the whole range is visible on the screen
; colorsearch of notes works fine also in small zoom factors

~y & f1::				; set left color (1) magenta 0xff00ff
~l & [::				; idem
SetColor_F1 := "LeftPair_1"
Goto, PickColor_F1
~y & f2::				; set right color (1) lime 0x00ff00
~l & ]::				; idem
SetColor_F1 := "RightPair_1"
Goto, PickColor_F1
~y & f3::				; set left color (2) blue 0x0000ff
~k & [::				; idem
SetColor_F1 := "LeftPair_2"
Goto, PickColor_F1
~y & f4::				; set right color (2) orange half tone 0xffaa00
~k & ]::				; idem
SetColor_F1 := "RightPair_2"
Goto, PickColor_F1
~y & f5::				; set left color (3) red 0xff0000
~j & [::				; idem
SetColor_F1 := "LeftPair_3"
Goto, PickColor_F1
~y & f6::				; set right color (3) dark yellow 0xaaaa00
~j & ]::				; idem
SetColor_F1 := "RightPair_3"
Goto, PickColor_F1
~y & f7::				; set left color  (4) medium purple 0xaa55ff
~h & [::				; idem
SetColor_F1 := "LeftPair_4"
Goto, PickColor_F1
~y & f8::				; set right color  (4) light salmon 0xffaa7f
~h & ]::				; idem
SetColor_F1 := "RightPair_4"
Goto, PickColor_F1

PickColor_F1:
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
Gosub, InspectorCheck			; see subroutine at end of script	
Gosub, PickColor			; see subroutine at end of script
If (SetColor_F1 = "LeftPair_1")
    Send {Raw}#ff00ff			; select left color (1) magenta 
If (SetColor_F1 = "RightPair_1")
    Send {Raw}#00ff00			; select right color (1) lime
If (SetColor_F1 = "LeftPair_2")
    Send {Raw}#0000ff			; select left color (2) blue
If (SetColor_F1 = "RightPair_2")
    Send {Raw}#ffaa00			; select right color (2) orange half tone
If (SetColor_F1 = "LeftPair_3")
    Send {Raw}#ff0000			; select left color (3) red
If (SetColor_F1 = "RightPair_3")
    Send {Raw}#aaaa00			; select right color (3) dark yellow
If (SetColor_F1 = "LeftPair_4")
    Send {Raw}#aa55ff			; select left color (4) medium purple
If (SetColor_F1 = "RightPair_4")
    Send {Raw}#ffaa7f			; select right color (4) light salmon
Sleep, 50
Send {Enter}
CoordMode, Mouse, Screen
MouseMove, StartX, StartY
Return

; ♣================ COLORED RANGE ===== MOUSE TO LEFT/RIGHT OF PAIR 1/2/3/4 =======================

~y & 1::				; go to left color (1) magenta 0xff00ff
~l & LButton::				; idem
MoveToColorF1 := "LeftPair_1"
Goto, TravelToColor
~y & 2::				; go to right color (1) lime 0x00ff00
~l & RButton::				; idem
MoveToColorF1 := "RightPair_1"
Goto, TravelToColor
~y & 3::				; go to left color (2) blue 0x0000ff
~k & LButton::				; idem
MoveToColorF1 := "LeftPair_2"
Goto, TravelToColor
~y & 4::				; go to right color (2) orange half tone 0xffaa00
~k & RButton::				; idem
MoveToColorF1 := "RightPair_2"
Goto, TravelToColor
~y & 5::				; go to left color (3) red 0xff0000
~j & LButton::				; idem
MoveToColorF1 := "LeftPair_3"
Goto, TravelToColor
~y & 6::				; go to right color (3) dark yellow 0xaaaa00
~j & RButton::				; idem
MoveToColorF1 := "RightPair_3"
Goto, TravelToColor
~y & 7::				; go to left color  (4) medium purple 0xaa55ff
~h & LButton::				; idem
MoveToColorF1 := "LeftPair_4"
Goto, TravelToColor
~y & 8::				; go to right color  (4) light salmon 0xffaa7f
~h & RButton::				; idem
MoveToColorF1 := "RightPair_4"
Goto, TravelToColor

TravelToColor:
Send {Escape}
Sleep, 100
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

If (MoveToColorF1 = "LeftPair_1")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
If (MoveToColorF1 = "RightPair_1")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB
If (MoveToColorF1 = "LeftPair_2")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB
If (MoveToColorF1 = "RightPair_2")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa00, , Fast RGB
If (MoveToColorF1 = "LeftPair_3")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB
If (MoveToColorF1 = "RightPair_3")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaaaa00, , Fast RGB
If (MoveToColorF1 = "LeftPair_4")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
If (MoveToColorF1 = "RightPair_4")
    PixelSearch, X, Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB

if ErrorLevel
{
    If (MoveToColorF1 = "LeftPair_1")
        MsgBox, 4112, In search of left element [Pair 1], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "RightPair_1")
        MsgBox, 4112, In search of right element [Pair 1], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "LeftPair_2")
        MsgBox, 4112, In search of left element [Pair 2], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "RightPair_2")
        MsgBox, 4112, In search of right element [Pair 2], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "LeftPair_3")
        MsgBox, 4112, In search of left element [Pair 3], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "RightPair_3")
        MsgBox, 4112, In search of right element [Pair 3], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "LeftPair_4")
        MsgBox, 4112, In search of left element [Pair 4], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (MoveToColorF1 = "RightPair_4")
        MsgBox, 4112, In search of right element [Pair 4], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    Return
}
else
{
    MouseMove, X, Y+=2
    Click
    Return
}
Return

; ♣===================== COLORED RANGE ===== SELECT/RESET RANGE 1/2/3/4 ===========================

~y & 9::				; select colored range (1) from magenta to lime
~l & MButton::				; idem
~l & =::				; idem
SelectColRange := "Pair_1"
ResetColRange := 0
Goto, Select_Reset_Color
~l & -::				; reset colored range (1) from magenta to lime
SelectColRange := "Pair_1"
ResetColRange := 1
Goto, Select_Reset_Color
~y & 0::				; select colored range (2) from blue to orange half tone
~k & MButton::				; idem
~k & =::				; idem
SelectColRange := "Pair_2"
ResetColRange := 0
Goto, Select_Reset_Color
~k & -::				; reset colored range (2) from blue to orange half tone
SelectColRange := "Pair_2"
ResetColRange := 1
Goto, Select_Reset_Color
~y & -::				; select colored range (3) from red to dark yellow
~j & MButton::				; idem
~j & =::				; idem
SelectColRange := "Pair_3"
ResetColRange := 0
Goto, Select_Reset_Color
~j & -::				; reset colored range (3) from red to dark yellow
SelectColRange := "Pair_3"
ResetColRange := 1
Goto, Select_Reset_Color
~y & =::				; select colored range  (4) from medium purple to light salmon
~h & MButton::				; idem
~h & =::				; idem
SelectColRange := "Pair_4"
ResetColRange := 0
Goto, Select_Reset_Color
~h & -::				; reset colored range (4) from medium purple to pure green
SelectColRange := "Pair_4"
ResetColRange := 1
Goto, Select_Reset_Color

Select_Reset_Color:
CoordMode, Mouse, Screen
Send {Escape}
Sleep, 100

If (SelectColRange = "Pair_2")		; the MButton seems to trigger 'shift'
{					; Shift + K opens the Master Palette Key Sigs
    WinClose, Master Palette, , 0.25	; take 250 ms to close (prevent) Master Palette appearing
    WinWaitClose, Master Palette
}

If (SelectColRange = "Pair_1")
    PixelSearch, Left_X, Left_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB	; magenta
If (SelectColRange = "Pair_2")
    PixelSearch, Left_X, Left_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB	; blue
If (SelectColRange = "Pair_3")
    PixelSearch, Left_X, Left_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB	; red
If (SelectColRange = "Pair_4")
    PixelSearch, Left_X, Left_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB	; medium purple
If ErrorLevel
{
    If (SelectColRange = "Pair_1")
        MsgBox, 4112, In search of left element [Pair 1], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (SelectColRange = "Pair_2")
        MsgBox, 4112, In search of left element [Pair 2], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (SelectColRange = "Pair_3")
        MsgBox, 4112, In search of left element [Pair 3], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (SelectColRange = "Pair_4")
        MsgBox, 4112, In search of left element [Pair 4], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    Return
}
else
{
    If (SelectColRange = "Pair_2")
        WinActivate, ahk_exe MuseScore3.exe, , Master Palette	; again to stop the Master Palette appearing
    Send {Click, %Left_X%, %Left_Y%}
    Sleep, 50
}
If (SelectColRange = "Pair_1")
    PixelSearch, Right_X, Right_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB	; lime
If (SelectColRange = "Pair_2")
    PixelSearch, Right_X, Right_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa00, , Fast RGB	; orange half tone
If (SelectColRange = "Pair_3")
    PixelSearch, Right_X, Right_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaaaa00, , Fast RGB	; dark yellow
If (SelectColRange = "Pair_4")
    PixelSearch, Right_X, Right_Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB	; light salmon
If ErrorLevel
{
    If (SelectColRange = "Pair_1")
        MsgBox, 4112, In search of right element [Pair 1], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (SelectColRange = "Pair_2")
        MsgBox, 4112, In search of right element [Pair 2], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (SelectColRange = "Pair_3")
        MsgBox, 4112, In search of right element [Pair 3], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    If (SelectColRange = "Pair_4")
        MsgBox, 4112, In search of right element [Pair 4], The color was not found.`nMaybe the element is off screen.`nOr try a higher zoom factor.
    Return
}
else
{
    Send +{Click %Right_X%, %Right_Y%}
    Sleep, 100
}
If (ResetColRange = 1)
{
    Click, %IN_002_X%, %IN_002_Y%	; I(002) rectangular Set Color = Reset Color - ELEMENT GROUP
    Sleep, 50
}
If (ResetColRange = 0)
    Return
If (ResetColRange = 1)
    Click, %Left_X%, %Left_Y%
Sleep, 50
Return

; ♣===================================== SELECTION FILTER =========================================

; SHORTCUTLIST
; ,a,*,arp,bm,c,cs,d,f,fb,fd,g,gn,h,k1,k2,k3,k4
; ,l,o,ol,ot,pl,s,t,va,1,2,3,4,8,?
; note or rest in voice 1 selected

~z & f::					; selection filter
CueProduction := 0
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Gosub, InspectorCheck				; see subroutine at end of script
Send {Volume_Mute}				; Mute/unmute the master volume
MouseGetPos, StartX, StartY

MediumPurpleX := StartX				; initialisation to prevent warning
MediumPurpleY := StartY				; when PixelSearch (in Cueproduction) fails
LightSalmonX := StartX
LightSalmonY := StartY
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Selection Filter - Element Search, Color not found.`nMaybe there is no element selected.`nOr you could try a higher zoom factor.`nSelect a note or rest and try again.
    Send {Volume_Mute}				; Mute/unmute the master volume
    Return
}
Click, %ElementX%, %ElementY%
Sleep, 50

MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 150
ImageSearch, Tick_X, Tick_Y, SelTick_X1, SelTick_Y1, SelTick_X2, SelTick_Y2, *40 CTS_Checked_ticked_sign.png
If Errorlevel						; if Selection Filter unticked
{
    Send {Escape}
    Sleep, 50
    Send {f6}						; show Selection Filter
    Sleep, 150
}
Send {Escape}
Sleep, 50
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 150
ImageSearch, Tick_X, Tick_Y, PalTick_X1, PalTick_Y1, PalTick_X2, PalTick_Y2, *40 CTS_Checked_ticked_sign.png
If (Errorlevel = 0)					; if Palettes ticked
{
    Send {Escape}
    Sleep, 50
    Send {f9}						; hide Palettes
    Sleep, 150
}
Send {Escape}
Sleep, 50
Click, %ElementX%, %ElementY%
MsgBox, 4163, Selection Filter, Do you want to make a cue?`nNB: Cue material must be in voice 1.
IfMsgBox, Cancel
    Goto, FinishSelectionFilterLoop
IfMsgBox, Yes
    CueProduction := 1
IfMsgBox, No
{
    CueProduction := 0
    MsgBox, 4160, Selection Filter, Select the range.`nPress Z when ready.
    Keywait, z, d
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    If Errorlevel
    {
        MsgBox, 4144, Selection Filter, No range selected!`nSelect a range and try again.`nThe macro will exit.
        Goto, FinishSelectionFilterLoop
    }
}
If (CueProduction = 1)
{
    MsgBox, 4160, Selection Filter, Select first note or rest of the range.`nPress Z when ready.
    Keywait, z, d
    Gosub, PickColor				; see subroutine at end of script
    Send {Raw}#aa55ff				; select color medium purple 0xaa55ff
    Sleep, 50
    Send {Enter}
    Sleep, 200
    CoordMode, Mouse, Screen
    MsgBox, 4160, Selection Filter, Select last note or rest of the range.`nPress Z when ready.
    Keywait, z, d
    Loop
    {
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
        If (Errorlevel = 0)
        {
            MsgBox, 4144, Selection Filter,You made a range selection.`nSelect last note or rest of the range instead.`nPress Z when ready.
            Keywait, z, d
        }
        If (Errorlevel = 1)
            Break
    }
    Gosub, PickColor				; see subroutine at end of script
    Send {Raw}#ffaa7f				; select color light salmon 0xffaa7f
    Sleep, 50
    Send {Enter}
    Sleep, 200
    CoordMode, Mouse, Screen

    PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
    Send {Click %MediumPurpleX%, %MediumPurpleY%}
    Sleep, 150
    PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB
    Send +{Click %LightSalmonX%, %LightSalmonY%}
    Sleep, 150

    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    If Errorlevel
    {
        MsgBox, 4144, Selection Filter, No range selected!`nSelect a range and try again.`nThe macro will exit.
        Goto, FinishSelectionFilterLoop
    }
}
Loop
{
    ; InputBox, Filter, Selection Filter, , , W_IB, H_IB, IB_X, IB_Y, , , Help = ? Keep voice 1 = Enter - 2 = K2 etc.		;  (*change*?)
    InputBox, Filter, Selection Filter, , , W_IB, H_IB, StartX, StartY - 120, , , Help = ? Keep voice 1 = Enter - 2 = K2 etc.	;  (*change*?) here the InputBox is positioned near the mouse
    If ErrorLevel				; when Cancel is pressed
        Break
    If (Filter = "Help = ? Keep voice 1 = Enter - 2 = K2 etc.")
        Filter := "k1"
    If (Filter = "z")
    {
        WinActivate, ahk_exe MuseScore3.exe
        SplashImage, MuseScore_logo_round.jpg, b fm8 wm1000 ctff0000, , Press Z`nwhen ready, Select, Arial
        WinMove, Select, , StartX, StartY - 120		; (*change*?)
        Sleep, 1000					; shows for 1 second
        SplashImage, Off
        Keywait, z, d
        WinActivate, Selection Filter
    }
    If (Filter = "c")
    {
        WinActivate, ahk_exe MuseScore3.exe
        Send ^c
        SplashImage, MuseScore_logo_round.jpg, b fm8 wm1000 ctff0000, , Press Z`nwhen ready, Select, Arial
        WinMove, Press Z, , StartX, StartY - 120	; (*change*?)
        Sleep, 1000					; shows for 1 second
        SplashImage, Off
        MouseMove, StartX, StartY
        KeyWait, z, d
        Send ^v
        Break
    }
    If (Filter = "*")
        Click %SF_NN_X%, %SF_01_Y%			; (SF_01) All
    If (Filter = "1")
        Click %SF_NN_X%, %SF_02_Y%			; (SF_02) Voice 1
    If (Filter = "2")
        Click %SF_NN_X%, %SF_03_Y%			; (SF_03) Voice 2
    If (Filter = "3")
        Click %SF_NN_X%, %SF_04_Y%			; (SF_04) Voice 3
    If (Filter = "4")
        Click %SF_NN_X%, %SF_05_Y%			; (SF_05) Voice 4
    If (Filter = "d")
        Click %SF_NN_X%, %SF_06_Y%			; (SF_06) Dynamics
    If (Filter = "h")
        Click %SF_NN_X%, %SF_07_Y%			; (SF_07) Hairpins
    If (Filter = "f")
        Click %SF_NN_X%, %SF_08_Y%			; (SF_08) Fingering
    If (Filter = "l")
        Click %SF_NN_X%, %SF_09_Y%			; (SF_09) Lyrics
    If (Filter = "cs")
        Click %SF_NN_X%, %SF_10_Y%			; (SF_10) Chord Symbols
    If (Filter = "ot")
        Click %SF_NN_X%, %SF_11_Y%			; (SF_11) Other Text
    If (Filter = "a")
        Click %SF_NN_X%, %SF_12_Y%			; (SF_12) Articulations
    If (Filter = "o")
        Click %SF_NN_X%, %SF_13_Y%			; (SF_13) Ornaments
    If (Filter = "s")
        Click %SF_NN_X%, %SF_14_Y%			; (SF_14) Slurs
    If (Filter = "fb")
        Click %SF_NN_X%, %SF_15_Y%			; (SF_15) Figured Bass
    If (Filter = "va") || (Filter = "8")
        Click %SF_NN_X%, %SF_16_Y%			; (SF_16) Ottavas
    If (Filter = "pl")
        Click %SF_NN_X%, %SF_17_Y%			; (SF_017 Pedal Lines
    If (Filter = "ol")
        Click %SF_NN_X%, %SF_18_Y%			; (SF_18) Other Lines
    If (Filter = "arp")
        Click %SF_NN_X%, %SF_19_Y%			; (SF_19)  Arpeggios
    If (Filter = "g")
        Click %SF_NN_X%, %SF_20_Y%			; (SF_20) Glissandi
    If (Filter = "fd")
        Click %SF_NN_X%, %SF_21_Y%			; (SF_21) Fretboard Diagrams
    If (Filter = "bm")
        Click %SF_NN_X%, %SF_22_Y%			; (SF_22) Breath Marks
    If (Filter = "t")
        Click %SF_NN_X%, %SF_23_Y%			; (SF_23) Tremolos
    If (Filter = "gn")
        Click %SF_NN_X%, %SF_24_Y%			; (SF_24) Grace Notes

    If (Filter = "k1") || (Filter = "k2") || (Filter = "k3") || (Filter = "k4") || (Filter = " ")
    {
        ImageSearch, , , SLF_01_X1, SLF_01_Y1, SLF_01_X2, SLF_01_Y2, *40 SLF_01_SelectionFilter_All_ticked.png
        If Errorlevel					; if unticked tick it
            Click %SF_NN_X%, %SF_01_Y%			; (SF_01) All
        If (Filter = "k1") || (Filter = " ")
            Goto, SkipVoice1
        Click %SF_NN_X%, %SF_02_Y%			; (SF_02) Voice 1
        If (Filter = "k2")
            Goto, SkipVoice2
        SkipVoice1:
        Click %SF_NN_X%, %SF_03_Y%			; (SF_03) Voice 2
        SkipVoice2:
        If (Filter = "k3")
            Goto, SkipVoice3
        Click %SF_NN_X%, %SF_04_Y%			; (SF_04) Voice 3
        SkipVoice3:
        If (Filter = "k4")
            Goto, SkipVoice4
        Click %SF_NN_X%, %SF_05_Y%			; (SF_05) Voice 4
        SkipVoice4:
        Click %SF_NN_X%, %SF_06_Y%			; (SF_06) Dynamics
        Click %SF_NN_X%, %SF_07_Y%			; (SF_07) Hairpins
        Click %SF_NN_X%, %SF_08_Y%			; (SF_08) Fingering
        Click %SF_NN_X%, %SF_09_Y%			; (SF_09) Lyrics
        Click %SF_NN_X%, %SF_10_Y%			; (SF_10) Chord Symbols
        Click %SF_NN_X%, %SF_11_Y%			; (SF_11) Other Text
        Click %SF_NN_X%, %SF_12_Y%			; (SF_12) Articulations
        Click %SF_NN_X%, %SF_13_Y%			; (SF_13) Ornaments
        Click %SF_NN_X%, %SF_14_Y%			; (SF_14) Slurs
        Click %SF_NN_X%, %SF_15_Y%			; (SF_15) Figured Bass
        Click %SF_NN_X%, %SF_16_Y%			; (SF_16) Ottavas
        Click %SF_NN_X%, %SF_17_Y%			; (SF_17 Pedal Lines
        Click %SF_NN_X%, %SF_18_Y%			; (SF_18) Other Lines
        Click %SF_NN_X%, %SF_19_Y%			; (SF_19)  Arpeggios
        Click %SF_NN_X%, %SF_20_Y%			; (SF_20) Glissandi
        Click %SF_NN_X%, %SF_21_Y%			; (SF_21) Fretboard Diagrams
        Click %SF_NN_X%, %SF_22_Y%			; (SF_22) Breath Marks
        Click %SF_NN_X%, %SF_23_Y%			; (SF_23) Tremolo
        Click %SF_NN_X%, %SF_24_Y%			; (SF_24) Grace Notes
    }
    If (Filter = "?")
    {
        MsgBox, 4096, F1:  Selection Filter: Z + F → ?      Shortcuts,
(
In the InputBox enter

Keep voice 1			K1   or   Enter
Keep voice 2			K2
Keep voice 3			K3
Keep voice 4			K4

Toggle switches:

Voice 1				1
Voice 2				2
Voice 3				3
Voice 4				4

All				*
Dynamics			D
Hairpins				H
Fingerings			F
Lyrics				L
Chord Symbols			CS
Other Text			OT
Articulations			A
Ornaments			O
Slurs				S
Figured Bass			FB
Ottavas				VA	8
Pedal Lines			PL
Other Lines			OL
Arpeggios			ARP
Glissandi				G
Fretboard Diagrams		FD
Breath Marks			BM
Tremolos				T
Grace Notes			GN

---------------------------------------------------------------------------

Activate MuseScore
to do something.
E.g. set range colors		Z	InputBox
After your actions:
Return to Filter			Z	Keypress

---------------------------------------------------------------------------

Copy filtered selection		C	InputBox
Select destination and
Paste with			Z	Keypress
If you change your mind
Put the mouse on an
empty spot and press		Z	Keypress

Use ColorSelect for fast reselection
)
    }
}
FinishSelectionFilterLoop:
If (CueProduction = 1)
{
    Send {Escape}				; after Cancel: deselection of range needed
    Sleep, 150					; !!!!
    PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
    Click, %MediumPurpleX%, %MediumPurpleY%	; left element of range
    Sleep, 50
    If ErrorLevel
        MsgBox, Left element found?

    Click, %IN_013_X%, %IN_013_Y%		; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
    Sleep, 50
    PixelSearch, LightSalmonX, LightSalmonY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa7f, , Fast RGB
    Click, %LightSalmonX%, %LightSalmonY%	; right element of range
    Click, %IN_013_X%, %IN_013_Y%		; I(013) Reset (012) color elements WITHOUT a Style button in Inspector
    Sleep, 50
}

MouseMove, % SF_NN_X + SF_OffSet_X, % SF_24_Y	; (SF_24) 'Grace Notes' WORD
Click						; turning it blue to secure uncolored state 'All'
Sleep, 50					; the MsgBox is for testing
; MsgBox, 4144, Selection Filter - Check, 'Grace Notes' must now be blue.`nto secure the uncolored state of 'All'.	; for testing
ImageSearch, , , SLF_01_X1, SLF_01_Y1, SLF_01_X2, SLF_01_Y2, *40 SLF_01_SelectionFilter_All_ticked.png
If (Errorlevel = 1)
    Click %SF_NN_X%, %SF_01_Y%			; (SF_01) All
Sleep, 50
Send {F9}					; show Palettes
Sleep, 100
Send {F6}					; hide Selection Filter
If (Errorlevel = 2)				; if search failed
    MsgBox, 4112, Selection Filter, Selecting 'All' Failed
Click, %ElementX%, %ElementY%
Send {Volume_Mute}				; Mute/unmute the master volume
Return 

; ♣===================================== SUBROUTINES ==============================================

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


PickColor:
Click, %IN_012_X%, %IN_012_Y%		; I(012) color picker rectangular (black) - OVERLAP all elements
Sleep, 200
CoordMode, Mouse, Window
Click, %RGB_X%, %RGB_Y%			; Window Select Color HTML: #RGB rectangular
Sleep, 100
Send ^a
Sleep, 50
Return

; ♣============================= OUTCOMMENTED SUPPLEMENT ==========================================

/*
In the file Coordinates.ahk there are the following colors:

ColorV1 := 0x0065bf			; color selected voice 1 element
ColorV2 := 0x007f00			; color selected voice 2 element
ColorV3 := 0xc53f00			; color selected voice 3 element
ColorV4 := 0xc31989			; color selected voice 4 element (red handles in lines have the same color)

ColorCanvas := 0xfffeef			; check your color!
ColorLBC := 0xa0a0a4			; layout break color
ColorMasPal := 0x7fb2d7			; color of selected field in Master Palette
ColorHandle := 0xa0a0a4			; color selected grey square in handles e.g. of hairpin; this is also the color of unselected invisible elements
ColorSelectedInvisible := 0x99c1e5	; color of selected invisible Elements
Two colors used in Independent HotKeys:
RGB_DesktopIcon := 0x3b8ac9		; color of highlighted icon (color set by Windows OS)
RGB_Expl_File := 0xcce8ff		; in Explorer 0xcce8ff is color of selected file (color set by Windows OS)

FYI: colors dependent of view mode
In PageView:				In Cont.View
Clefs		#0065bf	if selected	#0032ab		not selectable
KeySigs		#0065bf	if selected	#0032ab		not selectable
TimeSigs	#0065bf	if selected	#0032ab		not selectable
Spacer		#0065bf	if selected	#0065bf		if selected
Spacer		#0032ab	if not selected	#0032ab		if not selected

; ♣============================== Colors in Z + C Apply Colors ====================================
MuseScore format	#colornr.
AHK format		0xcolornr.

v1	voice 1			#0065bf		Strong blue
v2	voice 2			#007f00		Dark lime green
v3	voice 3			#c53f00		Strong orange
v4	voice 4			#c31989		Strong pink
1	colorpair 1-2 left	#ff00ff		Magenta
2	colorpair 1-2 right	#00ff00		Lime	
3	colorpair 3-4 left	#0000ff		Blue
4	colorpair 3-4 right	#ffaa00		Orange half tone
5	colorpair 5-6 left	#ff0000		Red
6	colorpair 5-6 right	#aaaa00		Dark yellow
7	colorpair 7-8 left	#aa55ff		Medium purple
8	colorpair 7-8 right	#ffaa7f		Light salmon
A	color note A 		#b30fc8		Electric violet
B	color note B		#919cb4		Grayish blue
C	color note C		#00d100		Strong lime green
D	color note D		#ffff00		Pure (or mostly pure) yellow
E	color note E		#006cc8		Strong blue
F	color note F		#fda900		Pure (or mostly pure) orange
G	color note G		#fa1000		Pure (or mostly pure) red
AB	color note A - BWC	#5040a0		Crail
BB	color note B - BWC	#d020a0		Strong pink
CB	color note C - BWC	#e01040		Vivid red
DB	color note D - BWC	#f09010		Vivid orange
EB	color note E - BWC	#fcfc00		Pure (or mostly pure) yellow
FB	color note F - BWC	#90e040		Bright green
GB	color note G - BWC	#00a0a0		Dark cyan
LBC	LayoutBreakColor	#a0a0a4		Dark grayish blue
MT	pure white		#ffffff		(Masking Text)

; ♣==================================== COLOR INFO MUSESCORE ======================================

Info:
https://musescore.org/en/project/colornotestpc
(Ziya Mete Demircan)

ColorNotes_tpc.qml
The seven tones of the natural scale in the tonal pitch class of 33 elements
noteC : #00d100
noteD : #ffff00
noteE : #006cc8
noteF : #fda900
noteG : #fa1000
noteA : #b30fc8
noteB : #919cb4
https://musescore.org/nl/handbook/developers-handbook/plugin-development/tonal-pitch-class-enum

Boomwhackers convention
colornotestpc
noteC : #e01040
noteD : #f09010
noteE : #fcfc00
noteF : #90e040
noteG : #00a0a0
noteA : #5040a0
noteB : #d020a0


https://musescore.org/en/node/243426
#00d100", // C
#00d100", // C#
#ffff00", // Db
#ffff00", // D
#ffff00", // D#
#026cc8", // Eb
#026cc8", // E
#fda900", // F
#fda900", // F#
#fa1000", // Gb
#fa1000", // G
#fa1000", // G#
#b30ec8", // Ab
#b30ec8", // A
#b30ec8", // A#
#919cb4", // Bb
#919cb4"  // B

or

#009c13", // C
#0077c0", // C#/Db
#5b57a6", // D
#9665ab", // D#/Eb
#ee4d9b", // E
#e21c48", // F
#f37021", // F#/Gb
#f99d1c", // G
#ffcc32", // G#/Ab
#fff32b", // A
#d5e15b", // A#/Bb
#62bb46",  // B
*/
