#NoEnv  			; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  				; Enable warnings to assist with detecting common errors.
SendMode Input  		; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 	; Ensures a consistent starting directory.
#InstallMouseHook
#SingleInstance force		; Replaces script (Reloads).
#Persistent			; to make it run indefinitely
#IfWinActive ahk_exe MuseScore3.exe	; Enables Hotkeys when MuseScore3 Window is Active
#Include Coordinates.ahk	; All coordinates are managed in this external file
				; The Include directive causes the script to behave as though
				; the specified file's contents are present at this exact position

; Replace the path S:\etc. with your location of MuseScore3.exe

ToggleCopy := 0			; initialisation for the hotkey #LButton (toggle - copy)
GroupAdd, Coordinates, Select Notes
GroupAdd, Coordinates, Select
GroupAdd, Coordinates, Staff/Part Properties
GroupAdd, Coordinates, Measure Properties
GroupAdd, Coordinates, Style
GroupAdd, Coordinates, MuseScore Preferences
GroupAdd, Coordinates, Master Palette
GroupAdd, Coordinates, Special Characters
GroupAdd, Coordinates, Select Color

; ♣==tooltips ========== SEPARATORS between Canvas and Inspector cq Palettes/Sel Filter ===========

; the tooltips show the correct width of the side panels
; (if needed: adjust the width of the text: the border of the tooltip must just touch the defined width)
; PM related utility 'Reset Width Palettes and Inspector'

CoordMode, ToolTip, Screen
ToolTip , ◄ Separator x = %Def_Insp_Width%, % Def_Insp_Width, 0, 1	; inspector (y=0)
; ToolTip , ◄ Separator x = %Def_Insp_Width%, 608, 0, 1			; inspector (y=0) Test to temporarily get this tooltip out of the way
ToolTip , Separator x=%Def_Pal_Width% ►, % 0, Pal_Sep_Height, 2		; palettes/selection filter (x=0)

; ♣================================== END OF AUTOEXEC SECTION  ====================================

; ♣====================================== HELP INFO (1) ===========================================

~[ & h::
MsgBox, 4096, Master General  -  [ + H,
(
OPEN macro group *		[ + F1 ... F12
EXIT macro group			] + F1 ... F12
Help File				[ + 1  ... 9,0  -  =
EXIT all macrogroups		] + A

*  Press the same hotkey again
to show the name of the macro group.

Prefixes: [  = OPEN     ]  = EXIT

Search and Select			F1
Apply Palette Symbols		F2
Navigation			F3
Positional Finetuning and CA	F4
Alternating Time Signatures		F5
Advanced Dynamics		F6
Master Palette Symbols		F7
Note Input revisited		F8
Specials				F9
Change Score Status #		F10
MouseWheel Note Duration	F11
Developments			F12

# Timed Tooltip

Reload master			[ + ]
Exit Master			] + [
Load PixelMousing		[ + /
Exit PixelMousing			] + /
Help PM (when active)		/ + H
Load Independent HotKeys		[ + \
Exit Independent HotKeys		] + \
Edit Coordinates file		[ + .
Help IHK (when active)		\ + H
Set Surface and Make Image	[ + NumpadEnter
Run Snipping Tool		[ + NumpadAdd

Ergonomy			[ + E
More Hotkeyinfo			[ + M
Utilities				[ + U
WorkFlow			[ + W
Zoom & View			[ + Z
)
Return

; ♣==================================== HELP INFO (2) =============================================

~[ & z::
MsgBox, 4096, Master Zoom & View  -  [ + Z,
(
VIEW

Page				P + V
Continuous			P + C
Page ↔ Continuous		P + L
Single Page			P + S
Page Width			P + W
Whole Page			P + H
Two Pages			P + T

ZOOMFACTOR FIXED

100`%				P + O
110`%				P + 1
120`%				P + 2
130`%				P + 3
140`%				P + 4
150`%				P + 5
160`%				P + 6
170`%				P + 7
180`%				P + 8
190`%				P + 9
200`%				P + 0
300`%				P + E
400`%				P + R

ZOOMFACTOR VARIABLE

Open utilities			Z + U
Enter a number
between 30 and 1600

General Hotkeyinfo		[ + H
Ergonomy			[ + E
More Hotkeyinfo			[ + M
Utilities				[ + U
WorkFlow			[ + W
)
Return



; ♣==================================== HELP INFO (3) =============================================

~[ & e::
MsgBox, 4096, Master Ergonomy  -  [ + E,
(
Ergonomy

Copy/paste range selection		Win + LButton
Rightclick *			AppsKey
Doubleclick *			Alt + CapsLock
Reset (Control + R)		Control + CapsLock
Automatic Placement		Shift + Capslock
Escape				Win + Capslock
Back to last escaped element	Win + Z

* put mouse on element e.g. with Color Search

Alt + Right →			CapsLock + Z
Alt + Down ↓			CapsLock + D
Delete				CapsLock + X
Store MousePosition		CapsLock + Q
Store MousePosition		CapsLock + LButton
Select this position		CapsLock + W

Full Screen toggle			CapsLock + A
Shortcuts → Search		CapsLock + S
Center Selected Element		CapsLock + C
Empty palette search		CapsLock + E

Move cursor x measures right	Z + Wheel Up
Move cursor x measures left		Z + Wheel Down
Scroll up				Z + Up
Scroll down			Z + Down
Scroll left			Z + Left
Scroll right			Z + Right

Master Help			[ + H
More Hotkeyinfo			[ + M
Utilities				[ + U
WorkFlow			[ + W
Zoom & View			[ + Z
)
Return

; ♣==================================== HELP INFO (4) =============================================

~[ & m::
MsgBox, 4096, Master More  -  [ + M,
(
TOOLBAR toggle  -  CAPSLOCK	+ 

Note Input + Workspaces		1
File Operations			2
Playback Controls			3
Concert Pitch			4
Image Capture			5
Feedback			6
All except 1			7
All toolbars invisible		8

PLAYPANEL

Playpanel volume			F11 + F12
Playpanel tempo percentage	F11 + F10

WIN-OS - VOLUME CONTROL

Mute/unmute + popup #		F11 + F9
Volume change in popup		Wheel/click
Volume down in steps		F11 + -
Volume up in steps		F11 + =
# Splash image reminder - Exit	Z

Master Help			[ + H
Ergonomy			[ + E
Utilities				[ + U
WorkFlow			[ + W
Zoom & View			[ + Z
)
Return

; ♣==================================== HELP INFO (5) =============================================
~[ & w::
MsgBox, 4096, Master WorkFlow  -  [ + W,
(
WORKFLOW

Add big staff spacer up #		P + I
Add variable staff spacer up #	P + J
Set extra distance above staff * ҂	P + U
Make one staff small - toggle *	P + N
Make staves small - toggle *		P + M
Measure properties *		P + [
Staff properties *			P + ]
Exclude from measure count	P + X

# measure selected
# Advanced AHK Workspace
* voice 1 note or rest selected 
҂ set value: wheel/arrow keys
  and click to apply

Pianokeyboard			P + K
Show palettes, hide selection filter	P + F
Close palette >			P + .
Open last closed palette <		P + ,

Master Help			[ + H
Ergonomy			[ + E
More Hotkeyinfo			[ + M
Utilities				[ + U
Zoom & View			[ + Z
)
Return



; ♣==================================== HELP INFO (6) =============================================

~[ & u::
MsgBox, 4096, Master Utilities  -  [ + U,
(
In Independent Hotkeys:
Focus on MuseScore		Ctrl + WIN + Z
and restore Defined State
-------------------------------------------------------------------
Check defined state and expand collapsed
Inspector sections for selected element

from  ► to ▼			Z + I

Reset Width Palettes		Z + 1
Reset Width Inspector		Z + 2
Click Screencentre §		Z + 3
Check Canvas Search Area		Z + 4
Set Width Palettes *		Z + F1
Set Width Inspector *		Z + F2
Kit development: test one image	Z + F10
Get Hotspot coordinates #		Z + F11
Get Surface/Image coordinates #	Z + F12
Get color mouse position		Z + /

§ To reactivate out of focus MsgBoxes
* Help macros to get Z+1/2 working
# Loop

GENERAL UTILITIES		Z + U

In InputBox enter

Check Coordinates		CCC
Empty Palette Search		EPS
Get Color Mouseposition		GCM
Initialise Inspector			INI
Initialise Master Palette		IMP
Initialise Play Panel		IPP
Reset Width Inspector *		RWI
Reset Width Palettes *		RWP
Test Image recognition		TIR
* semi automatic

Master Help			[ + H
Ergonomy			[ + E
More Hotkeyinfo			[ + M
WorkFlow			[ + W
Zoom & View			[ + Z
)
Return

; ♣===================================== RELOAD and EXIT APP ======================================

~[ & ]::					; reload master
SendMode Event					; to make slower mouse movements possible
MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2 , 20
MsgBox, 4132, Reload Master        [  +  ], Are you sure you want to reload?
IfMsgBox, Yes
Reload
Return

~] & [::					; exit master
MsgBox, 4132, Exit Master        ]  +  [, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

; ♣============================ RUN MACRO GROUPS and External Utilities ===========================

~[ & F1::
Run, F1_ColorSearchSelect.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F1 - Start Search and Select,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F2::
Run, F2_Apply_Palette_Symbols.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F2 - Start Apply Palette Symbols,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F3::
Run, F3_Navigation.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F3 - Navigation,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F4::
Run, F4_Positioning.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F4 - Positioning,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F5::
Run, F5_Alt_Time_Sigs_and_BeamProps.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F5 - Measure Operations,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F6::
Run, F6_Advanced_Dynamics.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F6 - Advanced Dynamics,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F7::
Run, F7_Master_Palette.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F7 - Master Palette,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F8::
Run, F8_Note_Input.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F8 - Rhythmic Patterns,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F9::
Run, F9_Specials.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F9 - Specials,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F10::
Run, F10_Change_Score_Status.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F10 - Score Status,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & F11::
Run, F11_Note Duration_MouseWheel.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + F11 - Wheel Input,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & \::
Run, Independent_Hotkeys.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, [ + \ - Independent hotkeys,
(
The macro group could not be launched.
Check name and location of the file.
)
Return

~[ & /::
Run, PixelMousing.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, Start PixelMousing,
(
PixelMousing could not be launched.
Check name and location of the file.
)
Return

~[ & .::		; edit file Coordinates.ahk (open default text editor e.g. Notepad)
If WinExist("Coordinates.ahk - Notepad")
    WinActivate
else
Run Edit Coordinates.ahk
Return

~[ & NumpadEnter::
Run, Set_Surface_Coordinates.ahk, , UseErrorLevel
if (ErrorLevel = "Error")
MsgBox, 4112, Set Surface Coordinates,
(
The macro could not be launched.
Check name and location of the file.
)
Return

~[ & NumpadAdd::				; Run SnippingTool
Run, SnippingTool.exe
WinActivate, ahk_class Microsoft-Windows-SnipperToolbar
WinWaitActive, ahk_class Microsoft-Windows-SnipperToolbar
Send, ^n					; new snip
Sleep, 1000
WinActivate ahk_class Microsoft-Windows-SnipperEditor
WinWaitActive, ahk_class Microsoft-Windows-SnipperEditor
Return

; ♣================================== CLOSE MACRO GROUPS =====================================-----
; https://autohotkey.com/board/topic/39319-how-do-you-close-another-ahk-script-solved/
; "This will terminate the script by closing its main window (the window that opens
; by default when you double click on the "H" icon)"  use WinClose
; fullScriptPath = E:\test.ahk  ; edit with your full script path
; legacy definition of variable: e.g. F1_Script = %A_ScriptDir%\F1_ColorSearchSelect.ahk
; DetectHiddenWindows, On 

~] & a::				; close all active macro groups
MsgBox, 4404, Close All Macrogroups,
(
This command will close all macrogroups, F1, F2, F3 etc.
PixelMousing, Master and Independent Hotkeys
will NOT be closed.

Do you want to continue?
)
IfMsgBox, No
    Return
DetectHiddenWindows, On
F1_Script = %A_ScriptDir%\F1_ColorSearchSelect.ahk
F2_Script = %A_ScriptDir%\F2_Apply_Palette_Symbols.ahk
F3_Script = %A_ScriptDir%\F3_Navigation.ahk
F4_Script = %A_ScriptDir%\F4_Positioning.ahk
F5_Script = %A_ScriptDir%\F5_Alt_Time_Sigs_and_BeamProps.ahk
F6_Script = %A_ScriptDir%\F6_Advanced_Dynamics.ahk
F7_Script = %A_ScriptDir%\F7_Master_Palette.ahk
F8_Script = %A_ScriptDir%\F8_Note_Input.ahk
F9_Script = %A_ScriptDir%\F9_Specials.ahk
F10_Script = %A_ScriptDir%\F10_Change_Score_Status.ahk
F11_Script = %A_ScriptDir%\F11_Note Duration_MouseWheel.ahk
WinClose, %F1_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F2_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F3_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F4_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F5_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F6_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F7_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F8_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F9_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F10_Script% ahk_class AutoHotkey
Sleep, 50
WinClose, %F11_Script% ahk_class AutoHotkey
Sleep, 50
Return

; ♣================================= GET COLOR MOUSEPOSITION ======================================

~z & /::			; get color mouseposition
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseGetPos, X, Y
PixelGetColor, PixColor, %X%, %Y% , RGB
MsgBox, 4160, Color of mousepositionpixel , --- The color is %PixColor% ---
Return

; ♣==================== HOTKEY UTILITY GROUP === Z + NUMBER and Z + Functionkey ===================

; ♣=============================== RESET WIDTH PALETTES and INSPECTOR =============================

; These resets are also possible via the utility Z + U _> input RWP (Palettes) or RWI (Inspector)
; RWP and RWI don't need images but are only semi automatic, asking for user actions
; In contrast the hotkeys Z + 1 and Z +2 work fast and are fully automatic.
; But they need 3 images.

; for the hotkey Z + F1 we have to make two images: Palette_Locator_Left.png and Palette_Locator_Right.png. See the Example Images file
; Palette_Locator_Left.png must be made when the Palettes are most left. Palette_Locator_Right.png when the Palettes are most right.
; first we have to determine their surface area which is the same for both of them and enter the coordinates in the file coordinates.ahk
; with Z + F11 you can determine the surface area
; their surface area is a ribbon across the width of the Screen when Palettes resp. Inspector are at their extreme left cq right
; we reload the Master - with [ + ] - to reload the coordinates. Next we use the hotkey Z + F1 to test these two images. are they recognized?
; are our numbers of their ribbon like surface area correct?
; if recognized we can use the hotkey Z + F1 and PixelMousing to determine two distances:
; these are called Left_Loc_Dist_X and Right_Loc_Dist_X
; we enter these distances (number of pixels) of course also in the file Coordinates.ahk
; with the hotkey Z + 1 we can now quickly reset the widt of the palettes to the defined state.
; the combi Z + F2 and Z + 2 does the same but now for the Inspector, where only one image suffices.
; NB: The search for the locators and their Offsets to the Separator is also used
; in the hotkey Ctrl + Win + Z (^#z::) in "Independent_Hotkeys.ahk"

; when the inspector is at its narrowest the word 'Inspector' will be truncated to 'Insp'
; so this image will show 'Insp'

~z & f1::				; test images and measure distance (2x) from locators to palette separator
MsgBox, 4160, Test Palette Left Locator, Make the Palettes as narrow as possible.`nPress Z when ready.
KeyWait, z, d
ImageSearch, X, Y, Pal_Loc_X1, Pal_Loc_Y1, Pal_Loc_X2, Pal_Loc_Y2, *80 Palette_Locator_Left.png	; nb with *80 more color shades are allowed
If (Errorlevel = 0)
{
    MsgBox, 4144, Test Palette Left Locator, Left Locator recognized
    MouseMove, X, Y			; to make measurement possible
    Tooltip, Activate PixelMousing. Press CapsLock to make the coordinates visible.`nMeasure the X-distance to the point where the Palettes separator becomes`nactive. This number is 'Left_Loc_Dist_X'. Press Z when ready, X, Y+60, 5	; (*change*?)
    KeyWait, z, d
    Tooltip, , , , 5			; end of tooltip (5)
}
If (Errorlevel = 1) {
    MsgBox, 4112, Test Palette Left Locator, Left Locator not recognized.`nCheck the Search Area.`n`nThe macro will exit.
    Return
}
If (Errorlevel = 2) {
    MsgBox, 4112, Test Palette Left Locator, Left Locator not recognized.`nThere was a problem that prevented the command from conducting the search.`nE.g. a failure to open the image file or a badly formatted option.`n`nCheck name and location of the png.`nThe macro will exit.
    Return
}
MsgBox, 4160, Test Palette Right Locator, Make the Palettes as wide as possible.`nPress Z when ready.
KeyWait, z, d
ImageSearch, X, Y, Pal_Loc_X1, Pal_Loc_Y1, Pal_Loc_X2, Pal_Loc_Y2, *80 Palette_Locator_Right.png	; nb with *80 more color shades are allowed
If (Errorlevel = 0)
{
    MsgBox, 4144, Test Palette Right Locator, Right Locator recognized
    MouseMove, X, Y			; to make measurement possible
    Tooltip, Activate PixelMousing. Press CapsLock to make the coordinates visible.`nMeasure the X-distance to the point where the Palettes separator becomes`nactive. This number is 'Right_Loc_Dist_X'. Press Z when ready, X, Y+60, 5	; (*change*?)
    KeyWait, z, d
    Tooltip, , , , 5			; end of tooltip (5)
}
If (Errorlevel = 1) {
    MsgBox, 4112, Test Palette Right Locator, Right Locator not recognized.`nCheck the Search Area.`n`nThe macro will exit.
    Return
}
If (Errorlevel = 2) {
    MsgBox, 4112, Test Palette Right Locator, Right Locator not recognized.`nThere was a problem that prevented the command from conducting the search.`nE.g. a failure to open the image file or a badly formatted option.`n`nCheck name and location of the png.`nThe macro will exit.
    Return
}
Return

~z & 1::					; reset the Palette separator to the Defined Width. Use two pngs if needed
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
ImageSearch, X, Y, Pal_Loc_X1, Pal_Loc_Y1, Pal_Loc_X2, Pal_Loc_Y2, *80 Palette_Locator_Left.png
If (Errorlevel = 0)				; 
{
    MouseMove, (X+=Left_Loc_Dist_X), A_ScreenHeight / 2	; measured distance to separator is ... (See Coordinates file)
    Click, Down					; drag enable
    Sleep, 50
    MouseMove, % Def_Pal_Width, % A_ScreenHeight / 2	; to my defined Palettes width
    Click, U					; drag disable
    Sleep, 50
    Send {Escape}
    Click, %StartX%, %StartY%
}
If (Errorlevel = 1)
{
    ImageSearch, X, Y, Pal_Loc_X1, Pal_Loc_Y1, Pal_Loc_X2, Pal_Loc_Y2, *80 Palette_Locator_Right.png
    If (Errorlevel = 0)
    {
        MouseMove, (X+=Right_Loc_Dist_X), A_ScreenHeight / 2	; measured distance to separator is ... (See Coordinates file)
        Click, Down				; drag enable
        Sleep, 50
        MouseMove, % Def_Pal_Width, % A_ScreenHeight / 2	; to my defined Palettes width
        Click, U				; drag disable
        Sleep, 50
        Send {Escape}
        Click, %StartX%, %StartY%
    }
    If (Errorlevel = 1)
        MsgBox, 4144, To Defined State Palettes, Palettes Separator not found.`nTry the utility Reset Width Palettes.`nPress Z + U and enter RWP.
}
Return

~z & f2::			; test image and measure distance from Insp image to inspector separator
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
ImageSearch, X, Y, IM_01_2_X1, IM_01_2_Y1, IM_01_2_X2, IM_01_2_Y2, *40 IM_01_2_Inspector_Displaced_Insp.png
If (Errorlevel = 1)				; Inspector is not present or undocked
{
    MsgBox, 4144, Determine 'Insp' Offset, The Inspector is not present or undocked`nor there are unwanted toolbars active.
    Return
}
If (Errorlevel = 0)
{
    MsgBox, 4144, Determine 'Insp' Offset, The image is recognized.
    MouseMove, X,Y			; to make measurement possible
    Tooltip, Activate PixelMousing. Press CapsLock to make the coordinates visible.`nMeasure the X-distance to the point where the Inspector separator becomes`nactive.This number is 'Insp_Loc_Dist_X'. Press Z when ready, X-60, Y+60, 5	; (*change*?)
    KeyWait, z, d
    Tooltip, , , , 5				; end of tooltip (5)
}
MouseMove, StartX, StartY
Return

~z & 2::					; reset the Inspector separator to the Defined Width
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
ImageSearch, X, Y, IM_01_2_X1, IM_01_2_Y1, IM_01_2_X2, IM_01_2_Y2, *40 IM_01_2_Inspector_Displaced_Insp.png
If (ErrorLevel =1)				; Inspector not present or undocked
{
    MsgBox, 4144, Find Inspector Width, The Inspector is not present or undocked`nor there are unwanted toolbars active.
    Click, %StartX%, %StartY%
    Return
}
If (Errorlevel = 0)
{
    MouseMove, (X-=Insp_Loc_Dist_X), A_ScreenHeight / 2	; 
    Click, down					; drag enable
    Sleep, 50
    MouseMove, % Def_Insp_Width, %  A_ScreenHeight / 2	; to my defined Inspector width
    Sleep, 50
    Click, U					; drag disable
    Send {Escape}
    Sleep, 50
}
Click, %StartX%, %StartY%
Return

; ♣==================================== Small Hotkey Utilities ====================================

; outcommented hotkey - example - see pdf p 70
/*
#1::					; switch workspace
Send !v
Sleep, 100
Send o
Sleep, 100
Send {down 2}				; with the workspaces Basic, Advanced and Advanced AHK
Sleep, 50				; this example switches to the Advanced AHK workspace
Send {Enter}
Return
*/

~z & 3::				; click screencentre (e.g. MsgBoxes)
MouseMove, A_ScreenWidth / 2, A_ScreenHeight / 2
Click
Return

~z & 4::				; Check Canvas Search Area (check its coordinates)
Send {Escape}
Sleep, 50
MsgBox, 4401, Check Canvas Searc Area, Perform this check preferably`non an empty part of the score.
IfMsgBox, Cancel
    Return
CoordMode, Mouse, Screen
SendMode, Event
Send {Shift Down}{Click, %CSA_X1%, %CSA_Y1% down}
Sleep, 100
MouseMove, % CSA_X2, % CSA_Y2, 100	; moves with slowest speed
Sleep, 3000
Send {Lbutton up}{Shift up}
SendMode, Input
Send {Escape}
Return


~z & f10::				; test an image
InputBox, TestImage, Image Test,
(
Select the right element. Go with Alt + Tab back to this InputBox.
Type the number of the test item 1,2,3...

For instance:
1	Statusbar_Note_Pitch.png		Select a note
2	Statusbar_Nothing_Selected.png	Test Statusbar coordinates
3	IM_01_Inspector_Inspector.png	Defined State
4	Clef				Select a Clef
5	TimeSig				Select a TimeSig
6	KeySig				Select a KeySig
7	Note right-click menu: Delete_Blue
	Click a note. Go with Alt + Tab back to this InputBox. Enter 7.
	In the contextual menu: move the mouse to Delete.
	It will turn blue. Press Z.
)
, , 480, 330, A_ScreenWidth / 2 - 200, A_ScreenHeight / 9, , , Input the abbreviation   ? = help	;  (*change*?)
; If the list gets higher: increase the vertical number (now 330)
If ErrorLevel					; when Cancel is pressed
    Return
If TestImage not in 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
{
    MsgBox, 4144, Image Recognition Test, Input a valid abbreviation!`nThe maco will exit.,
    Return
}
Sleep, 250			; to give the system time to produce e.g. the statusbar
; example
If (TestImage = 1)
; ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
; or with explicit coordinates
    ImageSearch, , , 0, 1038, 237, 1079, *40 Statusbar_Note_Pitch.png

If (TestImage = 2)		; test Statusbar surface coordinates
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png

If (TestImage = 3)
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png

If (TestImage = 4) {
IM_27_X1 := 1641	; replace the coordinates with those found by you
IM_27_Y1 := 303
IM_27_X2 := 1762
IM_27_Y2 := 328
ImageSearch, , , IM_27_X1, IM_27_Y1, IM_27_X2, IM_27_Y2, *40 IM_27_Clef_triangle_section_open.png
}

If (TestImage = 5) {
IM_28_X1 := 1641	; replace the coordinates with those found by you
IM_28_Y1 := 304
IM_28_X2 := 1762
IM_28_Y2 := 328
ImageSearch, , , IM_28_X1, IM_28_Y1, IM_28_X2, IM_28_Y2, *40 IM_28_TimeSig_triangle_section_open.png
}

If (TestImage = 6) {
IM_29_X1 := 1639	; replace the coordinates with those found by you
IM_29_Y1 := 305
IM_29_X2 := 1757
IM_29_Y2 := 328
ImageSearch, , , IM_29_X1, IM_29_Y1, IM_29_X2, IM_29_Y2, *40 IM_29_KeySig_triangle_section_open.png
}
If (TestImage = 7) {
MouseGetPos, StartX, StartY
Click, Right
Keywait, z, d
Sleep, 50
ImageSearch, , , CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, Delete_Blue.png		; this searches the Canvas Search Area
; NB: in the F1-selection macros the actual search coordinates are derived from the mouseposition
; To determine these coordinates: see pdf p 56
}
If (ErrorLevel = 1)
    MsgBox, 4144, Test Image Recognition, Selected image not recognized.`n`nPress Z + 3 to get the focus on this window and then OK.
If (ErrorLevel = 0)
    MsgBox, 4144, Test Image Recognition, Selected image recognized.`n`nPress Z + 3 to get the focus on this window and then OK.
If (ErrorLevel = 2)
    MsgBox, 4144, Test Image Recognition,
(
There was a problem that prevented
the command from conducting the search.
E.g. failure to open the image file
or a badly formatted option.

Press Z + 3 to get the focus on this
window and then OK,
)
WinActivate, Test Image Recognition
Return

; ♣============================== GET COORDINATES OF HOTSPOTS AND SURFACES ========================

~z & f11::					; get coordinates (GC) of hotspots
DetectHiddenWindows, On
SetTitleMatchMode, 2
Run, PixelMousing.ahk				; if PM is already running it will reload
Sleep, 300
GC_Loop := 0
GC_LoopEnable := 0
CoordMode, Mouse, Window
MsgBox, 4097, Get hotspot coordinates      Z + F11,
(
Loop: get the coordinates of x hotspots

To get maximum precision use this macro in combination 
with PixelMousing which starts automatically.

Help screen PM			/ + H
Show/hide coordinates		CapsLock

For maximum precision when using PM:
Activate storing			NumpadEnter
Store coordinates			Num7 or Num9	

Alternatively with manual mousesteering:
Store coordinates			Control

After the last hotspot:
Stop loop			Shift

The coordinates are written to the clipboard.
At the end of the macro the text file
Hotspot Coordinates will be opened.
Here you can paste the coordinates
with Control + V.
)
IfMsgBox, Cancel
    Return
Tooltip, With Pixelmousing: before storing press NumpadEnter.`nStore with Numpad 7 or Numpad 9.`nWithout Pixelmousing: store with Control.`nStop the loop with Shift., A_ScreenWidth / 2, 0, 6	; (*change*?)
Keywait, Enter, u
clipboard := ""					; empty the clipboard
Sleep, 50
Loop
{
    Input, FindCoord, , {NumpadEnter}{LControl}{RControl}{LShift}{RShift}
    If (ErrorLevel = "Endkey:RShift") || (ErrorLevel = "Endkey:LShift")
    {
        Tooltip, , , , 6			; close ToolTip (6)
        Break
    }
    If (ErrorLevel = "Endkey:LControl") || (ErrorLevel = "Endkey:RControl")
        GC_Loop := 1

    If (ErrorLevel = "Endkey:NumpadEnter")
    {
        Input, PM_Use, , {Numpad7}{Numpad9}
        If (ErrorLevel = "Endkey:Numpad7") || (ErrorLevel = "Endkey:Numpad9")
            GC_LoopEnable := 1
    }
    If (GC_Loop = 1) || (GC_LoopEnable = 1)
    {
        MouseGetPos, StartX, StartY
;        MsgBox, 4160, Get Coordinates, Coordinates pair # %A_Index%.`nThe mouse position is x=%StartX%  y=%StartY%		; stability delay - for testing
        Sleep, 50
        Tooltip, Hotspot: Cordinates pair # %A_Index%.`nX = %StartX% and Y = %StartY%`nPress Shift to end the loop, StartX, StartY - 50, 3
        ClipboardText = %StartX%%A_Space%%A_Space%%A_Space%%StartY%
        If (A_Index < 10)
            ClipNew = %A_Index%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%ClipboardText%
        Else
            ClipNew = %A_Index%%A_Space%%A_Space%%A_Space%%ClipboardText%
        If (A_Index = 1)
            Clipboard = %ClipNew%
        If (A_Index > 1)
            Clipboard = %Clipboard%`n`r%ClipNew%
        GC_Loop := 0
        GC_LoopEnable := 0
    }
}
Tooltip, , , , 3				; close ToolTip (3)
MsgBox, 4096, Get hotspot coordinates,
(
You pressed Shift to end the loop.
The coordinates in the clipboard are

          X         Y

%Clipboard%

After pressing OK the text file
Hotspot_Coordinates.txt will be opened.
Here you can paste the coordinates
with Control + V.

PixelMousing will exit.
)
Sleep, 500
SetTitleMatchMode, 2
If WinExist("Hotspot_Coordinates")
    Goto, SkipRunHC
Run, Hotspot_Coordinates.txt, , Min		; start minimized
WinWait, Hotspot_Coordinates
SkipRunHC:
IfWinNotActive, Hotspot_Coordinates
    WinActivate, Hotspot_Coordinates
WinWaitActive, Hotspot_Coordinates
WinGetPos, , , Width, Height, Hotspot_Coordinates
WinMove, Hotspot_Coordinates, , (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 800, 800	; 800, 800 size of text window (*change*?)
If WinExist("PixelMousing")			; makes PixelMousing last found window
    WinClose					; so no extra info needed to close it
Return

~z & F12::					; get coordinates (GC) of surfaces
DetectHiddenWindows, On
SetTitleMatchMode, 2
Run, PixelMousing.ahk				; if PM is already running it will reload
Sleep, 300
Even := 0
GC_Loop := 0
GC_LoopEnable := 0
GC_LoopDisable := 0
CoordMode, Mouse, Window
MsgBox, 4097, Get surface coordinates      Z + F12,
(
Loop: get the coordinates of x surfaces

A surface is determined by its TopLeftCorner TLC
and its BottomRightCorner BRC. Set the TLC first.

To get maximum precision use this macro in combination 
with PixelMousing which starts automatically.

Help screen PM			/ + H
Show/hide coordinates		CapsLock

For maximum precision when using PM:
Before storing TLC			NumpadEnter
Store TLC			Numpad7
Before storing BRC		NumpadEnter
Store BRC			Numpad9

Alternatively with manual mousesteering:
Store TLC			Control
Store BRC			Control

After the last surface:
Stop loop			Shift


The coordinates are written to the clipboard.
At the end of the macro the text file Image Coordinates
will be opened.
Here you can paste the coordinates with Control + V.
)
IfMsgBox, Cancel
    Return
Tooltip, With Pixelmousing: before each storing press NumpadEnter.`nStore TLC with Numpad 7.  Store BRC with Numpad 9.`nWithout Pixelmousing: store TLC with Control`, store BRC with Control.`nStop the loop with Shift., A_ScreenWidth / 2, 0, 6	; (*change*?)
Keywait, Enter, u
clipboard := ""						; empty the clipboard
Sleep, 50
Loop
{
    if Mod(A_Index, 2) = 0
        Even := 1					; pass number is even
    else
        Even := 0					; pass number is odd
    Input, FindCoord, , {NumpadEnter}{LControl}{RControl}{LShift}{RShift}
    If (ErrorLevel = "Endkey:RShift") || (ErrorLevel = "Endkey:LShift")
    {
        Tooltip, , , , 6				; close ToolTip (6)
        Break
    }
    If (ErrorLevel = "Endkey:LControl") || (ErrorLevel = "Endkey:RControl")
        GC_Loop := 1
    If (ErrorLevel = "Endkey:NumpadEnter")
    {
;        MsgBox, You pressed NumpadEnter		; for testing
        Sleep, 100
        Input, PM_Use, , {Numpad7}{Numpad9}		; input for Pixel Mousing
        If (ErrorLevel = "Endkey:Numpad7") {
            GC_LoopEnable := 1
;            MsgBox, You pressed Numpad7		; for testing
        }
        If (ErrorLevel = "Endkey:Numpad9") {
            GC_LoopDisable := 1
;            MsgBox, You pressed Numpad9		; for testing
        }
    }
    Sleep, 100
    If (GC_Loop = 1) || (GC_LoopEnable = 1) || (GC_LoopDisable = 1)
    {
        If (Even = 0) || (GC_LoopEnable = 1)
        {
;            MsgBox, 4160, Get Coordinates, TLC Coordinates pair # %A_Index%.`nThe mouse position is%A_Tab%x=%A_Tab%%X1%%A_Tab%y=%A_Tab%%Y1%		; stability delay - for testing
            MouseGetPos, X1, Y1
            ClipboardText = X1 =%A_Tab%%X1%%A_Tab%%A_Tab%Y1 =%A_Tab%%Y1%
            Tooltip, , , , 4
            Tooltip, Cordinates pair # %A_Index%.`nTLC: X1 = %X1%  and Y1 = %Y1%`nPress Shift to end the loop, X1, Y1 - 100, 3		; (*change*?)
        }
        If (Even = 1) || (GC_LoopDisable = 1)
        {
;            MsgBox, 4160, Get Coordinates, BRC Cordinates pair # %A_Index%.`nThe mouse position is%A_Tab%x=%A_Tab%%X2%%A_Tab%y=%A_Tab%%Y2%		; stability delay - for testing
            MouseGetPos, X2, Y2
            ClipboardText = X2 =%A_Tab%%X2%%A_Tab%%A_Tab%Y2 =%A_Tab%%Y2%
            Tooltip, , , , 3
            Tooltip, Cordinates pair # %A_Index%.`nBRC: X2 = %X2%  and Y2 = %Y2%`nPress Shift to end the loop, X2, Y2 - 100, 4		; (*change*?)
        }
        If (A_Index < 10)
            ClipNew = %A_Index%%A_Space%%A_Space%%A_Space%%A_Space%%A_Space%%ClipboardText%
        Else
            ClipNew = %A_Index%%A_Space%%A_Space%%A_Space%%ClipboardText%
        If (A_Index = 1)
            Clipboard = %ClipNew%
        If (A_Index > 1)
            Clipboard = %Clipboard%`n`r%ClipNew%
        GC_Loop := 0
        GC_LoopEnable := 0
        GC_LoopDisable := 0
    }
}
ToolTip, , , , 3						; close tooltip (3)
ToolTip, , , , 4						; close tooltip (4)
MsgBox, 4096, Get surface coordinates,
(
You pressed Shift to end the loop.
The coordinates in the clipboard are

%Clipboard%

After pressing OK the text file
Image_Coordinates.txt will be opened.
Here you can paste the coordinates
with Control + V.

PixelMousing will exit.
)
Sleep, 500
SetTitleMatchMode, 2
If WinExist("Image_Coordinates")
    Goto, SkipRunIC2
Run, Image_Coordinates.txt, , Min		; start minimized
WinWait, Image_Coordinates
SkipRunIC2:
IfWinNotActive, Image_Coordinates
    WinActivate, Image_Coordinates
WinWaitActive, Image_Coordinates
WinGetPos, , , Width, Height, Image_Coordinates
WinMove, Image_Coordinates, , (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 800, 800	; 800, 800 size of text window (*change*?)
If WinExist("PixelMousing")			; makes PixelMousing last found window
    WinClose					; so no extra info needed to close it
Return



; ♣===================================== END OF Z- UTILITIES ======================================


;♣ ================================  ERGONOMICAL MsC SHORTCUTS ====================================

; The next two commands belong together. They facilitate reselection of the note e.g. after attaching
; sticky elements like hairpins.


~CapsLock & LButton::		; store clicked MousePosition
~CapsLock & q::			; store MousePosition
Click
MouseGetPos, MousePosCapsL_Q_X, MousePosCapsL_Q_Y
Return

~CapsLock & w::			; click MousePosition stored by previous command
If (MousePosCapsL_Q_X = "") and (MousePosCapsL_Q_Y = "")
{
    MsgBox, 4144, Reselection element,
(
Ignore the warning!

You pressed CapsLock + W without
a previous positioning command.

CapsLock + W selects the position
stored by CapsLock + Q or
CapsLock + leftclick.

For now the mouse will travel
to the current selected element
and this position will be stored.

If nothing is selected it clicks
the centre of the screen.
)
    MousePosCapsL_Q_X := A_ScreenWidth / 2
    MousePosCapsL_Q_Y := A_ScreenHeight / 2
    PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
    if ErrorLevel
        Click, %MousePosCapsL_Q_X%, %MousePosCapsL_Q_Y%
    else
    {
    MousePosCapsL_Q_X := ElementX
    MousePosCapsL_Q_Y := ElementY
    }
}
Click, %MousePosCapsL_Q_X%, %MousePosCapsL_Q_Y%
Return

; the next hotkey comes in handy when - after using Z + A - you have to use manual selection
; of palette elements. Works best if 'Single Palette' is checked.

~CapsLock & e::			; empty palette search field -> show all palettes (also in Z + U utilities)
MouseGetPos, StartX, StartY
Send ^{f9}			; Custom MuseScore shortcut, to Palette Search  (*change*?)
Sleep, 100
Send {Del}
Sleep, 100
Send {Escape}
Sleep, 100
MouseMove, StartX, StartY
Return				

#CapsLock::			; accessible escape + creation memorypoint
CoordMode, Mouse, Window	; to make sure mouse gets position of element to be escaped
CoordMode, Pixel, Window
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Escape - Search for voice 1234 element, Color not found.`nProbably there is no element selected.`nOr you could try a higher zoom factor.
    Return
}
MouseMove, ElementX, ElementY
; Send {Escape}
Sleep, 50
Send {Escape}					; escape twice to get rid of sticky doubleclicks
Sleep, 50
MouseGetPos, MemPointEscapeX, MemPointEscapeY
Return

#MaxThreadsPerHotkey, 2				; same hotkey can have two results
#LButton::					; toggle - copy range selection
Gosub, InspectorCheck				; subroutine at end of file
MouseGetPos, StartX, StartY
ToggleCopy := !ToggleCopy
If (ToggleCopy = 1) {
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    If ErrorLevel {				; if no range selection
        ToolTip, Select a range!, StartX, StartY - 100, 10
        SetTimer, FinishToolTipCopy, -1500	; tooltip during 1.5 seconds
        ToggleCopy := 0				; reset toggle
        Return
    }
}
If (ToggleCopy = 1) {				; after first time hotkey press
    Send ^c
    ToolTip, Ready to paste.`nSelect destination with mouse`nor arrowkeys and repeat the hotkey., StartX, StartY - 100, 10
}
If (ToggleCopy = 0) {				; after second time hotkey press
    Send ^v
    ToolTip, , , , 10
}
Return

FinishToolTipCopy:				; timer causes tooltip to disappear
ToolTip, , , , 10
Return
#MaxThreadsPerHotkey, 1				; next hotkeys will have one thread again


#z::				; back to last Escaped element
If (MemPointEscapeX = "") && (MemPointEscapeY = "") {
    MsgBox, 4144, Back to last escaped element, There was no prior Win + CapsLock command.`n`nUse Win + CapsLock to Escape.`nWin + Z will then click the escaped element again.
    Return
}
Click, %MemPointEscapeX%, %MemPointEscapeY%
Return

~^CapsLock::Send ^r		; reset = Control + R

; The next hotkey can minimize manual stress caused by frequent mousing and works well
; in combination with the hotkeys for colorsearch of selected elements.
; e.g. to move an element.

~!CapsLock::			; doubleclick
Send {Click, down}
Sleep, 50
Send {Click, up}
Send {Click, down}
Send {Click, up}
Return    

~+CapsLock::			; toggles automatic placement
Send {=}
Return

~CapsLock & a::			; toggles full screen with two adjacent keys
Send ^u
Return

~CapsLock & d::			; accessibility: Alt + down
Send !{down}
Return

~Capslock & z::			; accessibility: next element
Send !{right}
Return

~Capslock & x::			; delete
Send {del}
Return

; FREE CANVAS - defined state of Window (=minimized)
; Window MuseScorePreferences -> Shortcuts -> Search
; Window 'Preferences' MINIMIZED => fixed coordinates to determine with PixelMousing

~CapsLock & s::			; with two almost adjacent keys
CoordMode, Mouse, Window	; coordinates relative to window
Send !e				; opens Menu Edit
Send {up}			; to Preferences
Send {Enter}
Sleep, 200
Click, %Tab_Sc_X%, %Tab_Sc_Y%	; (TAB_SC) Preferences Tab Shortcuts
Sleep, 50
Click, %Pref_Search_X%, %Pref_Search_Y%	; clicks searchfield
Return

; In some cases the AppsKey - between right Win logo key and right Control key -
; doesn't produce a contextual menu in MuseScore.
; This hotkey repairs that.
; NB: not every keyboard has got an AppsKey

AppsKey:: Click, right

; ♣=================================== ON SCREEN KEYBOARD =========================================

; redefining or clearing the shortcut 'P' makes hotkeys with first key P possible
; P + K replaces default MuseScore shortcut P


~p & k::			; toggles on screen Pianokeyboard
Send !v
Send {Down 9}
Send {Enter}
Return

; ♣================================== MOVE CURSOR and SCROLL ======================================
; FREE CANVAS

~z & WheelUp::				; move cursor x measures to the right
Send ^{right}
Return

~z & WheelDown::			; move cursor x measures to the left
Send ^{left}
Return

~z & Up::Send {WheelUp}			; Scroll vertically - up - MuseScore Shift + WheelUp

~z & Down::Send {WheelDown}		; Scroll vertically - down - MuseScore Shift + WheelDown

~z & Left::Send +{WheelUp}		; Scroll horizontically - left - MuseScore WheelUp

~z & Right::Send +{WheelDown}		; Scroll horizontically - right - MuseScore WheelDown

; ♣=========================== SHOW PALETTES, HIDE SELECTION FILTER ===============================
; in Full Screen
; detect if Palettes and/or Selection Filter are active
; switch Palettes on and Selection Filter off

~p & f::						; show palettes, hide selection filter
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 150
ImageSearch, , , PalTick_X1, PalTick_Y1, PalTick_X2, PalTick_Y2, *40 CTS_Checked_ticked_sign.png
If (Errorlevel = 1)					; if Palettes unticked
{
    Send {Escape}
    Sleep, 50
    Send {f9}						; show Palettes
    Sleep, 150
}
Send {Escape}
Sleep, 50
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 150
ImageSearch, , , SelTick_X1, SelTick_Y1, SelTick_X2, SelTick_Y2, *40 CTS_Checked_ticked_sign.png
If (Errorlevel = 0)					; if Selection Filter ticked
{
    Send {Escape}
    Sleep, 50
    Send {f6}						; hide Selection Filter
    Sleep, 150
}
Send {Escape}
Sleep, 50
Return

; ♣======================================== TOOLBARS ==============================================

; shortcuts for toolbars are of course assignable in MuseScore Preferences
; AHK makes combinations of toolbars possible with one command and invities customization
; example the hotkey CapsLock + 7, a toggle for all Toolbars except Note Input + Workspaces

~CapsLock & 1::						; Toolbar  Note Input + Workspaces toggle
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY				; original position
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 2}						; shortest way to Note Input
Send {Enter}						; selects Toolbar
Sleep, 100
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up}						; to Workspaces
Send {Enter}						; selects Toolbar
Sleep, 50
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

~CapsLock & 2::						; Toolbar File Operations toggle
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY	; original position
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 7}						; shortest way to File Operations
Send {Enter}						; selects Toolbar
Sleep, 50
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

~CapsLock & 3::						; Toolbar Playback Controls toggle
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY				; original position
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 6}						; shortest way to Playback Controls
Send {Enter}						; selects Toolbar
Sleep, 50
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

~CapsLock & 4::						; Toolbar Concert Pitch toggle
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY				; original position
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 5}						; shortest way to Concert Pitch
Send {Enter}						; selects Toolbar
Sleep, 50
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

~CapsLock & 5::						; Toolbar Image Capture toggle
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY				; original position
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 4}						; shortest way to Image Capture
Send {Enter}						; selects Toolbar
Sleep, 50
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

~CapsLock & 6::						; Toolbar Feedback toggle
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY				; original position
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 3}						; shortest way to Feedback
Send {Enter}						; selects Toolbar
Sleep, 50
Sleep, 100
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

~CapsLock & 7::						; Toggle for all Toolbars except Note Input and Workspaces
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY				; original positionMouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 7}						; to File Operations
Send {Enter}						; selects Toolbar
Sleep, 50
MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Sleep, 50
Click, right
Send {up 6}						; to Playback Controls
Send {Enter}						; selects Toolbar
Sleep, 50

MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 5}						; to Concert Pitch
Send {Enter}						; selects Toolbar
Sleep, 50

MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 4}						; to Image Capture
Send {Enter}						; selects Toolbar
Sleep, 50

MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
Click, right
Sleep, 100
Send {up 3}						; shortest way to Feedback
Send {Enter}						; selects Toolbar
Sleep, 50
Sleep, 100
MouseMove, StartX, StartY				; back to original position; y-offset is height toolbar = 40
Return

; MAX CANVAS version
; the contextual toolbar menu needs intialisation of the Play Panel to make the commands unambiguous
; after opening playpanel - or click in view menu - the play panel item is added to the list
; there is an ALTERNATIVE version of this command under this version
; if you want to activate the alternative version you have to outcomment this version
; remove semicolon and space in the next line
; /*

~CapsLock & 8::						; all toolbars off (*change*?) NB: you could change the search area to, exclude high or low toolbars from being unticked
MouseGetPos, StartX, StartY
Loop
{
    MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; click Toolbar selection spot
    Click, right
    Sleep, 150						; time to open contextual menu
    ImageSearch, Tick_X, Tick_Y, CTS_X1, CTS_Y1, CTS_X2, CTS_Y2, *40 CTS_Checked_ticked_sign.png

    If (ErrorLevel = 0)					; if tick √ present
    {
        MouseMove, Tick_X + ToolBTickOffset_X, Tick_Y + ToolBTickOffset_Y
        Click						; click tick away
        Sleep, 50
        Continue
    }
    If (ErrorLevel = 1)					; when all ticks in search area are unticked
    {
        Click, %ToolBarSel_X%, %ToolBarSel_Y%
        Break						; stop search loop
    }
}
MouseMove, StartX, StartY
Return
; if you want to activate the alternative version you have to outcomment this version
; remove semicolon and space in the next line
; */


/*
; ALTERNATIVE VERSION . Defined State must contain Toolbars NOTE INPUT and WORKSPACES only
; this alternative version is outcommented. To activate it delete /* above and */ at the end of this alternative version
; and outcomment the MAX CANVAS version as indicated above
~CapsLock & 8::						; switch the toolbars from 'File Operations' to 'Feedback' off if on.  Switch Note Input and Workspaces on if off (*change*?)
MouseGetPos, StartX, StartY
Loop
{
    MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; to Toolbar selection spot
    Click, right
    Sleep, 150						; in the meantime open contextual menu
    ImageSearch, Tick_X, Tick_Y, FoFb_X1, FoFb_Y1, FoFb_X2, FoFb_Y2, *40 CTS_Checked_ticked_sign.png
    If (ErrorLevel = 0)					; if tick √ present
    {
        MouseMove, Tick_X + ToolBTickOffset_X, Tick_Y + ToolBTickOffset_Y
        Click						; click tick away
        Sleep, 50					; click closes contextual menu
        Continue					; execute again from first line of loop
    }
    If (ErrorLevel = 1)					; when all ticks in search area are unticked
        Break						; stop search loop from 'File Operations' to 'Feedback'
}							; contextual menu is still open
ImageSearch, Tick_X, Tick_Y, NoteInp_X1, NoteInp_Y1, NoteInp_X2, NoteInp_Y2, *40 CTS_Checked_ticked_sign.png
If (ErrorLevel = 1)					; if tick √ is not present
{
    MouseMove, NoteInp_X1 + ToolBTickOffset_X, NoteInp_Y1 + ToolBTickOffset_Y
    Click						; switch toolbar Note Input on
    Sleep, 50						; click closes contextual menu
    MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; to Toolbar selection spot
    Click, right
    Sleep, 150						; in the meantime open contextual menu again
    Goto, CheckWorkspaces
}
If (ErrorLevel = 0)
    Goto, CheckWorkspaces
CheckWorkspaces:
ImageSearch, Tick_X, Tick_Y, WorkSp_X1, WorkSp_Y1, WorkSp_X2, WorkSp_Y2, *40 CTS_Checked_ticked_sign.png
If (ErrorLevel = 1)					; if tick √ is not present
{
    MouseMove, WorkSp_X1 + ToolBTickOffset_X, WorkSp_Y1 + ToolBTickOffset_Y
    Click						; switch toolbar Workspaces on
}
If (ErrorLevel = 0)					; if tick √ is present
    Click, %ToolBarSel_X%, %ToolBarSel_Y%
Sleep, 50						; click closes contextual menu
MouseMove, StartX, StartY
Return
*/

; ♣===================================== PLAY PANEL ===============================================

; F11 key liberated. The playpanel toggle is replaced by the combination F11 + F12 cq F11 + F10
; NB: often after start MuseScore the PlayPanel is docked in the Inspector' making it wider than needed
; Therefore: in Z + U utilities: initialisation play panel, undock from inspector, and move panel
; It resets also the  Inspector to the chosen minimum width of the Defined State
; And - important - it adds 'Play Panel' to the right-click menu of Timeline - Score Comparison Tool
; - Palettes - Inspector etc. as lowest item in this list
; Position the Play Panel: use PixelMousing to determine the coordinates.

~F11 & F12::					; playpanel toggle - change volume (NB: Default = -40 dB, click on Vol.slider)
PlayVar := "volume"
Goto, ExexPlayPanel				; name of label    
~F11 & F10::					; playpanel toggle - change speed as percentage
PlayVar := "speedpercentage"
Goto, ExexPlayPanel				; name of label

ExexPlayPanel:					; label
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
Send !v						; close panel with Escape or Alt + F4
Sleep, 50					; no action when panel is docked
Send {down 3}
Sleep, 50
Send {Enter}
Sleep, 100
WinMove, Play Panel, , Play_Panel_X, Play_Panel_Y, PlayP_Wide, PlayP_High	; x/y position, width, height of play panel
Sleep, 50
CoordMode, Mouse, Window

If (PlayVar = "volume")
    Click, %Volume_X%, %Volume_Y%		; rectangle master volume (*change*?)
If (PlayVar = "speedpercentage")
    Click, %TempoPerc_X%, %TempoPerc_Y%		; rectangle playback speed as percentage

Tooltip, Arrow up/down`nPress Z when ready, Play_Panel_X + 90, Play_Panel_Y - 10, 3	; position relative to Play Panel (*change*?)
Keywait, z, d
Tooltip, , , , 3				; end of tooltip (3)
Send {Escape}					; focus on numeric input field off
Sleep, 50
Send {Escape}
CoordMode, Mouse, Screen
MouseMove, StartX, StartY
Return

; Mute/unmute the master volume - change volume in popup with mouse wheel and click

~F11 & F9::					; Mute/unmute the master volume - change vol. by slider or MWheel
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY			; original position
Send {Volume_Mute}				; Mute/unmute the master volume
; Tooltip, Press Z`nwhen ready., OS_Slider_X + 30, OS_Slider_Y, 2		;  (*change*?)
Click, %OS_Slider_X%, %OS_Slider_Y%		; to OS Volume slider
SplashImage, MuseScore_logo_round.jpg, b fm8 wm1000 ctff0000, , When ready`nPress Z, Press Zvolume, Arial
WinMove, Press Zvolume, , 130, 100		; X/Y position (*change*?)
Sleep, 1000					; shows for 1 second
SplashImage, Off
Keywait, z, d
; ToolTip, , , , 2				; close Tooltip (2)
MouseMove, StartX, StartY
Return

~F11 & -::SoundSet, -5				; regulates volume in OS; stepsize -5
~F11 & =::SoundSet, +5				; regulates volume in OS; stepsize =5

; ♣==================================== CLOSE PORTALS =============================================

~p & .::			; close open palette if ▼ is visible
CoordMode, Mouse, Screen	; determine Palette ▼ search area with PixMousing
MouseGetPos, StartX, StartY
ImageSearch, OpenPortalX, OpenPortalY, DA_X1, DA_Y1, DA_X2, DA_Y2, *40 DA_Portal_Open_Down_Arrow.png
if errorlevel
MsgBox, 4160, Close Open Portal, No Portal to close!`n`nIf a Portal is open repeat the command, 3
MouseMove, OpenPortalX + TriAngleOffset_X, OpenPortalY + TriAngleOffset_Y	; in the centre of the ▼
Click
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MouseMove, StartX, StartY
    Return
}
MouseMove, ElementX, ElementY + 4		; to prevent hitting upper third
Click
Return

~p & ,::					; open last closed ▼ Portal  ►
MouseGetPos, StartX, StartY
MouseMove, OpenPortalX + TriAngleOffset_X, OpenPortalY + TriAngleOffset_Y	; in the centre of the ▼
Click
MouseMove, StartX, StartY
Return

; ♣========================= ACCESSIBILITY: CENTER SELECTED ELEMENT ===============================

; nb: ColorCanvas := 0xfffeef  Determine color with utility Z + U -> GCM

~CapsLock & c::					; Center selected element
CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen
Gosub, InspectorCheck				; subroutine at end of file
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
MsgBox, 4112, Trying to center the element, The element was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
Return
}
Click, %ElementX%, %ElementY%
MouseGetPos, StartX, StartY
Loop, 31
{
    MouseGetPos, EmptyX, EmptyY
    PixelSearch, EmptyX, EmptyY, EmptyX - 10, EmptyY - 10, EmptyX, EmptyY, ColorCanvas, , Fast RGB	; minus 10 to the left and up (*change*?)
    Click, %EmptyX%, %EmptyY%
    Sleep, 100
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
    If (ErrorLevel = 0)
    Break
    if (A_Index > 15)
    Goto, SearchUnderStart
    If (ErrorLevel = 1)
    Continue
    SearchUnderStart:
        {
        MouseMove, StartX, StartY
        Loop
            {
                MouseGetPos, EmptyX, EmptyY
                PixelSearch, EmptyX, EmptyY, EmptyX - 10, EmptyY + 10, EmptyX, EmptyY + 15, ColorCanvas, , Fast RGB	; plus 10 to the right and down (*change*?)
                Click, %EmptyX%, %EmptyY%
                Sleep, 100
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
                If (ErrorLevel = 1)
                Continue
                If (ErrorLevel = 0)
                Break
                if (A_Index = 15)
                Break
            }
            Break
        }
}
Tooltip, Center element. Press Z. After the screenshift`npress WIN + N to select a note or rest.`nFor Win + N macrogroup #3 must be active., EmptyX + 30, EmptyY - 30, 4 (*change*?)
KeyWait, z, d
Sleep, 100
SendMode, Event
Send {Click, down}
MouseMove, % A_ScreenWidth / 2, % A_ScreenHeight / 2, 40
Sleep, 400
Click, up
Send !{right}
Sleep, 50
Sleep, 100
WinClose, ahk_class tooltips_class32		; in this case needed
Return

; ♣===================================== STAFF SIZE ===============================================

; select a note or rest in voice 1

~p & n::					; toggle size of staff
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
MsgBox, 4144, Search for voice 1 element,  Color not found.`nMay be there is no element`nin this voice selected.`nOr try a higher zoom factor.
Return
}
Click, %ElementX%, %ElementY%
Sleep, 50
Click, right
Sleep, 50
MouseGetPos, StartX, StartY			; original position
Send {down}
Send {Enter}
Sleep, 100
Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
Sleep, 100
CoordMode, Mouse, Window
Click, %WSPP_01X%, %WSPP_01Y%			; (WSPP_01) Window Staff/Part Props Small staff tickbox
Sleep, 100
Send {Enter}
Sleep, 1000					; needed for scores with many staves
CoordMode, Mouse, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
    MsgBox, 4144, Toggle Staff size,
(
The originally selected element was not found again.
Select a note or rest, *not* a measure.
May be you have to increase the zoomfactor.
)
else
{
    Click, %ElementX%, %ElementY%
    Return
}
Return

; all staves visible
; select in voice 1 a note or rest; the macro loops from higher to lower staves

~p & m::					; toggle size of staves
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
MsgBox, 4144, Search for voice 1 element,  Color not found.`nMay be there is no element`nin this voice selected.`nOr try a higher zoom factor.
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
Click, %WSPP_06X%, %WSPP_06Y%			; (WSPP_06) Window Staff/Part Props Next staff ↓
Sleep, 100
Click, %WSPP_09X%, %WSPP_09Y%			; (WSPP_09) Window Staff/Part Props Apply
Sleep, 100
Loop
{
    MsgBox, 4131, Make staves small,
    (
Toggle small - normal size

To make the next staff small		Press Yes
To skip the next staff		Press No
To stop the macro			Press Cancel
    )
    IfMsgBox, Yes
    {
    Click, %WSPP_06X%, %WSPP_06Y%		; (WSPP_06) Window Staff/Part Props Next staff ↓
    Sleep, 100
    Click, %WSPP_01X%, %WSPP_01Y%		; (WSPP_01) Window Staff/Part Props Small staff tickbox
    Sleep, 100
    Click, %WSPP_09X%, %WSPP_09Y%		; (WSPP_09) Window Staff/Part Props Apply
    Sleep, 100
    Continue
    }
    IfMsgBox, No
    {
    Click, %WSPP_06X%, %WSPP_06Y%		; (WSPP_06) Window Staff/Part Props Next staff ↓
    Sleep, 100
    Continue
    }
    IfMsgBox, Cancel
    {
    Sleep, 100
    Click, %WSPP_08X%, %WSPP_08Y%		; (WSPP_08) Window Staff/Part Props OK
    Sleep, 100
    Break
    }
}
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
MsgBox, 4112, Looking for selected voice 1 element, The element in voice 1 was not found.`nMay be there is no voice 1 element selected.`nOr try a higher zoom factor.
else
Click, %ElementX%, %ElementY%
Return

; ♣================================= MEASURE/STAFF PROPERTIES =====================================

~p & [::				; Measure Properties - Select a note or rest in voice 1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Looking for voice 1 element, Element not found.`nMay be there is nothing selected.`nOr try a higher zoom factor.
    Return
}
else
Click, %ElementX%, %ElementY%
Click, right
Send {down 2}
Send {Enter}
Sleep, 100
Return

~p & ]::				; Staff/Part Properties - Select a note or rest in voice 1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Looking for voice 1 element, Element not found.`nMay be there is nothing selected.`nOr try a higher zoom factor.
    Return
}
else
Click, %ElementX%, %ElementY%
Click, right
Send {down}
Send {Enter}
Sleep, 100
Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
Sleep, 100
Return

; ♣=================================== EXCLUDE FROM MEASURE COUNT =================================

~p & x::				; Measure Properties - Select a note or rest in voice 1
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
if ErrorLevel
{
    MsgBox, 4112, Looking for voice 1 element, The element in voice 1 was not found.`nMay be there is no voice 1 element selected.`nOr try a higher zoom factor.
    Return
}
else
Click, %ElementX%, %ElementY%
Click, right
Send {down 2}
Send {Enter}
Sleep, 100
CoordMode, Mouse, Window
Click, %WMPP_02X%, %WMPP_02Y%		; Exclude from measure count tickbox
Sleep, 50
Click, %WMPP_04X%, %WMPP_04Y%		; Apply
Sleep, 50
Send {Escape}
Sleep, 50
CoordMode, Mouse, Screen
Click, %ElementX%, %ElementY%
Return

; ♣=========================== SET (temporarily) DISTANCE BETWEEN STAVES ==========================

; Especially in Continuous View extra space between staves prevents clutter.
; the Advanced AutoHotKey.workspace must be the selected workspace
~p & i::						; attach Staffspacer of 15 sp.
CoordMode, Mouse, Screen
Send ^{F9}						; Palette Search (Ctrl + F9)  (*change*?)
Sleep, 100
Send ^a
Sleep, 50
Send bs5						; glyph 604, Staff spacer up
Sleep, 100
Send ^!p						; MSc user defined shortcut 'Apply current palette element'  (*change*?)
Sleep, 200
PixelSearch, Px, Py, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, Colorv1, 0, Fast RGB
If ErrorLevel
{
MsgBox, 4113, Staffspacer not found,
(
Maybe the zoomfactor is too small.
Press OK to set the factor at 100`% or to retry.
If there is a nearby higher staffspacer
then this one will be selected instead.
)
}
IfMsgBox, Cancel
    Return
Sleep, 50
MouseMove, Px, Py
Click, 2
Send ^{up 12}
Return

~p & j::						; attach small spacer up
CoordMode, Mouse, Screen
Send ^{F9}						; Palette Search (Ctrl + F9)  (*change*?)
Sleep, 100
Send ^a
Sleep, 50
Send bs5						; glyph 604, Staff spacer up
Sleep, 100
Send ^!p						; MSc user defined shortcut 'Apply current palette element'  (*change*?)
Sleep, 200
PixelSearch, Px, Py, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorLBC, 0, Fast RGB
If ErrorLevel
{
MsgBox, 4113, Staffspacer not found,
(
There is no spacer or the zoomfactor is too small.
If there are more spacers on the screen
the highest one will be selected.
)
}
IfMsgBox, Cancel
    Return
MouseMove, Px, Py
Click, 2
Return

; for general score layout - in continuous view an alternative for attaching staffspacers
; set extra distance above staff in Window Staff/Part Properties 
; note or rest selected

~p & u::						; set extra distance above staff
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
Click, right
Sleep, 50
Send {down}
Sleep, 50
Send {Enter}
Sleep, 150
WinActivate, Staff/Part Properties
Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
Sleep, 50
CoordMode, Mouse, Window
CoordMode, ToolTip, Window
Sleep, 100
Click, %WSPP_03X%, %WSPP_03Y%				; (WSPP_03) Window Staff/Part Props Extra distance above staff - change distance with mousewheel
ToolTip, Press Z`nwhen ready., WSPP_03X + 30, WSPP_03Y, 2	;  (*change*?)
; SplashImage, MuseScore_logo_round.jpg, b fm8 wm1000 ctff0000, , When ready`nPress Z, Press Zvolume, Arial
; WinMove, Press Zvolume, , 130, 100			; (*change*?)
; Sleep, 3000						; shows for 3 seconds
; SplashImage, Off
KeyWait, z, d						; waiting for Z
ToolTip, , , , 2					; close Tooltip (2)
Send {Enter}
CoordMode, Mouse, Screen
Sleep, 100
MouseMove, StartX, StartY
Return

; ♣===================================== VIEW ASPECT ==============================================

~p & l::					; toggle page/continuous view
Send ^+{v}					; MSc shortcut (*change*?)
Return

~p & c::					; continuous view
Viewform := "c"
Goto, StartViewAspect
~p & v::					; page view
Viewform := "p"
Goto, StartViewAspect
~p & s::					; single page view
Viewform := "s"
Goto, StartViewAspect
~p & w::					; page width
Viewform := "w"
Goto, StartViewAspect
~p & h::					; whole page
Viewform := "h"
Goto, StartViewAspect
~p & t::					; two pages
Viewform := "t"
Goto, StartViewAspect

StartViewAspect:
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY			; original position
ImageSearch, , , PI_X1, PI_Y1, PI_X2, PI_Y2, *40 PI_Print_Icon.png
if (ErrorLevel = 0)				; if toolbar file operations is visible
Goto, ViewAspect
if (ErrorLevel = 1)				; if toolbar file operations is not visible
{
    Send !{v}
    Send {t}
    Send {Enter}
}
ViewAspect:
Click, %SPCView_X%, %SPCView_Y% 		; to selection field Single/Page/Continuous View
Sleep, 50
If (ViewForm = "p")
    Send p					; page view
If (ViewForm = "c")
    Send c					; continuous view
If (ViewForm = "s")
    Send s					; single page view
If (ViewForm = "w") || (ViewForm = "h") || (ViewForm = "t")
{
    Send p					; page view
    Sleep, 100
    Send {Enter}
    Sleep, 50
    Click, %ZoomArrow_X%, %ZoomArrow_Y%		; Arrow next to Zoompercentage rectangle
    Sleep, 200
    If (ViewForm = "w")
        Send p
    If (ViewForm = "h")
        Send w
    If (ViewForm = "t")
        Send t
}
Sleep, 100
Send {Enter}
MouseMove, StartX, StartY			; back to original position
Send {Escape}
if (ErrorLevel = 1)				; if toolbar file operations was not visible
{
    Send !{v}
    Send {t}
    Send {Enter}				; make toolbar file operations again not visible
}
Return

; ♣======================================== ZOOMFACTOR HOTKEYS ====================================

~p & o::					; zoomfactor 100 %
Send ^{0}					; MSc shortcut (*change*?)
Return

~p & 1::					; zoomfactor 110 %
Zoomfactor := 110
Goto, StartZoomfactor
~p & 2::					; zoomfactor 120 %
Zoomfactor := 120
Goto, StartZoomfactor
~p & 3::					; zoomfactor 130 %
Zoomfactor := 130
Goto, StartZoomfactor
~p & 4::					; zoomfactor 140 %
Zoomfactor := 140
Goto, StartZoomfactor
~p & 5::					; zoomfactor 150 %
Zoomfactor := 150
Goto, StartZoomfactor
~p & 6::					; zoomfactor 160 %
Zoomfactor := 160
Goto, StartZoomfactor
~p & 7::					; zoomfactor 170 %
Zoomfactor := 170
Goto, StartZoomfactor
~p & 8::					; zoomfactor 180 %
Zoomfactor := 180
Goto, StartZoomfactor
~p & 9::					; zoomfactor 190 %
Zoomfactor := 190
Goto, StartZoomfactor
~p & 0::					; zoomfactor 200 %
Zoomfactor := 200
Goto, StartZoomfactor
~p & e::					; zoomfactor 300 %
Zoomfactor := 300
Goto, StartZoomfactor
~p & r::					; zoomfactor 400 %
Zoomfactor := 400
Goto, StartZoomfactor

StartZoomfactor:
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY
ImageSearch, , , PI_X1, PI_Y1, PI_X2, PI_Y2, *40 PI_Print_Icon.png
if (ErrorLevel = 0)				; if toolbar file operations is visible
    Goto, ZoomPercVar
if (ErrorLevel = 1)				; if toolbar file operations is not visible
{
    Send !{v}
    Send {t}
    Send {Enter}
}
ZoomPercVar:
Click, %ZoomPerc_X%, %ZoomPerc_Y%		; (ZoomPerc) Zoom Percentage rectangle
Send ^a
Sleep, 100
Send % Zoomfactor
Sleep, 100
Send {Enter}
MouseMove, StartX, StartY			; back to original position
Send {Escape}
if (ErrorLevel = 1)				; if toolbar file operations was not visible
{
    Send !{v}					; view menu
    Send {t}					; toolbars
    Send {Enter}				; make toolbar file operations again not visible
}
Return

; ♣========================================= UTILITIES ============================================

~z & u::
CoordMode, Mouse, Screen
MouseGetPos, StartX, StartY			; position mouse
InputBox, Util, Utilities, , , W_IB, H_IB, IB_X, IB_Y, , , Help = Questionmark	;  (*change*?) InputBox positioned in Inspector area
; InputBox, Util, Utilities, , , W_IB, H_IB, StartX, StartY - 120, , , Help = Questionmark	;  (*change*?) InputBox positioned near the mouse
If ErrorLevel					; when Cancel is pressed
    Return

If (Util = "Help = Questionmark")
    Return

If (Util = "?")
{
MsgBox, 4097, Z + U  Utilities - Shortcuts,
(
In InputBox enter

ZOOMFACTOR  a number between 30 and 1600

GENERAL UTILITIES

Check Coordinates		CCC
Empty Palette Search		EPS
Get Color Mouseposition		GCM
Initialise Inspector			INI
Initialise Master Palette		IMP
Initialise Play Panel		IPP
Reset Width Palettes		RWP
Reset Width Inspector		RWI
Test Image recognition		TIR

Also as separate commands:
Empty Palette Search		CapsLock + E
Get Color Mouseposition		Z + /
Reset Width Palettes		Z + 1
Reset Width Inspector		Z + 2
)
    IfMsgBox, Cancel
        Return
    IfMsgBox, OK
    {
        InputBox, Util, Utilities, , , W_IB, H_IB, IB_X, IB_Y, , , Enter a command		;  (*change*?) InputBox positioned in Inspector area
;        InputBox, Util, Utilities, , , W_IB, H_IB, StartX, StartY - 120, , , Enter a command	;  (*change*?) InputBox positioned near the mouse
        If ErrorLevel					; when Cancel is pressed
            Return
    }
}

; ♣====================================== ZOOMFACTOR ==============================================
If Util is number
{
    Gosub, InspectorCheck			; subroutine at end of file
    ZoomfactorAbs := Abs(Util)
    Zoomfactor := Round(ZoomfactorAbs)
    ImageSearch, , , PI_X1, PI_Y1, PI_X2, PI_Y2, *40 PI_Print_Icon.png
    if (ErrorLevel = 0)				; if toolbar file operations is visible
    Goto, ZoomPerc
    if (ErrorLevel = 1)				; if toolbar file operations is not visible
    {
        Send !{v}
        Send {t}
        Send {Enter}
    }
    ZoomPerc:
    Click, %ZoomPerc_X%, %ZoomPerc_Y%		; (ZoomPerc) Zoom Percentage rectangle
    Send ^a
    Sleep, 100
    Send % Zoomfactor				; expression mode
;   Send %Zoomfactor%				; legacy mode
;   MsgBox, % "The Zoomfactor is " . Zoomfactor . "."
    Send {Enter}
    MouseMove, StartX, StartY			; back to original position
    Send {Escape}
    if (ErrorLevel = 1)				; if toolbar file operations was not visible
    {
        Send !{v}
        Send {t}
        Send {Enter}				; make toolbar file operations again not visible
    }
    Return
}
If Util in ccc,eps,ini,imp,ipp,tir		; no gcm (get color mousepos) and no rwi/rwp: reset side panels -  no defined state
    Gosub, InspectorCheck			; subroutine at end of file
If Util not in ccc,eps,gcm,ini,imp,ipp,rwi,rwp,tir
{
    MsgBox, 4144, Utilities, No valid command!
    Return
}

; ♣===================================== CHECK COORDINATES ========================================

If Util in ccc
{
    CoordCheck := 1
    RepeatCheck := 0
    MuseScoreFile := 0
    Barline := 0
    Gosub, InspectorCheck			; subroutine at end of file
    MsgBox, 4614, Check Coordinates,
(
This check presupposes you have finished the
utility Test Image Recognition successfully.

The mscz file 'Check MuseScore coordinates'
automates the switching between windows.

Load the testfile		Continue
Retry without reloading	Try Again

For an automatic check:
In the InputBox enter the number 1.
After the first number enter Z.

Keep entering Z and step through all
the checks consecutively.

The utility includes more items than used
in the current Coordinates file.
You'll be informed you can skip them.

For info how to jump to a group of coordinates:
See the Help file.

When a check fails, determine the right coordinates,
cancel the macro and correct the Coordinates file.
In this way you can continue the automatic procedure.

Many properties of a note are checked with the
dotted note C#4 selected.
After a jump verify that the right element is selected.
)
    IfMsgBox, Continue
    {
        Run, Check_MuseScore_coordinates.mscz, , UseErrorLevel
        If (ErrorLevel = "error")
            MsgBox, 4112, The file could not be loaded. Check name and location of the file.
        MuseScoreFile := 1
        Sleep, 1000
    }
    IfMsgBox, Cancel
        Return
    IfMsgBox, TryAgain
        MuseScoreFile := 1

    Loop
    {
        If WinExist("Select Notes") || WinExist("Select") || WinExist("Staff/Part Properties")
|| WinExist("Measure Properties")|| WinExist("Style")|| WinExist("MuseScore Preferences")
|| WinExist("Master Palette")|| WinExist("Special Characters")|| WinExist("Select Color")
|| (CoordCheck = 1901) || (CoordCheck = 1902) || (CoordCheck = 1903) 
            Goto, SkipInspectorCheckCcc
        ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
        If (ErrorLevel = 1)				; if 'Inspector' is not in the correct spot
        {
            MsgBox, 4112, Inspector Check,
(
The screen is not in the defined state.

Before continuing restore the defined state.
)
        }
        SkipInspectorCheckCcc:
        CoordMode, Mouse, Screen
        InputBox, CoordCheck, Check Coordinates, , , W_IB, H_IB, IB_X, IB_Y, , , Help = ?
        if (ErrorLevel = 1)				; when Cancel is pressed
        {
            If (MuseScoreFile = 1)
            {
                WinActivate, Check MuseScore coordinates
                Sleep, 200
                Send ^w
            }
            Sleep, 200
            Break				; exits the macro
        }

        If (Clipboard = 8)			; with the Z-key from the last of the Menu group to the first of the Selection Filter group
        Clipboard := 99
        If (Clipboard = 123)			; with the Z-key from the last of the Selection Filter group to the first of the Inspector group
        Clipboard := 199
        If (Clipboard = 301)			; with the Z-key from the last of the Inspector group to the first of the Select Notes group
        Clipboard := 999
        If (Clipboard = 1014)			; with the Z-key from the last of the Select Notes group to the first of the Select group
        Clipboard := 1099
        If (Clipboard = 1110)			; with the Z-key from the last of the Select group to the first of the Staff/Part Properties group
        Clipboard := 1199
        If (Clipboard = 1208)			; with the Z-key from the last of the Staff/Part Properties group to the first of the Measure Properties group
        Clipboard := 1299
        If (Clipboard = 1304)			; with the Z-key from the last of the Measure Properties group to the first of the Style group
        Clipboard := 1399
        If (Clipboard = 1427)			; with the Z-key from the last of the Style group to the first of the Preferences group
        Clipboard := 1499
        If (Clipboard = 1501)			; with the Z-key from the last of the Preferences group to the first of the Master Palette Symbols group
        Clipboard := 1599
        If (Clipboard = 1603)			; with the Z-key from the last of the Master Palette Symbols group to the first of the Special Characters group
        Clipboard := 1699
        If (Clipboard = 1703)			; with the Z-key from the last of the Special Characters group to the first of the Select Color group
        Clipboard := 1799
        If (Clipboard = 1800)			; with the Z-key from the last of the Select Color group to the first of the Canvas group
        Clipboard := 1899
        If (Clipboard = 1904)
        MsgBox, 4144, Check Coordinates, There are no higher numbers to be checked.

        If (CoordCheck = "z")			; to next number
        {
            CoordCheck := ++Clipboard
            Goto, RepeatInBoxCcc
        }

        If (CoordCheck = "r")
        {
            RepeatCheck = 1
            Goto, RepeatInBoxCcc
        }

        Clipboard = ""				; empty the clipboard
        ClipWait
        Clipboard := CoordCheck

        RepeatInBoxCcc:
        If (CoordCheck = "r")
        CoordCheck := Clipboard

;       MsgBox, The contents of the Clipboard is %CoordCheck%		; for testing

        If InStr(CoordCheck, "?")
        {
            MsgBox, 4096, Check coordinates - Shortcuts,
(
Go to the first check of a group with a letter.
Go next to a specific check with a number.
Go from the last check of a group to the first
check of the next group by entering		Z

Menubar			1	8
Selection Filter		100	123	A
Inspector		200	301

Inspector Selected Element

Element Group/Range	200		B
Element			209		C
Coloring			211
Element			216
Chord			229
Note			238
Dot			258
Stem			259		D
Beam			262		E
Tuplet			268		F
Rest			272
Text			274		G
Text Frame		281
Barline			285		H
Articulation		289		I
Accidental		291		J
Vertical Frame		293		K
Fretboard Diagram	300
Spacer			301

Contextual Menus

Select Notes		1000	1014	L
Select			1100	1120	M
Staff/Part Properties	1200	1208	N
Measure Properties	1300	1304	O
Style			1400	1427	P

Other Windows

Preferences		1500	1501	Q
Master Palette Symbols	1600	1603	S
Special Characters		1700	1703	T
Select Color		1800		U

Canvas			1900	1904	V

Repeat last command			R
Walk through all checks			Z
)
        }
/*
SHORTCUTLIST
If CoordCheck in 1,2,3,4,5,6,7,8
,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119
,120,121,122,123
,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219
,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239
,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259
,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279
,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299
,300,301
,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014
,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110
,1200,1201,1202,1203,1204,1205,1206,1207,1208
,1300,1301,1302,1303,1304
,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416
,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427
,1500,1501
,1600,1601,1602,1603
,1700,1701,1702,1703
,1800
,1900,1901,1902,1903,1904
*/

; ♣===================================== JUMP TO COORDINATE GROUP =================================

        If CoordCheck in a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,s,t,u,v
        {							; see at top of script
            GroupClose, Coordinates, A				; the windows that belong to this group
            Sleep, 350						; closes sub windows if any
            If (CoordCheck = "a")				; last item of menus
            Clipboard := 99
            If (CoordCheck = "b")
            Clipboard := 199
            If (CoordCheck = "c")
            Clipboard := 208
            If (CoordCheck = "d")
            Clipboard := 258
            If (CoordCheck = "e")
            Clipboard := 261
            If (CoordCheck = "f")
            Clipboard := 267
            If (CoordCheck = "g")
            Clipboard := 273
            If (CoordCheck = "h")
            Clipboard := 284
;            Barline := 1
            If (CoordCheck = "i")
            Clipboard := 288
            If (CoordCheck = "j")
            Clipboard := 290
            If (CoordCheck = "k")
            Clipboard := 292
            If (CoordCheck = "l")
            Clipboard := 999
            If (CoordCheck = "m")
            Clipboard := 1099
            If (CoordCheck = "n")
            Clipboard := 1199
            If (CoordCheck = "o")
            Clipboard := 1299
            If (CoordCheck = "p")
            Clipboard := 1399
            If (CoordCheck = "q")
            Clipboard := 1499
            If (CoordCheck = "s")
            Clipboard := 1599
            If (CoordCheck = "t")
            Clipboard := 1699
            If (CoordCheck = "u")
            Clipboard := 1799
            If (CoordCheck = "v")
            Clipboard := 1899

            WinActivate, Check MuseScore coordinates
            If CoordCheck in a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,s,t,u,v
            {
                CoordMode, Mouse, Screen
                CoordMode, Pixel, Screen
                MouseMove, % ToolBarSel_X, % ToolBarSel_Y	; toolbar selection spot
                Click, right
                Sleep, 150
                ImageSearch, Tick_X, Tick_Y, PalTick_X1, PalTick_Y1, PalTick_X2, PalTick_Y2, *40 CTS_Checked_ticked_sign.png
                If (Errorlevel = 1)					; if Palettes unticked
                {
                    Send {Escape}
                    Sleep, 50
                    Send {f9}					; show Palettes
                    Sleep, 150
                }
                Send {Escape}
                Sleep, 50
                MouseMove, % ToolBarSel_X, % ToolBarSel_Y	; toolbar selection spot
                Click, right
                Sleep, 150
                ImageSearch, Tick_X, Tick_Y, SelTick_X1, SelTick_Y1, SelTick_X2, SelTick_Y2, *40 CTS_Checked_ticked_sign.png
                If (Errorlevel = 0)				; if Selection Filter ticked
                {
                    Send {Escape}
                    Sleep, 50
                    Send {f6}					; hide Selection Filter
                    Sleep, 150
                }
                Send {Escape}
                Sleep, 50
            }
            If (CoordCheck = "a")
            MsgBox, 4160, To Coordinates Group, Check Selection Filter.`n`nEnter Z
            If (CoordCheck = "b")
            MsgBox, 4160, To Coordinates Group, Check Inspector.`nElement Group`n`nEnter Z
            If (CoordCheck = "c")
            MsgBox, 4160, To Coordinates Group, Check Notes.`nElement`nSegment`nChord`nNote`n`nEnter Z
            If (CoordCheck = "d")
            MsgBox, 4160, To Coordinates Group, Check Stem.`nElement`nStem`n`nEnter Z
            If (CoordCheck = "e")
            MsgBox, 4160, To Coordinates Group, Check Beam.`nElement`nBeam`n`nEnter Z
            If (CoordCheck = "f")
            MsgBox, 4160, To Coordinates Group, Check Tuplet.`nElement`nTuplet`n`nEnter Z
            If (CoordCheck = "g")
            MsgBox, 4160, To Coordinates Group, Check Text.`nElement`nText`nStaff Text`n`nEnter Z
            If (CoordCheck = "h")
            MsgBox, 4160, To Coordinates Group, Check Barline.`nElement`nSegment`nBarline`n`nEnter Z
            If (CoordCheck = "i")
            MsgBox, 4160, To Coordinates Group, Check Articulation.`nElement`nArticulation`n`nEnter Z
            If (CoordCheck = "j")
            MsgBox, 4160, To Coordinates Group, Check Accidental.`nElement`nAccidental`n`nEnter Z
            If (CoordCheck = "k")
            MsgBox, 4160, To Coordinates Group, Check Vertical Frame.`nVertical Frame`n`nEnter Z
            If (CoordCheck = "l")
            MsgBox, 4160, To Coordinates Group, Check Select Notes`n`nEnter Z
            If (CoordCheck = "m")
            MsgBox, 4160, To Coordinates Group, Check Select`n`nEnter Z
            If (CoordCheck = "n")
            MsgBox, 4160, To Coordinates Group, Check Staff/Part Properties`n`nEnter Z
            If (CoordCheck = "o")
            MsgBox, 4160, To Coordinates Group, Check Measure Properties`n`nEnter Z
            If (CoordCheck = "p")
            MsgBox, 4160, To Coordinates Group, Check Style`n`nEnter Z
            If (CoordCheck = "q")
            MsgBox, 4160, To Coordinates Group, Check Preferences`n`nEnter Z
            If (CoordCheck = "s")
            MsgBox, 4160, To Coordinates Group, Check Master Palette Symbols`n`nEnter Z
            If (CoordCheck = "t")
            MsgBox, 4160, To Coordinates Group, Check Special Characters`n`nEnter Z
            If (CoordCheck = "u")
            MsgBox, 4160, To Coordinates Group, Check Select Color`n`nEnter Z
            If (CoordCheck = "v")
            MsgBox, 4160, To Coordinates Group, Check Canvas`n`nEnter Z
        }
        If CoordCheck in 1
        {
            MouseMove, % Menu_File_X, % Menu_Y			; Menu File
            MsgBox, 4096, Check coordinates, 1  Menu File
        }
        If CoordCheck in 2
        {
            MouseMove, % Menu_Edit_X, % Menu_Y			; Menu Edit
            MsgBox, 4096, Check coordinates, 2  Menu Edit
        }
        If CoordCheck in 3
        {
            MouseMove, % Menu_View_X, % Menu_Y			; Menu View
            MsgBox, 4096, Check coordinates, 3  Menu View
        }
        If CoordCheck in 4
        {
            MouseMove, % Menu_Add_X, % Menu_Y			; Menu Add
            MsgBox, 4096, Check coordinates, 4  Menu Add
        }
        If CoordCheck in 5
        {
            MouseMove, % Menu_Format_X, % Menu_Y		; Menu Format
            MsgBox, 4096, Check coordinates, 5  Menu Format
        }
        If CoordCheck in 6
        {
            MouseMove, % Menu_Tools_X, % Menu_Y			; Menu Tools
            MsgBox, 4096, Check coordinates, 6  Menu Tools
        }
        If CoordCheck in 7
        {
            MouseMove, % Menu_Plugins_X, % Menu_Y		; Menu Plugins
            MsgBox, 4096, Check coordinates, 7  Menu Plugins
        }
        If (CoordCheck = 8) || (CoordCheck = 99)
        {
            MouseMove, % Menu_Help_X, % Menu_Y		; Menu Help
            MsgBox, 4096, Check coordinates,
(
8  Menu Help`n`nNext series: SELECTION FILTER`n`nEnter: 100 or enter Z

But if the selection filter is visible:
Enter A followed by Z.
)
        }

; ♣=================================== SELECTION FILTER ===========================================

        If CoordCheck in 100
        {
            If (RepeatCheck = 1)
            Goto, SkipPalSelChange
            Send {F6}
            Sleep, 100
            Send {F9}
            SkipPalSelChange:
            Sleep, 100
            MouseMove, % SF_NN_X, % SF_01_Y			; (SF_01) Selection Filter All
            MsgBox, 4096, Check coordinates, 100  Selection Filter  All`n`n(SF_01)
        }
        If CoordCheck in 101
        {
            MouseMove, % SF_NN_X, % SF_02_Y			; (SF_02) Selection Filter Voice 1
            MsgBox, 4096, Check coordinates, 101  Selection Filter Voice 1`n`n(SF_02)
        }
        If CoordCheck in 102
        {
            MouseMove, % SF_NN_X, % SF_03_Y			; (SF_03) Selection Filter Voice 2
            MsgBox, 4096, Check coordinates, 102  Selection Filter Voice 2`n`n(SF_03)
        }
        If CoordCheck in 103
        {
            MouseMove, % SF_NN_X, % SF_04_Y			; (SF_04) Selection Filter Voice 3
            MsgBox, 4096, Check coordinates, 103  Selection Filter Voice 3`n`n(SF_04)
        }
        If CoordCheck in 104
        {
            MouseMove, % SF_NN_X, % SF_05_Y			; (SF_05) Selection Filter Voice 4
            MsgBox, 4096, Check coordinates, 104  Selection Filter Voice 4`n`n(SF_05)
        }
        If CoordCheck in 105
        {
            MouseMove, % SF_NN_X, % SF_06_Y			; (SF_06) Selection Filter Dynamics & Hairpins
            MsgBox, 4096, Check coordinates, 105  Selection Filter Dynamics`n`n(SF_06)
        }
        If CoordCheck in 106
        {
            MouseMove, % SF_NN_X, % SF_07_Y			; (SF_07) Selection Filter Hairpins
            MsgBox, 4096, Check coordinates, 106  Selection Filter  Hairpins`n`n(SF_07)
        }
        If CoordCheck in 107
        {
            MouseMove, % SF_NN_X, % SF_08_Y			; (SF_08) Selection Filter Fingering
            MsgBox, 4096, Check coordinates, 107  Selection Filter Fingering`n`n(SF_08)
        }
        If CoordCheck in 108
        {
            MouseMove, % SF_NN_X, % SF_09_Y			; (SF_09) Selection Filter Lyrics
            MsgBox, 4096, Check coordinates, 108  Selection Filter Lyrics`n`n(SF_09)
        }
        If CoordCheck in 109
        {
            MouseMove, % SF_NN_X, % SF_10_Y			; (SF_10) Selection Filter Chord Symbols
            MsgBox, 4096, Check coordinates, 109  Selection Filter Chord Symbols`n`n(SF_10)
        }
        If CoordCheck in 110
        {
            MouseMove, % SF_NN_X, % SF_11_Y			; (SF_11) Selection Filter Other Text
            MsgBox, 4096, Check coordinates, 110  Selection Filter Other Text`n`n(SF_11)
        }
        If CoordCheck in 111
        {
            MouseMove, % SF_NN_X, % SF_12_Y			; (SF_12) Selection Filter Articulations & Ornaments
            MsgBox, 4096, Check coordinates, 111  Selection Filter Articulations`n`n(SF_12)
        }
        If CoordCheck in 112
        {
            MouseMove, % SF_NN_X, % SF_13_Y			; (SF_13) Selection Filter Articulations & Ornaments
            MsgBox, 4096, Check coordinates, 112  Selection Filter Ornaments`n`n(SF_13)
        }
        If CoordCheck in 113
        {
            MouseMove, % SF_NN_X, % SF_14_Y			; (SF_14) Selection Filter Slurs
            MsgBox, 4096, Check coordinates, 113  Selection Filter Slurs`n`n(SF_14)
        }
        If CoordCheck in 114
        {
            MouseMove, % SF_NN_X, % SF_15_Y			; (SF_15) Selection Filter Figured Bass
            MsgBox, 4096, Check coordinates, 114  Selection Filter Figured Bass`n`n(SF_15)
        }
        If CoordCheck in 115
        {
            MouseMove, % SF_NN_X, % SF_16_Y			; (SF_16) Selection Filter Ottavas
            MsgBox, 4096, Check coordinates, 115  Selection Filter Ottavas`n`n(SF_16)
        }
        If CoordCheck in 116
        {
            MouseMove, % SF_NN_X, % SF_17_Y			; (SF_17) Selection Filter Pedal Lines
            MsgBox, 4096, Check coordinates, 116  Selection Filter Pedal Lines`n`n(SF_17)
        }
        If CoordCheck in 117
        {
            MouseMove, % SF_NN_X, % SF_18_Y			; (SF_18) Selection Filter Other Lines
            MsgBox, 4096, Check coordinates, 117  Selection Filter Other Lines`n`n(SF_18)
        }
        If CoordCheck in 118
        {
            MouseMove, % SF_NN_X, % SF_19_Y			; (SF_19) Selection Filter Arpeggios
            MsgBox, 4096, Check coordinates, 118  Selection Filter Arpeggios`n`n(SF_19)
        }
        If CoordCheck in 119
        {
            MouseMove, % SF_NN_X, % SF_20_Y			; (SF_20) Selection Filter Glissandi
            MsgBox, 4096, Check coordinates, 119  Selection Filter Glissandi`n`n(SF_20)
        }
        If CoordCheck in 120
        {
            MouseMove, % SF_NN_X, % SF_21_Y			; (SF_21 Selection Filter Fretboard Diagrams
            MsgBox, 4096, Check coordinates, 120  Selection Filter Fretboard Diagrams`n`n(SF_21)
        }
        If CoordCheck in 121
        {
            MouseMove, % SF_NN_X, % SF_22_Y			; (SF_22) Selection Filter Breath Marks
            MsgBox, 4096, Check coordinates, 121  Selection Filter Breath Marks`n`n(SF_22)
        }
        If CoordCheck in 122
        {
            MouseMove, % SF_NN_X, % SF_23_Y			; (SF_23) Selection Filter Tremolo
            MsgBox, 4096, Check coordinates, 122  Selection Filter Tremolo`n`n(SF_23)
        }
        If (CoordCheck = 123) || (CoordCheck = 199)
        {
            MouseMove, % SF_NN_X, % SF_24_Y			; (SF_24) Selection Filter Grace Notes
            MsgBox, 4096, Check coordinates,
(
123  Selection Filter Grace Notes`n`n(SF_24)

For the next series of coordinates: make a Range Selection.

Verification of the ELEMENT GROUP in the Inspector.

Enter 200 or enter Z.
)
        }

; ♣====================================== INSPECTOR ===============================================
        If CoordCheck in 200
        {
            WinActivate, Check MuseScore coordinates
            If (RepeatCheck = 1)
            {
                Send {Escape}
                Sleep, 50
                Goto, Skip_200
            }
            CoordMode, Mouse, Screen
            CoordMode, Pixel, Screen
            MouseMove, % ToolBarSel_X, % ToolBarSel_Y	; toolbar selection spot
            Click, right
            Sleep, 150
            ImageSearch, Tick_X, Tick_Y, PalTick_X1, PalTick_Y1, PalTick_X2, PalTick_Y2, *40 CTS_Checked_ticked_sign.png
            If (Errorlevel = 1)					; if Palettes unticked
            {
                Send {Escape}
                Sleep, 50
                Send {f9}					; show Palettes
                Sleep, 150
            }
            Send {Escape}
            Sleep, 50
            MouseMove, % ToolBarSel_X, % ToolBarSel_Y	; toolbar selection spot
            Click, right
            Sleep, 150
            ImageSearch, Tick_X, Tick_Y, SelTick_X1, SelTick_Y1, SelTick_X2, SelTick_Y2, *40 CTS_Checked_ticked_sign.png
            If (Errorlevel = 0)				; if Selection Filter ticked
            {
                Send {Escape}
                Sleep, 50
                Send {f6}					; hide Selection Filter
                Sleep, 150
            }
            Send {Escape}
            Sleep, 50
            Skip_200:

            PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB
            if ErrorLevel
            {
                MsgBox, 4144, Search for colored element,
(
The color was not found.
Select the first note
and repeat the command by entering R.

But when a range is selected
just press OK.
)
            }
            Click, %ElementX%, %ElementY%
            Send ^+{right}
            Sleep, 100
            WinActivate, Check Coordinates
            Sleep, 100
;            MouseMove, % IN_001_X, % IN_001_Y		; I(001) black rectangle color picker - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 200  Inspector`n`nBlack rectangle color picker`n`nI(001)`n`nELEMENT GROUP`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 201
        {
            MouseMove, % IN_002_X, % IN_002_Y		; I(002) rectangle Set Color = Reset Color - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 201  Inspector`n`nRectangle Set Color = Reset Color`n`nI(002)`n`nELEMENT GROUP
        }
        If CoordCheck in 202
        {
;        MouseMove, % IN_003_X, % IN_003_Y		; I(003) rectangle Set Visible - ELEMENT GROUP
        MsgBox, 4096, Check coordinates, 202  Inspector`n`nRectangle Set Visible`n`nI(003)`n`nELEMENT GROUP`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 203
        {
;            MouseMove, % IN_004_X, % IN_004_Y		; I(004) rectangle Set InvVisible - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 203  Inspector`n`nRectangle Set Invisible`n`nI(004)`n`nELEMENT GROUP`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 204
        {
;            MouseMove, % IN_005_X, % IN_005_Y		; I(0005) rectangle Enable Autoplace - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 204  Inspector`n`nRectangle Enable Autoplace`n`nI(005)`n`nELEMENT GROUP`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 205
        {
;            MouseMove, % IN_006_X, % IN_006_Y		; I(006) rectangle Disable Autoplace - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 205  Inspector`n`nRectangle Disable Autoplace`n`nI(006)`n`nELEMENT GROUP`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 206
        {
            MouseMove, % IN_007_X, % IN_007_Y		; I(007) Select Notes - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 206  Inspector`n`nRectangle Select Notes`n`nI(007)`n`nELEMENT GROUP
        }
        If CoordCheck in 207
        {
            MouseMove, % IN_008_X, % IN_008_Y		; I(008) Select Grace Notes - ELEMENT GROUP
            MsgBox, 4096, Check coordinates, 207  Inspector`n`nRectanguler Select Grace Notes`n`nI(008)`n`nELEMENT GROUP
        }
        If CoordCheck in 208
        {
            MouseMove, % IN_009_X, % IN_009_Y		; I(009) Select Rests - ELEMENT GROUP
            MsgBox, 4096, Check coordinates,
(
208  Inspector

Rectangle Select Rests

I(009)

ELEMENT GROUP

For the next check select a Note.
Or enter Z for the automatic procedure.
)
        }
        If CoordCheck in 209
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            Send {Escape}
            Sleep, 50
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Sleep, 50
            WinActivate, Check coordinates
;            MouseMove, % IN_010_X, % IN_010_Y		; I(010) Tick box visible
            MsgBox, 4096, Check coordinates, 209  Inspector Element`n`nTick box Visible`n`nI(010)`n`nNOTE or CHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 210
        {
;            MouseMove, % IN_011_X, % IN_011_Y		; I(011) Reset (010) visible
            MsgBox, 4096, Check coordinates, 210  Inspector Element`n`nReset Visible`n`nI(011)`n`nNOTE or CHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 211
        {
            MouseMove, % IN_012_X, % IN_012_Y		; I(012) color rectangle (black) - all elements OVERLAP
            MsgBox, 4096, Check coordinates,
(
211  Inspector Element`n`nRectangle Color Picker OVERLAP`n`nI(012)`n`nALL ELEMENTS

Elements like texts have Style buttons.
This causes a shift of some fields. Check overlap.

For the next check select a Text and enter 212.
Or just enter Z if you follow the automatic procedure.
)
        }
        If CoordCheck in 212
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_212
            Send !{right}
            Sleep, 200
            Skip_212:
            WinActivate, Check coordinates
            MouseMove, % IN_012_X, % IN_012_Y		; I(012) color rectangle (black) - all elements OVERLAP
            MsgBox, 4096, Check coordinates,
(
212  Inspector Element`n`nRectangle Color Picker OVERLAP`n`nI(012)`n`nALL ELEMENTS

For the next check select a dynamic and enter 213.
Or just enter Z if you follow the automatic procedure.

Check that the coordinates are in the overlap area of these elements.
)
        }
        If CoordCheck in 213
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_213
            Send !{right}
            Sleep, 200
            Skip_213:
            WinActivate, Check coordinates
            MouseMove, % IN_012_X, % IN_012_Y		; I(012) color rectangle (black) - all elements OVERLAP
            MsgBox, 4096, Check coordinates,
(
213  Inspector Element`n`nRectangle Color Picker OVERLAP`n`nI(012)`n`nALL ELEMENTS

Select a note and enter Z for the next check, 214
)
        }
        If CoordCheck in 214
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_214
            Send !{right}
            Sleep, 200
            WinActivate, Check coordinates
            Skip_214:
            MouseMove, % IN_013_X, % IN_013_Y		; I(013) Reset (012) color WITHOUT a Style button
            MsgBox, 4096, Check coordinates,
(
214  Inspector Element`n`nReset Color of Elements WITHOUT a Style Button`n`nI(013)
This concerns: Notes, stems, beams, flags (hooks), rests,
accidentals, barlines, breaths, arpeggios & glissandi.

NB:  Whenever possible: color will be reset
via Range Selection - ELEMENT GROUP I2

For the next check select a text and enter 215.
Or just enter Z if you follow the automatic procedure.
)
        }
        If CoordCheck in 215
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_215
            Send !{right}
            Sleep, 200
            Skip_215:
            WinActivate, Check coordinates
;            MouseMove, % IN_014_X, % IN_014_Y		; I(014) Reset (012) color WITH a Style button`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
            MsgBox, 4096, Check coordinates,
(
215  You can skip this test.
This item has been left out in this AHK kit.

Inspector Element`n`nReset Color of Elements WITH a Style Button`n`nI(014)
This concerns: Ornaments, articulations, repeats, 
jumps, fretboard diagrams and text.
Text  includes tempo, ritmic modulation and fingering.

NB1: Dynamics need a wide inspector to show all functions.
Its column of 'Set as Style' buttons is not relevant for the AHK commands.

NB2:  Whenever possible: color will be reset
via Range Selection - ELEMENT GROUP I2

For the next check select a note and enter 216.
Or just enter Z if you follow the automatic procedure.
)
        }
        If CoordCheck in 216
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_216
            Send !{right}
            Sleep, 200
            Skip_216:
            WinActivate, Check coordinates
;            MouseMove, % IN_015_X, % IN_015_Y		; I(015) Automatic placement
            MsgBox, 4096, Check coordinates, 216  Inspector Element`n`nTickbox Automatic placement`n`nI(015)`n`nALL ELEMENTS`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 217
        {
;            MouseMove, % IN_016_X, % IN_016_Y		; I(016) Reset (015) Automatic placement
            MsgBox, 4096, Check coordinates, 217  Inspector Element`n`nReset Automatic placement`n`nI(016)`n`nALL ELEMENTS`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 218
        {
            MouseMove, % IN_017_X, % IN_017_Y		; I(017) Minimum distance input field
            MsgBox, 4096, Check coordinates,
(
218  Inspector Element`n`nMinimum distance input rectangle`n`nI(017)`n`nALL ELEMENTS
The rectangles of elements WITH or WITHOUT a style button
don't occupy the same space.
E.g. texts have a style button but notes don't.
The two rectangles overlap each other a bit.
Check that the coordinates are in the overlapping area.

For the next check select a text and enter 219.
Or just enter Z if you follow the automatic procedure.
)
        }
        If CoordCheck in 219
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_219
            Send !{right}
            Sleep, 200
            Skip_219:
            WinActivate, Check coordinates
            MouseMove, % IN_017_X, % IN_017_Y		; I(017) Minimum distance input field
            MsgBox, 4096, Check coordinates,
(
219  Inspector Element`n`nMinimum distance input rectangle`n`nI(017)`n`nALL ELEMENTS

For the next check select a note and enter 220.
Or just enter Z if you follow the automatic procedure.
)
        }
        If CoordCheck in 220
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_220
            Send !{left}
            Sleep, 50
            Skip_220:
            WinActivate, Check coordinates
;            MouseMove, % IN_018_X, % IN_018_Y		; I(018) Reset Minimum distance elements WITHOUT
            MsgBox, 4096, Check coordinates, 220  Inspector Element`n`nReset Minimum distance elements`n`nWITHOUT a Style Button`n`nI(018)`n`nFor the next series of coordinates: select a text.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 221
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_221
            Send !{right}
            Skip_221:
;            MouseMove, % IN_019_X, % IN_019_Y		; I(019) Reset Minimum distance elements WITH
            MsgBox, 4096, Check coordinates, 221  Inspector Element`n`nReset Minimum distance elements`n`nWITH a Style Button`n`nI(019)`n`nFor the next series of coordinates: select a note.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 222
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_222
            Send !{left}
            Sleep, 50
            Skip_222:
            MouseMove, % IN_020_X, % IN_020_Y		; I(020) X-offset ELEMENT
            MsgBox, 4096, Check coordinates, 222  Inspector Element`n`nOffset X: rectangle`n`nI(020)`n`nAll Elements. Choose in the overlapping areas.
        }
        If CoordCheck in 223
        {
            MouseMove, % IN_021_X, % IN_021_Y		; I(021) Y-offset ELEMENT
            MsgBox, 4096, Check coordinates, 223  Inspector Element`n`nOffset Y: rectangle`n`nI(021)`n`nAll Elements. Choose in the overlapping areas.
        }
        If CoordCheck in 224
        {
            MouseMove, % IN_022_X, % IN_022_Y		; I(022) Reset (020) en (021) X/Y Offset ELEMENT
            MsgBox, 4096, Check coordinates, 224  Inspector Element`n`nReset Offset X and Y`n`nI(022)`n`nELEMENT
        }
        If CoordCheck in 225
        {
            MouseMove, % IN_023_X, % IN_023_Y		; I(023) Stacking order (Z)
            MsgBox, 4096, Check coordinates, 225  Inspector Element`n`nStacking order (Z) rectangle`n`nI(023)`n`nAll Elements. Choose in the overlapping areas.
        }
        If CoordCheck in 226
        {
;            MouseMove, % IN_024_X, % IN_024_Y		; I(024) Reset (023) stacking order
            MsgBox, 4096, Check coordinates, 226  Inspector Element`n`nReset Stacking order (Z)`n`nI(024)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 227
        {
            MouseMove, % IN_025_X, % IN_025_Y		; I(025) Segment leading space inputbox
            MsgBox, 4096, Check coordinates, 227  Inspector Segment`n`nLeading space rectangle`n`nI(025)`n`nSegment NOTES and RESTS
        }
        If CoordCheck in 228
        {
            MouseMove, % IN_026_X, % IN_026_Y		; I(026) Reset (025) Segment leading space
            MsgBox, 4096, Check coordinates, 228  Inspector Segment`n`nReset Leading space`n`nI(026)`n`nSegment NOTES and RESTS
        }
        If CoordCheck in 229
        {
            MouseMove, % IN_027_X, % IN_027_Y		; I(027) CHORD X-offset 
            MsgBox, 4096, Check coordinates, 229  Inspector Chord`n`nChord Offset X: Rectangle`n`nI(027)`n`nCHORD
        }
        If CoordCheck in 230
        {
            MouseMove, % IN_028_X, % IN_028_Y		; I(028) CHORD Y-offset
            MsgBox, 4096, Check coordinates, 230  Inspector Chord`n`nChord Offset Y: Rectangle`n`nI(028)`n`nCHORD
        }
        If CoordCheck in 231
        {
;            MouseMove, % IN_029_X, % IN_029_Y		; I(029) CHORD Reset X/Y offset (027) and (028)
            MsgBox, 4096, Check coordinates, 231  Inspector Chord`n`nChord Reset X/Y offset`n`nI(029)`n`nCHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 232
        {
            MouseMove, % IN_030_X, % IN_030_Y		; I(030) CHORD, tickbox Small
            MsgBox, 4096, Check coordinates, 232  Inspector Chord`n`nChord Tickbox Small`n`nI(030)`n`nCHORD
        }
        If CoordCheck in 233
        {
;            MouseMove, % IN_031_X, % IN_031_Y		; I(031) CHORD Reset (030) Small
            MsgBox, 4096, Check coordinates, 233  Inspector Chord`n`nReset Chord Small`n`nI(031)`n`nCHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 234
        {
            MouseMove, % IN_032_X, % IN_032_Y		; I(032) CHORD, tickbox stemless
            MsgBox, 4096, Check coordinates, 234  Inspector Chord`n`nTickbox stemless`n`nI(032)`n`nCHORD
        }
        If CoordCheck in 235
        {
;            MouseMove, % IN_033_X, % IN_033_Y		; I(033) CHORD Reset (032) CHORD, stemless
            MsgBox, 4096, Check coordinates, 235  Inspector Chord`n`nReset stemless`n`nI(033)`n`nCHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 236
        {
;            MouseMove, % IN_034_X, % IN_034_Y		; I(034) CHORD ▼ Stem direction field
        MsgBox, 4096, Check coordinates, 236  Inspector Chord`n`nStem direction rectangle`n`nI(034)`n`nCHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 237
        {
;            MouseMove, % IN_035_X, % IN_035_Y		; I(035) CHORD Reset (034) Stem direction
            MsgBox, 4096, Check coordinates, 237  Inspector Chord`n`nReset Stem direction`n`nI(035)`n`nCHORD`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 238
        {
            MouseMove, % IN_036_X, % IN_036_Y		; I(036) Note Small
            MsgBox, 4096, Check coordinates, 238  Inspector Note`n`nNote Small tickbox`n`nI(036)`n`nNOTE
        }
        If CoordCheck in 239
        {
;            MouseMove, % IN_037_X, % IN_037_Y		; I(037) Reset (036) Note Small
            MsgBox, 4096, Check coordinates, 239  Inspector Note`n`nReset Note Small`n`nI(037)`n`nNOTE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 240
        {
            MouseMove, % IN_038_X, % IN_038_Y		; I(038) Note Headgroup
            MsgBox, 4096, Check coordinates, 240  Inspector Note`n`nHeadgroup rectangle`n`nI(038)`n`nNOTE
        }
        If CoordCheck in 241
        {
;            MouseMove, % IN_039_X, % IN_039_Y		; I(039) Reset (038) Noteheads
            MsgBox, 4096, Check coordinates, 241  Inspector Note`n`nReset Headgroup`n`nI(039)`n`nNOTE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 242
        {
;            MouseMove, % IN_040_X, % IN_040_Y		; I(040) Note Head type
            MsgBox, 4096, Check coordinates, 242  Inspector Note`n`nHeadtype rectangle`n`nI(040)`n`nNOTE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 243
        {
;            MouseMove, % IN_041_X, % IN_041_Y		; I(041) Reset (040) Note Head type
            MsgBox, 4096, Check coordinates, 243  Inspector Note`n`nReset Headtype`n`nI(041)`n`nNOTE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 244
        {
;            MouseMove, % IN_042_X, % IN_042_Y		; I(042) Note Mirror Head
            MsgBox, 4096, Check coordinates, 244  Inspector Note`n`nMirror Head`n`nI(042)`n`nNOTE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 245
        {
;            MouseMove, % IN_043_X, % IN_043_Y		; I(043) Reset (042) Note Mirror Head
            MsgBox, 4096, Check coordinates, 245  Inspector Note`n`nReset Mirror Head`n`nI(043)`n`nNOTE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 246
        {
            MouseMove, % IN_044_X, % IN_044_Y		; I(044) Note Fix to line tick box
            MsgBox, 4096, Check coordinates, 246  Inspector Note`n`nFix to line tickbox`n`nI(044)`n`nNOTE
        }
        If CoordCheck in 247
        {
            MouseMove, % IN_045_X, % IN_045_Y		; I(045) Fix to linenumber input field
            MsgBox, 4096, Check coordinates, 247  Inspector Note`n`nFix to line Number rectangle`n`nI(045)`n`nNOTE
        }
        If CoordCheck in 248
        {
            MouseMove, % IN_046_X, % IN_046_Y		; I(046) Note play tick box
            MsgBox, 4096, Check coordinates, 248  Inspector Note`n`nPlay tickbox`n`nI(046)`n`nNOTE
        }
        If CoordCheck in 249
        {
            MouseMove, % IN_047_X, % IN_047_Y		; I(047) Velocity Type rectangle ▼
            MsgBox, 4096, Check coordinates, 249  Inspector Note`n`nVelocity Type rectangle`n`nI(047)`n`nNOTE`n`nNB:Condition: 'Play' must be TICKED!
        }
        If CoordCheck in 250
        {
            MouseMove, % IN_048_X, % IN_048_Y		; I(048) Reset (047) Velocity Type (to Offset)
            MsgBox, 4096, Check coordinates, 250  Inspector Note`n`nReset Velocity Type (to Offset)`n`nI(048)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 251
        {
            MouseMove, % IN_049_X, % IN_049_Y		; I(049) Velocity amount input field
            MsgBox, 4096, Check coordinates, 251  Inspector Note`n`nVelocity amount rectangle`n`nI(049)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 252
        {
            MouseMove, % IN_050_X, % IN_050_Y		; I(050) Reset (049) Velocity amount
            MsgBox, 4096, Check coordinates, 252  Inspector Note`n`nReset Velocity`n`nI(050)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 253
        {
            MouseMove, % IN_051_X, % IN_051_Y		; I(051) Select augm. dot 1
            MsgBox, 4096, Check coordinates, 253  Inspector Note`n`nSelect Dot 1`n`nI(051)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 254
        {
            MouseMove, % IN_052_X, % IN_052_Y		; I(052) Select stem
            MsgBox, 4096, Check coordinates, 254  Inspector Note`n`nSelect Stem`n`nI(052)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 255
        {
            MouseMove, % IN_053_X, % IN_053_Y		; I(053) Select hook
            MsgBox, 4096, Check coordinates, 255  Inspector Note`n`nSelect Hook (Flag)`n`nI(053)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 256
        {
            MouseMove, % IN_054_X, % IN_054_Y		; I(054) Select beam
            MsgBox, 4096, Check coordinates, 256  Inspector Note`n`nSelect Beam`n`nI(054)`n`nNOTE`n`nCondition: 'Play' is ticked.
        }
        If CoordCheck in 257
        {
            MouseMove, % IN_055_X, % IN_055_Y		; I(055) Select tuplet
            MsgBox, 4096, Check coordinates, 257  Inspector Note`n`nSelect Tuplet`n`nI(055)`n`nNOTE`n`nCondition: 'Play' is ticked.`n`nFor the next check select an augmentation dot.`n Or enter Z.
        }
        If CoordCheck in 258
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 50
            If (RepeatCheck = 1)
                Goto, Skip_258
            Click, %IN_051_X%, %IN_051_Y%		; I(051) Select augm. dot 1
            Sleep, 300
            Skip_258:
            WinActivate, Check coordinates
            MouseMove, % IN_056_X, % IN_056_Y		; I(056) Note Dot Dot position
            MsgBox, 4096, Check coordinates, 258  Inspector Augmentation dot`n`nNote Dot - Dot position`n`nI(056)`n`nNOTE DOT`n`nFor the next check select a stem.
        }
        If CoordCheck in 259
        {
            Send {Escape}
            Sleep, 50
            PixelSearch, LimeX, LimeY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB
            Click, %LimeX%, %LimeY%
            Sleep, 50
            Click, %IN_052_X%, %IN_052_Y%		; I(052) Select stem
            Sleep, 400
            WinActivate, Check coordinates
;            MouseMove, % IN_057_X, % IN_057_Y		; I(057) Stem Line thickness
            MsgBox, 4096, Check coordinates, 259  Inspector Stem`n`nLine thickness`n`nI(057)`n`nSTEM`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 260
        {
            MouseMove, % IN_058_X, % IN_058_Y		; I(058) Stem Length change
            MsgBox, 4096, Check coordinates, 260  Inspector Stem`n`nLength change rectangle`n`nI(058)`n`nSTEM
        }
        If CoordCheck in 261
        {
            MouseMove, % IN_059_X, % IN_059_Y		; I(059) Reset (058) Length change stems
            MsgBox, 4096, Check coordinates, 261  Inspector Stem`n`nReset Length change`n`nI(059)`n`nSTEM`n`nFor the next series of coordinates: select a beam.
        }
        If CoordCheck in 262
        {
            Send {Escape}
            Sleep, 50
            PixelSearch, OrangeX, OrangeY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xffaa00, , Fast RGB
            Click, %OrangeX%, %OrangeY%
            Sleep, 50
            Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
            Sleep, 300
            MouseMove, % IN_060_X, % IN_060_Y		; I(060) Beam Force horizontal
            MsgBox, 4096, Check coordinates, 262  Inspector Beam`n`nForce horizontal tickbox`n`nI(060)`n`nBEAM
        }
        If CoordCheck in 263
        {
            MouseMove, % IN_061_X, % IN_061_Y		; I(061) Reset (060) Horizontal Beams
            MsgBox, 4096, Check coordinates, 263  Inspector Beam`n`nReset Horizontal Beams`n`nI(061)`n`nBEAM
        }
        If CoordCheck in 264
        {
            MouseMove, % IN_062_X, % IN_062_Y		; I(062) Beam Custom position tick box 
            MsgBox, 4096, Check coordinates, 264  Inspector Beam`n`nCustom position tickbox `n`nI(062)`n`nBEAM
        }
        If CoordCheck in 265
        {
            MouseMove, % IN_063_X, % IN_063_Y		; I(063) Reset (062) Beam Custom position
            MsgBox, 4096, Check coordinates, 265  Inspector Beam`n`nReset Custom position`n`nI(063)`n`nBEAM
        }
        If CoordCheck in 266
        {
            MouseMove, % IN_064_X, % IN_064_Y		; I(064) Beam Position X = left handle input field
            MsgBox, 4096, Check coordinates, 266  Inspector Beam`n`nPosition X: rectangle`n`nI(064)`n`nBEAM Left handle input field
        }
        If CoordCheck in 267
        {
            MouseMove, % IN_065_X, % IN_065_Y		; I(065) Beam Position Y = right handle input field
            MsgBox, 4096, Check coordinates, 267  Inspector Beam`n`nPosition Y: rectangle`n`nI(065)`n`nBEAM Right handle input field`nNB: The 'Grow' rectangles are NOT tested.`n`nFor the next check select a tuplet number.
        }
        If CoordCheck in 268
        {
            Send {Escape}
            Sleep, 50
            PixelSearch, RedX, RedY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB
            Click, %RedX%, %RedY%
            Sleep, 50
            Click, %IN_055_X%, %IN_055_Y%		; I(055) Select tuplet
            Sleep, 300
;            MouseMove, % IN_066_X, % IN_066_Y		; I(066) Tuplet direction
            MsgBox, 4096, Check coordinates, 268  Inspector Tuplet`n`nDirection rectangle`n`nI(066)`n`nTUPLET`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 269
        {
            MouseMove, % IN_067_X, % IN_067_Y		; I(067) Tuplet number type
            MsgBox, 4096, Check coordinates, 269  Inspector Tuplet`n`nNumber type rectangle`n`nI(067)`n`nTUPLET
        }
        If CoordCheck in 270
        {
            MouseMove, % IN_068_X, % IN_068_Y		; I(068) Tuplet bracket type
            MsgBox, 4096, Check coordinates, 270  Inspector Tuplet`n`nBracket type rectangle`n`nI(068)`n`nTUPLET`n`nFor the next check`nSelect a note and UNtick 'Play'.
        }
        If CoordCheck in 271
        {
            If (RepeatCheck = 1)
                Goto, Skip_271
            PixelSearch, RedX, RedY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB
            Click, %RedX%, %RedY%
            Sleep, 50
            Click, %IN_046_X%, %IN_046_Y%		; I(046) Note play tick box
            Sleep, 50
            Skip_271:
;            MouseMove, % IN_069_X, % IN_069_Y		; I(069) Select stem when play tick box is NOT ticked
            MsgBox, 4096, Check coordinates, 271  Inspector Note with 'Play' UNticked`n`nI(069)`n`nSelect Stem rectangle`n`nNOTE`n`nFor the next check:`nSelect a Rest.`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 272
        {
            WinActivate, Check MuseScore coordinates
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_272
            Click, %IN_046_X%, %IN_046_Y%		; I(046) Note play tick box
            Sleep, 100
            PixelSearch, LimeX, LimeY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x00ff00, , Fast RGB
            Click, %LimeX%, %LimeY%
            Sleep, 50
            Send ^+{end}
            Sleep, 50
            Send {right}
            Sleep, 50
            Skip_272:
            MouseMove, % IN_070_X, % IN_070_Y		; I(070) Rest small
            MsgBox, 4096, Check coordinates, 272  Inspector Rest`n`nSmall tickbox`n`nI(070)`n`nREST
        }
        If CoordCheck in 273
        {
;            MouseMove, % IN_071_X, % IN_071_Y	; I(071) Reset (070) rests small
            MsgBox, 4096, Check coordinates, 273  Inspector Rest`n`nReset Small`n`n`n`nI(071)REST`n`nFor the next check:`nSelect a Staff Text.`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 274
        {
            Send {Escape}
            Sleep, 50
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Send !{right}
            Sleep, 100
            WinActivate, Check coordinates
;            MouseMove, % IN_072_X, % IN_072_Y		; I(072) Text Font rectangle
            MsgBox, 4096, Check coordinates, 274  Inspector Text`n`nFont rectangle`n`nI(072)`n`nTEXT`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 275
        {
            MouseMove, % IN_073_X, % IN_073_Y		; I(073) Text Font size
            MsgBox, 4096, Check coordinates, 275  Inspector Text`n`nFont size rectangle`n`nI(073)`n`nTEXT
        }
        If CoordCheck in 276
        {
            MouseMove, % IN_074_X, % IN_074_Y		; I(074) Reset (073) textsize
            MsgBox, 4096, Check coordinates, 276  Inspector Text`n`nReset Font size`n`nI(074)`n`nTEXT
        }
        If CoordCheck in 277
        {
            Click, %IN_072_X%, %IN_072_Y%		; I(072) Horizontal Scrollbar Right
            Sleep, 50
            MouseMove, % IN_075_X, % IN_075_Y		; I(075) Text Bold
            MsgBox, 4096, Check coordinates, 277  Inspector Text`n`nBold`n`nI(075)`n`nTEXT
            Click, %IN_071_X%, %IN_071_Y%		; I(071) Horizontal Scrollbar Left
        }
        If CoordCheck in 278
        {
            Click, %IN_072_X%, %IN_072_Y%		; I(072) Horizontal Scrollbar Right
            Sleep, 50
            MouseMove, % IN_076_X, % IN_076_Y		; I(076) Text Italic
            MsgBox, 4096, Check coordinates, 278  Inspector Text`n`nItalic`n`nI(076)`n`nTEXT
            Click, %IN_071_X%, %IN_071_Y%		; I(071) Horizontal Scrollbar Left
        }
        If CoordCheck in 279
        {
            Click, %IN_072_X%, %IN_072_Y%		; I(072) Horizontal Scrollbar Right
            Sleep, 50
            MouseMove, % IN_077_X, % IN_077_Y		; I(077) Text Underlined
            MsgBox, 4096, Check coordinates, 279  Inspector Text`n`nUnderlined`n`nI(077)`n`nTEXT
            Click, %IN_071_X%, %IN_071_Y%		; I(071) Horizontal Scrollbar Left
        }
        If CoordCheck in 280
        {
            Click, %IN_072_X%, %IN_072_Y%		; I(072) Horizontal Scrollbar Right
            Sleep, 50
            MouseMove, % IN_078_X, % IN_078_Y		; I(078) Reset Text Properties
            MsgBox, 4096, Check coordinates, 280  Inspector Text`n`nReset Text Properties`n`nI(078)`n`nTEXT
            Click, %IN_071_X%, %IN_071_Y%		; I(071) Horizontal Scrollbar Left
        }
        If CoordCheck in 281
        {
            MouseMove, % IN_079_X, % IN_079_Y		; I(079) Text Frame
            MsgBox, 4096, Check coordinates, 281  Inspector Text`n`nText Frame rectangle`n`nI(079)`n`nTEXT`n`nNext check is Frame:`nRectangle already selected.Enter Z.
        }
        If CoordCheck in 282
        {
            If (RepeatCheck = 1)
                Goto, Skip_282
            Click, %IN_079_X%, %IN_079_Y%		; I(079) Text Frame
            Sleep, 100
            Send r
            Sleep, 100
            Send {enter}
            Sleep, 50
            Skip_282:
            MouseMove, % IN_080_X, % IN_080_Y		; I(080) Text Border rectangle
            MsgBox, 4096, Check coordinates, 282  Inspector Text`n`nFrame-Border Color Picker rectangle`n`nI(080)`n`nTEXT and FRAME
        }
        If CoordCheck in 283
        {
            MouseMove, % IN_081_X, % IN_081_Y		; I(081) Text Thickness rectangle
            MsgBox, 4096, Check coordinates, 283  Inspector Text`n`nFrame - Thickness rectangle`n`nI(081)`n`nTEXT and FRAME
        }
        If CoordCheck in 284
        {
            MouseMove, % IN_082_X, % IN_082_Y		; I(082) Text Margin rectangle
            MsgBox, 4096, Check coordinates, 284  Inspector Text`n`nFrame - Margin rectangle`n`nI(082)`nNext: barlines
        }
        If CoordCheck in 285
        {
;            Send {Escape}
            Sleep, 50
;            If (Barline = 1)
;                Goto, Skip_285_a
            If (RepeatCheck = 1)
                Goto, Skip_285_b
            Skip_285_a:
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Send !{left}
            Sleep, 100
            WinActivate, Check coordinates
            Skip_285_b:
;            MouseMove, % IN_083_X, % IN_083_Y		; I(083) Reset Barline Style
            MsgBox, 4096, Check coordinates, 285  Inspector Barline`n`nReset Style`n`nI(083)`n`nBARLINE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 286
        {
;            MouseMove, % IN_084_X, % IN_084_Y		; I(084) Reset Barline Span from
            MsgBox, 4096, Check coordinates, 286  Inspector Barline`n`nReset Span from`n`nI(084)`n`nBARLINE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 287
        {
;            MouseMove, % IN_085_X, % IN_085_Y		; I(085) Reset Barline Span to
            MsgBox, 4096, Check coordinates, 287  Inspector Barline`n`nReset Span to`n`nI(085)`n`nBARLINE`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 288
        {
;            MouseMove, % IN_086_X, % IN_086_Y		; I(086) Barline Span presets: Default
            MsgBox, 4096, Check coordinates, 288  Inspector Barline`n`nSpan presets: rectangle Default`n`nI(086)`n`nBARLINE`n`nFor the next check:`nSelect an Articulation.`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 289
        {
            Send {Escape}
            Sleep, 50
            PixelSearch, RedX, RedY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff0000, , Fast RGB
            Click, %RedX%, %RedY%
            Sleep, 50
            Send !{right}
            Sleep, 50
;            MouseMove, % IN_087_X, % IN_087_Y		; I(087) Articulation Anchor Field rectangle
            MsgBox, 4096, Check coordinates, 289  Inspector Articulation`n`nAnchor: rectangle`n`nI(087)`n`nARTICULATION`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 290
        {
;            MouseMove, % IN_088_X, % IN_088_Y		; I(088) Reset (087) Articulation Anchor
            MsgBox, 4096, Check coordinates, 290  Inspector Articulation`n`nReset Anchor`n`nI(088)`n`nARTICULATION`n`nFor the next series of coordinates:`nSelect an Accidental.`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 291
        {
            Send {Escape}
            Sleep, 50
            PixelSearch, MediumPurpleX, MediumPurpleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xaa55ff, , Fast RGB
            Click, %MediumPurpleX%, %MediumPurpleY%
            Sleep, 300
            MouseMove, % IN_089_X, % IN_089_Y		; I(089) Accidental Small tickbox
            MsgBox, 4096, Check coordinates, 291  Inspector Accidental`n`nSmall tickbox`n`nI(089)`n`nACCIDENTAL
        }
        If CoordCheck in 292
        {
            MouseMove, % IN_090_X, % IN_090_Y		; I(090) Accidental Bracket type rectangle
            MsgBox, 4096, Check coordinates, 292  Inspector Accidental`n`nBracket type rectangle`n`nI(090)`n`nACCIDENTAL`n`nFor the next check:`nSelect a Vertical Frame.`nOr enter Z.
        }
        If CoordCheck in 293
        {
            Send {Escape}
            Sleep, 50
            WinActivate, Check MuseScore coordinates
            Sleep, 50
            PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB
            Sleep, 50
            Click, %ElementX%, %ElementY%
            Sleep, 50
            Send !{left}
            Sleep, 50
            Send !{left}
            Sleep, 50
            Send !{left}
            Sleep, 50
            Send !{left}
            Sleep, 50
;            MouseMove, % IN_091_X, % IN_091_Y		; I(091) Vertical Frame Top gap rectangle
            MsgBox, 4096, Check coordinates, 293  Inspector Vertical Frame`n`nTop gap rectangle`n`nI(091)`n`nVERTICAL FRAME`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 294
        {
;            MouseMove, % IN_092_X, % IN_092_Y		; I(092) Vertical Frame Bottom gap rectangle
            MsgBox, 4096, Check coordinates, 294  Inspector Vertical Frame`n`nBottom gap rectangle`n`nI(092)`n`nVERTICAL FRAME`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 295
        {
;            MouseMove, % IN_093_X, % IN_093_Y		; I(093) Vertical Frame Height rectangle
            MsgBox, 4096, Check coordinates, 295  Inspector Vertical Frame`n`nHeight rectangle`n`nI(093)`n`nVERTICAL FRAME`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 296
        {
;            MouseMove, % IN_094_X, % IN_094_Y		; I(094) Vertical Frame Left margin rectangle
            MsgBox, 4096, Check coordinates, 296  Inspector Vertical Frame`n`nLeft margin rectangle`n`nI(094)`n`nVERTICAL FRAME`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 297
        {
;            MouseMove, % IN_095_X, % IN_095_Y		; I(095) Vertical Frame Right margin rectangle
            MsgBox, 4096, Check coordinates, 297  Inspector Vertical Frame`n`nRight margin rectangle`n`nI(095)`n`nVERTICAL FRAME`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 298
        {
;            MouseMove, % IN_096_X, % IN_096_Y		; I(096) Vertical Frame Top margin rectangle
            MsgBox, 4096, Check coordinates, 298  Inspector Vertical Frame`n`nTop margin rectangle`n`nI(096)`n`nVERTICAL FRAME`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 299
        {
;            MouseMove, % IN_097_X, % IN_097_Y		; I(097) Vertical Frame Bottom margin rectangle
            MsgBox, 4096, Check coordinates, 299  Inspector Vertical Frame`n`nBottom margin rectangle`n`nI(097)`n`nVERTICAL FRAME`n`nFor the next series of coordinates:`nSelect a Fretboard Diagram.`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 300
        {
            If (RepeatCheck = 1)
                Goto, Skip_300
            PixelSearch, BlueX, BlueY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB
            Click, %BlueX%, %BlueY%
            Sleep, 50
            Send !{right}
            Sleep, 100
            Skip_300:
;            MouseMove, % IN_098_X, % IN_098_Y		; I(098) Fretboard Diagram, spot in free space under 'Multiple Dots'
            MsgBox, 4096, Check coordinates, 300  Inspector Fretboard Diagram`n`nA spot in the free space under 'Multiple Dots`n`nI(098)'`n`nFRETBOARD DIAGRAM`n`nFor the next series of coordinates:`nSelect a Spacer.`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If (CoordCheck = 301) || (CoordCheck = 999)
        {
            If (RepeatCheck = 1)
                Goto, Skip_301
            PixelSearch, LbcX, LbcY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorLBC, , Fast RGB
            Click, %LbcX%, %LbcY%
            Sleep, 50
            Skip_301:
;            MouseMove, % IN_099_X, % IN_099_Y		; I(099) Spacer Height rectangle
            MsgBox, 4096, Check coordinates,
(
301  Inspector Spacer`n`nHeight rectangle`n`nSPACER`n`nI(099)
`n`nYou can skip this test.`nThis item has been left out in this AHK kit.

For the next check,
select the magenta colored note '212'.
Rightclick. Select 'More'.
In Inputbox: type 1000
)
        }
/*
        If CoordCheck in 302
        {
            MouseMove, % IN_100_X, % IN_100_Y		; I(100) MessageBox stacking order: to OK
            MsgBox, 4096, Check coordinates, 302  MsgBox stacking order`n`nHeight rectangle`n`nSPACER`n`nI(100)`n`nFor the next series of coordinates:`nSelect a Note , rightclick, select 'More'.`nEnter: 1000`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
*/
        If (CoordCheck = 1000)
        {
            GroupClose, Coordinates, A
            Sleep, 50
            Send {Escape}
            Sleep, 300
            CoordMode, Mouse, Screen
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Sleep, 50
            Click, right
            Sleep, 50
            Send {up}					; executing each line adds 30 ms of sleep
            Sleep, 50
            Send {up}					; this delay is needed when many notes are selected
            Sleep, 50
            Send {up}
            Sleep, 50
            Send {up}
            Sleep, 50
            Send {right}
            Sleep, 50
            Send {up}
            Sleep, 50
            Send {Enter}				; opens Window Select Notes
            Sleep, 200					; increase sleeptime if needed
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_01X, % WSN_01Y		; (WSN_01) Window Select Notes Same notehead
            MsgBox, 4096, Check coordinates,
(
1000  Select Notes (4x up)`n`nSame notehead.`n`n(WSN_01)

You can skip this test.
This item has been left out in this AHK kit.

All elements on the canvas have their contextual menu.
You reach it by a rightclick. And then:
For Notes, Grace Notes and Rests: 4x arrow up -> More
For all other elements: 6x arrow down -> More
The window 'Select Notes' is unique.

Rests (4x up) have the same window as all other elements (6x down).
Stems, Beams and Hooks (Flags) share this same window (6x down).

Before you check the coordinates:
First minimize the window 'Select Notes'.
Now the coordinates will always be valid as long as the window stays minimized.

NB: The coordinates are relative to the Active Window.
)
        }
        If CoordCheck in 1001
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
            MouseMove, % WSN_02X, % WSN_02Y		; (WSN_02) Window Select Notes same pitch
            MsgBox, 4096, Check coordinates, 1001  Select Notes`n`nSame pitch`n`n(WSN_02)
        }
        If CoordCheck in 1002
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_03X, % WSN_03Y		; (WSN_03) Window Select Notes same type
            MsgBox, 4096, Check coordinates, 1002  Select Notes`n`nSame type`n`n(WSN_03)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1003
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_04X, % WSN_04Y		; (WSN_04) Window Select Notes same note type
            MsgBox, 4096, Check coordinates, 1003  Select Notes`n`nSame note type`n`n(WSN_04)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1004
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
            MouseMove, % WSN_05X, % WSN_05Y		; (WSN_05) Window Select Notes same duration
            MsgBox, 4096, Check coordinates, 1004  Select Notes`n`nSame duration`n`n(WSN_05)
        }
        If CoordCheck in 1005
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
            MouseMove, % WSN_06X, % WSN_06Y		; (WSN_06) Window Select Notes same note name
            MsgBox, 4096, Check coordinates, 1005  Select Notes`n`nSame note name`n`n(WSN_06)
        }
        If CoordCheck in 1006
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
            MouseMove, % WSN_07X, % WSN_07Y		; (WSN_07) Window Select Notes same staff
            MsgBox, 4096, Check coordinates, 1006  Select Notes`n`nSame staff`n`n(WSN_07)
        }
        If CoordCheck in 1007
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
            MouseMove, % WSN_08X, % WSN_08Y		; (WSN_08) Window Select Notes In selection
            MsgBox, 4096, Check coordinates, 1007  Select Notes`n`nIn selection`n`n(WSN_08)
        }
        If CoordCheck in 1008
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
            MouseMove, % WSN_09X, % WSN_09Y		; (WSN_09) Window Select Notes Same voice
            MsgBox, 4096, Check coordinates, 1008  Select Notes`n`nSame voice`n`n(WSN_09)
        }
        If CoordCheck in 1009
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_10X, % WSN_10Y		; (WSN_10) Window Select Notes Same system
            MsgBox, 4096, Check coordinates, 1009  Select Notes`n`nSame system`n`n(WSN_10)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1010
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_11X, % WSN_11Y		; (WSN_11) Window Select Notes Replace selection
            MsgBox, 4096, Check coordinates, 1010  Select Notes`n`nReplace selection`n`n(WSN_11)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1011
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_12X, % WSN_12Y		; (WSN_12) Window Select Notes add to selection
            MsgBox, 4096, Check coordinates, 1011  Select Notes`n`nAdd to selection`n`n(WSN_12)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1012
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_13X, % WSN_13Y		; (WSN_13) Window Select Notes search in selection
            MsgBox, 4096, Check coordinates, 1012  Select Notes`n`nSearch in selection`n`n(WSN_13)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1013
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
;            MouseMove, % WSN_14X, % WSN_14Y		; (WSN_14) Window Select Notes subtract from selection
            MsgBox, 4096, Check coordinates, 1013  Select Notes`n`nSubtract from selection`n`n(WSN_14)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If (CoordCheck = 1014) || (CoordCheck = 1099)
        {
            CoordMode, Mouse, Window
            WinActivate, Select Notes
            Sleep, 50
;            MouseMove, % WSN_15X, % WSN_15Y		; (WSN_15) Window Select Notes OK
            MsgBox, 4096, Check coordinates, 1014  Select Notes`n`nOK`n`n(WSN_15)`n`nFor the next check:`nSelect a Dynamic , rightclick, select 'More'.`nEnter: 1100`nOr enter Z.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
    If CoordCheck in 1100
        {
            WinActivate, Select Notes
            Sleep, 100
            GroupClose, Coordinates, A
            Sleep, 50
            CoordMode, Mouse, Screen
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Send !{right}
            Sleep, 100
            Send !{right}				; selects dynamic
            Sleep, 100
            PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB
            MouseMove, ElementX, ElementY
            Click, right
            Sleep, 100
            Loop, 6
            {
                Send {down}
                Sleep, 50
            }
            Sleep, 100					; important!
            Send {right}
            Sleep, 50
            Send {up}
            Sleep, 50
            Send {Enter}				; opens Window Select
            Sleep, 200					; increase sleeptime if needed
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
            MouseMove, % WS_01_X, % WS_01_Y		; (WS_01) Window Select same subtype
            MsgBox, 4096, Check coordinates,
(
1100  Select`n`nSame subtype`n`n`(WS_01)

Before you check the coordinates:
First minimize the window 'Select'.
Now the coordinates will always be valid
as long as the window stays minimized.
)
        }
        If CoordCheck in 1101
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
            MouseMove, % WS_02_X, % WS_02_Y		; (WS_02) Window Select same staff
            MsgBox, 4096, Check coordinates, 1101  Select`n`nSame staff`n`n`(WS_02)
        }
        If CoordCheck in 1102
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
            MouseMove, % WS_03_X, % WS_03_Y		; (WS_03) Window Select in selection
            MsgBox, 4096, Check coordinates, 1102  Select`n`nIn selection`n`n`(WS_03)
        }
        If CoordCheck in 1103
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
            MouseMove, % WS_04_X, % WS_04_Y		; (WS_04) Window Select same voice
            MsgBox, 4096, Check coordinates, 1103  Select`n`nSame voice`n`n`(WS_04)
        }
        If CoordCheck in 1104
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
            MouseMove, % WS_05_X, % WS_05_Y		; (WS_05) Window Select same system
            MsgBox, 4096, Check coordinates, 1104  Select`n`nSame system`n`n`(WS_05)
        }
        If CoordCheck in 1105
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
;            MouseMove, % WS_06_X, % WS_06_Y		; (WS_06) Window Select same duration
            MsgBox, 4096, Check coordinates, 1105  Select`n`nSame duration`n`n`(WS_06)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1106
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
;            MouseMove, % WS_07_X, % WS_07_Y		; (WS_07) Window Select Replace selection
            MsgBox, 4096, Check coordinates, 1106  Select`n`nReplace selection`n`n`(WS_07)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1107
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
;            MouseMove, % WS_08_X, % WS_08_Y		; (WS_08) Window Select Add to selection
            MsgBox, 4096, Check coordinates, 1107  Select`n`nAdd to selection`n`n`(WS_08)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1108
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
;            MouseMove, % WS_09_X, % WS_09_Y		; (WS_09) Window Select Search in selection
            MsgBox, 4096, Check coordinates, 1108  Select`n`nSearch in selection`n`n`(WS_09)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1109
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
;            MouseMove, % WS_10_X, % WS_10_Y		; (WS_10) Window Select Subtract from selection
            MsgBox, 4096, Check coordinates, 1109  Select`n`nSubtract from selection`n`n`(WS_10)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If (CoordCheck = 1110) || (CoordCheck = 1199)
        {
            CoordMode, Mouse, Window
            WinActivate, Select
            Sleep, 50
            MouseMove, % WS_11_X, % WS_11_Y		; (WS_11) Window Select OK
            MsgBox, 4096, Check coordinates,
(
1110  Select`n`nOK`n`n(WS_11)`n`nFor the next series of coordinates:
Select a Note , rightclick, select 'Staff/Part Properties'.
Enter: 1200
Or enter Z.
)
        }
        If CoordCheck in 1200
        {
            Send {Escape}
            Sleep, 50
            GroupClose, Coordinates, A
            Sleep, 100
            CoordMode, Mouse, Screen
            Send {Escape}
            Sleep, 50
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Sleep, 100
            Click, right
            Sleep, 100
            Send {down}
            Sleep, 50
            Send {enter}
            Sleep, 100
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_01X, % WSPP_01Y		; (WSPP_01) Window Staff/Part PropertiesSmall staff tickbox 
            MsgBox, 4096, Check coordinates,
(
1200  Staff/Part Properties`n`nSmall staff tickbox`n`n(WSPP_01)

When you check the coordinates:
The height of the window 'Staff/Part Properties'
will first be sized according to your setting.
Now the coordinates will always be valid.
)
        }
        If CoordCheck in 1201
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
;            MouseMove, % WSPP_02X, % WSPP_02Y		; (WSPP_02) Window Staff/Part Properties Cutaway tickbox
            MsgBox, 4096, Check coordinates, 1201  Staff/Part Properties`n`nCutaway tickbox`n`n(WSPP_02)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1202
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_03X, % WSPP_03Y		; (WSPP_03) Window Staff/Part Properties Extra distance above staff
            MsgBox, 4096, Check coordinates, 1202  Staff/Part Properties`n`nExtra distance above staff rectangle`n`n(WSPP_03)
        }
        If CoordCheck in 1203
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_04X, % WSPP_04Y		; (WSPP_04) Window Staff/Part Properties Lower right corner of Long instrument name
            MsgBox, 4096, Check coordinates, 1203  Staff/Part Properties`n`nLower right corner of Long instrument name`n`n(WSPP_04)
        }
        If CoordCheck in 1204
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_05X, % WSPP_05Y		; (WSPP_05) Window Staff/Part Properties Lower right corner of Short instrument name
            MsgBox, 4096, Check coordinates, 1204  Staff/Part Properties`n`nLower right corner of Short instrument name`n`n(WSPP_05)
        }
        If CoordCheck in 1205
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_06X, % WSPP_06Y		; (WSPP_06) Window Staff/Part Properties Next staff ↓
            MsgBox, 4096, Check coordinates, 1205  Staff/Part Properties`n`nNext staff ↓`n`n(WSPP_06)
        }
        If CoordCheck in 1206
        {
            CoordMode, Mouse, Window    
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
;            MouseMove, % WSPP_07X, % WSPP_07Y		; (WSPP_07) Window Staff/Part Properties Previous staff ↑
            MsgBox, 4096, Check coordinates, 1206  Staff/Part Properties`n`nPrevious staff ↑`n`n(WSPP_07)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1207
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_08X, % WSPP_08Y		; (WSPP_08) OK Window Staff/Part Properties
            MsgBox, 4096, Check coordinates, 1207  Staff/Part Properties`n`nOK`n`n(WSPP_08)
        }
        If (CoordCheck = 1208) || (CoordCheck = 1299)
        {
            CoordMode, Mouse, Window
            WinActivate, Staff/Part Properties
            Winmove, Staff/Part Properties, , , , Default, % WSPPHeight
            Sleep, 50
            MouseMove, % WSPP_09X, % WSPP_09Y		; (WSPP_09) Apply Window Staff/Part Properties
            MsgBox, 4096, Check coordinates,
(
1208  Staff/Part Properties`n`nApply`n`n(WSPP_09)
For the next series of coordinates:
Select a Note , rightclick.
Select 'Measure Properties'
Enter: 1300.
Or enter Z.
)
        }
        If CoordCheck in 1300
        {
            Send {Escape}
            Sleep, 50
            CoordMode, Mouse, Screen
            GroupClose, Coordinates, A
            Sleep, 100
            Send {Escape}				; deselect magenta note
            Sleep, 100
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Sleep, 50
            Click, right
            Sleep, 100
            Send {down}
            Sleep, 50
            Send {down}
            Sleep, 50
            Send {enter}
            Sleep, 200
            CoordMode, Mouse, Window
            Skip_1300:
            WinActivate, , Measure Properties
            Sleep, 50
            MouseMove, % WMPP_01X, % WMPP_01Y		; (WMPP_01) Window Measure Properties Duration Actual
            MsgBox, 4096, Check coordinates,
(
1300  Measure Properties`n`nMeasure Duration Actual rectangle`n`n(WMPP_01)

Before you check the coordinates:
First minimize the window 'Measure Properties'.
Now the coordinates will always be valid
as long as the window stays minimized.
)
        }
        If CoordCheck in 1301
        {
            CoordMode, Mouse, Window
            WinActivate, , Measure Properties
            Sleep, 50
            MouseMove, % WMPP_02X, % WMPP_02Y		; (WMPP_02) Window Measure Properties Exclude from measure count tickbox
            MsgBox, 4096, Check coordinates, 1301  Measure Properties`n`nExclude from measure count tickbox`n`n(WMPP_02)
        }
        If CoordCheck in 1302
        {
            CoordMode, Mouse, Window
            WinActivate, , Measure Properties
            Sleep, 50
            MouseMove, % WMPP_03X, % WMPP_03Y			; (WMPP_03) Window Measure Properties To next measure →
            MsgBox, 4096, Check coordinates, 1302  Measure Properties`n`nTo next measure →`n`n(WMPP_03)
        }
        If CoordCheck in 1303
        {
            CoordMode, Mouse, Window
            WinActivate, , Measure Properties
            Sleep, 50
            MouseMove, % WMPP_04X, % WMPP_04Y			; (WMPP_04) Window Measure Properties Apply
            MsgBox, 4096, Check coordinates, 1303  Measure Properties`n`nApply`n`n(WMPP_04)
        }
        If (CoordCheck = 1304) ||(CoordCheck = 1399)
        {
            CoordMode, Mouse, Window
            WinActivate, , Measure Properties
            Sleep, 50
            MouseMove, % WMPP_05X, % WMPP_05Y			; (WMPP_05) Window Measure Properties OK
            MsgBox, 4096, Check coordinates,
(
1304  Measure Properties`n`nOK`n`n(WMPP_05)
For the next check:
Go to 'Style'. Select 'Page'.
Enter: 1400.
Or enter Z.
)
        }
        If CoordCheck in 1400
        {
            GroupClose, Coordinates, A
            Sleep, 100
            Send !o							; Menu Tools
            Sleep, 100
            Send {enter}						; Style
            Sleep, 400
            Send {home}
            Sleep, 100
            Send p							; Page
            Sleep, 300
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
;            MouseMove, % STY_01X, % STY_01Y				; (STY_01) Window Style Page OK
            MsgBox, 4096, Check coordinates,    
(
1400  Style - Page`n`nOK`n`n(STY_01)

You can skip this test.
This item has been left out in this AHK kit.

Before you check the coordinates:
The height and width of the window you
must already have entered in the
coordinates file. (WSTYHeight and WSTYWidth)
)
        }
        If CoordCheck in 1401
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
;            MouseMove, % STY_02X, % STY_02Y				; (STY_02) Window Style Page Cancel
            MsgBox, 4096, Check coordinates, 1401  Style - General`n`nCancel`n`n(STY_02)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1402
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
;            MouseMove, % STY_03X, % STY_03Y				; (STY_03) Window Style Page Apply to all Parts
            MsgBox, 4096, Check coordinates, 1402  Style - General`n`nApply to all Parts`n`n(STY_03)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1403
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_04X, % STY_04Y				; (STY_04) Window Style Page Music top margin rectangle
            MsgBox, 4096, Check coordinates, 1403  Style - Page`n`nMusic top margin rectangle`n`n(STY_04)
        }
        If CoordCheck in 1404
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_05X, % STY_05Y				; (STY_05) Window Style Page Music bottom margin rectangle
            MsgBox, 4096, Check coordinates, 1404  Style - Page`n`nMusic bottom margin rectangle`n`n(STY_05)
        }    
        If CoordCheck in 1405
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_06X, % STY_06Y				; (STY_06) Window Style Page Staff distance rectangle
            MsgBox, 4096, Check coordinates, 1405  Style - Page`n`nStaff distance rectangle`n`n(STY_06)
        }
        If CoordCheck in 1406
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_07X, % STY_07Y				; (STY_07) Window Style Page Grand staff distance rectangle
            MsgBox, 4096, Check coordinates, 1406  Style - Page`n`nGrand staff distance rectangle`n`n(STY_07)
        }
        If CoordCheck in 1407
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_08X, % STY_08Y				; (STY_08) Window Style Page Min. system distance rectangle
            MsgBox, 4096, Check coordinates, 1407  Style - Page`n`nMin. system distance rectangle`n`n(STY_08)
        }
        If CoordCheck in 1408
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_09X, % STY_09Y				; (STY_09) Window Style Page Max. system distance rectangle
            MsgBox, 4096, Check coordinates, 1408  Style - Page`n`nMax. system distance rectangle`n`n(STY_09)
        }
        If CoordCheck in 1409
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_10X, % STY_10Y				; (STY_10) Window Style Page Vertical frame top margin rectangle
            MsgBox, 4096, Check coordinates, 1409  Style - Page`n`nVertical frame top margin rectangle`n`n(STY_10)
        }
        If CoordCheck in 1410
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_11X, % STY_11Y				; (STY_11) Window Style Page Vertical frame bottom margin rectangle
            MsgBox, 4096, Check coordinates, 1410  Style - Page`n`nVertical frame bottom margin rectangle`n`n(STY_11)
        }
        If CoordCheck in 1411
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_12X, % STY_12Y				; (STY_12) Window Style Page Last system fill threshold rectangle
            MsgBox, 4096, Check coordinates, 1411  Style - Page`n`nLast system fill threshold rectangle`n`n(STY_12)
        }
        If CoordCheck in 1412
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
;            MouseMove, % STY_13X, % STY_13Y				; (STY_13) Window Style Page Courtesy Time Signatures tickbox
            MsgBox, 4096, Check coordinates,
(
1412  Style - Page`n`nCourtesy Time Signatures tickbox`n`n(STY_13)`n`n
You can skip this test.
This item has been left out in this AHK kit.

For the next series of coordinates:
Within 'Style' select 'Header, Footer'.
Or enter Z.
)
        }
        If CoordCheck in 1413
        {
            If (RepeatCheck = 1)
                Goto, Skip_1413
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            Send h
            Sleep, 100
            Skip_1413:
            MouseMove, % STY_14X, % STY_14Y				; (STY_14) Window Style Header, Footer Page Left Odd Header topleft
            MsgBox, 4096, Check coordinates, 1413  Style - Header, Footer`n`nPage Left Odd Header topleft`n`n(STY_14)
        }
        If CoordCheck in 1414
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_15X, % STY_15Y				; (STY_15) Window Style Header, Footer Page Left Even Header topleft
            MsgBox, 4096, Check coordinates, 1414  Style - Header, Footer`n`nPage Left Even Header topleft`n`n(STY_15)
        }
        If CoordCheck in 1415
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_16X, % STY_16Y				; (STY_16) Window Style Header, Footer Page Middle Odd Header topleft
            MsgBox, 4096, Check coordinates, 1415  Style - Header, Footer`n`nPage Middle Odd Header topleft`n`n(STY_16)
        }
        If CoordCheck in 1416
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_17X, % STY_17Y				; (STY_17) Window Style Header, Footer Page Middle Even Header topleft
            MsgBox, 4096, Check coordinates, 1416  Style - Header, Footer`n`nPage Middle Even Header topleft`n`n(STY_17)
        }
        If CoordCheck in 1417
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_18X, % STY_18Y				; (STY_18) Window Style Header, Footer Page Right Odd Header topleft
            MsgBox, 4096, Check coordinates, 1417  Style - Header, Footer`n`nPage Right Odd Header topleft`n`n(STY_18)
        }
        If CoordCheck in 1418
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_19X, % STY_19Y				; (STY_19) Window Style Header, Footer Page Right Even Header topleft
            MsgBox, 4096, Check coordinates, 1418  Style - Header, Footer`n`nPage Right Even Header topleft`n`n(STY_19)
        }
        If CoordCheck in 1419
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_20X, % STY_20Y				; (STY_20) Window Style Header, Footer Page Left Odd Footer topleft
            MsgBox, 4096, Check coordinates, 1419  Style - Header, Footer`n`nPage Left Odd Footer topleft`n`n(STY_20)
        }
        If CoordCheck in 1420
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_21X, % STY_21Y				; (STY_21) Window Style Header, Footer Page Left Even Footer topleft
            MsgBox, 4096, Check coordinates, 1420  Style - Header, Footer`n`nPage Left Even Footer topleft`n`n(STY_21)
        }
        If CoordCheck in 1421
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_22X, % STY_22Y				; (STY_22) Window Style Header, Footer Page Middle Odd Footer topleft
            MsgBox, 4096, Check coordinates, 1421  Style - Header, Footer`n`nPage Middle Odd Footer topleft`n`n(STY_22)
        }
        If CoordCheck in 1422
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_23X, % STY_23Y				; (STY_23) Window Style Header, Footer Page Middle Even Footer topleft
            MsgBox, 4096, Check coordinates, 1422  Style - Header, Footer`n`nPage Middle Even Footer topleft`n`n(STY_23)
        }
        If CoordCheck in 1423
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_24X, % STY_24Y				; (STY_24) Window Style Header, Footer Page Right Odd Footer topleft
            MsgBox, 4096, Check coordinates, 1423  Style - Header, Footer`n`nPage Right Odd Footer topleft`n`n(STY_24)
        }
        If CoordCheck in 1424
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            MouseMove, % STY_25X, % STY_25Y				; (STY_25) Window Style Header, Footer Page Right Even Footer topleft
        MsgBox, 4096, Check coordinates, 1424  Style - Header, Footer`n`nPage Right Even Footer topleft`n`n(STY_25)`n`nWithin the Style Window: select 'Score'.`Or enter Z.
        }
        If CoordCheck in 1425
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            If (RepeatCheck = 1)
                Goto, Skip_1425
            Sleep, 50
            Send {home}
            Sleep, 100
            Skip_1425:
;            MouseMove, % STY_26X, % STY_26Y				; (STY_26) Window Style Score Hide empty staves within systems
            MsgBox, 4096, Check coordinates, 1425  Style - Score`n`nHide empty staves within systems`n`n(STY_26)`n`nWithin the Style Window: select 'Slurs and Ties'.`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If CoordCheck in 1426
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
            If (RepeatCheck = 1)
                Goto, Skip_1426
            Send v							; to volta
            Sleep, 600
            Send {up}
            Sleep, 100
            Send {up}
            Sleep, 100
            Skip_1426:
;            MouseMove, % STY_27X, % STY_27Y				; (STY_27) Window Style Slurs and Ties Line thickness middle
            MsgBox, 4096, Check coordinates, 1426  Style - Slurs and Ties`n`nLine thickness middle`n`n(STY_27)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If (CoordCheck = 1427) || (CoordCheck = 1499)
        {
            CoordMode, Mouse, Window
            WinActivate, Style
            Winmove, Style, , , , % WSTYWidth, % WSTYHeight
            Sleep, 50
;            MouseMove, % STY_28X, % STY_28Y				; (STY_28) Window Style Slurs and Ties Line thickness Reset
            MsgBox, 4096, Check coordinates,
(
1427  Style - Slurs and Ties`n`nLine thickness Reset`n`n(STY_28)

You can skip this test.
This item has been left out in this AHK kit.

For the next check:
Open 'Preferences' and select the tab 'Shortcuts'.
Type in InputBox: 1500
Or enter Z.
)
        }
        If CoordCheck in 1500
        {
            GroupClose, Coordinates, A
            Sleep, 100
            If (RepeatCheck = 1)
                Goto, Skip_1500
            WinClose, Style
            Sleep, 50
            Send !e							; opens Menu Edit
            Sleep, 100
            Send {up}							; to Preferences
            Sleep, 50
            Send {Enter}
            Sleep, 600
            Skip_1500:
            CoordMode, Mouse, Window
            MouseMove, % Tab_Sc_X, % Tab_Sc_Y				; (Tab_Sc) Window Preferences Tab Shortcuts
            MsgBox, 4096, Check coordinates,
(
1500  Preferences`n`nTab Shortcuts`n`n(TAB_SC)

Before you check the coordinates:
Minimize the window 'MuseScore Preferences'.
To repeat the command: enter Q first.
)
        }
        If (CoordCheck = 1501) || (CoordCheck = 1599)
        {
            CoordMode, Mouse, Window
            WinActivate, MuseScore Preferences
            Sleep, 50
            Click, %Tab_Sc_X%, %Tab_Sc_Y%				; (Tab_Sc) Window Preferences Tab Shortcuts
            MouseMove, % Pref_Search_X, % Pref_Search_Y			; (Pref_Search) Window Preferences Search rectangle
            MsgBox, 4096, Check coordinates,
(
1501  Preferences`n`nSearch rectangle`n`n(PREF_SEARCH)

For the next check:
Open the 'Master Palette' SYMBOLS.
Enter: 1600.
Or enter Z.
)
        }
        If CoordCheck in 1600
        {
            GroupClose, Coordinates, A
            Sleep, 100
            Send {Escape}
            Sleep, 50
            Send +{f9}
            Sleep, 300
            Send {end}
            Sleep, 300
            CoordMode, Mouse, Window
            WinActivate, Master Palette
            Sleep, 50
            MouseMove, % WMPS_01X, % WMPS_01Y			; (WMPS_01) Master Palette symbols Search rectangle
            MsgBox, 4096, Check coordinates, 1600  Master Palette Symbols`n`nSearch rectangle`n`n(WMPS_01)
        }
        If CoordCheck in 1601
        {
            CoordMode, Mouse, Window
            WinActivate, Master Palette
            Sleep, 50
            MouseMove, % WMPS_02X, % WMPS_02Y			; (WMPS_02) Master Palette symbols, Clear rectangle
            MsgBox, 4096, Check coordinates, 1601  Master Palette Symbols`n`nClear rectangulle`n(WMPS_02)
        }
        If CoordCheck in 1602
        {
            CoordMode, Mouse, Window
            WinActivate, Master Palette
            Sleep, 50
;            MouseMove, % WMPS_03X, % WMPS_03Y			; (WMPS_03) Master Palette symbols, System flag tickbox
            MsgBox, 4096, Check coordinates, 1602  Master Palette Symbols`n`nSystem flag tickbox`n`n(WMPS_03)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If (CoordCheck = 1603) || (CoordCheck = 1699)
        {
            CoordMode, Mouse, Window
            WinActivate, Master Palette
            Sleep, 50
;            MouseMove, % WMPS_04X, % WMPS_04Y			; (WMPS_04) Master Palette symbols, Font selection rectangle
            MsgBox, 4096, Check coordinates,
(
1603  Master Palette Symbols`n`nFont selection rectangle`n`n(WMPS_04)

You can skip this test.
This item has been left out in this AHK kit.

For the next check:
Create a staff text. While editing press F2 to
Open the window 'Special Characters'.
Enter: 1700.
Or enter Z.
)
        }
        If CoordCheck in 1700
        {
            Send {Escape}
            Sleep, 50
            If (RepeatCheck = 1)
                Goto, Skip_1700
            WinClose, Master Palette
            Sleep, 100
            Send {Escape}
            Sleep, 50
            PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
            Click, %MagentaX%, %MagentaY%
            Send !{right}
            Sleep, 300
            PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
            Click, %ElementX%, %ElementY%, 2
            Sleep, 100
            Send {f2}
            Sleep, 500
            CoordMode, Mouse, Window
            Skip_1700:
            WinActivate, Special Characters
            WinMove, Special Characters, , , , WSC_Width2, WSC_Height2
            Sleep, 50
            MouseMove, % WSC_01X, % WSC_01Y				; (WSC_01) Window Special Characters Tab Common Symbols
            MsgBox, 4096, Check coordinates,
(
1700  Special Characters`n`nTab Common Symbols`n`n(WSC_01)

Before you check the coordinates:
Minimize the window 'Special Characters'.
)
        }
        If CoordCheck in 1701
        {
            Send {Escape}
            Sleep, 50
            CoordMode, Mouse, Window
            WinActivate, Special Characters
            WinMove, Special Characters, , , , WSC_Width2, WSC_Height2
            Sleep, 50
            MouseMove, % WSC_02X, % WSC_02Y				; (WSC_02) Window Special Characters Flat
            MsgBox, 4096, Check coordinates, 1701  Special Characters`n`nFlat`n`n(WSC_02)
        }
        If CoordCheck in 1702
        {
            Send {Escape}
            Sleep, 50
            CoordMode, Mouse, Window
            WinActivate, Special Characters
            WinMove, Special Characters, , , , WSC_Width2, WSC_Height2
            Sleep, 50
;            MouseMove, % WSC_03X, % WSC_03Y				; (WSC_03) Window Special Characters Natural
            MsgBox, 4096, Check coordinates, 1702  Special Characters`n`nNatural`n`n(WSC_03)`n`nYou can skip this test.`nThis item has been left out in this AHK kit.
        }
        If (CoordCheck = 1703) || (CoordCheck = 1799)
        {
            Send {Escape}
            Sleep, 50
            CoordMode, Mouse, Window
            WinActivate, Special Characters
            WinMove, Special Characters, , , , WSC_Width2, WSC_Height2
            Sleep, 50
;            MouseMove, % WSC_04X, % WSC_04Y				; (WSC_04) Window Special Characters Sharp
            MsgBox, 4096, Check coordinates,
(
1703  Special Characters`n`nSharp`n`n(WSC_04)

You can skip this test.
This item has been left out in this AHK kit.

For the next check:
Open the window 'Select Color'.
Minimize it.
Enter: 1800.
Or enter Z.
)
        }
        If (CoordCheck = 1800) || (CoordCheck = 1899)
        {
            Send {Escape}
            Sleep, 50
            WinClose, Special Characters
            Sleep, 100
            Send {Escape}
            Sleep, 50
            PixelSearch, BlueX, BlueY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0x0000ff, , Fast RGB
            Click, %BlueX%, %BlueY%
            Sleep, 50
            Click, %IN_012_X%, %IN_012_Y%			; I(012) color rectangle (black) - all elements OVERLAP
            Sleep, 200
            CoordMode, Mouse, Window
            Sleep, 50
            Skip_1800:
            MouseMove, % RGB_X, % RGB_Y				; (RGB) Window Select Color HTML: #RGB rectangle
            MsgBox, 4096, Check coordinates,
(
1800  Select Color`n`nHTML: #RGB rectangle`n`n(RGB)

The next series of coordinates
are Canvas elements.

Enter: 1900.
Or enter Z.
)
        }
        If CoordCheck in 1900
        {
            Send {Escape}
            Sleep, 50
            MsgBox, 4401, Check coordinates, 1900  Canvas Search Area`n`nPerform this check preferably`non an empty part of the score.`n`n(CSA)
            IfMsgBox, Cancel
                Continue
            If (RepeatCheck = 1)
                Goto, Skip_1900
            WinClose, Select Color
            Sleep, 100
            Skip_1900:
            CoordMode, Mouse, Screen
            SendMode, Event
            Send {Shift Down}{Click, %CSA_X1%, %CSA_Y1% down}
            Sleep, 100
            MouseMove, % CSA_X2, % CSA_Y2, 100	; moves with slowest speed
            Sleep, 3000
            Send {Lbutton up}{Shift up}
            SendMode, Input
            Send {Escape}
            MsgBox, 4096, Check coordinates,
(
1900 The next three checks are about the ViewType,
Page/Continuous View or Single Page,
the Zoomfactor percentage field and
the dropdown for Page Width, Whole Page or
Two Pages.

If unvisible open the Toolbar File Operations.
Or enter Z.

The check of the Defined State is temporarily suspended.
After the three View checks the Toolbar will return
to its Defined State.
)
        }
        If CoordCheck in 1901
        {
            MsgBox, 4096, Check coordinates,
(
1901  Single/Page/Continuous View rectangle`n`nIn Toolbar File Operations`n`n(SPCView)

If unvisible open the Toolbar File Operations
for this and the next two verifications.
Or press OK for the automatic procedure.
The check of the Defined State is temporarily suspended.
At the end of the View checks the Toolbar will return
to its Defined State.
)
            Send {Escape}
            Sleep, 50
            CoordMode, Mouse, Screen
            MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
            Click, right
            Sleep, 150
            ImageSearch, Tick_X, Tick_Y, FileOpTick_X1, FileOpTick_Y1, FileOpTick_X2, FileOpTick_Y2, *40 CTS_Checked_ticked_sign.png
            If (Errorlevel = 1)					; if File Operations unticked
            {
                MouseMove, FileOpTick_X1 + ToolBTickOffset_X, FileOpTick_Y1 + ToolBTickOffset_Y
                Click						; show File Operations
                Sleep, 50
            }
            If (ErrorLevel = 0)					; when toolbar File Operations is already present
                Click, %ToolBarSel_X%, %ToolBarSel_Y%
            Sleep, 50
            MouseMove, % SPCView_X, % SPCView_Y
            MsgBox, 4096, Check coordinates, 1901  Single/Page/Continuous View rectangle`n`nIn Toolbar File Operations`n`n(SPCView)
        }
        If CoordCheck in 1902
        {
            Send {Escape}
            Sleep, 50
            MouseMove, % ZoomPerc_X, % ZoomPerc_Y
            MsgBox, 4096, Check coordinates, 1902  Zoom Percentage rectangle`n`nIn Toolbar File Operations`n`n(ZoomPerc)
        }
        If CoordCheck in 1903
        {
            CoordMode, Mouse, Screen
            Send {Escape}
            Sleep, 50
            MouseMove, % ZoomArrow_X, % ZoomArrow_Y
            MsgBox, 4096, Check coordinates,
(
1903  Arrow next to Zoompercentage rectangle`n`nIn Toolbar File Operations`n`n(ZoomArrow)

The Defined State of the Toolbar File Operations
will be restored.
If you want to repeat the three toolbar checks:
Enter 1901. Or V to go first to the Canvas Search Area test.
)
            ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
            If (ErrorLevel = 1)	
            {
                MouseMove, % ToolBarSel_X, % ToolBarSel_Y		; toolbar selection spot
                    Click, right
                Sleep, 150
                MouseMove, FileOpTick_X1 + ToolBTickOffset_X, FileOpTick_Y1 + ToolBTickOffset_Y
                Click							; hide File Operations
                Sleep, 50
            }
        }
        If CoordCheck in 1904
        {
            Send {Escape}
            Sleep, 50
            CoordMode, Mouse, Screen
            MouseMove, % ToolBarSel_X, % ToolBarSel_Y
            MsgBox, 4096, Check coordinates, 1904  Toolbar Selection Spot next to Menu Help - same height`n`nFull Screen or Maximized`n`n(ToolBarSel)
        }
        RepeatCheck := 0
        Barline := 0
    }						; end of check-c loop 
    Return
}						; end of 'If util in ccc'

; ♣=================================== TEST IMAGE RECOGNITION  ====================================

; In the ImageSearch commands *40 indicates  the allowed number of shades of variation in either
; direction for the intensity of the red, green, and blue components of each pixel's color
; ALL forms of staccato are recognized via Statusbar_tacca.png   (-> S-tacca-to)
; normal staccato, Staccatissimo, Staccatissimo Wedge and Staccatissimo Stroke
; Accent-Staccato, Marcato-Staccato, soft accent staccato and soft accent tenuto staccato

If util in tir
{
    MsgBox, 4161, Image Recognition test,
(
Statusbar: Select the element you want to test.
Inspector: take care that the testitem is visible
and in the correct test state, e.g. an active reset button.
)
    IfMsgBox, Cancel
        Return

    Loop
    {
        InputBox, TestImage, Test Image Recognition,
(
Type the short name of the image using this list.

STATUSBAR
Acciaccatura		ACC	Note			N
Appoggiatura		APP	Nothing Selected		NSS
Articulation		AR	Range Selection		RS
Barline			BL	Rest			R
Beam			B	Slur			S
Bend			BE	S-tacca-to		ST
Dynamic			D	Stem			SM
Full measure rest		MR	Symbol			SYM
Grace Note		GN	Text			TXTS
Hairpin			H	Tie			T
List Selection		LS	Tremolo			TR
--------------------------------------------------------------------------------------
Master Palette Title	MP  →→	MP must be an INactive Window!
Palette Locator Left	PLL	Palette Locator Right	PLR
Selectionfilter (NOT blue!)	ALL	-> Palettes must be invisible!
Check ticked √ F- ops	CTFO	Check ticked √ Sel Filter	CTSF
Check ticked √ Palettes	CTP	Check ticked √ Workspaces	CTWS
Check ticked √ F-ops..Fb	CTFOFB	Check ticked √ Note Input	CTNI
Check ticked √ F-ops..Ws	CTFOWS	Check ticked √ Horiz. Beam	CTHB
--------------------------------------------------------------------------------------
NOTES CONTEXTUAL MENU - Item must be blue!
Delete			DEL	Remove Selected Range	RSR
Paste			PASTE	Swap with Clipboard	SWC
--------------------------------------------------------------------------------------
INSPECTOR	▼ = section open
Beam ▼			BM	Play Panel		PP
Beam Custom Pos √	BC	Play ticked √		PT
Clef ▼			CL	Segment ▼		SEG
Element ▼		EL	Select Augmentation Dot1	SAD
Empty Surface		ES	Select Beam		SB
Fingering ▼		FI	Select Flag		SF
Fretboard Diagram ▼	FD	Select Stem		SSM
Inspector			I	Select Tuplet		TU
Insp displaced		ID	Stem ▼			SMI
KeySig ▼			KS	Text ▼			TXTI
Line ▼			LI	TimeSig ▼		TIS
Nothing Selected		NSI	Triangle Closed ►		TRI
--------------------------------------------------------------------------------------
PALETTES				MASTER PALETTE
Palette Open ▼		PO	Pincé - *not* blue!!		PIN
)
, , 460, 840, A_ScreenWidth / 2 - 200, A_ScreenHeight / 9, , , Input the abbreviation	;  width 460 height 840 at 1/9 of screenheight (*change*?)
        If ErrorLevel					; when Cancel is pressed
            Break
        Sleep, 500

        If TestImage not in acc,ad,all,app,ar,b,bc,be,bl,bm,cl,ctfo,ctfofb,cthb,ctni,ctfows,ctp,ctsf,ctws,d,del,el,es,fd,fi,gn,h
,i,id,ks,li,ls,mp,mr,n,nss,nsi,nx,or,paste,pin,pll,plr,po,pp,pr,pt,r,rs,rsr,s,sad,sb,seg,sf,sm,smi,st,ssm,swc,sym
,t,tis,tr,tri,tu,txti,txts
        {
            MsgBox, 4144, Image Recognition Test, No valid input!,
                Continue
        }
        If TestImage in rsr,swc,paste,del
        {
            MsgBox, 4144, Test contextual menu of notes,
(
Press OK.
Select a range and right click a note.
The test item must be blue.
So put the mouse on

Remove Selected Range	RSR
Swap with Clipboard	SWC
Paste			PASTE
Delete			DEL

The test will start after 5 seconds.
)
            Sleep, 5000
            If (TestImage = "rsr")
                ImageSearch, , , CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, *40 Remove_Selected_Range_Blue.png
            If (TestImage = "swc")
                ImageSearch, , , CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, *40 Swap_with_Clipboard_Blue.png
            If (TestImage = "paste")
                ImageSearch, , , CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, *40 Paste_Blue.png
            If (TestImage = "del")
                ImageSearch, , , CSA_X1, CSA_Y1, CSA_X2, CSA_Y2, *40 Delete_Blue.png
        }
        If (TestImage = "pll")
        ImageSearch, X, Y, Pal_Loc_X1, Pal_Loc_Y1, Pal_Loc_X2, Pal_Loc_Y2, *80 Palette_Locator_Left.png
        If (TestImage = "plr")
        ImageSearch, X, Y, Pal_Loc_X1, Pal_Loc_Y1, Pal_Loc_X2, Pal_Loc_Y2, *80 Palette_Locator_Right.png
        If (TestImage = "acc")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Acciaccatura.png
        If (TestImage = "app")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Appoggiatura.png
        If (TestImage = "ar")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Articulation.png
        If (TestImage = "bl")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Barline.png
        If (TestImage = "b")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Beam.png
        If (TestImage = "be")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Bend.png
        If (TestImage = "d")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Dynamic.png
        If (TestImage = "mr")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest_Duration_Measure.png
        If (TestImage = "gn")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Grace_Note.png
        If (TestImage = "h")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Hairpin.png
        If (TestImage = "ls")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_List_Selection.png
        If (TestImage = "n")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
        If (TestImage = "nss")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, Statusbar_Nothing_Selected.png
        If (TestImage = "rs")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
        If (TestImage = "r")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
        If (TestImage = "s")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Slur.png
        If (TestImage = "st")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_tacca.png
        If (TestImage = "sm")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Stem.png
        If (TestImage = "sym")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Symbol.png
        If (TestImage = "txts")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Text.png
        If (TestImage = "t")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_TieStart.png
        If (TestImage = "tr")
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 StatusBar_Tremolo.png
        If (TestImage = "bm")
        ImageSearch, , , IM_26_X1, IM_26_Y1, IM_26_X2, IM_26_Y2, *40 IM_26_Inspector_Beam_Section_active.png
        If (TestImage = "bc")
        ImageSearch, , , IM_09_X1, IM_09_Y1, IM_09_X2, IM_09_Y2, *40 IM_09_Inspector_Beam_Custom_Position_ticked.png
        If (TestImage = "cl")
        ImageSearch, , , IM_27_X1, IM_27_Y1, IM_27_X2, IM_27_Y2, *40 IM_27_Clef_triangle_section_open.png
        If (TestImage = "el")
        ImageSearch, , , IM_13_X1, IM_13_Y1, IM_13_X2, IM_13_Y2, *40 IM_13_Inspector_Element.png
        If (TestImage = "es")
        ImageSearch, , , IM_02_X1, IM_02_Y1, IM_02_X2, IM_02_Y2, IM_02_Inspector_Empty_Surface.png
        If (TestImage = "fi")
        ImageSearch, , , IM_20_X1, IM_20_Y1, IM_20_X2, IM_20_Y2, *40 IM_20_Inspector_Fingering.png
        If (TestImage = "fd")
        ImageSearch, , , IM_22_X1, IM_22_Y1, IM_22_X2, IM_22_Y2, *40 IM_22_Inspector_Fretboard_Diagram.png
        If (TestImage = "i")
        ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
        If (TestImage = "id")
        ImageSearch, , , IM_01_2_X1, IM_01_2_Y1, IM_01_2_X2, IM_01_2_Y2, *40 IM_01_2_Inspector_Displaced_Insp.png
        If (TestImage = "ks")
        ImageSearch, , , IM_29_X1, IM_29_Y1, IM_29_X2, IM_29_Y2, *40 IM_29_KeySig_triangle_section_open.png
        If (TestImage = "li")
        ImageSearch, , , IM_23_X1, IM_23_Y1, IM_23_X2, IM_23_Y2, *40 IM_23_Line_triangle_section_open.png
        If (TestImage = "nsi")
        ImageSearch, , , IM_03_X1, IM_03_Y1, IM_03_X2, IM_03_Y2, *40 IM_03_Inspector_Nothing_Selected.png
        If (TestImage = "or")
        ImageSearch, , , IM_24_X1, IM_24_Y1, IM_24_X2, IM_24_Y2, IM_24_Ornament_triangle_section_open.png
        If (TestImage = "pp")
        ImageSearch, , , IM_19_X1, IM_19_Y1, IM_19_X2, IM_19_Y2, *40 IM_19_Inspector_Play_Panel_Header.png
        If (TestImage = "pt")
        ImageSearch, , , IM_25_X1, IM_25_Y1, IM_25_X2, IM_25_Y2, *40 IM_25_Play_ticked.png
        If (TestImage = "seg")
        ImageSearch, , , IM_14_X1, IM_14_Y1, IM_14_X2, IM_14_Y2, *40 IM_14_Inspector_Segment.png
        If (TestImage = "sad")
        ImageSearch, , , IM_07_X1, IM_07_Y1, IM_07_X2, IM_07_Y2, *40 IM_07_Inspector_AugmentationDot1.png
        If (TestImage = "sb")
        ImageSearch, , , IM_08_X1, IM_08_Y1, IM_08_X2, IM_08_Y2, *40 IM_08_Inspector_Select_Beam.png
        If (TestImage = "sf")
        ImageSearch, , , IM_05_X1, IM_05_Y1, IM_05_X2, IM_05_Y2, *40 IM_05_Inspector_Flag.png
        If (TestImage = "ssm")
        ImageSearch, , , IM_04_X1, IM_04_Y1, IM_04_X2, IM_04_Y2, *40 IM_04_Inspector_Stem.png
        If (TestImage = "tu")
        ImageSearch, , , IM_06_X1, IM_06_Y1, IM_06_X2, IM_06_Y2, *40 IM_06_Inspector_Tuplet.png
        If (TestImage = "smi")
        ImageSearch, , , IM_21_X1, IM_21_Y1, IM_21_X2, IM_21_Y2, *40 IM_21_Inspector_Stem_section_open.png
        If (TestImage = "txti")
        ImageSearch, , , IM_17_X1, IM_17_Y1, IM_17_X2, IM_17_Y2, *40 IM_17_Inspector_Text.png
        If (TestImage = "tis")
        ImageSearch, , , IM_28_X1, IM_28_Y1, IM_28_X2, IM_28_Y2, *40 IM_28_TimeSig_triangle_section_open.png
        If (TestImage = "tri")
        ImageSearch, , , IM_18_X1, IM_18_Y1, IM_18_X2, IM_18_Y2, *40 IM_18_Inspector_Triangle_Closed.png
        If (TestImage = "po")
        ImageSearch, , , DA_X1, DA_Y1, DA_X2, DA_Y2, *40 DA_Portal_Open_Down_Arrow.png
        If (TestImage = "all")
        ImageSearch, , , SLF_01_X1, SLF_01_Y1, SLF_01_X2, SLF_01_Y2, *40 SLF_01_SelectionFilter_All_ticked.png
        If (TestImage = "pr")
        ImageSearch, , , PI_X1, PI_Y1, PI_X2, PI_Y2, *40 PI_Print_Icon.png
        If (TestImage = "mp")
        ImageSearch, MP_TitleX, MP_TitleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, *40 Master_Palette_title.png
        If (TestImage = "cthb")
        ImageSearch, Tick_X, Tick_Y, Hor_X1, Hor_Y1, Hor_X2, Hor_Y2, *40 CTS_Checked_ticked_sign.png
        If TestImage in ctfows,ctp,ctsf,ctfo,ctfofb,ctni,ctws
        {
            MsgBox, 4144, Test Toolbar Recognition,
(
NB: Play Panel must be in the list!

While testing only the ticked item must be visible.

CTFO		File Operations ticked
CTSF		Selection Filter ticked
CTP		Palettes ticked
CTNI		Note Input ticked
CTWS		Workspaces ticked
CTFOWS		File Operations ticked	highest
CTFOWS		Workspaces ticked	lowest
CTFOFB		File Operations ticked	highest
CTFOFB		Feedback ticked		lowest

When the test is finished:
restore the original toolbar layout
of your Defined State.
)
            MouseMove, % ToolBarSel_X, % ToolBarSel_Y
            Click, right
            Sleep, 300
            If (TestImage = "ctfows")				; area from □ File Operations thru □ Workspaces
                ImageSearch, Tick_X, Tick_Y, CTS_X1, CTS_Y1, CTS_X2, CTS_Y2, *40 CTS_Checked_ticked_sign.png
            If (TestImage = "ctp")				; tick √ area in front of □ Palettes only
                ImageSearch, Tick_X, Tick_Y, PalTick_X1, PalTick_Y1, PalTick_X2, PalTick_Y2, *40 CTS_Checked_ticked_sign.png
            If (TestImage = "ctsf")				; tick √ area in front of □ Selection Filter
                ImageSearch, Tick_X, Tick_Y, SelTick_X1, SelTick_Y1, SelTick_X2, SelTick_Y2, *40 CTS_Checked_ticked_sign.png
            If (TestImage = "ctfo")				; tick √ area in front of □ File Operations
                ImageSearch, Tick_X, Tick_Y, FileOpTick_X1, FileOpTick_Y1, FileOpTick_X2, FileOpTick_Y2, *40 CTS_Checked_ticked_sign.png
            If (TestImage = "ctni")				; tick √ area in front of □ Note Input
                ImageSearch, Tick_X, Tick_Y, NoteInp_X1, NoteInp_Y1, NoteInp_X2, NoteInp_Y2, *40 CTS_Checked_ticked_sign.png
            If (TestImage = "ctws")				; tick √ area in front of □ Workspaces
                ImageSearch, Tick_X, Tick_Y, WorkSp_X1, WorkSp_Y1, WorkSp_X2, WorkSp_Y2, *40 CTS_Checked_ticked_sign.png
            If (TestImage = "ctfofb")				; area from □ File Operations thru □ Feedback
                ImageSearch, Tick_X, Tick_Y, FoFb_X1, FoFb_Y1, FoFb_X2, FoFb_Y2, *40 CTS_Checked_ticked_sign.png
            Sleep, 500
        }
        If (TestImage = "pin")
        {
            WinActivate, Master Palette
            CoordMode, Pixel, Window
            CoordMode, Mouse, Window
            ImageSearch, , , MP_X1, MP_Y1, MP_X2, MP_Y2, *40 PIN_Master_Palette_Pincé.png
        }
        If (ErrorLevel = 0)
            MsgBox, 4160, Test Image Recognition, Selected image recognized.,
        If (ErrorLevel = 1)
            MsgBox, 4144, Test Image Recognition, Selected image not recognized.,
        If (ErrorLevel = 2)
            MsgBox, 4112, Test Image Recognition,
(
There was a problem that prevented
the command from conducting the search.
E.g. failure to open the image file
or a badly formatted option.
)
    }
    Return					; end of 'If util in tir'
}

; ♣=================================== INITIALISE INSPECTOR =======================================

If util in ini
{
    CoordMode, Pixel, Window
    CoordMode, Mouse, Window
    MouseGetPos, StartX, StartY
    Gosub, InspectorCheck			; subroutine at end of file
    MsgBox, 4662, Initialise Inspector,
(
The mscz file 'Initialise Inspector'
includes all inspector headers
which must be checked.

Load the testfile		Continue
Retry without reloading	Try Again
)
    IfMsgBox, Cancel
        Return
    IfMsgBox, TryAgain
        Goto, SkiploadingInitInsp
;    Keywait, z, d
    Run, Initialise_Inspector.mscz, , UseErrorLevel
    if ErrorLevel = Error
    {
        MsgBox, 4112, Trying to load 'Initialise Inspector.mscz',
(
The test file could not be launched.
Check name and location of the file.
)
        Return
    }
    SkiploadingInitInsp:
    MsgBox, 4144, Initialise Inspector, All elements will be inspected twice.`n`nWhen the cursor enters the Title:.`nPress Escape.`n`nPress OK to start the test.

    Loop, 2
    {
        PixelSearch, MagentaX, MagentaY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, 0xff00ff, , Fast RGB
        MouseMove, MagentaX, MagentaY
        Click
        Loop, 50
        {
            ImageSearch, TrX, TrY, IM_18_X1, IM_18_Y1, IM_18_X2, IM_18_Y2, IM_18_Inspector_Triangle_Closed.png
            If (ErrorLevel = 2)
            {
                MsgBox,  There was a problem that prevented the command`nfrom conducting the search.`n E.g. a failure to open the image file`nor a badly formatted option.
                Return
            }
            If (ErrorLevel = 0)
            {
                MouseMove, TrX + TriAngleOffset_X, TrY + TriAngleOffset_Y
                Click
                Sleep, 300
                Send !{right}
                Sleep, 150
                Continue
            }
            If (ErrorLevel = 1)
            {
                Send !{right}
                Sleep, 250
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
                If (ErrorLevel = 1)					; there is no rest, check next element
                Continue
                If (ErrorLevel = 0)					; there is a rest
                {
                    Loop						; third loop, nested
                    {
                        Sleep, 50
                        If (A_Index = 2)				; dotted eight
                            Click, %IN_051_X%, %IN_051_Y%		; I(051) Select augm. dot 1
                        If (A_Index = 3)				; last note of triplet
                            Click, %IN_052_X%, %IN_052_Y%		; I(052) Select stem
                        If (A_Index = 4)				; middle note of triplet
                            Click, %IN_054_X%, %IN_054_Y%		; I(054) Select beam
                        If (A_Index = 5)				; last note of triplet
                            Click, %IN_055_X%, %IN_055_Y%		; I(055) Select tuplet
                        Sleep, 150
                        ImageSearch, TrX, TrY, IM_18_X1, IM_18_Y1, IM_18_X2, IM_18_Y2, IM_18_Inspector_Triangle_Closed.png
                        If (ErrorLevel = 0)
                        {
                            MouseMove, TrX + TriAngleOffset_X, TrY + TriAngleOffset_Y
                            Click					if the rest was ► it is changed into ▼
                            Sleep, 300
                            If (A_Index = 1)
                                Send {left}				; to dotted eight
                            If (A_Index = 2) || (A_Index = 3)
                                Send !{left}				; in pass 2 to last and in pass 3 to middle note of triplet
                            If (A_Index = 4)
                            {
                                Send !{right}				; to final barline
                                Sleep, 50
                                Send !{left}
                                Sleep, 50
                                Send {left}
                                Sleep, 50
                                Send {left}				; to last note of triplet
                            }
                            If (A_Index = 5)
                                Break
                            Continue
                        }
                        If (ErrorLevel = 1)
                        {
                            If (A_Index = 1)
                                Send {left}				; to dotted eight
                            If (A_Index = 2) || (A_Index = 3)
                                Send !{left}				; in pass 2 to last and in pass 3 to middle note of triplet
                            If (A_Index = 4)
                            {
                                Send !{right}				; to final barline
                                Sleep, 50
                                Send !{left}
                                Sleep, 50
                                Send {left}
                                Sleep, 50
                                Send {left}				; to last note of triplet
                            }
                            If (A_Index = 5)
                                Break
                        }
                    }
                }
            }
            Send !{right}						; to 'segno note'
            Sleep, 50
            Send ^{left}						; to first note
            Sleep, 100
            Send !{left}
            Sleep, 50
            Send !{left}
            Sleep, 50
            Send !{left}
            Sleep, 50
            Send !{left}						; to vertical frame
            Sleep, 50
        }								; end of first loop
    }									; end of second loop. The Frame Text Style (Title) is the only section which remains hard to detect. But this section is not relevant for the AHK macros.
    MsgBox, 4160, Initialise Inspector, The test is finished.
    MouseMove, StartX, StartY
    Return								; end of 'If util in ini'
}

; ♣================================== INITIALISE PLAY PANEL =======================================

; initialisation play panel, undock from inspector and move panel

If util in ipp
{
    CoordMode, Mouse, Screen
    MouseGetPos, StartX, StartY
    ImageSearch, PP_X, PP_Y, IM_19_X1, IM_19_Y1, IM_19_X2, IM_19_Y2, *40 IM_19_Inspector_Play_Panel_Header.png
    If (ErrorLevel = 0)
        Goto, MovePlayPanel
    If (ErrorLevel = 1)
        Send !v
        Send {down 3}
        Send {Enter}
        Sleep, 300
        ImageSearch, PP_X, PP_Y, IM_19_X1, IM_19_Y1, IM_19_X2, IM_19_Y2, *40 IM_19_Inspector_Play_Panel_Header.png
    MovePlayPanel:
;   MsgBox, PlayPanel Y is %PP_Y%			; for testing
    MouseMove, PP_X + PP_Off_X, PP_Y + PP_Off_Y
;   MsgBox, 4160, Check distance, On clickpoint?,	; for testing
    Click, 2
    Sleep, 50
    WinActivate, Play Panel
    WinMove, Play Panel, , Play_Panel_X, Play_Panel_Y, PlayP_Wide, PlayP_High	; x/y position, width, height of play panel
    Sleep, 100						; end of 'If util in ipp'
}

; ♣============================= RESET WIDTH PALETTES and INSPECTOR ===============================

; Found minimal Palettes width is 'Min_Pal_Width'
; Defined Palettes width is 'Def_Pal_Width'
; PM: The y coordinate of the dragpoint is half the screenheight

If util in rwp					; semi-automatic alternative for Hotkey Z + 1
{
    CoordMode, Mouse, Screen
    MsgBox, 4161, Reset Palettes to my defined width,
(
Make sure that the Palettes
are as narrow as possible.
If not, do it now.
Reset also the screen
to your preferred size,
maximized or full.
If everything is ready:
press OK and 
click an empty spot on the screen.
)
    IfMsgBox, Cancel
	Return
    Keywait, LButton, D
    Click, up
    MouseGetPos, StartX, StartY			; original position
    ; MsgBox, 4096, Reset Palettes width, To get the focus right:`nclick on OK or press Enter.	; for testing - its effect is more sleeptime
    MouseMove, % Min_Pal_Width, % A_ScreenHeight / 2	; to my found minimal Palettes width at half screen height
    Sleep, 100
    Click, Down					; drag enable
    Sleep, 50
    MouseMove, % Def_Pal_Width, % A_ScreenHeight / 2	; to my defined Palettes width at half screen height
    Click, U					; drag disable
    Sleep, 50
    Send {Escape}
    MouseMove, StartX, StartY
    Send {Home}
}						; end of 'If util in rwp'

If util in rwi					; semi-automatic alternative for Hotkey Z + 2
{
    CoordMode, Mouse, Screen
    MsgBox, 4161, Reset Inspector to my defined width,
(
Make sure that the Inspector
is as narrow as possible.
If not, do it now.
Reset also the screen
to your preferred size,
maximized or full.
If everything is ready:
press OK and
click an empty spot on the screen.
)
    IfMsgBox, Cancel
	Return
    Keywait, LButton, D
    Click, up
    MouseGetPos, StartX, StartY			; original position
    ; MsgBox, 4096, Reset Inspector width, To get the focus right:`nclick on OK or press Enter.	; for testing - its effect is more sleeptime
    MouseMove, % Min_Insp_Width, % A_ScreenHeight / 2	; to my found minimal (docked) Inspector width at half screen height
    Sleep, 100
    Click, Down					; drag enable
    Sleep, 50
    MouseMove, % Def_Insp_Width, % A_ScreenHeight / 2	; to my defined Inspector width at half screen height
    Click, U					; drag disable
    Send {Escape}
    MouseMove, StartX, StartY
    Send {Home}
    Return
}						; end of 'If util in rwi'

; ♣============================= EMPTY PALETTE SEARCH FIELD =======================================

If util in eps					; alternative for the hotkey CapsLock + E
{
    MouseGetPos, StartX, StartY
    Send ^{f9}					; Custom MuseScore shortcut, to Palette Search  (*change*?)
    Sleep, 100
;    Send ^a
    Send {Del}
    Sleep, 100
    Send +{Tab 2}				; to get the cursor out of the search field
    Sleep, 100
    Send {Escape}
    Sleep, 300
    MouseMove, StartX, StartY
    Return					; end of 'If util in eps'
}

; ♣================================== GET COLOR OF MOUSEPOSITION ==================================

If util in gcm
{
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen
    MouseGetPos, X, Y
    PixelGetColor, PixColor, %X%, %Y% , RGB
    MsgBox, 4160, Color of mousepositionpixel , --- The color is %PixColor% ---
    Return
}						; end of 'If util in gcm'

; ♣================================= INITIALISE MASTER PALETTE ====================================

If util in imp
{
    CoordMode, Mouse, Screen
    MouseGetPos, StartX, StartY
    Click, %StartX%, %StartY%
    Send +z					; open master palette symbols - custom shortcut! (*change*?)
    Sleep, 1000
    WinActivate, Master Palette
    CoordMode, Mouse, Window
    CoordMode, Pixel, Window
    Click, %WMPS_02X%, %WMPS_02Y%		; (WMPS_02) Window Master Palette Symbols, Clear rectangle
    Sleep, 50
    Click, %WMPS_01X%, %WMPS_01Y%		; (WMPS_01) Window Master Palette Symbols, Search rectangle
    Sleep, 50
    Send pinc					; Pincé (Couperin)
    Sleep, 300
    ImageSearch, PincéX, PincéY, MP_X1, MP_Y1, MP_X2, MP_Y2, *40 PIN_Master_Palette_Pincé.png
    If ErrorLevel
    {
        MsgBox, 4096, Activation of the Master Palette - Symbols,
(
The symbol is not recognized.
On some systems you have to repeat the command
before actual selection of the field is succesful.

When the field of the symbol is colored
the Symbol Master Palette has already been activated.
)
        Send {Escape}					; close master palette symbols - custom shortcut! (*change*?)
        Sleep, 100
        Return
    }
    Click, %PincéX%, %PincéY%
    Sleep, 50
    Click, %WMPS_02X%, %WMPS_02Y%		; (WMPS_02) Window Master Palette Symbols, Clear rectangle
    Sleep, 50
    Send +z					; close master palette symbols - custom shortcut! (*change*?)
    Sleep, 100
    CoordMode, Mouse, Screen
    Send {Escape}
    Click, %StartX%, %StartY%
    Return					; end of 'If util in imp'
}
Return						; end of Utilities

; ♣================================= EXPAND COLLAPSED INSPECTOR SECTIONS ==========================
; if screen in defined state

~z & i::			; check current inspector sections - if collapsed expand: ▼ instead of ►
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
Gosub, InspectorCheck
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
{
    MsgBox, 4144, Search element, Nothing selected. The macro will exit.
    Return
}
Click, %ElementX%, %ElementY%
Sleep, 50
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
Sleep, 300
Click, %ElementX%, %ElementY%
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