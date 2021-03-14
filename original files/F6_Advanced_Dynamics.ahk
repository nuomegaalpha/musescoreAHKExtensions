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

; Replace the path S:\etc. by your location of MuseScore3.exe

~[ & F6::
CoordMode, Tooltip, Screen
Tooltip, F6  Advanced Dyn., ToolT_F6_X, 0, 1		; tooltip (1) Advanced Dynamics
Return

~] & F6::
MsgBox, 4132, Advanced Dynamics, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 6::
MsgBox, 4096, F6: Loop Dynamics and Advanced Dynamics      [ + 6,
(
With the start note selected:
Loop Input Dynamics			Z + E
Advanced Dynamics			Z + D

ADVANCED DYNAMICS - upto 5 at one go - Possible combinations

5					
Dyn	Pin	Dyn	Pin	Dyn
MF	<	F	>	PP

4
type A as first character or Z as last.
Dyn	Pin	Dyn	Pin	Dyn
A	<	F	>	P	no first Dyn
F	>	MP	<	Z	no last Dyn

3
Dyn	Pin	Dyn
Dyn	Line	Dyn
MF	C	FF	Crescendo line
MF	D	PP	Diminuendo line

2
Pin	Dyn
Dyn	Pin
Line	Dyn
Dyn	Line

1 as in macro group F2

With note selected:
Replace a dynamic			Type = and new dynamic
Replace and keep position		Type . and new dynamic

Verbose info Advanced Dynamics	Z + D → OK or '?'
Info Loop Dynamics		Z + E → OK or '?'
)
Return

; ♣================================= ENTER OR REPLACE DYNAMICS ====================================

~z & d::			; advanced dynamics
CoordMode, Mouse, Screen	; add dynamics from advanced workspace ahk
CoordMode, Pixel, Screen
MouseGetPos, StartX, StartY
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    Send {Click}
    Sleep, 100
    Send {Escape}				; to suppress the contextual menu
    Sleep, 50
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit., 1
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if ErrorLevel
{
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Range_Selection.png
    if ErrorLevel = 1		; there is an error
    {
    MsgBox, 4144, Enter Dynamics, No note or range selected!
    Return
    }
    else			; if no error
    {
    ElementX := StartX		; assigns StartX to ElementX when range selected
    ElementY := StartY		; assigns StartY to ElementY when range selected
    Goto, SkipFirstClickOpenDynamics
    }
}
; in rangeselection a click would deselect the range; this is prevented
; single notes will still be clicked
; in range selection there will be no PixelSearching but at the end of the macro
; there will still be a note selected on the canvas

PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
; when a single note is selected, even if not found by 4voice PixelSearch, the macro continues
; this is relevant at small zoomfactors and especially for finding the + noteheadsign
; this sign is too thin to be recognized by PixelSearch
{
    Goto, SkipFirstClickOpenDynamics
}
Click, %ElementX%, %ElementY%

SymbolDynamics =

SkipFirstClickOpenDynamics:
; InputBox, SymbolDynamics, Enter or Change (= or .) Dynamics, , , W_IB, H_IB, IB_X, IB_Y, , , single or combined dynamics    ? for Help	; (*change*?)
InputBox, SymbolDynamics, Enter or Change (= or .) Dynamics, , , W_IB, H_IB, StartX, StartY-120, , , single or combined dynamics    ? for Help	; (*change*?) rel.to mouse
if ErrorLevel			; when Cancel is pressed
    Return			; exits the macro

If InStr(SymbolDynamics, "?")
{
    MsgBox, 4097, Advanced Dynamics - main info,
(
SINGLE DYNAMICS - Also possible with macro group #2

Type the name of the dynamic in the InputBox.

ppp	pp	p	mp	mf	f	ff	fff
rf	rfz	fz	sf	sfz	sff	sffz	
sfpp	sfp	fp	m	r	s	z	n
--------------------------------------------------------------------------------------------
To REPLACE a dynamic: select the note with the wrong dynamic.
Type = and then the dynamic. E.g. =f

To REPLACE a dynamic ON THE CUSTOMIZED POSITION of the old one:
Type first a period and then the name of the dynamic.
So .mp  or .ff. This presupposes the Defined State.
--------------------------------------------------------------------------------------------
COMBINED DYNAMICS	in the range from ppp to fff
--------------------------------------------------------------------------------------------
Up to five dynamics can be entered at one go.

Dynamic	hairpin	dynamic	hairpin	dynamic    mf<f>pp        f>pp<mf

The first dynamic will be attached to the start note.
Navigate with arrowkeys or mouse to the note where the first hairpin
must end. PRESS Z. Do the same for the second hairpin. Again: PRESS Z.
The first dynamic will be attached to the selected start note.
The second and the third dynamic after the first resp. second hairpin.
--------------------------------------------------------------------------------------------
With four dynamics: type A as first character or Z as last.
Leave out the first dynamic:		a<f>p    a>p<f    a<mf>p
Leave out the last dynamic:		p<f<z    p<f>z    f>mp<z
--------------------------------------------------------------------------------------------
With three dynamics these combinations are possible:

Dynamic		hairpin		dynamic		mp<ff	mf>p
Dynamic		line		dynamic		mfcff       mfdpp

The first dynamic will be attached to the start note. Navigate to the
note where the hairpin or the cresc/dim. line must end. PRESS Z.
The hairpin cq line and the final dynamic will be attached.
C= cresc.  D= dim. line.
--------------------------------------------------------------------------------------------
With two dynamics these combinations are possible:

Hairpin		dynamic				<ff	>p
Dynamic		hairpin				p<	mf>
Line		dynamic				cff	dmp
Dynamic		line				mpc	fd

The dynamic, hairpin or cresc./dim. line will be attached
to the start note.  C= cresc.  D= dim. line.
Navigate to the note where the hairpin or line must end.
PRESS Z. The final dynamic will be attached after the pin.
The hairpin or line will be created, the final dynamic will be attached.
--------------------------------------------------------------------------------------------
At higher zoomfactors in Page View navigating across line breaks can
cause a screen shift and thus malfunctioning of the macro.
To prevent this switch to a smaller zoom or select the second note
with the mouse. Or work in Continuous View.
--------------------------------------------------------------------------------------------
COMBINED dynamics work on one staff only.
To copy them to the same timeposition in another staff: use the hotkeys
of macro group #1: colored range selection and select similar.
)
    IfMsgBox, Cancel
    Return
    IfMsgBox, OK
    {
; InputBox, SymbolDynamics, Enter or Change (= or .) Dynamics, , , W_IB, H_IB, IB_X, IB_Y, , , Enter single or combined dynamics		; (*change*?)
        InputBox, SymbolDynamics, Enter or Change (= or .) Dynamics, , , W_IB, H_IB, StartX, StartY-120, , , Enter single or combined dynamics	; (*change*?) rel.to mouse
        if ErrorLevel			; when Cancel is pressed
        Return
    }
}
Send {Volume_Mute}			; Mute/unmute the master volume

; ♣====================================== REPLACE DYNAMIC =========================================

If InStr(SymbolDynamics, "=")
{
Loop, 12				; allow to skip max 12 elements in other voices
    {
        Send !{right}			; give system and appearance
        Sleep, 300			; of statusbar some time
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Dynamic.png
        If (ErrorLevel = 1)		; no dynamic
        Continue
        If (ErrorLevel = 0)		; dynamic found
        Break
    }
Send {del}
Sleep, 50
}

; ♣============================== REPLACE DYNAMIC ON same position ================================

; The phrase 'If SymbolDynamics in .....' checks whether a variable's contents exactly match
; one of the items in a list

If SymbolDynamics in .ppp,.pp,.p,.mp,.fp,.fff,.ff,.f,.mf,.sfp,.sf,.sfz,.sff,.sffz
,.sfpp,.rf,.rfz,.fz,.m,.r,.s,.z,.n

{					; get position of 'old' dynamic
    ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
    If ErrorLevel
    {
        MsgBox, 4144, Replace dynamic and keep position, The Canvas is not in the defined state.`nThe macro will exit.,
        Return
    }
    Loop, 12				; allow some elements in other voices as well
    {
        Send !{right}			; takes some time
        Sleep, 300			; system and statusbar
        ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Dynamic.png
        If (ErrorLevel = 1)		; error: element is no dynamic
            Continue
        If (ErrorLevel = 0)		; no error: element is a dynamic
            Break
    }
    clipboard =				; Empty the clipboard
    Loop, 2				; two passes between { and }
    {					; get position of 'old' dynamic
        if (A_Index = 1)		; find in the first pass the horizontal position
        Click, %IN_020_X%, %IN_020_Y%	; I(020) X-offset - OVERLAP
        if (A_Index = 2)		; find in the second pass the vertical position
        Click, %IN_021_X%, %IN_021_Y%	; I(021) Y-offset - OVERLAP
        Sleep, 50
        Send ^a				; select all content of x cq y offset-field
        ClipboardText = %Clipboard%  	; remove formatting. Then: Control + C
        SendEvent ^c  			; copy. SendEvent necessary. Not just Send
        ClipWait			; wait until the clipboard contains data
        ClipNew = %Clipboard%
        if (A_Index = 1)		; we want the first line not preceded by a linebreak
        {
            Clipboard = %ClipboardText%%ClipNew%
            Goto, XOffsetElementReplaceDynamics		; in the first pass: skip the linebreak
        }
        Clipboard = %ClipboardText%`n`r%ClipNew%	; the second line under the first
        XOffsetElementReplaceDynamics:
        ClipboardText =					; clear the variable
    }
    ; MsgBox, 4096, , Old dynamic selected?			; for testing: uncomment these 2 lines
    ; Sleep, 100
    Send {Escape}
    Sleep, 50
    Send {del}
    Sleep, 100
}

If SymbolDynamics in ppp,pp,p,mp,mf,f,ff,fff,fp,sf,sfz,sff
,sffz,sfp,sfpp,rfz,rf,fz,m,r,s,z,n
,.ppp,.pp,.p,.mp,.mf,.f,.ff,.fff,.fp,.sf,.sfz,.sff
,.sffz,.sfp,.sfpp,.rfz,.rf,.fz,.m,.r,.s,.z,.n
,=ppp,=pp,=p,=mp,=mf,=f,=ff,=fff,=fp,=sf,=sfz,=sff
,=sffz,=sfp,=sfpp,=rfz,=rf,=fz,=m,=r,=s,=z,=n
{
    Send ^{f9}						; MSc shortcut, Palette Search (Ctrl + F9) (*change*?)
    Sleep, 400						; Sleep, 100 IS NORMAAL
    Send ^a						; HOEFT NIET ???
    Send {del}						; HOEFT NIET ???
    Sleep, 400						; ???????????????
    If SymbolDynamics in ppp,.ppp,=ppp
        Send d-1-					; glyph 440, ppp
    If SymbolDynamics in pp,.pp,=pp
        Send d-2-					; glyph 441, pp
    If SymbolDynamics in p,.p,=p
        Send d-3					; glyph 442, p
    If SymbolDynamics in mp,.mp,=mp
        Send d-4					; glyph 443, mp
    If SymbolDynamics in mf,.mf,=mf
        Send d-5					; glyph 444, mf
    If SymbolDynamics in f,.f,=f
        Send d-6					; glyph 445, f
    If SymbolDynamics in ff,.ff,=ff
        Send d-7					; glyph 446, ff
    If SymbolDynamics in fff,.fff,=fff
        Send d-8					; glyph 447, fff
    If SymbolDynamics in fp,.fp,=fp
        Send d-9					; glyph 448, fp
    If SymbolDynamics in sf,.sf,=sf
        Send d-10					; glyph 449, sf
    If SymbolDynamics in sfz,.sfz,=sfz
        Send d-11					; glyph 450, sfz
    If SymbolDynamics in sff,.sff,=sff
        Send d-12					; glyph 451, sff
    If SymbolDynamics in sffz,.sffz,=sffz
        Send d-13					; glyph 452, sffz
    If SymbolDynamics in sfp,.sfp,=sfp
        Send d-14					; glyph 453, sfp
    If SymbolDynamics in sfpp,.sfpp,=sfpp
        Send d-15					; glyph 454, sfpp
    If SymbolDynamics in rfz,.rfz,=rfz
        Send d-16					; glyph 455, rfz
    If SymbolDynamics in rf,.rf,=rf
        Send d-17					; glyph 456, rf
    If SymbolDynamics in fz,.fz,=fz
        Send d-18					; glyph 457, fz
    If SymbolDynamics in m,.m,=m
        Send d-19					; glyph 458, m
    If SymbolDynamics in r,.r,=r
        Send d-20					; glyph 459, r
    If SymbolDynamics in s,.s,=s
        Send d-21					; glyph 460, s
    If SymbolDynamics in z,.z,=z
        Send d-22					; glyph 461, z
    If SymbolDynamics in n,.n,=n
       Send d-23					; glyph 462, n
    Sleep, 100
    Send ^!p						; MSc user defined shortcut 'Apply current palette element'
    Sleep, 200
;   MsgBox, 4097, Test, Check content Searchbox		; for test purposes
;   IfMsgBox, Cancel					; uncomment these 3 lines
;   Return						; by removing ;
}

If SymbolDynamics in .ppp,.pp,.p,.mp,.fp,.fff,.ff,.f,.mf,.sfp,.sf,.sfz,.sff,.sffz
,.sfpp,.rf,.rfz,.fz,.m,.r,.s,.z,.n
{							; dynamics preceded by a period
    Loop, parse, clipboard, `n, `r
    {
        If (A_Index = 1)
        Click, %IN_020_X%, %IN_020_Y%			; I(020) X-offset - OVERLAP
        If (A_Index = 2)
        Click, %IN_021_X%, %IN_021_Y%			; I(021) Y-offset - OVERLAP
        Sleep, 50
        Send ^{a}
        Sleep, 50
        Send %A_LoopField%
        Sleep, 200
        If (A_Index = 2)
        Break
    }
}
If SymbolDynamics in ppp,pp,p,mp,fp,fff,ff,f,mf,sfp,sf,sfz,sfz
,sffz,sfpp,rf,rfz,fz,m,r,s,z,n
,.ppp,.pp,.p,.mp,.fp,.fff,.ff,.f,.mf,.sfp,.sf,.sfz,.sff,.sffz
,.sfpp,.rf,.rfz,.fz,.m,.r,.s,.z,.n
,=ppp,=pp,=p,=mp,=fp,=fff,=ff,=f,=mf,=sfp,=sf,=sfz,=sff,=sffz
,=sfpp,=rf,=rfz,=fz,=m,=r,=s,=z,=n
{
    Click, %ElementX%, %ElementY%
    Send {Volume_Mute}			; Mute/unmute the master volume
    Return
}

; ♣============================ COMBINED DYNAMICS === KEYWAIT ONCE ================================

; this part, like the one before, is  an example of "manual parsing". Usecases are:
; (1) dynamic - pin - dynamic  (2) dynamic - cresc./dim.line - dynamic  (3) dynamic - pin
; (4) dynamic - cresc./dim.line  (5) pin - dynamic  (6) cresc./dim.line - dynamic

If SymbolDynamics in fff>ff,fff>f,fff>mf,fff>mp,fff>p,fff>pp,fff>ppp
,ff>f,ff>mf,ff>mp,ff>p,ff>pp,ff>ppp
,f>mf,f>mp,f>p,f>pp,f>ppp
,mf>mp,mf>p,mf>pp,mf>ppp
,mp>p,mp>pp,mp>ppp
,p>pp,p>ppp
,pp>ppp
,fffdff,fffdf,fffdmf,fffdmp,fffdp,fffdpp,fffdppp
,ffdf,ffdmf,ffdmp,ffdp,ffdpp,ffdppp
,fdmf,fdmp,fdp,fdpp,fdppp
,mfdmp,mfdp,mfdpp,mfdppp
,mpdp,mpdpp,mpdppp
,pdpp,pdppp
,ppdppp
,ppp<pp,ppp<p,ppp<mp,ppp<mf,ppp<f,ppp<ff,ppp<fff
,pp<p,pp<mp,pp<mf,pp<f,pp<ff,pp<fff
,p<mp,p<mf,p<f,p<ff,p<fff
,mp<mf,mp<f,mp<ff,mp<fff
,mf<f,mf<ff,mf<fff
,f<ff,f<fff
,ff<fff
,pppcpp,pppcp,pppcmp,pppcmf,pppcf,pppcff,pppcfff
,ppcp,ppcmp,ppcmf,ppcf,ppcff,ppcfff
,pcmp,pcmf,pcf,pcff,pcfff
,mpcmf,mpcf,mpcff,mpcfff
,mfcf,mfcff,mfcfff
,fcff,fcfff
,ffcfff
,>ppp,>pp,>p,>mp,>mf,>f,>ff
,dppp,dpp,dp,dmp,dmf,df,dff
,<fff,<ff,<f,<mf,<mp,<p,<pp
,cfff,cff,cf,cmf,cmp,cp,cpp
,pppc,ppc,pc,mpc,mfc,fc,ffc
,fffd,ffd,fd,mfd,mpd,pd,ppd,
{
    KeyWait, z, d
    PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
    if ErrorLevel
    PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
    if ErrorLevel
    PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
    if ErrorLevel
    {
        MsgBox, 4112, Looking for the last note in the range in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
        Return
    }
    Send {Click %ElementX%, %ElementY%}
    Sleep, 50
    Send +{Click %LastX%, %LastY%}
    Sleep, 50

    If SymbolDynamics in fff>ff,fff>f,fff>mf,fff>mp,fff>p,fff>pp,fff>ppp
,ff>f,ff>mf,ff>mp,ff>p,ff>pp,ff>ppp
,f>mf,f>mp,f>p,f>pp,f>ppp
,mf>mp,mf>p,mf>pp,mf>ppp
,mp>p,mp>pp,mp>ppp
,p>pp,p>ppp
,pp>ppp
,>ppp,>pp,>p,>mp,>mf,>f,>ff

    Send +.						; attach decresc. hairpin to range - MS Shc.
    ; MsgBox, 4097, , pin selected?
    ; IfMsgBox, Cancel
    ; Return

    If SymbolDynamics in ppp<pp,ppp<p,ppp<mp,ppp<mf,ppp<f,ppp<ff,ppp<fff
,pp<p,pp<mp,pp<mf,pp<f,pp<ff,pp<fff
,p<mp,p<mf,p<f,p<ff,p<fff
,mp<mf,mp<f,mp<ff,mp<fff
,mf<f,mf<ff,mf<fff
,f<ff,f<fff
,ff<fff
,<fff,<ff,<f,<mf,<mp,<p,<pp

    Send +,						; attach cresc. hairpin to range - MS Shc.
    ; MsgBox, 4097, , pin selected?			; for testing
    ; IfMsgBox, Cancel
    ; Return

    If SymbolDynamics in pppcpp,pppcp,pppcmp,pppcmf,pppcf,pppcff,pppcfff
,ppcp,ppcmp,ppcmf,ppcf,ppcff,ppcfff
,pcmp,pcmf,pcf,pcff,pcfff
,mpcmf,mpcf,mpcff,mpcfff
,mfcf,mfcff,mfcfff
,fcff,fcfff
,ffcfff
,cfff,cff,cf,cmf,cmp,cp,cpp
,pppc,ppc,pc,mpc,mfc,fc,ffc
    {
        Send ^{F9}					;  Palette Search (*PS)
        Sleep, 100
        Send ^a
        Sleep, 50
        Send l-4					; glyph 243, Cresc. line
        Sleep, 100
        Send ^!p					; MSc user defined shortcut 'Apply current palette element'
        Sleep, 200
    ; MsgBox, 4097, , line selected?			; for testing
    ; IfMsgBox,  Cancel
    ; Return
    }

        If SymbolDynamics in fffdff,fffdf,fffdmf,fffdmp,fffdp,fffdpp,fffdppp
,ffdf,ffdmf,ffdmp,ffdp,ffdpp,ffdppp
,fdmf,fdmp,fdp,fdpp,fdppp
,mfdmp,mfdp,mfdpp,mfdppp
,mpdp,mpdpp,mpdppp
,pdpp,pdppp
,ppdppp
,dppp,dpp,dp,dmp,dmf,df,dff
,fffd,ffd,fd,mfd,mpd,pd,ppd
    {
        Send ^{F9}					; Palette Search (*PS)
        Sleep, 100
        Send ^a						; HOEFT NIET???
        Sleep, 50
        Send l-5					; glyph 244, Dim. line
        Sleep, 100
        Send ^!p					; MSc user defined shortcut 'Apply current palette element'
        Sleep, 200
        Send ^{F9}					; Palette Search (*PS)
        Sleep, 100
        ; MsgBox, 4097, , line selected?		; for testing
        ; IfMsgBox, Cancel
        ; Return
    }

    If SymbolDynamics in >ppp,>pp,>p,>mp,>mf,>f,>ff,<fff,<ff,<f,<mf,<mp,<p,<pp
,dppp,dpp,dp,dmp,dmf,df,dff,cfff,cff,cf,cmf,cmp,cp,cpp
    {
        Sleep, 500					; !!!!!
        Goto, AttachFinalDynamic
    }

    Click %ElementX%, %ElementY%
    Sleep, 50

    Send ^{F9}						;  Palette Search (*PS)
    Sleep, 100
    Send ^a
    Sleep, 50

    If SymbolDynamics in fff>ff,fff>f,fff>mf,fff>mp,fff>p,fff>pp,fff>ppp
,fffdff,fffdf,fffdmf,fffdmp,fffdp,fffdpp,fffdppp,fffd
        Send d-8					; glyph 447, fff

    If SymbolDynamics in ff>f,ff>mf,ff>mp,ff>p,ff>pp,ff>ppp,ff<fff
,ffdf,ffdmf,ffdmp,ffdp,ffdpp,ffdppp,ffcfff,ffc,ffd
        Send d-7					; glyph 446, ff

    If SymbolDynamics in f>mf,f>mp,f>p,f>pp,f>ppp,f<ff,f<fff
,fdmf,fdmp,fdp,fdpp,fdppp,fcff,fcfff,fc,fd
        Send d-6					; glyph 445, f

    If SymbolDynamics in mf>mp,mf>p,mf>pp,mf>ppp,mf<f,mf<ff,mf<fff,mfdmp
,mfdmp,mfdp,mfdpp,mfdppp,mfcf,mfcff,mfcfff,mfc,mfd
        Send d-5					; glyph 444, mf

    If SymbolDynamics in mp>p,mp>pp,mp>ppp,mp<mf,mp<f,mp<ff,mp<fff,mpcmf
,mpdp,mpdpp,mpdppp,mpcmf,mpcf,mpcff,mpcfff,mpc,mpd
        Send d-4					; glyph 443, mp

    If SymbolDynamics in p>pp,p>ppp,p<mp,p<mf,p<f,p<ff,p<fff
,pdpp,pdppp,pcmp,pcmf,pcf,pcff,pcfff,pc,pd
        Send d-3					; glyph 442, p

    If SymbolDynamics in pp>ppp,pp<p,pp<mp,pp<mf,pp<f,pp<ff,pp<fff
,ppdppp,ppcp,ppcmp,ppcmf,ppcf,ppcff,ppcfff,ppc,ppd
        Send d-2-					; glyph 441, pp

    If SymbolDynamics in ppp<pp,ppp<p,ppp<mp,ppp<mf,ppp<f,ppp<ff,ppp<fff
,pppcpp,pppcp,pppcmp,pppcmf,pppcf,pppcff,pppcfff,pppc
        Send d-1-					; glyph 440, ppp

    Sleep, 100
    Send ^!p						; MSc user defined shortcut 'Apply current palette element'
    Sleep, 200

    If SymbolDynamics in pppc,ppc,pc,mpc,mfc,fc,ffc,fffd,ffd,fd,mfd,mpd,pd,ppd,
        Goto, FinishDynamicAndLine			; no final dynamic so skip this last part
    AttachFinalDynamic:
    Click %LastX%, %LastY%
    Send {right}
    Sleep, 100

    Send ^{F9}						; Palette Search (*PS)
    Sleep, 100
    Send ^a
    Sleep, 50

    If SymbolDynamics in fff>ppp,ff>ppp,f>ppp,mf>ppp,mp>ppp,p>ppp,pp>ppp,>ppp
,fffdppp,ffdppp,fdppp,mfdppp,mpdppp,pdppp,ppdppp,dppp
        Send d-1-					; glyph 440, ppp

    If SymbolDynamics in ppp<pp,fff>pp,ff>pp,f>pp,mf>pp,mp>pp,p>pp,>pp,<pp
,pppcpp,fffdpp,ffdpp,fdpp,mfdpp,mpdpp,pdpp,dpp,cpp
        Send d-2-					; glyph 441, pp

    If SymbolDynamics in ppp<p,pp<p,fff>p,ff>p,f>p,mf>p,mp>p,>p,<p
,pppcp,ppcp,fffdp,ffdp,fdp,mfdp,mpdp,dp,cp
        Send d-3					; glyph 442, p

    If SymbolDynamics in ppp<mp,pp<mp,p<mp,fff>mp,ff>mp,f>mp,mf>mp,>mp,<mp
,pppcmp,ppcmp,pcmp,fffdmp,ffdmp,fdmp,mfdmp,dmp,cmp
        Send d-4					; glyph 443, mp

    If SymbolDynamics in ppp<mf,pp<mf,p<mf,mp<mf,fff>mf,ff>mf,f>mf,>mf,<mf
,pppcmf,ppcmf,pcmf,mpcmf,fffdmf,ffdmf,fdmf,dmf,cmf
        Send d-5					; glyph 444, mf

    If SymbolDynamics in ppp<f,pp<f,p<f,mp<f,mf<f,fff>f,ff>f,>f,<f
,pppcf,ppcf,pcf,mpcf,mfcf,fffdf,ffdf,df,cf
        Send d-6					; glyph 445, f

    If SymbolDynamics in ppp<ff,pp<ff,p<ff,mp<ff,mf<ff,f<ff,fff>ff,>ff,<ff
,pppcff,ppcff,pcff,mpcff,mfcff,fcff,fffdff,dff,cff
        Send d-7					; glyph 446, ff

    If SymbolDynamics in ppp<fff,pp<fff,p<fff,mp<fff,mf<fff,f<fff,ff<fff,<fff
,pppcfff,ppcfff,pcfff,mpcfff,mfcfff,fcfff,ffcfff,cfff
        Send d-8					; glyph 447, fff

    Sleep, 100
    Send ^!p						; MSc user defined shortcut 'Apply current palette element'
    Sleep, 200
    FinishDynamicAndLine:
    Click %LastX%, %LastY%
    Send {right}
    Send {Volume_Mute}					; Mute/unmute the master volume
    Return
}

; ♣=============== COMBINED DYNAMICS ======= PIN/DYNAMIC/PIN ====== KEYWAIT TWICE =================

; use cases: (1) dynamic - pin - dynamic - pin - dynamic
; (2) pin - dynamic - pin - dynamic   (3) dynamic - pin - dynamic - pin

KeyWait, z, d						; press z after selection end first dynamic cq pin
PixelSearch, MiddleX, MiddleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
if ErrorLevel
PixelSearch, MiddleX, MiddleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
if ErrorLevel
PixelSearch, MiddleX, MiddleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
if ErrorLevel
PixelSearch, MiddleX, MiddleY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
if ErrorLevel
    {
    MsgBox, 4112, Looking for the first middle note in the range in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Send {Volume_Mute}					; Mute/unmute the master volume
    Return
    }
Click, %ElementX%, %ElementY%				; start note
Sleep, 50

Position := 0
Loop, Parse, SymbolDynamics, <>				; the delimiters are < and >
{
    Position += StrLen(A_LoopField) + 1			; retrieve the delimiter found by the parsing loop
    SeparatorDynamics := SubStr(SymbolDynamics, Position, 1)
    Send ^{F9}						; Palette Search (*PS)
    Sleep, 100
    If (A_Index = 1) and InStr(SymbolDynamics, "a")	; pin-dyn-pin-dyn
    Goto, SkipFirstDynamic
    If (A_Index = 3) and InStr(SymbolDynamics, "z")	; dyn-pin-dyn-pin
    {
        Send {Escape}
        Sleep, 300
        Break
    }
    If A_LoopField = ppp
        Send d-1-					; glyph 440, ppp
    If A_LoopField = pp
        Send d-2-					; glyph 441, pp
    If A_LoopField = p
        Send d-3					; glyph 442, p
    If A_LoopField = mp
        Send d-4					; glyph 443, mp
    If A_LoopField = mf
        Send d-5					; glyph 444, mf
    If A_LoopField = f
        Send d-6					; glyph 445, f
    If A_LoopField = ff
        Send d-7					; glyph 446, ff
    If A_LoopField = fff
        Send d-8					; glyph 447, fff

    Sleep, 100
    Send ^!p						; MSc user defined shortcut 'Apply current palette element'
    Sleep, 350
    If (A_Index = 3)
        Break

    SkipFirstDynamic:
    If (A_Index = 1)
    {
        Send, {Click, %ElementX%, %ElementY%}
;        Click, %ElementX%, %ElementY%
        Sleep, 50
; MsgBox, Start clicked?
        Send, +{Click, %MiddleX%, %MiddleY%}
        Sleep, 100
; MsgBox, Range selected?
    }
    If (A_Index = 2)
    {
        Send {Click %Middle2X%, %Middle2Y%}
        Sleep, 50
        Send +{Click %LastX%, %LastY%}
        Sleep, 100
    }
    If (SeparatorDynamics = "<")
    {
        Send +,						; attach cresc. hairpin to range - MS Sc.
        Sleep, 150
        Send {Escape}
        Sleep, 200
        If (A_Index = 1)
        {
            Send {Escape}				; hairpin is 'sticky' in MS 3.5
            Sleep, 100
            Send !{right}
            Sleep, 150
            Click %MiddleX%, %MiddleY%
            Sleep, 50
        }
    }
    If (SeparatorDynamics = ">")
    {
        Send +.						; attach decresc. hairpin to range - MS Sc.
        Sleep, 150
        Send {Escape}
        Sleep, 250
        If (A_Index = 1)
        {
            Send {Escape}				; hairpin is 'sticky' in MS 3.5
            Sleep, 100
            Send !{right}
            Sleep, 150
            Click %MiddleX%, %MiddleY%
            Sleep, 50
        }
    }
    If (A_Index = 1)
    {
        KeyWait, z, d

        PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, LastX, LastY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        if ErrorLevel
        {
            MsgBox, 4112, Looking for the last note in the range in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
            Send {Volume_Mute}				; Mute/unmute the master volume
            Return
        }
        Click %MiddleX%, %MiddleY%
        Sleep, 50
        Send {right}					; from middle note one note further
        Sleep, 250					; was 50 !!! determine position of this note

        PixelSearch, Middle2X, Middle2Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
        if ErrorLevel
        PixelSearch, Middle2X, Middle2Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV2, , Fast RGB	; voice 2
        if ErrorLevel
        PixelSearch, Middle2X, Middle2Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV3, , Fast RGB	; voice 3
        if ErrorLevel
        PixelSearch, Middle2X, Middle2Y, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV4, , Fast RGB	; voice 4
        if ErrorLevel
        {
            MsgBox, 4112, Looking for the second middle note in the range in voice 1`, 2`, 3`, `4, The note was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
            Send {Volume_Mute}				; Mute/unmute the master volume
            Return
        }
    }
    If (A_Index = 2)
    {
        Click %LastX%, %LastY%
        Send {right}
        Sleep, 50
    }
}
Sleep, 50
Click %LastX%, %LastY%
Send {right}
Send {Volume_Mute}					; Mute/unmute the master volume
Return

; ♣====================================== LOOP SINGLE DYNAMICS ====================================

~z & e::						; set single dynamics consecutively (loop)
; Send {Volume_Mute}					; Mute/unmute the master volume
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel
{
    Send {Click}
    Sleep, 100
    Send {Escape}				; to suppress the contextual menu
    Sleep, 50
    MsgBox, 4112, Inspector Check, The screen is not in the defined state.`nThe macro will exit., 1
    Return
}
Tooltip, Loop Input Dynamics. Enter new dynamic`, hairpin or cresc`/dim line.`nPress Right Alt to activate InputBox when hidden.`nEnter \ and OK to switch to MuseScore. Exit macro: (Right Alt +) Escape, ToolT_F6_X, 40, 2	; tooltip (2) (*change*?) 40 is height tooltip
Loop
{
    MouseGetPos, StartX, StartY
;    InputBox, Dynamics, Enter Single Dynamic - Loop, , , W_IB, H_IB, IB_X, IB_Y, , , Enter shortcut				; (*change*?)
    InputBox, Dynamics, Enter Single Dynamic - Loop, , , W_IB, H_IB, StartX, StartY - 160, , , Enter shortcut  Help = ?		; (*change*?) rel. to mouse
    If ErrorLevel					; when Cancel is pressed
        Break						; exit macro
    If (Dynamics = "?") || (Dynamics = "Enter shortcut  Help = ?")
    {
        MsgBox, 4096, Input Dynamics Loop,
(
PPP	PP	P	MP
MF	F	FF	FFF
RF	RFZ	FZ	SF
SFZ	SFF	SFFZ	
SFPP	SFP	FP	M
R*	S	Z	N

Hairpin crescendo		<
Hairpin decrescendo	>
Crescendo line		C
Decrescendo line		D
Repeat command		R
Delete dynamic		X
Activate MuseScore	\ + Enter	(adjacent keys)
Activate InputBox		Right Alt

Select a note, activate IB and add dynamic.
To create e.g. a dim/cresc line: make a rangeselection,
activate IB and enter C or D.

When you have 'clicked away' the InputBox
reactivate it with ALT + TAB.

InputBox active:
Exit macro		Escape
)
    Continue
    }
    If Dynamics not in <,>,\,c,d,q,x,ppp,pp,p,mp,mf,f,ff,fff,rf,rfz,fz,sf,sfz,sff,sffz,sfpp,sfp,fp,m,r,s,z,n
    {
    MsgBox, 4144, Dynamics Loop, No valid input.
        Continue
    }
    If (Dynamics = "\")
        WinActivate, MuseScore3.exe			; suppresses InputBox
    If (A_Index = 1)
        DynamicsOld := ""
    If (Dynamics = "r")
        Dynamics := DynamicsOld
    If (Dynamics = "x")
    {
        Loop, 12					; allow to skip max 12 elements in other voices
        {
            Send !{right}				; give system and appearance
            Sleep, 300					; of statusbar some time
            ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Dynamic.png
            If (ErrorLevel = 1)				; no dynamic
            {
                ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Hairpin.png
                If (ErrorLevel = 1)			; no hairpin
                Continue
            }
            If (ErrorLevel = 0)				; dynamic found
                Break
        }
        Send {del}
        Sleep, 50
        Continue
    }
    If Dynamics in c,d,ppp,pp,p,mp,mf,f,ff,fff,rf,rfz,fz,sf,sfz,sff,sffz,sfpp,sfp,fp,m,r,s,z,n
    {
        Send ^{F9}					; Palette Search (Ctrl + F9) (*change*?)
        Sleep, 100
        If (Dynamics = "ppp")				; glyph 440, ppp
            Send d-1-
        If (Dynamics = "pp")				; glyph 441, pp
            Send d-2-
        If (Dynamics = "p")				; glyph 442, p
            Send d-3
        If (Dynamics = "mp")				; glyph 443, mp
            Send d-4
        If (Dynamics = "mf")				; glyph 444, mf
            Send d-5
        If (Dynamics = "f")				; glyph 445, f
            Send d-6
        If (Dynamics = "ff")				; glyph 446, ff
            Send d-7
        If (Dynamics = "fff")				; glyph 447, fff
            Send d-8
        If (Dynamics = "fp")				; glyph 448, fp
            Send d-9
        If (Dynamics = "sf")				; glyph 449, sf
            Send d-10
        If (Dynamics = "sfz")				; glyph 450, sfz
            Send d-11
        If (Dynamics = "sff")				; glyph 451, sff
            Send d-12
        If (Dynamics = "sffz")				; glyph 452, sffz
            Send d-13
        If (Dynamics = "sfp")				; glyph 453, sfp
            Send d-14
        If (Dynamics = "sfpp")				; glyph 454, sfpp
            Send d-15
        If (Dynamics = "rfz")				; glyph 455, rfz
            Send d-16
        If (Dynamics = "rf")				; glyph 456, rf
            Send d-17
        If (Dynamics = "fz")				; glyph 457, fz
            Send d-18
        If (Dynamics = "m")				; glyph 458, m
            Send d-19
        If (Dynamics = "r*")				; glyph 459, r
            Send d-20
        If (Dynamics = "s")				; glyph 460, s
            Send d-21
        If (Dynamics = "z")				; glyph 461, z
            Send d-22
        If (Dynamics = "n")				; glyph 462, n
            Send d-23
        If (Dynamics = "c")				; glyph 243, Cresc. line
            Send l-4
        If (Dynamics = "d")				; glyph 244, Dim. line
            Send l-5
        Sleep, 100
        Send ^!p					; MSc user defined shortcut 'Apply current palette element' (*change*?)
        Sleep, 200
    }
    If (Dynamics = "<")					; added for completeness: direct way is faster
    {
        Send +{,}
        Sleep, 50
    }
    If (Dynamics = ">")					; added for completeness: direct way is faster
    {
        Send +{.}
        Sleep, 50
    }
    DynamicsOld := Dynamics
    Keywait, RAlt, d
    Sleep, 100
    WinActivate, ahk_class #32770			; activates InputBox (#32770 found via Window Spy)
    Sleep, 100
}
Tooltip, , , , 2					; close tooltip (2)
Loop, 12						; allow to skip max 12 elements in other voices
{
    Send !{left}					; give system and appearance
    Sleep, 300						; of statusbar some time
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
    If (ErrorLevel = 1)					; no note
    Continue
    If (ErrorLevel = 0)					; note found
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
MsgBox, 4144, Search for voice 1234 note, Note not found.
Click, %ElementX%, %ElementY%
; Send {Volume_Mute}					; Mute/unmute the master volume
Return

; ♣================================================================================================