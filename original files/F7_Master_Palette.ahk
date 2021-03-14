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
; Lines marked with (*change*?) StartY - 160 is height tooltip.

~[ & F7::
CoordMode, Tooltip, Screen
Tooltip, F7  Symbols MP, ToolT_F7_X, 0, 1		; tooltip (1) Symbols Master Palette
Return

~] & F7::
MsgBox, 4132, Symbols Master Palette, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 7::
MsgBox, 4096, F7: Symbols Master Palette      [ + 7,
(
Add Ornaments from Master Palette		Z + O
Add Symbols from Master Palette		Z + S

NB: When the Master Palette window covers
the selected note the macro will not work!
)
Return

; ♣============================ ADD SYMBOLS FROM MASTER PALETTE ==========================

; Important! The selected note or rest must remain visible thus NOT be covered by the Master Palette!
; When you position the Master Palette in the bottom right corner this risk is minimal.
; NB: for finetuning position with NumPad keys macrogroup#4 Positioning must be active.

~z & s::				; add add symbols from master palette
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel				; if 'Inspector' is not in the correct spot
{
    MsgBox, 4112, Inspector Check, The Canvas is not in the defined state.`nThe macro will exit.
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if ErrorLevel
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest.png
if ErrorLevel
{
    MsgBox, 4112, Master Palette Symbols, No note or rest selected!
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
    MsgBox, 4144, Looking for an element in voice 1`, 2`, 3`, `4, The element was not found.`nMaybe there is nothing selected.`nOr you could try a higher zoom factor.
    Return
}
MouseMove, ElementX, ElementY
MouseGetPos, StartX, StartY
InputBox, SymbolMasPal, Enter Master Palette Symbols, , , W_IB, H_IB, IB_X, IB_Y, , , Help = ?	; (*change*?)
if ErrorLevel				; when Cancel is pressed
{
Click, %StartX%, %StartY%
Return
}

If (SymbolMasPal = "?") || (SymbolMasPal = "Help = ?")
{
    MsgBox, 4096, Master Palette Symbols - Help shortcuts,
(
Master Palette Symbols can be attached to a note or rest.

Enter a help shortcut or a symbol shortcut

String				STRI	S
Harp				HARP	H
Guitar				GUIT	G
Percussion			PERC	P
Wind				WIND	W
Vocal				VOICE	V
Keyboard, Piano, Organ		KEYB	K
Conductor			COND	C
Brackets, Braces
Parentheses, System dividers
Bar repeats, Segno special		BRAC	B
)
    InputBox, SymbolMasPal, Master Palette Symbols, , , W_IB, H_IB, IB_X, IB_Y, , , Enter Help or Symbol Shortcut
    if ErrorLevel				; when Cancel is pressed
    {
        Click, %StartX%, %StartY%
        Return
    }
}

If (SymbolMasPal = "s") || (SymbolMasPal = "stri")
{
    MsgBox, 4096, Master Palette Symbols - shortcuts String and Plucked,
(
String techniques

Up bow					UB
Down bow				DB
Turned up bow				TUB
Turned down bow			TDB
Bow behind bridge stemless		SULP	(sul ponticello)
Bow behind bridge with stem		SULP+	(sul ponticello)
Bow on top of bridge stemless		BOB
Bow on top of bridge with stem		BOB+
Bow on tailpiece stemless			TAIL
Bow on tailpiece with stem			TAIL+
Bow behind bridge on one string		BBB1
Bow behind bridge on two strings		BBB2
Bow behind bridge on three strings		BBB3
Bow behind bridge on four strings		BBB4
Change bow direction, indeterminate	CBDI
Fouetté, whip stroke	 		FOUETTE
Harmonic				HAR
Half-harmonic				HHAR
Jeté (gettato) above			JETEA
Jeté (gettato) below			JETEB
Mute on					MON
Mute off					MOFF
Overpressure, down bow			OVERD
Overpressure, up bow			OVERU
Overpressure, no bow direction		OVERN
Thumb position				TP
Turned thumb position			TTP
Unmeasured tremolo stemless		UT	(Penderecki)
Unmeasured tremolo with stem		UT+	(Penderecki)
Vibrato pulse accent stemless		VPA	(Saunders)
Vibrato pulse accent with stem		VPA+	(Saunders)

Plucked techniques

Arpeggiato up				ARPU
Arpeggiato down				ARPD
Buzz pizzicato				BPIZZ
Damp stemless				D
Damp with stem				D+
Damp for stem				DFS
Damp all					DA
Fingernail flick				FF
With fingernails				WF
Left-hand pizzicato			LHPIZZ
Plectrum					PL
Snap pizzicato above			SPIZZA
Snap pizzicato below			SPIZZB
)
}

If (SymbolMasPal = "harp") || (SymbolMasPal = "h")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Harp,
(
Harp techniques

Ascending aeolian chords (Salzedo)		AAC
Descending aeolian chords (Salzedo)		DAC
Damp above (Salzedo)			DAMPA
Damp below (Salzedo)			DAMPB
Damp with both hands (Salzedo		DAMP2H
Damp only low strings (Salzedo)		DAMPL
Fluidic sounds, left hand (Salzedo)		FSL
Fluidic sounds, right hand (Salzedo)		FSR
Harp pedal raised (flat)			HPR
Harp pedal centered (natural)		HPC
Harp pedal lowered (sharp)			HPL
Harp pedal divider				HPD
Isolated sounds (Salzedo)			ISO
Metal rod pictogram			ROD
Metallic sounds, one string (Salzedo)		MS1S
Metallic sounds (Salzedo)			MSS
Muffle totally (Salzedo)			MUF
Oboic flux (Salzedo)			FLUX
Play at upper end of strings (Salzedo)		UPPER
Retune strings for glissando		RETUNE
Slide with suppleness (Salzedo)		SLIDE
Snare drum effect (Salzedo)			SNARE
String noise stemless			SN
String noise with stem			SN+
Tam-tam sounds (Salzedo)			TAM
Thunder effect (Salzedo)			THU
Timpanic sounds (Salzedo)			TIM
Tuning key pictogram			TKEY
Use handle of tuning key pictogram		HANDLE
Use shank of tuning key pictogram		SHANK
Whistling sounds (Salzedo)			WHISTLE
)
}

If (SymbolMasPal = "guit") || (SymbolMasPal = "g")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Guitar,
(
Guitar

Strum direction up		SDU
Strum direction down		SDD
Left-hand tapping			LHT
Right-hand tapping		RHT
Golpe (tapping the pick guard)	GOL
Guitar shake			GSHAKE
Half-open wah/volume pedal	HALFO
Guitar vibrato bar dip		BARDIP
Guitar vibrato bar scoop		BARSCP
)
}

If (SymbolMasPal = "wind") || (SymbolMasPal = "w")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Wind,
(
Wind techniques

Embouchure
Flatter embouchure			FEMB
Sharper embouchure			SEMB
Relaxed embouchure			REMB
Somewhat relaxed embouchure		SREMB
Somewhat tight embouchure		STEMB
Tight embouchure				TEMB
Very tight embouchure			VTEMB
Very relaxed embouchure / weak air-pressure	VREMBW
Very tight embouchure / strong air pressure	VTEMBS

Hole
Closed hole				CLH
Half-closed hole				1/2CLH
Half-closed hole 2				1/2CLH2
Half-open hole				HOH
Three-quarters closed hole			3/4CLH
Open hole				OH

Multiphonics
Multiphonics (black) stemless		MPHB
Multiphonics (black) with stem		MPHB+
Multiphonics (white) stemless		MPHW
Multiphonics (white) with stem		MPHW+
Multiphonics (black and white) stemless	MPHBW
Multiphonics (black and white) with stem	MPHBW+

Reed
Normal reed position			NREED
Very little reed (pull outwards)		VLREED
Much more reed (push inwards)		MMREED

Tongue
Double-tongue above			DTA
Double-tongue below			DTB
Triple-tongue above			TTA
Triple-tongue below			TTB

Miscellaneous
Mouthpiece or hand pop			MPIECE
Rim only					RIM
Trill key					TRK
)
}

If (SymbolMasPal = "perc") || (SymbolMasPal = "p")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Percussion,
(
Percussion techniques

Buzz roll stemless				BUZZ
Buzz roll with stem			BUZZ+
Center (Weinberg)				CENTERW
Center (Ghent)				CENTERG
Center (Caltabiano)			CENTERC
Choke (Weinberg)				CHOKE
Crush stemless				CRUSH
Damp					DAMP
Damp 2					DAMP2
Damp 3					DAMP3
Damp 4					DAMP4
Damp with stem				D+
Damp for stem				DFS
Half-open				HO
Half-open 2 (Weinberg)			HO2
Left hand (Agostini)			LHA
Normal position (Caltabiano)		NPC
On rim					ONRIM
Open = open wah				O
Right hand (Agostini)			RHA
Rim (Caltabiano)				RIMC
Rim (Ghent)				RIMG
Rim or edge (Weinberg)			RIMW
Rim shot for stem				RS
Rim shot with stem			RS+
Rim shot closed	+ sign			RSC
Scrape from center to edge			SCE
Scrape from edge to center			SEC
Scrape around rim (counter-clockwise)	SCCW
Scrape around rim (clockwise)		SCW
Stick shot				SS
Swish stemless				SWISH
Swish with stem				SWISH+
Turn right stemless			TR
Turn left stemless				TL
Turn left or right stemless			TLOR
X stemless (dead note)			X
)
}

If (SymbolMasPal = "cond") || (SymbolMasPal = "c")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Conductor,
(
Conductor symbols

Strong beat or cue		SB
Left-hand beat or cue		LB
Right-hand beat or cue		RB
Weak beat or cue			WB
Beat 2, simple time			B2S
Beat 3, simple time			B3S
Beat 4, simple time			B4S
Beat 2, compound time		B2C
Beat 3, compound time		B3C
Beat 4, compound time		B4C
Unconducted/free passages	FREE
)
}

If (SymbolMasPal = "voice") || (SymbolMasPal = "v")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Vocal,
(
Vocal techniques

Mouth closed				MC
Mouth slightly open			MSO
Mouth open				MO
Mouth wide open				MWO
Mouth pursed				MP
Sprechgesang				SG
Sprechgesang with stem			SG+
Sussurando for stem			SSDO
Sussurando with stem			SSDO+
Nasal voice				NV
Tongue click (Stockhausen)			TC
Finger click (Stockhausen)			FC
Tongue and finger click (Stockhausen)	TFC
)
}

If (SymbolMasPal = "keyb") || (SymbolMasPal = "k")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Keyboard,
(
Keyboard, Piano, Organ & Finger substitution

Pedal heel 1		PH1	Pedal Ped	             PEDPED
Pedal heel 2		PH2	Pedal P			PEDP
Pedal heel 3 (Davis)	PH3	Pedal S			PEDS
Pedal toe 1		PT1	Sostenuto pedal mark	SOS
Pedal toe 2		PT2	Half pedal mark 1		HP1
Pedal toe to heel		PTTH	Half pedal mark 2		HP2
Pedal heel to toe	 	PHTT
Pedal heel or toe		PHOT

Truncated brackets:
Play with left hand	PLH	Play with right hand 	PRH
Play with left hand (End)	PLHE	Play with right hand (End)	PRHE

Loco (octaves supplement)	LOCO

Finger substitution above					FSA
Finger substitution below					FSB
Finger substitution dash					FSD
Multiple notes played by thumb or single finger		MN
)
}

If (SymbolMasPal = "brac") || (SymbolMasPal = "b")
{
MsgBox, 4096, Master Palette Symbols - shortcuts Brackets etc.,
(
Brackets, Braces, Parentheses, System dividers, Bar repeats

Double-height left bracket			DHLB
Double-height right bracket		DHRB
Left bracket for whole time signature		LBTS
Right bracket for whole time signature	RBTS
Left bracket for numerator only		LBNO
Right bracket for numerator only		RBNO
Combining open curly brace		OCB
Combining close curly brace		CCB
Brace					BR
Reversed brace				RBR
Double-height left parenthesis		DHLP
Double-height right parenthesis		DHRP

System divider				SDIV
Long system divider			LSDIV
Extra long system divider			ELSDIV
Split bar divider (bar spans a system break)	SBDIV
Staff divide arrows			SDIVAR

Segno serpent vertical lines			SS||
Repeat 1-measure				RM1
Repeat 2-measure				RM2
Repeat 4-measure				RM4
)
}

If SymbolMasPal in ?,Help = ?,s,stri,harp,h,guit,g,wind,w,perc,p,cond,c,voice,v,keyb,k,brac,b
InputBox, SymbolMasPal, Enter Master Palette Symbols, , , W_IB, H_IB, IB_X, IB_Y, , , Enter symbol shortcut
if ErrorLevel				; when Cancel is pressed
{
    Click, %StartX%, %StartY%
    Return
}

; 220 symbols in total
; NB: If SymbolMasPal in arpu,arpd,br,buzz,damp,damp3,har,oh,sg,tail,ut	 AMBIGUOUS SYMBOL NAMES - these get special treatment

If SymbolMasPal not in ub,db,tub,tdb,hhar,mon,moff,sulp,sulp+,bob,bob+,overd,overu,overn
,jetea,jeteb,fouette,tp,ttp,cbdi,bbb1,bbb2,bbb3,bbb4,vpa,vpa+,tail+,ut+,bpizz,d,d+,dfs
,da,ff,wf,lhpizz,pl,spizza,spizzb
,aac,dac,dampa,dampb,damp2h,dampl,fsl,fsr,hpr,hpc,hpl,hpd,iso,rod,ms1s,mss,muf,flux
,upper,retune,slide,snare,sn,sn+,tam,thu,tim,tkey,handle,shank,whistle
,dta,dtb,tta,ttb,clh,3/4clh,1/2clh,1/2clh2,hoh,trk,femb,semb,remb,sremb,temb,stemb
,vtemb,vrembw,vtembs,nreed,vlreed,mmreed,mphb,mphb+,mphw,mphw+,mphbw,mphbw+,mpiece,rim
,buzz+,centerw,centerg,centerc,choke,crush,damp2,damp4,ho,ho2,lha,npc
,o,onrim,rha,rimc,rimg,rimw,rs,rs+,rsc,sce,sec,sccw,scw,ss,swish,swish+,tr,tl,tlor,x
,mc,mso,mo,mwo,mp,sg+,ssdo,ssdo+,nv,tc,fc,tfc,sb,lb,rb,wb,b2s,b3s,b4s,b2c,b3c,b4c
,free,dhlp,dhrp,dhlb,dhrb,lbts,rbts,lbno,rbno,ocb,ccb,rbr,sdiv,lsdiv,elsdiv
,sbdiv,sdivar
,pedped,pedp,peds,sos,hp1,hp2,ph1,ph2,ph3,pt1,pt2,ptth,phtt,phot,plh,plhe,prh,prhe,loco,fsa,fsb,fsd,mn
,sdu,sdd,lht,rht,gol,gshake,halfo,bardip,barscp
,rm1,rm2,rm4,ss||
,arpu,arpd,har,tail,ut,oh,buzz,damp,damp3,sg,br
    {
    MsgBox, 4144, Add Symbols from Master Palette, ⁞	No valid command!`n⁞	The macro will exit.
    Return
    }
/*
; Symbols Alphabetically: (NB: ornaments created with Z + O)
; If SymbolMasPal in aac,arpd,arpu,b2c,b2s,b3c,b3s,b4c,b4s,bardip,barscp,bbb1,bbb2,bbb3,bbb4,bob,bob+,bpizz
; ,br,buzz,buzz+,cbdi,ccb,centerc,centerg,centerw,choke,clh,3/4clh,1/2clh,1/2clh2,crush
; ,d,d+,da,dac,damp,dampa,dampb,damp2,damp2h,damp3,damp4,dampl,db,dfs,dhlb,dhlp,dhrb,dhrp
; ,dta,dtb,elsdiv,fc,femb,ff,flux,fouette,free,fsa,fsb,fsd,fsl,fsr,gol,gshake,halfo,handle,har,hhar
; ,ho,ho2,hoh,hp1,hp2,hpc,hpd,hpl,hpr,iso,jetea,jeteb,lb,lbno,lbts,lha,lhpizz,lht,lsdiv
; ,mc,mmreed,mn,mo,moff,mon,mp,mphb,mphb+,mphbw,mphbw+,mphw,mphw+,mpiece,ms1s,mso,mss,muf,mwo
; ,nreed,npc,nv,o,oh,ocb,onrim,overd,overn,overu
; ,pedp,pedped,peds,ph1,ph2,ph3,phot,phtt,pl,plh,plhe,prh,prhe,pt1,pt2,ptth
; ,rb,rbno,rbr,rbts,remb,retune,rha,rht,rim,rimc,rimg,rimw,rm1,rm2,rm4,rod,rs,rs+,rsc
; ,sb,sbdiv,sce,sdd,sdiv,sdivar,sdu,sec,sccw,scw,semb,sg,sg+,shank,slide
; ,sn,sn+,snare,sos,spizza,spizzb,sremb,ss,ss||,ssdo,ssdo+,stemb,sulp,sulp+,swish,swish+
; ,tail,tail+,tam,tc,tdb,temb,tfc,thu,tim,tkey,tl,tlor,tp,tr,trk,tta,ttb,ttp,tu,tub
; ,ub,upper,ut,ut+,vlreed,vpa,vpa+,vrembw,vtemb,vtembs,wb,wf,whistle,x
*/

Send {Escape}						; deselects note or rest
Sleep, 50
Send +{z}						; open master palette symbols - custom shortcut!
Sleep, 400						; <<<<<<<<<<<<<
CoordMode, Mouse, Window
Click, %WMPS_02X%, %WMPS_02Y%				; (WMPS_02) Clear rectangle Window Master Palette Symbols
Sleep, 300						; shows all symbols (*change*?)
Click, %MasPalFirstFieldX%, %MasPalFirstFieldY%		; click the centre of leftmost (first) symbol
Sleep, 50
WinActivate, ahk_exe MuseScore3.exe
Sleep, 100
CoordMode, Mouse, Screen
Click, %StartX%, %StartY%		; selects note or rest - master palette must not cover note/rest!
Sleep, 100
CoordMode, Pixel, Screen
WinActivate, Master Palette
Sleep, 100						; <<<<<<<
CoordMode, Mouse, Window
Sleep, 50
Click, %WMPS_01X%, %WMPS_01Y%				; (WMPS_01) Search rectangle Window Master Palette Symbols
Sleep, 200

; ♣==============================================STRING ===========================================

If (SymbolMasPal = "ub")
    Send p bow				; Up bow
If (SymbolMasPal = "db")
    Send n bo				; Down bow
If (SymbolMasPal = "tub")
    Send d up bow			; Turned up bow
If (SymbolMasPal = "tdb")
    Send ed dow				; Turned down bow
If (SymbolMasPal = "hhar")
    Send f-h				; Half-harmonic
If (SymbolMasPal = "mon")
    Send ute on				; Mute on
If (SymbolMasPal = "moff")
    Send ute of				; Mute off
If (SymbolMasPal = "sulp")
    Send e (sul p			; Bow behind bridge (sul ponticello)
If (SymbolMasPal = "sulp+")
    Send g sul p			; Combining sul ponticello (bow behind bridge) stem
If (SymbolMasPal = "bob")
    Send on to				; Bow on top of bridge
If (SymbolMasPal = "bob+")
    Send w on b				; Combining bow on bridge stem
If (SymbolMasPal = "overd")
    Send re, d				; Overpressure, down bow
If (SymbolMasPal = "overu")
    Send re, u				; Overpressure, up bow
If (SymbolMasPal = "overn")
    Send re, n				; Overpressure, no bow direction
If (SymbolMasPal = "jetea")
    Send tato) a			; Jeté (gettato) above
If (SymbolMasPal = "jeteb")
    Send tato) b			; Jeté (gettato) below
If (SymbolMasPal = "fouette")
    Send tté				; Fouetté
If (SymbolMasPal = "har")
    Send monic				; Harmonic -> 4 x-> RIGHT
If (SymbolMasPal = "tp")
    Send b p				; Thumb position
If (SymbolMasPal = "ttp")
    Send ed th				; Turned thumb position
If (SymbolMasPal = "cbdi")
   Send inate				; Change bow direction, indeterminate
If (SymbolMasPal = "bbb1")
    Send n on				; Bow behind bridge on one string
If (SymbolMasPal = "bbb2")
    Send n tw				; Bow behind bridge on two strings
If (SymbolMasPal = "bbb3")
    Send n thr				; Bow behind bridge on three strings
If (SymbolMasPal = "bbb4")
    Send n fo				; Bow behind bridge on four strings
If (SymbolMasPal = "tail")
    Send lpi				; Bow on tailpiece -> RIGHT
If (SymbolMasPal = "vpa")
    Send s) f				; Vibrato pulse accent (Saunders) for stem
If (SymbolMasPal = "vpa+")
    Send g vi				; Combining vibrato pulse accent (Saunders) stem
If (SymbolMasPal = "arpu")
    Send to u				; Arpeggiato up -> RIGHT
If (SymbolMasPal = "arpd")
    Send to d				; Arpeggiato down -> RIGHT
If (SymbolMasPal = "tail+")
    Send g bow on t			; Combining bow on tailpiece stem
If (SymbolMasPal = "ut")
    Send cki u				; Penderecki unmeasured tremolo	stemless -> RIGHT
If (SymbolMasPal = "ut+")
    Send g penderecki u			; Combining Penderecki unmeasured tremolo stem
If (SymbolMasPal = "bpizz")
    Send z p				; Buzz pizzicato
If (SymbolMasPal = "d")
    Send mp 3				; Damp stemless, Damp 3
If (SymbolMasPal = "d+")
    Send mp s				; Combining damp stem
If (SymbolMasPal = "dfs")
    Send mp f				; Damp for stem
If (SymbolMasPal = "da")
    Send p al				; Damp all
If (SymbolMasPal = "ff")
    Send flic				; Fingernail flick
If (SymbolMasPal = "wf")
    Send h fi				; With fingernails
If (SymbolMasPal = "lhpizz")
    Send -hand p			; Left-hand pizzicato
If (SymbolMasPal = "pl")
    Send ctr				; Plectrum
If (SymbolMasPal = "spizzb")
    Send icato b			; Snap pizzicato below
If (SymbolMasPal = "spizza")
    Send icato a			; Snap pizzicato above

; ♣=============================================== HARP ===========================================

If (SymbolMasPal = "aac")
    Send ascending a			; Ascending aeolian chords (Salzedo)
If (SymbolMasPal = "dac")
    Send escending a			; Descending aeolian chords (Salzedo)
If (SymbolMasPal = "dampa")
    Send mp ab				; Damp above (Salzedo)
If (SymbolMasPal = "dampb")
    Send mp b				; Damp below (Salzedo)
If (SymbolMasPal = "damp2h")
    Send mp w				; Damp with both hands (Salzedo)
If (SymbolMasPal = "dampl")
    Send w st				; Damp only low strings (Salzedo)
If (SymbolMasPal = "fsl")
    Send s, left h			; Fluidic sounds, left hand (Salzedo)
If (SymbolMasPal = "fsr")
    Send s, right h			; Fluidic sounds, right hand (Salzedo)
If (SymbolMasPal = "hpr")
    Send d (f				; Harp pedal raised (flat)
If (SymbolMasPal = "hpc")
    Send d (n				; Harp pedal centered (natural)
If (SymbolMasPal = "hpl")
    Send d (sharp)			; Harp pedal lowered (sharp)
If (SymbolMasPal = "hpd")
    Send l div				; Harp pedal divider
If (SymbolMasPal = "iso")
    Send isol				; Isolated sounds (Salzedo)
If (SymbolMasPal = "rod")
    Send rod				; Metal rod pictogram
If (SymbolMasPal = "ms1s")
    Send s, o				; Metallic sounds, one string (Salzedo)
If (SymbolMasPal = "mss")
    Send lic sounds (s			; Metallic sounds (Salzedo)
If (SymbolMasPal = "muf")
    Send muffl				; Muffle totally (Salzedo)
If (SymbolMasPal = "flux")
    Send x (s				; Oboic flux (Salzedo)
If (SymbolMasPal = "upper")
    Send f str				; Play at upper end of strings (Salzedo)
If (SymbolMasPal = "retune")
    Send s for g			; Retune strings for glissando
If (SymbolMasPal = "slide")
    Send ss (s				; Slide with suppleness (Salzedo)
If (SymbolMasPal = "snare")
    Send m ef				; Snare drum effect (Salzedo)
If (SymbolMasPal = "sn")
    Send g str				; Combining string noise for stem
If (SymbolMasPal = "sn+")
    Send ng har				; Combining harp string noise stem
If (SymbolMasPal = "tam")
    Send m so				; Tam-tam sounds (Salzedo)
If (SymbolMasPal = "thu")
    Send r ef				; Thunder effect (Salzedo)
If (SymbolMasPal = "tim")
    Send nic s				; Timpanic sounds (Salzedo)
If (SymbolMasPal = "tkey")
    Send g k				; Tuning key pictogram
If (SymbolMasPal = "handle")
    Send use h				; Use handle of tuning key pictogram
If (SymbolMasPal = "shank")
    Send use s				; Use shank of tuning key pictogram
If (SymbolMasPal = "whistle")
    Send g so				; Whistling sounds (Salzedo)

; ♣============================================= GUITAR ===========================================

If (SymbolMasPal = "sdu")
    Send on u				; strum direction up
If (SymbolMasPal = "sdd")
    Send on dow				; strum direction down
If (SymbolMasPal = "lht")
    Send ft-hand ta			; left-hand tapping
If (SymbolMasPal = "rht")
    Send ht-hand ta			; right-hand tapping
If (SymbolMasPal = "gol")
    Send gol				; golpe (tapping the pick guard)
If (SymbolMasPal = "gshake")
    Send ar shake			; guitar shake
If (SymbolMasPal = "halfo")
    Send f-open w			; half-open wah/volume pedal
If (SymbolMasPal = "bardip")
    Send r dip				; guitar vibrato bar dip
If (SymbolMasPal = "barscp")
    Send r sc				; guitar vibrato bar scoop

; ♣============================================ WIND ==============================================

If (SymbolMasPal = "dta")
    Send ble-tongue a			; Double-tongue above
If (SymbolMasPal = "dtb")
    Send ble-tongue b			; Double-tongue below
If (SymbolMasPal = "tta")
    Send ple-tongue a			; Triple-tongue above
If (SymbolMasPal = "ttb")
    Send ple-tongue b			; Triple-tongue below
If (SymbolMasPal = "clh")
    Send sed h				; Closed hole
If (SymbolMasPal = "3/4clh")
    Send s clo				; Three-quarters closed hole
If (SymbolMasPal = "1/2clh")
    Send f-closed h			; Half-closed hole
If (SymbolMasPal = "1/2clh2")
    Send ole 2				; Half-closed hole 2
If (SymbolMasPal = "hoh")
    Send -open h			; Half-open hole
If (SymbolMasPal = "oh")
    Send open h				; Open hole -> RIGHT
If (SymbolMasPal = "trk")
    Send l k				; Trill key
If (SymbolMasPal = "femb")
    Send ter e				; Flatter embouchure
If (SymbolMasPal = "semb")
    Send rper e				; Sharper embouchure
If (SymbolMasPal = "remb")
    Send xed e				; Relaxed embouchure
If (SymbolMasPal = "sremb")
    Send hat r				; Somewhat relaxed embouchure
If (SymbolMasPal = "temb")
    Send tight				; Tight embouchure
If (SymbolMasPal = "stemb")
    Send at t				; Somewhat tight embouchure
If (SymbolMasPal = "vtemb")
    Send ery t				; Very tight embouchure
If (SymbolMasPal = "vrembw")
    Send ery r				; Very relaxed embouchure / weak air-pressure
If (SymbolMasPal = "vtembs")
    Send / st				; Very tight embouchure / strong air pressure
If (SymbolMasPal = "nreed")
    Send mal r				; Normal reed position
If (SymbolMasPal = "vlreed")
    Send (pull				; Very little reed (pull outwards)
If (SymbolMasPal = "mmreed")
    Send more r				; Much more reed (push inwards)
If (SymbolMasPal = "mphb")
    Send ck) f				; Combining multiphonics (black) for stem
If (SymbolMasPal = "mphb+")
    Send ck) s				; Combining multiphonics (black) stem
If (SymbolMasPal = "mphw")
    Send (white) f			; Combining multiphonics (white) for stem
If (SymbolMasPal = "mphw+")
    Send s (white) s			; Combining multiphonics (white) stem
If (SymbolMasPal = "mphbw")
    Send d white) f			; Combining multiphonics (black and white) for stem
If (SymbolMasPal = "mphbw+")
    Send d white) s			; Combining multiphonics (black and white) stem
If (SymbolMasPal = "mpiece")
    Send nd po				; Mouthpiece or hand pop
If (SymbolMasPal = "rim")
    Send im on				; Rim only

; ♣============================================ PERCUSSION ========================================

If (SymbolMasPal = "buzz")
    Send buzz r				; Buzz roll stemless -> RIGHT
If (SymbolMasPal = "buzz+")
    Send g buzz				; Combining buzz roll stem
If (SymbolMasPal = "centerw")
    Send r (w				; Center (Weinberg)
If (SymbolMasPal = "centerg")
    Send r (g				; Center (Ghent)
If (SymbolMasPal = "centerc")
    Send r (ca				; Center (Caltabiano)
If (SymbolMasPal = "choke")
    Send ke (we				; Choke (Weinberg)
If (SymbolMasPal = "crush")
    Send cru				; Combining crush for stem
If (SymbolMasPal = "damp")
    Send damp				; Damp -> 5x RIGHT
If (SymbolMasPal = "damp2")
    Send mp 2				; Damp 2
If (SymbolMasPal = "damp3")
    Send mp 3				; Damp 3 -> RIGHT
If (SymbolMasPal = "damp4")
    Send mp 4				; Damp 4
; If (SymbolMasPal = "d+") If (SymbolMasPal = "dfs") already in String techniques
If (SymbolMasPal = "ho")
    Send -open w			; Half-open
If (SymbolMasPal = "ho2")
    Send 2 (w				; Half-open 2 (Weinberg)
If (SymbolMasPal = "lha")
    Send ft hand (a			; Left hand (Agostini)
If (SymbolMasPal = "npc")
    Send n (c				; Normal position (Caltabiano)
If (SymbolMasPal = "onrim")
    Send on r				; On rim
If (SymbolMasPal = "o")
    Send en w				; Open, is same symbol as open wah
If (SymbolMasPal = "rha")
    Send ht hand (a			; Right hand (Agostini)
If (SymbolMasPal = "rimc")
    Send m (ca				; Rim (Caltabiano)
If (SymbolMasPal = "rimg")
    Send m (g				; Rim (Ghent)
If (SymbolMasPal = "rimw")
    Send ge (w				; Rim or edge (Weinberg)
If (SymbolMasPal = "rs")
    Send ot f				; Rim shot for stem
If (SymbolMasPal = "rs+")
    Send ot s				; Combining Rim shot stem
If (SymbolMasPal = "rsc")
    Send / rim s			; Closed / rim shot
If (SymbolMasPal = "sce")
    Send om e				; Scrape from center to edge
If (SymbolMasPal = "sec")
    Send om c				; Scrape from edge to center
If (SymbolMasPal = "sccw")
    Send im (co				; Scrape around rim (counter-clockwise)
If (SymbolMasPal = "scw")
    Send m (cl				; Scrape around rim (clockwise)
If (SymbolMasPal = "ss")
    Send ick s				; Stick shot
If (SymbolMasPal = "swish")
    Send ish f				; Combining swish for stem
If (SymbolMasPal = "swish+")
    Send hed s				; Combining swished stem
If (SymbolMasPal = "tr")
    Send n rig				; Combining turn right for stem
If (SymbolMasPal = "tl")
    Send ft f				; Combining turn left for stem
If (SymbolMasPal = "tlor")
    Send ft o				; Combining turn left or right for stem
If (SymbolMasPal = "x")
    Send dea				; Combining X for stem (dead note)

; ♣=== VOCAL ==== CONDUCTOR === BRACKETS, BRACES DIVIDERS === BAR REPEATS === SEGNO SPECIAL =======

If (SymbolMasPal = "mc")
    Send h cl				; Mouth closed
If (SymbolMasPal = "mso")
    Send h sli				; Mouth slightly open
If (SymbolMasPal = "mo")
    Send h op				; Mouth open
If (SymbolMasPal = "mwo")
    Send h wid				; Mouth wide open
If (SymbolMasPal = "mp")
    Send h pu				; Mouth pursed
If (SymbolMasPal = "sg")
    Send spr				; Sprechgesang -> RIGHT
If (SymbolMasPal = "sg+")
    Send g sp				; Combining sprechgesang stem
If (SymbolMasPal = "ssdo+")
    Send do s				; Combining sussurando stem
If (SymbolMasPal = "ssdo")
    Send do f				; Combining sussurando for stem
If (SymbolMasPal = "nv")
    Send voic				; Nasal voice
If (SymbolMasPal = "tc")
    Send e cli				; Tongue click (Stockhausen)
If (SymbolMasPal = "fc")
    Send r cli				; Finger click (Stockhausen)
If (SymbolMasPal = "tfc")
    Send e and f			; Tongue and finger click (Stockhausen)
If (SymbolMasPal = "sb")
    Send g bea				; Strong beat or cue
If (SymbolMasPal = "lb")
    Send ft-hand b			; Left-hand beat or cue
If (SymbolMasPal = "rb")
    Send ht-hand b			; Right-hand beat or cue
If (SymbolMasPal = "wb")
    Send k bea				; Weak beat or cue
If (SymbolMasPal = "b2s")
    Send 2, s				; Beat 2, simple time
If (SymbolMasPal = "b3s")
    Send 3, s				; Beat 3, simple time
If (SymbolMasPal = "b4s")
    Send 4, s				; Beat 4, simple time
If (SymbolMasPal = "b2c")
    Send 2, c				; Beat 2, compound time
If (SymbolMasPal = "b3c")
    Send 3, c				; Beat 3, compound time
If (SymbolMasPal = "b4c")
    Send 4, c				; Beat 4, compound time
If (SymbolMasPal = "free")
    Send nco				; Unconducted/free passages
If (SymbolMasPal = "dhlp")
    Send t left p			; Double-height left parenthesis
If (SymbolMasPal = "dhrp")
    Send t right p			; Double-height right parenthesis
If (SymbolMasPal = "dhlb")
    Send t left b			; Double-height left bracket
If (SymbolMasPal = "dhrb")
    Send t right b			; Double-height right bracket
If (SymbolMasPal = "lbts")
    Send ft bracket for w		; Left bracket for whole time signature
If (SymbolMasPal = "rbts")
    Send ht bracket for w		; Right bracket for whole time signature
If (SymbolMasPal = "lbno")
    Send ft bracket for n		; Left bracket for numerator only
If (SymbolMasPal = "rbno")
    Send ht bracket for n		; Right bracket for numerator only
If (SymbolMasPal = "ocb")
    Send g op				; Combining open curly brace
If (SymbolMasPal = "ccb")
    Send g clo				; Combining close curly brace
If (SymbolMasPal = "br")
    Send brace				; Brace -> 2x RIGHT
If (SymbolMasPal = "rbr")
    Send d brace			; Reversed brace
If (SymbolMasPal = "sdiv")
    Send m div				; System divider - Automatic Placement Off
If (SymbolMasPal = "lsdiv")
    Send ong sy				; Long system divider - Automatic Placement Off
If (SymbolMasPal = "elsdiv")
    Send xtr				; Extra long system divider - Automatic Placement Off
If (SymbolMasPal = "sbdiv")
    Send r (b				; Split bar divider (bar spans a system break)
If (SymbolMasPal = "sdivar")
    Send arrows				; Staff divide arrows
If (SymbolMasPal = "rm1")
    Send st m				; 1-measure repeat sign graphical
If (SymbolMasPal = "rm2")
    Send last t				; 2-measure repeat sign graphical
If (SymbolMasPal = "rm4")
    Send r mea				; 4-measure repeat sign graphical
If (SymbolMasPal = "ss||")
    Send l lines			; segno (serpent with vertical lines)

; ♣===================================== KEYBOARD & Finger substitution ===========================

If (SymbolMasPal = "pedped")
    Send dal m				; pedal Ped
If (SymbolMasPal = "pedp")
    Send dal p				; pedal P
If (SymbolMasPal = "peds")
    Send edal s				; pedal S
If (SymbolMasPal = "sos")
    Send o pe				; sostenuto pedal mark
If (SymbolMasPal = "hp1")
    Send rk 1				; half pedal mark 1
If (SymbolMasPal = "hp2")
    Send rk 2				; half pedal mark 2
If (SymbolMasPal = "ph1")
    Send eel 1				; pedal heel 1
If (SymbolMasPal = "ph2")
    Send eel 2				; pedal heel 2
If (SymbolMasPal = "ph3")
    Send eel 3				; pedal heel 3 (Davis)
If (SymbolMasPal = "pt1")
    Send oe 1				; pedal toe 1
If (SymbolMasPal = "pt2")
    Send oe 2				; pedal toe 2
If (SymbolMasPal = "ptth")
    Send oe t				; pedal toe to heel
If (SymbolMasPal = "phtt")
    Send to toe				; pedal heel to toe 
If (SymbolMasPal = "phot")
    Send l or				; pedal heel or toe
If (SymbolMasPal = "plh")
    Send y with l			; play with left hand 
If (SymbolMasPal = "plhe")
    Send ft hand (e			; play with left hand (End)
If (SymbolMasPal = "prh")
    Send y with r			; play with right hand 
If (SymbolMasPal = "prhe")
    Send ht hand (e			; play with right hand (End)
If (SymbolMasPal = "loco")
    Send loco				; loco (octaves supplement)
If (SymbolMasPal = "fsa")
    Send n ab				; Finger substitution above
If (SymbolMasPal = "fsb")
    Send n bel				; Finger substitution below
If (SymbolMasPal = "fsd")
    Send n da				; Finger substitution dash
If (SymbolMasPal = "mn")
    Send ple n				; Multiple notes played by thumb or single finger

Sleep, 400				; !!!!!!!
CoordMode, Pixel, Window
; NB: Determine Search Area Master Palette Symbols (MP_XY/1 and MP_XY/2 in minimized window )
; determine ColorMasPal (Color selected element in Master Palette)
; in the next line the upper-left corner of the symbol is found
PixelSearch, SymbolMasterPalX, SymbolMasterPalY, % MP_X1, % MP_Y1, % MP_X2, % MP_Y2, ColorMasPal, , Fast RGB
if errorlevel
{
    MsgBox, 4112, Symbol Selection,
(
The symbol was not found.
Maybe the Master Palette needs activation.
Or the Master Palette covered the note.
Undo possible edits with Control + Z.
The macro will exit.
)
    IfMsgBox, OK
    WinActivate, Master Palette
    Sleep, 100
;    Send {Escape}			; master palette close
    Send +{z}
    Sleep, 50
    Return
}

CentreField_X := SymbolMasterPalX + MasPalFieldWidth / 2
CentreField_Y := SymbolMasterPalY + MasPalFieldHeight / 2

; ♣================================== 11 AMBIGUOUS SYMBOL NAMES ===================================

; some symbolnames are ambiguous resulting in more glyphs candidates; the correct one does not reside in the leftmost field
; starting at the first field the correct one is reached by a MouseMove + x times MasPalFieldWidth (is width of one cell in Master Palette)
If SymbolMasPal in arpu,arpd,har,tail,ut,oh,buzz,damp,damp3,sg,br
{
    If (SymbolMasPal = "tail") || (SymbolMasPal = "ut") || (SymbolMasPal = "arpd") || (SymbolMasPal = "arpu") || (SymbolMasPal = "oh") || (SymbolMasPal = "buzz") || (SymbolMasPal = "damp3") || (SymbolMasPal = "sg")
    {
        MouseMove, CentreField_X + MasPalFieldWidth, CentreField_Y
;        MsgBox, Mouse in centre second field?			; for testing
    }
    If (SymbolMasPal = "br")
        MouseMove, CentreField_X + MasPalFieldWidth * 2, CentreField_Y
    If (SymbolMasPal = "har")
        MouseMove, CentreField_X + MasPalFieldWidth * 4, CentreField_Y
    If (SymbolMasPal = "damp")
    {
        MouseMove, CentreField_X + MasPalFieldWidth * 5, CentreField_Y
;        MsgBox, Mouse in centre fifth field?			; for testing
    }
    Click
}
; ♣================================================================================================

If SymbolMasPal not in arpu,arpd,har,tail,ut,oh,buzz,damp,damp3,sg,br
    Click, %CentreField_X%, %CentreField_Y%
Sleep, 100
WinActivate, Master Palette
Sleep, 200				; was 100
Send +{z}				; master palette close
Sleep, 100
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Send {left}
Sleep, 50
Send {BS 4}
Sleep, 50
If SymbolMasPal in pedped,pedp,peds,sos,hp1,hp2,ph1,ph2,ph3,pt1,pt2,ptth,phtt,phot
    {
    Send 7.00				; move pedal and heel/toe symbols below the staff
    Goto, SkipAboveStaff
    }
Send -4.00
Sleep, 50
SkipAboveStaff:

Send {Escape}				; deselects Y-offset field
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
    MsgBox, 4144, Symbol Search,
(
The symbol was not found.
Maybe the Master Palette covered the note.
Undo possible edits with Control + Z.
The macro will exit.
)
    Return
}
Click, %ElementX%, %ElementY%
Send {=}					; automatic placement off
Sleep, 50
Click, 2
CoordMode, Tooltip, Screen
Tooltip, Position symbol with arrowkeys.`nPress Z when ready, StartX, StartY - 120, 2	; tooltip (2) (*change*?) StartY - 160 is height tooltip
Keywait, z, d
Tooltip, , , , 2			; close tooltip (2)
Click, %StartX%, %StartY%
Return

; ♣================================ MASTER PALETTE ======== ORNAMENTS =============================

; Important! The selected note or rest must remain visible thus NOT be covered by the Master Palette!
; When you position the Master Palette in the bottom right corner this risk is minimal.
; NB: for finetuning position with NumPad keys macrogroup#4 Positioning must be active!
; for a total of 34 Master Palette ornaments


~z & o::  				; add Ornaments from Master Palette
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
If ErrorLevel				; if 'Inspector' is not in the correct spot
{
    MsgBox, 4112, Inspector Check, The Canvas is not in the defined state.`nThe macro will exit.
    Return
}
ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Note_Pitch.png
if ErrorLevel
{
    MsgBox, 4112, Master Palette Ornaments, No note selected!`nThe macro will exit.
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
    MsgBox, 4144, Looking for a note in voice 1`, 2`, 3`, `4, The note was not found.`nTry a higher zoom factor.
    Return
}
MouseMove, ElementX, ElementY
MouseGetPos, StartX, StartY
InputBox, SymbolMasPal, Enter Master Palette Ornaments, , , W_IB, H_IB, IB_X, IB_Y, , , Help = ?
if ErrorLevel				; when Cancel is pressed
{
Click, %StartX%, %StartY%
Return
}
If (SymbolMasPal = "?") || (SymbolMasPal = "Help = ?")
{
    MsgBox, 4097, Master Palette Ornaments - Info shortcuts,
(
Schleifer						SCHL
Pincé (Couperin)					PINC
Tremblement appuyé (Couperin)			TRMBA
Haydn ornament					HAY
Mordent with release				MR
Mordent with upper auxiliary			MUA
Mordent with lower auxiliary			MLA
Inverted mordent with upper prefix			IMUP
Trill with mordent					TRM
Trill with lower suffix				TRL
Trill with two-note suffix (Dandrieu)			TR2D
Port de voix					PDV
Pre-beat port de voix followed
by multiple mordent (Dandrieu)			PDVD
Shake						+
Shake (Muffat)					SM

Turn up						TU
Inverted turn up					ITU
Appoggiatura trill					AT
Appoggiatura trill with two-note suffix		AT2
Turn-trill (D'Anglebert)				TTRD
Turn-trill with two-note suffix (J.S.Bach)		TTR2
Descending slide					DS
Slide-trill (D'Anglebert)				STRD
Slide-trill (Muffat)					STRM
Slide-trill with one-note suffix (Marpurg)		STR1M
Slide-trill with two-note suffix (J.S.Bach)		STR2B
Slide-trill with two-note suffix (Muffat)		STR2M

Cadence						C
Cadence with turn					CT
Cadence with upper prefix				CUP
Cadence with upper prefix and turn			CUPT
Double cadence with lower prefix			DCLP
Double cadence with upper prefix			DCUP
Double cadence with upper prefix and turn		DCUPT

Show pdf info Ornaments				PDF

The automatic placement of the ornament will be switched off.
To switch it on again: go to the ornament with Alt + right
or CapsLock + Z and press Shift + CapsLock or =

To reposition the symbol press WIN + M.
Macrogroup F3 Navigation must be active.
)
}
IfMsgBox, Cancel
    Return
IfMsgBox, OK
InputBox, SymbolMasPal, Enter Master Palette Ornaments, , , W_IB, H_IB, IB_X, IB_Y, , , Type shortcut
if ErrorLevel				; when Cancel is pressed
{
Click, %StartX%, %StartY%
Return
}

If (SymbolMasPal = "pdf")
{
    Run, Ornaments_Master_Palette.pdf
    WinActivate, Ornaments_Master_Palette.pdf
    MsgBox, 4160, Info Ornaments Master Palette,
(
When you are ready Press Z
to exit the image and this macro.
), 5
    Keywait, z, d
    WinClose, Ornaments_Master_Palette
    Return
}
If SymbolMasPal not in at,at2,c,ct,cup,cupt,dclp,dcup,dcupt,ds,hay,imup,itu,mla,mr,mua
,pdv,pdvd,pinc,schl,sm,str1m,str2b,str2m,strd,strm,tr2d,trl,trm,trmba,ttr2,ttrd,tu,+
{
    MsgBox, 4112, Add Master Palette Ornaments, No valid input.`nThe macro will exit.
    Return
}
Send {Escape}						; deselects note or rest
Sleep, 50
Send +{z}						; open master palette symbols - custom shortcut!
Sleep, 400						; <<<<<<<<<<<<<
CoordMode, Mouse, Window
Click, %WMPS_02X%, %WMPS_02Y%				; (WMPS_02) Clear rectangle Window Master Palette Symbols
Sleep, 300						; shows all symbols (*change*?)
Click, %MasPalFirstFieldX%, %MasPalFirstFieldY%		; click the centre of leftmost (first) symbol
Sleep, 50
WinActivate, ahk_exe MuseScore3.exe
Sleep, 100
CoordMode, Mouse, Screen
Click, %StartX%, %StartY%		; selects note or rest - master palette must not cover note/rest!
Sleep, 100				; <<<<<<<<<<<<<<<
WinActivate, Master Palette
Sleep, 100				; <<<<<<<
CoordMode, Mouse, Window
Sleep, 50
Click, %WMPS_01X%, %WMPS_01Y%		; (WMPS_01) Search rectangle Window Master Palette Symbols
Sleep, 200				; <<<<<<<<<<

If (SymbolMasPal = "at")
    Send d app				; Supported appoggiatura trill
If (SymbolMasPal = "at2")
    Send a trill w			; Supported appoggiatura trill with two-note suffix
If (SymbolMasPal = "c")
    Send cad				; Cadence
If (SymbolMasPal = "ct")
    Send e with t			; Cadence with turn
If (SymbolMasPal = "cup")
    Send e with u			; Cadence with upper prefix
If (SymbolMasPal = "cupt")
    Send e with upper prefix a		; Cadence with upper prefix and turn
If (SymbolMasPal = "dclp")
    Send e cadence with l		; Double cadence with lower prefix
If (SymbolMasPal = "dcup")
    Send e cadence with u		; Double cadence with upper prefix
If (SymbolMasPal = "dcupt")
    Send e cadence with upper prefix a	; Double cadence with upper prefix and turn
If (SymbolMasPal = "ds")
    Send g sl				; descending slide
If (SymbolMasPal = "hay")
    Send hay				; Haydn ornament
If (SymbolMasPal = "imup")
    Send inverted mordent w		; inverted mordent with upper prefix
If (SymbolMasPal = "itu")
    Send ted turn u			; Inverted turn up
If (SymbolMasPal = "mla")
    Send wer aux			; mordent with lower auxiliary
If (SymbolMasPal = "mr")
    Send h rel				; mordent with release
If (SymbolMasPal = "mua")
    Send per aux			; mordent with upper auxiliary
If (SymbolMasPal = "pdvd")
    Send t (da				; Pre-beat port de voix followed by multiple mordent (Dandrieu)
If (SymbolMasPal = "pdv")
    Send port de v			; Port de voix
If (SymbolMasPal = "pinc")
    Send pinc				; Pincé (Couperin)
If (SymbolMasPal = "schl")
    Send schl				; Schleifer
If (SymbolMasPal = "sm")
    Send ake (				; Shake (Muffat)
If (SymbolMasPal = "str1m")
    Send x (ma				; Slide-trill with one-note suffix (Marpurg)
If (SymbolMasPal = "str2b")
    Send Slide-trill with two-note suffix (J	; Slide-trill with two-note suffix (J.S.Bach)
If (SymbolMasPal = "str2m")
    Send x (mu				; Slide-trill with two-note suffix (Muffat)
If (SymbolMasPal = "strd")
    Send e-trill (d			; Slide-trill (D'Anglebert)
If (SymbolMasPal = "strm")
    Send l (mu				; Slide-trill (Muffat)
If (SymbolMasPal = "tr2d")
    Send x (d				; Trill with two-note suffix (Dandrieu)
If (SymbolMasPal = "trl")
    Send l with l			; trill with lower suffix
If (SymbolMasPal = "trm")
    Send h mord				; trill with mordent
If (SymbolMasPal = "trmba")
    Send appu				; Tremblement appuyé (Couperin)
If (SymbolMasPal = "ttr2")
    Send turn-trill w			; Turn-trill with two-note suffix (J.S.Bach)
If (SymbolMasPal = "ttrd")
    Send n-trill (d			; Turn-trill (D'Anglebert)
If (SymbolMasPal = "tu")
    Send rn u				; Turn up
If (SymbolMasPal = "+")
    Send shake				; NB: 2 types of shake. Our shake is 4 fields to the right

Sleep, 400				; !!!!!!!
CoordMode, Pixel, Window
; NB: Determine Search Area Master Palette Symbols (window minimized) and Color selected element in Master Palette!
PixelSearch, SymbolMasterPalX, SymbolMasterPalY, % MP_X1, % MP_Y1, % MP_X2, % MP_Y2, ColorMasPal, , Fast RGB
if errorlevel
{
    MsgBox, 4112, Ornament Selection,
(
The ornament was not found.
Maybe the Master Palette needs activation.
The macro will exit.
)
;    IfMsgBox, OK
    WinActivate, Master Palette
    Sleep, 100
    Send {Escape}				; Master Palette close
    Sleep, 50
    Return
}
CentreField_X := SymbolMasterPalX + MasPalFieldWidth / 2
CentreField_Y := SymbolMasterPalY + MasPalFieldHeight / 2

If SymbolMasPal not in +
    Click, %CentreField_X%, %CentreField_Y%

If (SymbolMasPal = "+")			; ambiguous reference: here the fifth field must be selected
{
    MouseMove, CentreField_X + MasPalFieldWidth * 4, CentreField_Y
    Click					; attaches ornament
}
WinActivate, Master Palette
Sleep, 200				; was 100
Send +{z}				; master palette close
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
Sleep, 100
Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
Sleep, 50
Send {left}
Sleep, 50
Send {BS 4}
Sleep, 50
Send -4.00
Sleep, 50
Send {Escape}				; deselects Y-offset field
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
    MsgBox, 4144, Searching Ornament, The ornament was not found.`nTry a higher zoomfactor.`nThe macro will exit.
    Send +{z}
    Click, %StartX%, %StartY%
    Return
}
Click, %ElementX%, %ElementY%
Send {=}					; automatic placement off
Sleep, 50
Click, 2
CoordMode, Tooltip, Screen
Tooltip, Position ornament with arrowkeys.`nPress Z when ready, StartX, StartY - 120, 3	; tooltip (3) (*change*?) StartY - 120 is height tooltip
Keywait, z, d
Tooltip, , , , 3			; close tooltip (3)
Click, %StartX%, %StartY%
Return

; ♣=================================================================================================
