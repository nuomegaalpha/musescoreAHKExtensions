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
~[ & F2::
CoordMode, Tooltip, Screen
Tooltip, F2  Palette Symbols, ToolT_F2_X, 0, 1		; tooltip Palette Symbols
Return

~] & F2::
MsgBox, 4132, Apply Palette Symbols, Are you sure you want to exit?
IfMsgBox, Yes
ExitApp
Return

~[ & 2::			; general info group F2
MsgBox, 4096, F2: Apply Palette Symbols      [ + 2,
(
Apply Palette Symbols		Z + A

PM: related
In macrogroup F6
Advanced Dynamics		Z + D
In macrogroup F7
Master Palette Symbols		Z + S
)
Return

; ♣================================== SHORTCUTLIST ================================================

; SHORTCUTLIST Apply Palette Symbols
; If you want to edit new Palette items: check this listing for available shortcuts
; 0,1,1:||:2,2,3,4,5,0c,1c,1fb,1fn,1sn,1s#,2c,3c,3fb,3fbb,3sx,3s#,4c,5c,5fbb,5sx,6c
; ,2/4,3/4,4/4,5/4,6/4,3/8,2+3/8,3+2/8,6/8,7/8,9/8,3+2+2+3/8,12/8,c4/4,2/2,3/2
; ,.a,.2,2=,.4,4=,.6,6=,8,8=,16,16=,32,32=,64,64=
; ,1#,2#,3#,4#,5#,6#,7#,1b,1m,2b,3b,4b,5b,6b,7b,0#0b,xsig
; ,1v,2v,2vo,3v,8va,8vb,15ma,15mb,22ma,22mb
; ,|,||,|||,|:,:|,:||:,|a,|a,|aad,|aau,|ab,|apd,|apu,|d,|gls,|glw,|hf,|p,|s,|sia,|sib,|sod,|sou
; ,=ab,=fbf,=fbs,=sb,=mb,=nb,=16b,=32b
; ,-a,-c,-i,-m,-p,
; ,#,#a,#ci,#e,#m,#o,#p,#rm,#s,#stc,#sw,#t,#tr
; ,@,!,@!,@#,[],(),+,.,..,....,----,..s,..w,.t,<,>
; ,[[,[{,[l,[s
; ,*ab,*c,*cl,*d,*do,*lar,*n,*td,*tu,*x,*+,*xc,*xx,*/,*\,*//
; ,?,?a,?ag,?b,?bl,?bp,?br,?bs,?c,?d,?f,?fd,?fm,?g,?gn,?h,?i,?k,?ks,?l,?m,?n,?nh
; ,?o,?p,?q,?r,?rj,?t,?tr,?ts,?u,?v,?w,?x,?z,?[
; ,a,a.,a>,a<,aad,aau,ab,ac,acs,ada,adag,adagi,adagio,allegre,allegretto,allegro
; ,alro,alto,am,and,anda,andan,andante,ap,apd,aps,apu,ar,arco,arp,arpdown,arpup,at
; ,b,b.,bd,ber,besr,bf,bm`,,bm`,),bm',bmv,bn,bps,br,bs1,bs2,bsr,bt1,bt2,buzz
; ,c,c!,!c,c1,c2,c),c/,c||,c//,ci,cla,clb,clbar,clbarf,clb8va,clb8vb,clb15ma
; ,clb15mb,cldt8vb,clfvc,clms,clp,clp2,cls,clsb,clt,cltab,cltab4,clten,clto8vb
; ,clt8va,clt8vb,clt15ma,clt15vb,coda,crotchet,crotchet.,cv
; ,d,d#,dash,db,dc,dcac,dcaf,do,doit,dm,dpl,dpr,ds,dsac,dsaf,dsq,dsq=,er,esr,ex,expr
; ,f,f!,!f,fa,fall,ff,fff,fi,fine,fo,fm,fp,fz
; ,g3,g3a,g3as,g3asn,g3s,g4,g4s,g6,g6a,g6as,g6asn,g6s,g8a,gls,gra,grav,grave,gv,gvw
; ,h,hdsq,hdsq=,hf,im
; ,l,l.,l1,l2,l3,la,lar,larg,largo,len,lent,lento,lfm,lfmh,lpr,lr,lt,lv
; ,m,m.,m*,m2,m2.,m4,m4.,m8,m8.,mi,minim,minim.,mp,mf,mfcp
; ,mm2=4,mm4=2,mm4=4,mm4=4.,mm4.=4,mm8=8,mmc=c,mmc=c.,mmc.=c,mmc=m,mmm=c,mmq=q
; ,mod,mode,moder,moderato
; ,mt,mu,mup,mute,n*,nal,o,op,open
; ,p,p.,pb,pcc,pcr,pi,pizz,plop,pm,pp,ppl,ppp,pr,prd,pre,pres,prest,presto,prm,pru
; ,ps*,psc,psr,pss
; ,q,q0,q1,q2,q3,q4,q5,q=,qa,qam,qa7,qb,qbm,qb7,qc,qcm,qc7,qd,qdm,qd7
; ,qe,qem,qe7,qf,qfm,qf7,qg,qgm,qg7,quaver,quaver.
; ,r,r*,r m,r-m,re,rf,rfz,rm,rm!,!rm
; ,s,s..,s1,s2,s*,s!,!s,sa,sa.,salz,sat,sat.,sb,scoop,segno,sf,sff,sfm,sfmh,sfp,sfpp,sfz,sffz
; ,sia,sib,sib,sl,slide,sls,sod,sol,sou,sp,sq,sq=,sr,ss,ssd,ssf,ssu,st,staff,stc
; ,str,sv,sw,sy,sys,system,swls
; ,t,t.,-t,-turn,+t,+turn,ta,tb,tc,tf,th,ti,tl,tm,tp,tr,trem,tremolo,trl,trmb,tsaw,turn
; ,ub,um,unstr,upl,upm,upr
; ,vc,vf,viv,viva,vivac,vivace,vlf,vlfm,vs,vsaw,vsfm
; ,w..
; ,xb
; ,z*

; ♣==================================== APPLY PALETTE SYMBOLS =====================================

~z & a::					; apply palette symbols
MouseGetPos, StartX, StartY			; position mouse
InputBox, PaletteSymbol, Apply Symbols from Palette, , , W_IB, H_IB, IB_X, IB_Y, , , Help = Questionmark	;  (*change*?) 
; InputBox, PaletteSymbol, Apply Symbols from Palette, , , W_IB, H_IB, StartX, StartY-120, , , Help = Questionmark	;  (*change*?) here the InputBox is positioned near the mouse
if ErrorLevel					; when Cancel is pressed
    Return

If PaletteSymbol not in 0,1,1:||:2,2,3,4,5,0c,1c,1fb,1fn,1sn,1s#
,2c,3c,3fb,3fbb,3sx,3s#,4c,5c,5fbb,5sx,6c
,2+3/8,2/4,3+2/8,3+2+2+3/8,3/4,4/4,5/4,6/4,3/8,6/8,7/8,9/8,12/8,c4/4,2/2,3/2
,.2,2=,.4,4=,.6,6=,8,8=,16,16=,32,32=,64,64=
,1#,2#,3#,4#,5#,6#,7#,1b,1m,2b,3b,4b,5b,6b,7b,0#0b,xsig
,1v,2v,2vo,3v,8va,8vb,15ma,15mb,22ma,22mb
,|,||,|||,|:,:|,:||:,|a,|a,|aad,|aau,|ab,|apd,|apu,|d,|gls,|glw,|hf,|p,|s,|sia,|sib,|sod,|sou
,=ab,=fbf,=fbs,=sb,=mb,=nb,=16b,=32b
,-a,-c,-i,-m,-p
,#,#a,#ci,#e,#m,#o,#p,#rm,#s,#stc,#sw,#t,#tr
,@,!,@!,@#,[],(),+,.,..,....,----,..s,..w,.a,.l,.t,<,>
,[[,[{,[l,[s
,*ab,*c,*cl,*d,*do,*lar,*n,*td,*tu,*x,*+,*xc,*xx,*/,*\,*//
,?,?a,?ag,?b,?bl,?bp,?br,?bs,?c,?d,?f,?fd,?fm,?g,?gn,?h,?i,?k,?ks,?l,?m,?n,?nh
,?o,?p,?q,?r,?rj,?t,?tr,?ts,?u,?v,?w,?x,?z,?[
,a,a.,a>,a<,aad,aau,ab,ac,acs,ada,adag,adagi,adagio,allegre,allegretto,allegro
,alro,alto,am,and,anda,andan,andante,ap,apd,aps,apu,ar,arco,arp,arpdown,arpup,at
,b,b.,bd,ber,besr,bf,bm`,,bm`,),bm',bmv,bn,bps,br,bs1,bs2,bsr,bt1,bt2,buzz
,c,c!,!c,c1,c2,c),c/,c||,c//,ci,cla,clb,clbar,clbarf,clb8va,clb8vb,clb15ma
,clb15mb,cldt8vb,clfvc,clms,clp,clp2,cls,clsb,clt,cltab,cltab4,clten,clto8vb
,clt8va,clt8vb,clt15ma,clt15vb,coda,crotchet,crotchet.,cv
,d,d#,dash,db,dc,dcac,dcaf,do,doit,dm,dpl,dpr,ds,dsac,dsaf,dsq,dsq=,er,esr,ex,expr
,f,f!,!f,fa,fall,ff,fff,fi,fine,fo,fm,fp,fz
,g3,g3a,g3as,g3asn,g3s,g4,g4s,g6,g6a,g6as,g6asn,g6s,g8a,gls,gra,grav,grave,gv,gvw
,h,hdsq,hdsq=,hf,im
,l,l.,l1,l2,l3,la,lar,larg,largo,len,lent,lento,lfm,lfmh,lpr,lr,lt,lv
,m,m.,m*,m2,m2.,m4,m4.,m8,m8.,mi,minim,minim.,mp,mf,mfcp
,mm2=4,mm4=2,mm4=4,mm4=4.,mm4.=4,mm8=8,mmc=c,mmc=c.,mmc.=c,mmc=m,mmm=c,mmq=q
,mod,mode,moder,moderato
,mt,mu,mup,mute,n*,nal,o,op,open
,p,p.,pb,pcc,pcr,pi,pizz,plop,pm,pp,ppl,ppp,pr,prd,pre,pres,prest,presto,prm,pru
,ps*,psc,psr,pss
,q,q0,q1,q2,q3,q4,q5,q=,qa,qam,qa7,qb,qbm,qb7,qc,qcm,qc7,qd,qdm,qd7
,qe,qem,qe7,qf,qfm,qf7,qg,qgm,qg7,quaver,quaver.
,r,r*,r m,r-m,re,rf,rfz,rm,rm!,!rm
,s,s..,s1,s2,s*,s!,!s,sa,sa.,salz,sat,sat.,sb,scoop,segno,sf,sff,sfm,sfmh,sfp,sfpp,sfz,sffz
,sia,sib,sib,sl,slide,sls,sod,sol,sou,sp,sq,sq=,sr,ss,ssd,ssf,ssu,st,staff,stc
,str,sv,sw,sy,sys,system,swls
,t,t.,-t,-turn,+t,+turn,ta,tb,tc,tf,th,ti,tl,tm,tp,tr,trem,tremolo,trl,trmb,tsaw,turn
,ub,um,unstr,upl,upm,upr
,vc,vf,viv,viva,vivac,vivace,vlf,vlfm,vs,vsaw,vsfm
,w..
,xb
,z*
,Help = Questionmark
{
    MsgBox, 4112, Apply Symbols from Palette, No valid command.`nThe macro will exit.
    Return
}

If (PaletteSymbol = "r")
    PaletteSymbol := PaletteSymbolOld

If (PaletteSymbol = "?") || (PaletteSymbol = "Help = Questionmark")
{
MsgBox, 4096, Info Palettes,
(
Enter a help shortcut or a symbol shortcut

► Accidentals			?X
► Arpeggios & Glissandi		?V	?AG
► Articulations			?A
► Barlines			?B	?BL
► Beam Properties			?Z
► Brackets			?[	?BR
► Breaks & Spacers		?I	?BS
► Breath's & Pauses		?P	?BP
► Clefs				?C
► Dynamics			?D
► Fingering			?F
► Frames & Measures		?H	?FM
► Fretboard Diagrams		?Q	?FD
► Grace Notes			?G	?GN
► Key Signatures			?K	?KS
► Lines				?L
► Noteheads			?N	?NH
► Ornaments			?O
► Repeats & Jumps		?R	?RJ
► Tempo				?M
► Text				?T
► Time Signatures			?TS
► Tremolo			?W	?TR

Repeat last command		R

In macrogroup F7
Apply Master Palette Symbols	Z + S
)
    InputBox, PaletteSymbol, Apply Symbols from Palette, , , W_IB, H_IB, IB_X, IB_Y, , , Enter Help or Symbol Shortcut	;  (*change*?) 
;   InputBox, PaletteSymbol, Apply Symbols from Palette, , , W_IB, H_IB, StartX, StartY-120, , , Enter Help or Symbol Shortcut	;  (*change*?) here the InputBox is positioned above the mouse
    if ErrorLevel				; when Cancel is pressed
    {
        Click, %StartX%, %StartY%
        Return
    }
}
If (PaletteSymbol = "Enter Help or Symbol Shortcut")
{
    MsgBox, 4096, Apply Symbols from Palette, "Enter Help or Symbol Shortcut"`nis no valid input.`nThe macro will exit.
    Return
}
If (PaletteSymbol = "?x")
{
MsgBox, 4096, Accidentals - shortcuts,
(
In InputBox enter:

Flat				!
Natural				@
Sharp				#
Double sharp			D#
Double flat			D!
Natural Flat			@!
Natural Sharp			@#

Gould arrow quartertone accidentals (24-EDO)

Quarter-tone flat			1FB	↑♭
Three-quarter-tones flat		3FB	↓♭
Quarter-tone sharp		1SN	↑♮
Quarter-tone flat			1FN	♮↓
Three-quarter-tones sharp		3S#	♯↑
Quarter-tone sharp		1S#	↓♯
Five-quarter-tones sharp		5SX	×↑
Three-quarter-tones sharp		3SX	↓×
Three-quarter-tones flat		3FBB	♭↑♭
Five-quarter-tones flat		5FBB	↓♭♭

Add brackets to accidental		[ ]
Add parentheses to element	( )

Keyboard layout
 ♭	 ♮	♯
 !	@	#
1	 2	3

In macrogroup F8
Add accidentals (loop)		Z + X
)
}

If (PaletteSymbol = "?v") || (PaletteSymbol = "?ag")
{
MsgBox, 4096, Arpeggios & Glissandi - shortcuts,
(
In InputBox enter:

Arpeggio			|A	ARP
Arpeggio point up		|APU	APU	ARPUP
Arpeggio point down		|APD	APD	ARPDOWN
Arpeggio bracket			|AB	AB
Arpeggio arrow up		|AAU	AAU
Arpeggio arrow down		|AAD	AAD
Glissando line straight		|GLS	GLS
Glissando line wiggle		|GLW	GLW
Fall				|F	FALL
Doit				|D	DOIT
Plop				|P	PLOP
Scoop				|S	SCOOP
Slide out down			|SOD	SOD
Slide out up			|SOU	SOU
Slide in above			|SIA	SIA
Slide in below			|SIB	SIB
)
}

If (PaletteSymbol = "?a")
{
MsgBox, 4096, Articulations - shortcuts,
(
In InputBox enter:

Accent			A
Accent staccato		A.	.A	
Bend			B
Downbow		DB
Fade in			FI
Fade out			FO
Fermata			FM
Harmonic		H
Laissez vibrer		LV
Long fermata		LFM
Long fermata Henze	LFMH
Louré			L.
Marcato			M
Marcato staccato		M.	.M
Marcato tenuto		MT	TM
Muted			+
Open			O
Portato			P.
Sawtooth line segment	SLS
Idem wide line segment	SWLS
Short fermata		SFM
Short fermata Henze	SFMH
Snap pizzicato		SP
Soft accent		SA
Soft accent staccato	SA.
Soft accent tenuto		SAT
Idem SAT staccato		SAT.
Staccato			.
Staccatissimo		..
Staccatissimo stroke	..S	S..
Staccatissimo wedge	..W	W..
Stress			STR
Tenuto			T
Tenuto accent		TA	AT
Tenuto staccato		T.	.T
Tremolo bar		TB
Unstress			UNSTR
Upbow			UB
Very long fermata		VLFM
Very short fermata		VSFM
Vibrato large faster	VLF
Vibrato large slowest	VLS
Volume swell		VS
)
}

If (PaletteSymbol = "?o")
{
MsgBox, 4096, Ornaments - shortcuts,
(
In InputBox enter:

Inverted turn			-T	-TURN
Turn				+T	+TURN	TURN
Trill				TR
Upper Mordent, Prall		UM	PR
Lower, Inverted Mordent		IM
Tremblement			TRMB
Prall mordent			PRM
Up prall				UPR
Mordent upper prefix		MUP
Up mordent			UPM
Down prall			DPR
Prall down			PRD
Down mordent, Prall up		DM	PRU
Prall up, Line Prall			LPR
Slide				SL	SLIDE

In macrogroup F7
Add Ornaments Master Palette	Z + O
)
}

If (PaletteSymbol = "?b") || (PaletteSymbol = "?bl")
{
MsgBox, 4096, Barlines - shortcuts,
(
In InputBox enter:

Barline normal		BN	|
Barline double		BD	||
Barline start repeat	BSR	|:
Barline end repeat		BER	:|
Barline end-start repeat	BESR	:||:
Barline dashed		DASH	----
Barline final		BF	|||
Barline dotted		B.	....
Barline tick 1 span #	BT1
Barline tick 2 span #	BT2
Barline short 1 span #	BS1
Barline short 2 span #	BS2
Barline pseudo (symbol)	BPS

Combination
┌─1─┐:‖:┌─2──		1:||:2

# Reset these barlines in the Inspector
)
}

If (PaletteSymbol = "?g") || (PaletteSymbol = "?gn")
{
MsgBox, 4096, Grace Notes - shortcuts,
(
In InputBox enter:

Acciaccatura				AC
Acciaccatura #				ACS
Appogiatura				AP
Appogiatura #				APS
Grace quarter				G4
Grace 16th				G6
Grace 16th *				G6S
Grace 32nd				G3
Grace 32nd * 				G3S
Grace eight after				G8A
Grace 16th after				G6A
Grace 16th after ∆ 				G6AS
Grace 32nd after				G3A
Grace 32nd after ∆				G3AS

# diatonically raised + slur

For all 16th and 32nd Grace Notes:
After the first to create another: press	Y
To stop adding grace notes: press		N

*  Adds a slur from  first grace-note-before to main note

∆ Adds a slur from main-note-before to main-note-after
)
}

If (PaletteSymbol = "?n") || (PaletteSymbol = "?nh")
{
MsgBox, 4096, Noteheads - shortcuts,
(
In InputBox enter:

Alt brevis			*AB
Circled			*C
Circled large		*CL
Cross			*X
Diamond			*D
Diamond old		*DO
Large arrow		*LAR
Normal			*N
Plus			*+
Slash			*//
Slashed forwards		*/
Slashed backwards	*\
Triangle up		*TU
Triangle down		*TD
With X			*XX
X circle			*XC

Do			DO
Re			RE
Mi			MI
Fa			FA
Sol			SOL
La			LA
Ti			TI

Add parentheses
to element		( )
)
}

If (PaletteSymbol = "?f")
{
MsgBox, 4096, Fingering - shortcuts,
(
In InputBox enter:

0 - piano		Q0		0 - LH Guitar	0
1 - piano		Q1		1 - LH Guitar	1
2 - piano		Q2		2 - LH Guitar	2
3 - piano		Q3		3 - LH Guitar	3
4 - piano		Q4		4 - LH Guitar	4
5 - piano		Q5		5 - LH Guitar	5
				T - LH guitar	TH

0 in circle	0c		p		-P
1 in circle	1c		i		-I		
2 in circle	2c		m		-M		
3 in circle	3c		a		-A		
4 in circle	4c		c		-C		
5 in circle	5c
6 in circle	6c		Thumb pos	TP


Lute thumb fing (RH fingering thumb)		LT
Lute 1 fing (RH first finger)				L1
Lute 2 fing (RH second finger)			L2
Lute 3 fing (RH third finger)				L3
)
}

If (PaletteSymbol = "?p") || (PaletteSymbol = "?bp")
{
MsgBox, 4096, Breath's & Pauses - shortcuts,
(
In InputBox enter:

Breath mark (comma)	BM,
Breathmark tick-like	BM'
Breathmark salzedo	BM,)	SALZ
Breathmark upbow-like	BMV
Curved caesura		C)
Caesura straight		C/
Short caesura		C||
Thick caesura		C//
)
}

If (PaletteSymbol = "?c")
{
MsgBox, 4096, Clefs - shortcuts,
(
In InputBox enter:

Treble			CLT
Treble 8va		CLT8VA
Treble 15ma		CLT15MA
Treble 8vb		CLT8VB
Treble 15vb		CLT15VB
Double Treble 8vb		CLDT8VB
Treble optional 8vb	CLTO8VB
French violin clef		CLFVC
Soprano			CLS
Mezzo Soprano		CLMS
Alto			CLA
Tenor			CLTEN
Baritone			CLBAR
Bass			CLB
Bass 8va			CLB8VA
Bass 15ma		CLB15MA
Bass 8vb			CLB8VB
Bass 15mb		CLB15MB
Baritone F clef		CLBARF
Subbass			CLSB
Percussion		CLP
Percussion 2		CLP2
Tablature		CLTAB
Tablature 4 lines		CLTAB4
)
}

If (PaletteSymbol = "?k") || (PaletteSymbol = "?ks")
{
MsgBox, 4096, Key Signatures - shortcuts,
(
In InputBox enter:

MAJOR	MINOR	ENTER

G	E	1#
D	B	2#
A	F♯	3#
E	C♯	4#
B	G♯	5#
F♯	D♯	6#
C♯	A♯	7#

F	D	1b
B♭	G	2b
E♭	C	3b
A♭	F	4b
D♭	B♭	5b
G♭	E♭	6b
C♭	A♭	7b

C	A	0#0b

Open Atonal	XSIG
)
}

If (PaletteSymbol = "?d")
{
MsgBox, 4096, Dynamics - shortcuts,
(
In InputBox enter:

PPP	PP	P	MP	MF	F	FF	FFF
RF	RFZ	FZ	SF	SFZ	SFF	SFFZ	
SFPP	SFP	FP	M*	R*	S*	Z*	N*

In macrogroup F6
Advanced dynamics		Z + D
)
}

If (PaletteSymbol = "?l")
{
MsgBox, 4096, Lines - shortcuts,
(
In InputBox enter:

Ambitus #		AM
Cresc			C
Dim			D
Downprall line		DPL
Guitar vibrato		GV
Guitar vibrato wide	GVW
Hairpin crescendo		<
Hairpin decrescendo	>
Let ring			LR
Line			L
mf cresc pin		MFCP
Note anchored line	NAL
Palm mute		PM
Prall prall line		PPL
Prima volta		1V
Seconda volta		2V
Seconda volta open	2VO
Slur			S
Terza volta		3V
Text line			TL
Tremolo sawtooth wide	TSAW
Trill line			TRL
Upprall line		UPL
Vibrato sawtooth		VSAW

# Select clef

Pedline continue-continue	PCC
Pedline continue-release	PCR
Pedline start-continue	PSC
Pedline start-stop		PSS
Pedline start-asterisk	PS*
Pedline start-release	PSR
Octaves			8VA
			8VB
			15MA
			15MB
			22MA
			22MB

Combination
┌─1─┐:‖:┌─2──		1:||:2
)
}

If (PaletteSymbol = "?w") || (PaletteSymbol = "?tr")
{
MsgBox, 4096, Tremolos - shortcuts,
(
In InputBox enter:

1/8	stroke through stem	8		Q
1/16	stroke through stem	16	.6	SQ
1/32	stroke through stem	32	.2	DSQ
1/64	stroke through stem	64	.4	HDSQ

1/8	between notes		8=		Q=
1/16	between notes		16=	6=	SQ=
1/32	between notes		32=	2=	DSQ=
1/64	between notes		64=	4=	HDSQ=

Buzzroll				BR	BUZZ
)
}

If (PaletteSymbol = "?t")
{
MsgBox, 4096, Text - shortcuts,
(
In InputBox enter:

Stafftext			#T	ST	STAFF
System text		#S	SY	SYS	SYSTEM
Expression text 		#E	EX	EXPR
Change Instrument	#CI	CI
Staff type change		#STC	STC
Rehearsal mark 		#RM	RM
Swing			#SW	SW
Pizzicato			#P	PIZZ	PI
Arco			#A	ARCO	AR
Tremolo			#TR	TREM	TREMOLO
Mute			#M	MUTE	MU
Open			#O	OPEN	OP
)
}

If (PaletteSymbol = "?m")
{
MsgBox, 4096, Tempo - shortcuts,
(
In InputBox enter:

Half note =80		M2	MINIM
Half note dotted =80	M2.	MINIM.
Quarter =80		M4	CROTCHET
Quarter dotted =80	M4.	CROTCHET.
Eight =80		M8	QUAVER
Eight dotted =80		M8.	QUAVER.
Grave 35			GRA	GRAV	GRAVE
Largo 50			LAR	LARG	LARGO	
Lento 52			LEN	LENT	LENTO
Adagio 71		ADA	ADAG	ADAGI	ADAGIO
Andante 92		AND	ANDA	ANDAN	ANDANTE
Moderato 114		MOD	MODE	MODER	MODERATO
Allegretto 116		ALTO	A>	ALLEGRE	ALLEGRETTO
Allegro 144		ALRO	A<	ALLEGRO
Vivace 172		VIV	VIVA	VIVAC	VIVACE
Presto 187		PRE	PRES	PREST	PRESTO

METRIC MODULATION

Quarter=dotted quarter		MM4=4.		MMC=C.
Dotted quarter=quarter		MM4.=4		MMC.=C
Half=quarter			MM2=4		MMM=C
Quarter=half			MM4=2		MMC=M
Eight=eight			MM8=8		MMQ=Q
Quarter=quarter			MM4=4		MMC=C
)
}

If (PaletteSymbol = "?r") || (PaletteSymbol = "?rj")
{
MsgBox, 4096, Repeats and Jumps - shortcuts,
(
In InputBox enter:

Repeat measure			RM!	!RM	R-M	R M
Segno				S!	!S	S1          SEGNO
Segno serpent § (variation)		SS	SV	S2
Coda Φ				C!	!C	C1	CODA
Varied coda			VC	CV	C2
Fine				F!	!F	FINE
To Coda				TC
Da Capo				DC
Da Capo al Fine			DCAF
Da Capo al Coda			DCAC
Dalle Segno al Coda		DSAC
Dalle Segno al Fine		DSAF
D.S.				DS
Start repeat			SR	|:
End repeat			ER	:|
End-start repeat			ESR	:||:
)
}

If (PaletteSymbol = "?q") || (PaletteSymbol = "?fd")
{
MsgBox, 4096, Fretboard diagrams - shortcuts,
(
In InputBox enter: FIRST a Q and then

A		A7		Am
B		B7		Bm
C		C7		Cm
D		D7		Dm
E		E7		Em
F		F7		Fm
G		G7		Gm
)
}

If (PaletteSymbol = "?h") || (PaletteSymbol = "?fm")
{
MsgBox, 4096, Frames & Measures - shortcuts,
(
In InputBox enter:

Insert vertical frame		VF
Insert horizontal frame		HF
Insert text frame			TF
Insert one measure		1M
)
}


If (PaletteSymbol = "?ts")
{
MsgBox, 4096, Time Signatures - shortcuts,
(
In InputBox enter:

FOR		ENTER

2/4		2/4
3/4		3/4
4/4		4/4
5/4		5/4
6/4		6/4
C		C4/4
₵		2/2
3/2		3/2
3/8		3/8
2+3/8		2+3/8
3+2/8		3+2/8
6/8		6/8
7/8		7/8
9/8		9/8
3+2+2+3/8	3+2+2+3/8
12/8		12/8

In macrogroup F5
Alternating
Time
Signatures	Z + M
)
}

/*
If (PaletteSymbol = "?ts")
{
MsgBox, 4096, Time Signatures - shortcuts,
(
⁞	In InputBox enter:
⁞
⁞	FOR		ENTER
⁞
⁞	2/4		  2/4
⁞	3/4		  3/4
⁞	4/4		  4/4
⁞	5/4		  5/4
⁞	6/4		  6/4
⁞	C		  C4/4
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
⁞
⁞ In macrogroup F5
⁞ Alternating Time Signatures	Z + M
)
}
*/


If (PaletteSymbol = "?[") || (PaletteSymbol = "?br")
{
MsgBox, 4096, Brackets - shortcuts,
(
⁞	In InputBox enter:
⁞
⁞	Bracket		[ [
⁞	Brace		[ {
⁞	Square		[ S
⁞	Line		[ L
)
}

If (PaletteSymbol = "?i") || (PaletteSymbol = "?bs")
{
MsgBox, 4096, Breaks & Spacers - shortcuts,
(
In InputBox enter:

System break			SB
Page break			PB
Section break			XB
Staff spacer down			SSD
Staff spacer up			SSU
Staff spacer fixed			SSF
)
}

If (PaletteSymbol = "?z")
{
MsgBox, 4096, Beam Properties - shortcuts,
(
In InputBox enter:

Start a beam			=SB
Middle beam			=MB
No beam				=NB
Start second level beam		=16B
Beam 16th sub			=16B
Start third level beam		=32B
Beam 32th sub			=32B
Autobeam			=AB
Feathered beam slower #		=FBS
Feathered beam faster #		=FBF

# Select beam. Reset in Inspector

Macrogroup F3:
From note to beam		Win + B
Macrogroup F4:
Finetuning beam angles
and grow left/right
Macrogroup F5:
Set beam properties (loop)		Z + B
)
}

If PaletteSymbol in ?a,?ag,?b,?bl,?bp,?br,?bs,?c,?d,?f,?fd,?fm,?g,?gn,?h,?i,?k,?ks,?l,?m,?n,?nh
,?o,?p,?q,?r,?rj,?t,?tr,?ts,?u,?v,?w,?x,?z,?[
{
    InputBox, PaletteSymbol, Apply Symbols from Palette, , , W_IB, H_IB, IB_X, IB_Y, , , Enter Symbol Shortcut	;  (*change*?) 
;   InputBox, PaletteSymbol, Apply Symbols from Palette, , , W_IB, H_IB, StartX, StartY-120, , , Enter Symbol Shortcut	;  (*change*?) here the InputBox is positioned above the mouse
    if ErrorLevel				; when Cancel is pressed
    {
        Click, %StartX%, %StartY%
        Return
    }
}

If (PaletteSymbol = "Enter Symbol Shortcut")
{
    MsgBox, 4096, Apply Symbols from Palette, "Enter Symbol Shortcut"`nis no valid input.`nThe macro will exit.
    Return
}

If PaletteSymbol not in 0,1,1:||:2,2,3,4,5,0c,1c,1fb,1fn,1sn,1s#
,2c,3c,3fb,3fbb,3sx,3s#,4c,5c,5fbb,5sx,6c
,2/4,3/4,4/4,5/4,6/4,3/8,2+3/8,3+2/8,6/8,7/8,9/8,3+2+2+3/8,12/8,c4/4,2/2,3/2
,.2,2=,.4,4=,.6,6=,8,8=,16,16=,32,32=,64,64=
,1#,2#,3#,4#,5#,6#,7#,1b,1m,2b,3b,4b,5b,6b,7b,0#0b,xsig
,1v,2v,2vo,3v,8va,8vb,15ma,15mb,22ma,22mb
,|,||,|||,|:,:|,:||:,|a,|a,|aad,|aau,|ab,|apd,|apu,|d,|gls,|glw,|hf,|p,|s,|sia,|sib,|sod,|sou
,=ab,=fbf,=fbs,=sb,=mb,=nb,=16b,=32b
,-a,-c,-i,-m,-p
,#,#a,#ci,#e,#m,#o,#p,#rm,#s,#stc,#sw,#t,#tr
,@,!,@!,@#,[],(),+,.,..,....,----,..s,..w,.a,.l,.t,<,>
,[[,[{,[l,[s
,*ab,*c,*cl,*d,*do,*lar,*n,*td,*tu,*x,*+,*xc,*xx,*/,*\,*//
,?,?a,?ag,?b,?bl,?bp,?br,?bs,?c,?d,?f,?fd,?fm,?g,?gn,?h,?i,?k,?ks,?l,?m,?n,?nh
,?o,?p,?q,?r,?rj,?t,?tr,?ts,?u,?v,?w,?x,?z,?[
,a,a.,a>,a<,aad,aau,ab,ac,acs,ada,adag,adagi,adagio,allegre,allegretto,allegro
,alro,alto,am,and,anda,andan,andante,ap,apd,aps,apu,ar,arco,arp,arpdown,arpup,at
,b,b.,bd,ber,besr,bf,bm`,,bm`,),bm',bmv,bn,bps,br,bs1,bs2,bsr,bt1,bt2,buzz
,c,c!,!c,c1,c2,c),c/,c||,c//,ci,cla,clb,clbar,clbarf,clb8va,clb8vb,clb15ma
,clb15mb,cldt8vb,clfvc,clms,clp,clp2,cls,clsb,clt,cltab,cltab4,clten,clto8vb
,clt8va,clt8vb,clt15ma,clt15vb,coda,crotchet,crotchet.,cv
,d,d#,dash,db,dc,dcac,dcaf,do,doit,dm,dpl,dpr,ds,dsac,dsaf,dsq,dsq=,er,esr,ex,expr
,f,f!,!f,fa,fall,ff,fff,fi,fine,fo,fm,fp,fz
,g3,g3a,g3as,g3asn,g3s,g4,g4s,g6,g6a,g6as,g6asn,g6s,g8a,gls,gra,grav,grave,gv,gvw
,h,hdsq,hdsq=,hf,im
,l,l.,l1,l2,l3,la,lar,larg,largo,len,lent,lento,lfm,lfmh,lpr,lr,lt,lv
,m,m.,m*,m2,m2.,m4,m4.,m8,m8.,mi,minim,minim.,mp,mf,mfcp
,mm2=4,mm4=2,mm4=4,mm4=4.,mm4.=4,mm8=8,mmc=c,mmc=c.,mmc.=c,mmc=m,mmm=c,mmq=q
,mod,mode,moder,moderato
,mt,mu,mup,mute,n*,nal,o,op,open
,p,p.,pb,pcc,pcr,pi,pizz,plop,pm,pp,ppl,ppp,pr,prd,pre,pres,prest,presto,prm,pru
,ps*,psc,psr,pss
,q,q0,q1,q2,q3,q4,q5,q=,qa,qam,qa7,qb,qbm,qb7,qc,qcm,qc7,qd,qdm,qd7
,qe,qem,qe7,qf,qfm,qf7,qg,qgm,qg7,quaver,quaver.
,r,r*,r m,r-m,re,rf,rfz,rm,rm!,!rm
,s,s..,s1,s2,s*,s!,!s,sa,sa.,salz,sat,sat.,sb,scoop,segno,sf,sff,sfm,sfmh,sfp,sfpp,sfz,sffz
,sia,sib,sib,sl,slide,sls,sod,sol,sou,sp,sq,sq=,sr,ss,ssd,ssf,ssu,st,staff,stc
,str,sv,sw,sy,sys,system,swls
,t,t.,-t,-turn,+t,+turn,ta,tb,tc,tf,th,ti,tl,tm,tp,tr,trem,tremolo,trl,trmb,tsaw,turn
,ub,um,unstr,upl,upm,upr
,vc,vf,viv,viva,vivac,vivace,vlf,vlfm,vs,vsaw,vsfm
,w..
,xb
,z*
,Help = Questionmark
{
    MsgBox, 4112, Apply Symbols from Palette, No valid command.`nThe macro will exit.
    Return
}

PaletteSymbolOld := PaletteSymbol		; stores value in 'PaletteSymbolOld' for repeat command 
Send ^{F9}					; Palette Search (Ctrl + F9) (*change*?)
Sleep, 100

; ♣=================================== CLEFS ===========================================
; shortcuts in this section
; ,clt,clt8va,clt15ma,clt8vb,clt15vb,cldt8vb,clto8vb,clfvc,cls,clms,cla,clten,clbar
; ,clb,clb8va,clb15ma,clb8vb,clb15mb,clbarf,clsb,clp,clp2,cltab,cltab4

If (PaletteSymbol = "clt")			; glyph 001, Treble
Send c-1-
If (PaletteSymbol = "clt8va")			; glyph 002, Treble 8va
Send c-2-
If (PaletteSymbol = "clt15ma")			; glyph 003, Treble 15ma
Send c-3
If (PaletteSymbol = "clt8vb")			; glyph 004, Treble 8vb
Send c-4
If (PaletteSymbol = "clt15vb")			; glyph 005, Treble 15vb
Send c-5
If (PaletteSymbol = "cldt8vb")			; glyph 006, Double Treble 8vb
Send c-6
If (PaletteSymbol = "clto8vb")			; glyph 007, Treble optional 8vb
Send c-7
If (PaletteSymbol = "clfvc")			; glyph 008, French violin clef
Send c-8
If (PaletteSymbol = "cls")			; glyph 009, Soprano
Send c-9
If (PaletteSymbol = "clms")			; glyph 010, Mezzo Soprano
Send c-10
If (PaletteSymbol = "cla")			; glyph 011, Alto
Send c-11
If (PaletteSymbol = "clten")			; glyph 012, Tenor
Send c-12
If (PaletteSymbol = "clbar")			; glyph 013, Baritone
Send c-13
If (PaletteSymbol = "clb")			; glyph 014, Bass
Send c-14
If (PaletteSymbol = "clb8va")			; glyph 015, Bass 8va
Send c-15
If (PaletteSymbol = "clb15ma")			; glyph 016, Bass 15ma
Send c-16
If (PaletteSymbol = "clb8vb")			; glyph 017, Bass 8vb
Send c-17
If (PaletteSymbol = "clb15mb")			; glyph 018, Bass 15mb
Send c-18
If (PaletteSymbol = "clbarf")			; glyph 019, Baritone F clef
Send c-19
If (PaletteSymbol = "clsb")			; glyph 020, Subbass
Send c-20
If (PaletteSymbol = "clp")			; glyph 021, Percussion
Send c-21
If (PaletteSymbol = "clp2")			; glyph 022, Percussion 2
Send c-22
If (PaletteSymbol = "cltab")			; glyph 023, Tablature
Send c-23
If (PaletteSymbol = "cltab4")			; glyph 024, Tablature 4 lines
Send c-24

; ♣=============================== KEY SIGNATURES ======================================
; shortcuts in this section
; ,1#,2#,3#,4#,5#,6#,7#,7b,6b,5b,4b,3b,2b,1b,0#0b,xsig

If (PaletteSymbol = "1#")			; glyph 030, 1#
Send k-1-
If (PaletteSymbol = "2#")			; glyph 031, 2#
Send k-2
If (PaletteSymbol = "3#")			; glyph 032, 3#
Send k-3
If (PaletteSymbol = "4#")			; glyph 033, 4#
Send k-4
If (PaletteSymbol = "5#")			; glyph 034, 5#
Send k-5
If (PaletteSymbol = "6#")			; glyph 035, 6#
Send k-6
If (PaletteSymbol = "7#")			; glyph 036, 7#
Send k-7
If (PaletteSymbol = "7b")			; glyph 037, 7b
Send k-8
If (PaletteSymbol = "6b")			; glyph 038, 6b
Send k-9
If (PaletteSymbol = "5b")			; glyph 039, 5b
Send k-10
If (PaletteSymbol = "4b")			; glyph 040, 4b
Send k-11
If (PaletteSymbol = "3b")			; glyph 041, 3b
Send k-12
If (PaletteSymbol = "2b")			; glyph 042, 2b
Send k-13
If (PaletteSymbol = "1b")			; glyph 043, 1b
Send k-14
If (PaletteSymbol = "0#0b")			; glyph 044, 0# 0b
Send k-15
If (PaletteSymbol = "xsig")			; glyph 045, Xsig - Atonal
Send k-16

; ♣============================== TIME SIGNATURES ======================================
; shortcuts in this section
; ,2/4,3/4,4/4,5/4,6/4,3/8,2+3/8,3+2/8,6/8,7/8,3+2+2+3/8,9/8,12/8,c4/4,2/2,3/2

If (PaletteSymbol = "2/4")			; glyph 050, 2/4
Send 2/4
If (PaletteSymbol = "3/4")			; glyph 051, 3/4
Send 3/4
If (PaletteSymbol = "4/4")			; glyph 052, 4/4
Send 4/4-
If (PaletteSymbol = "5/4")			; glyph 053, 5/4
Send 5/4
If (PaletteSymbol = "6/4")			; glyph 054, 6/4
Send 6/4
If (PaletteSymbol = "3/8")			; glyph 055, 3/8
Send 3/8
If (PaletteSymbol = "2+3/8")
    Send {Raw}2+3/8
If (PaletteSymbol = "3+2/8")
    Send {Raw}3+2/8
If (PaletteSymbol = "3+2+2+3/8")
    Send {Raw}3+2+2+3/8
If (PaletteSymbol = "6/8")			; glyph 056, 6/8
Send 6/8
If (PaletteSymbol = "7/8")			; glyph 062, 7/8
Send 7/8
If (PaletteSymbol = "9/8")			; glyph 057, 9/8
Send 9/8
If (PaletteSymbol = "12/8")			; glyph 058, 12/8
Send 12/8
If (PaletteSymbol = "c4/4")			; glyph 059, C 4/4
Send c4/4
If (PaletteSymbol = "2/2")			; glyph 060, ₵ 2/2
Send 2/2
If (PaletteSymbol = "3/2")			; glyph 061, 3/2
Send 3/2

; ♣================================= ACCIDENTALS =======================================
; shortcuts in this section
; ,!,@,#,d#,d!,@!,@#,[],(),1fb,1fn,1sn,1s#,3fb,3fbb,3sx,3s#,5fbb,5sx

If (PaletteSymbol = "!")			; glyph 080, Flat
Send x-1
If (PaletteSymbol = "@")			; glyph 081, Natural
Send x-2
If (PaletteSymbol = "#")			; glyph 082, Sharp
Send x-3
If (PaletteSymbol = "d#")			; glyph 083, Double sharp
Send x-4
If (PaletteSymbol = "d!")			; glyph 084, Double flat
Send x-5
If (PaletteSymbol = "@!")			; glyph 085, Natural Flat
Send x-6
If (PaletteSymbol = "@#")			; glyph 086, Natural Sharp
Send x-7
If (PaletteSymbol = "[]")			; glyph 087, Add brackets to accidental
Send x-8
If (PaletteSymbol = "()")			; glyph 088, Add parentheses to element
Send x-9
If (PaletteSymbol = "1fb")			; ↑♭ - Gould Quarter-tone flat
Send x-10
If (PaletteSymbol = "3fb")			; ↓♭ - Gould Three-quarter-tones flat
Send x-11
If (PaletteSymbol = "1sn")			; ↑nat. - Gould Quarter-tone sharp
Send x-12
If (PaletteSymbol = "1fn")			; ↓nat. - Gould Quarter-tone flat
Send x-13
If (PaletteSymbol = "3s#")			; ♯↑ - Gould Three-quarter-tones sharp
Send x-14
If (PaletteSymbol = "1s#")			; ↓♯ - Gould Quarter-tone sharp
Send x-15
If (PaletteSymbol = "5sx")			; ×↑ - Gould Five-quarter-tones sharp
Send x-16
If (PaletteSymbol = "3sx")			; ↓× - Gould Three-quarter-tones sharp
Send x-17
If (PaletteSymbol = "3fbb")			; ♭↑♭ - Gould Three-quarter-tones flat
Send x-18
If (PaletteSymbol = "5fbb")			; ↓♭♭ - Gould Five-quarter-tones flat
Send x-19

; ♣================================= ARTICULATIONS =====================================
; shortcuts in this section
; ,fm,sfm,lfm,lfmh,sfmh,vlfm,vsfm,a,.,..,t,t.,.t,l.,.l,m,a.,.a,lv,m.,.m,mt,p.,tm,..s,..w,str,ta,at
; ,unstr,sa,sa.,sat,sat.,fi,fo,vs,sls,swls,vlf,vls,o,+,h,ub,db,sp,b,tb

If (PaletteSymbol = "fm")			; glyph 100, Fermata
Send a-1-
If (PaletteSymbol = "sfm")			; glyph 101, Short fermata above
Send a-2-
If (PaletteSymbol = "lfm")			; glyph 102, Long fermata
Send a-3-
If (PaletteSymbol = "lfmh")			; glyph 103, Long fermate Henze above
Send a-4-
If (PaletteSymbol = "sfmh")			; glyph 104, Short fermate Henze above
Send a-5
If (PaletteSymbol = "vlfm")			; glyph 105, Very long_fermata
Send a-6
If (PaletteSymbol = "vsfm")			; glyph 106, Very short fermata above
Send a-7
If (PaletteSymbol = "a")			; glyph 107, Sforzato, Accent above
Send a-8
If (PaletteSymbol = ".")			; glyph 108, Staccato
Send a-9
If (PaletteSymbol = "..")			; glyph 109, Staccatissimo
Send a-10
If (PaletteSymbol = "t")			; glyph 110, Tenuto
Send a-11
If (PaletteSymbol = "t.") || (PaletteSymbol = ".t") || (PaletteSymbol = "l.") || (PaletteSymbol = "p.")
Send a-12					; glyph 111, Tenuto staccato) (Louré) (Portato)
If (PaletteSymbol = "m")			; glyph 112, Marcato above
Send a-13
If (PaletteSymbol = "a.") || (PaletteSymbol = ".a") 	; glyph 113, Accent staccato above
Send a-14
If (PaletteSymbol = "lv")			; glyph 114, Laissez vibrer above
Send a-15
If (PaletteSymbol = "m.") || (PaletteSymbol = ".m")	; glyph 115, Marcato staccato above
Send a-16
If (PaletteSymbol = "mt") || (PaletteSymbol = "tm")	; glyph 116, Marcato tenuto above
Send a-17
If (PaletteSymbol = "..s") || (PaletteSymbol = "s..")	; glyph 117, Staccatissimo stroke above
Send a-18
If (PaletteSymbol = "..w") || (PaletteSymbol = "w..")	; glyph 118, Staccatissimo wedge above
Send a-19
If (PaletteSymbol = "str")			; glyph 119, Stress above
Send a-20
If (PaletteSymbol = "ta") || (PaletteSymbol = "at")	; glyph 120, Tenuto accent above
Send a-21
If (PaletteSymbol = "unstr")			; glyph 121, Unstress above
Send a-22
If (PaletteSymbol = "sa")			; glyph 122, Soft accent above
Send a-23
If (PaletteSymbol = "sa.")			; glyph 123, Soft accent staccato above
Send a-24
If (PaletteSymbol = "sat")			; glyph 124, Soft accent tenuto above
Send a-25
If (PaletteSymbol = "sat.")			; glyph 125, Soft accent tenuto staccato above
Send a-26
If (PaletteSymbol = "fi")			; glyph 126, Fade in
Send a-27
If (PaletteSymbol = "fo")			; glyph 127, Fade out
Send a-28
If (PaletteSymbol = "vs")			; glyph 128, Volume swell
Send a-29
If (PaletteSymbol = "sls")			; glyph 129, Sawtooth line segment
Send a-30
If (PaletteSymbol = "swls")			; glyph 130, Sawtooth wide line segment
Send a-31
If (PaletteSymbol = "vlf")			; glyph 131, Vibrato large faster
Send a-32
If (PaletteSymbol = "vls")			; glyph 132, Vibrato large slowest
Send a-33
If (PaletteSymbol = "o")			; glyph 133, Open
Send a-34
If (PaletteSymbol = "+")			; glyph 134, Muted (closed)
Send a-35
If (PaletteSymbol = "h")			; glyph 135, Harmonic
Send a-36
If (PaletteSymbol = "ub")			; glyph 136, Upbow
Send a-37
If (PaletteSymbol = "db")			; glyph 137, Downbow
Send a-38
If (PaletteSymbol = "sp")			; glyph 138, Snap pizzicato above
Send a-39
If (PaletteSymbol = "b")			; glyph 139, Bend
Send a-40
If (PaletteSymbol = "tb")			; glyph 140, Tremolo bar
Send a-41

; ♣================================== ORNAMENTS ========================================
; shortcuts in this section
; ,-t,-turn,+t,+turn,turn,tr,um,pr,im,trmb,prm,upr,mup,upm,dpr,prd,dm,pru,lpr,sl,slide

If (PaletteSymbol = "-t") || (PaletteSymbol = "-turn")	; glyph 160, Inverted turn
Send o-1-
If (PaletteSymbol = "+t") || (PaletteSymbol = "+turn")
|| (PaletteSymbol = "turn")				; glyph 161, Turn
Send o-2
If (PaletteSymbol = "tr")				; glyph 162, Trill
Send o-3
If (PaletteSymbol = "um") || (PaletteSymbol = "pr")	; glyph 163, Upper Mordent  (Prall)
Send o-4
If (PaletteSymbol = "im")				; glyph 164, Lower, Inverted Mordent
Send o-5
If (PaletteSymbol = "trmb")				; glyph 165, Tremblement
Send o-6
If (PaletteSymbol = "prm")				; glyph 166, Prall mordent
Send o-7
If (PaletteSymbol = "upr")				; glyph 167, Up prall
Send o-8
If (PaletteSymbol = "mup")				; glyph 168, Mordent with upper prefix
Send o-9
If (PaletteSymbol = "upm")				; glyph 169, Up mordent
Send o-10
If (PaletteSymbol = "dpr")				; glyph 170, Down prall (Down mordent)
Send o-11
If (PaletteSymbol = "prd")				; glyph 171, Prall down
Send o-12
If (PaletteSymbol = "dm") || (PaletteSymbol = "pru")	; glyph 172, Down mordent (Prall up)
Send o-13
If (PaletteSymbol = "lpr")				; glyph 173, Prall up (Line Prall)
Send o-14
If (PaletteSymbol = "sl") || (PaletteSymbol = "slide")	; glyph 174, Slide
Send o-15

;  ♣============================ BREATHS and PAUSES ====================================
; shortcuts in this section
; ,bm,,bm',bm,,),salz,bmv,c),c/,c||,c//

If (PaletteSymbol = "bm,")				; glyph 190, Breath mark (comma)
Send a)
If (PaletteSymbol = "bm'")				; glyph 191, Breathmark tick-like
Send ck-
If (PaletteSymbol = "bm,)") || (PaletteSymbol = "salz")	; glyph 192, Breathmark salzedo
Send lz
If (PaletteSymbol = "bmv")				; glyph 193, Breathmark upbow-like
Send w-
If (PaletteSymbol = "c)")				; glyph 194, Curved caesura
Send d ca
If (PaletteSymbol = "c/")				; glyph 195, Caesura straight
Send ra1
If (PaletteSymbol = "c||")				; glyph 196, Short caesura
Send t ca
If (PaletteSymbol = "c//")				; glyph 197, Thick caesura
Send ck c

; ♣================================= GRACE NOTES =======================================

; acs = Acciaccatura diatonically raised and slurred
; aps idem voor Appogiatura
; g6s and g3s: grace notes slurred to main note
; g6as and g3as: grace notes-after slurred from main note to next note

; shortcuts in this section
; ,ac,acs,ap,aps,g4,g6,g6s,g3,g3s,g8a,g6a,g6as,g3a,g3as

If (PaletteSymbol = "ac") || (PaletteSymbol = "acs")	; glyph 200, Acciaccatura
Send cia
If (PaletteSymbol = "ap") || (PaletteSymbol = "aps")	; glyph 201, Appogiatura
Send gia
If (PaletteSymbol = "g4")				; glyph 202, Grace quarter
Send e: q
If (PaletteSymbol = "g6") || (PaletteSymbol = "g6s")	; glyph 203, Grace 16th
Send h bef
If (PaletteSymbol = "g3") || (PaletteSymbol = "g3s")	; glyph 204, Grace 32nd
Send d bef
If (PaletteSymbol = "g8a")				; glyph 205, Grace eight after
Send e: e
If (PaletteSymbol = "g6a") || (PaletteSymbol = "g6as")	; glyph 206, Grace 16th after
Send 6th a
If (PaletteSymbol = "g3a") || (PaletteSymbol = "g3as")	; glyph 207, Grace 32nd after
Send nd a

; ♣================================= NOTEHEADS =========================================
; shortcuts in this section
; ,*n,*x,*+,*xc,*xx,*tu,*td,*/,*\,*d,*do,*c,*cl,*lar,*ab,*//,sol,la,fa,mi,do,re,ti

If (PaletteSymbol = "*n")				; glyph 210, Normal
Send n-1-
If (PaletteSymbol = "*x")				; glyph 211, Cross
Send n-2-
If (PaletteSymbol = "*+")				; glyph 212, Plus
Send n-3
If (PaletteSymbol = "*xc")				; glyph 213, X circle
Send n-4
If (PaletteSymbol = "*xx")				; glyph 214, With X
Send n-5
If (PaletteSymbol = "*tu")				; glyph 215, Triangle up
Send n-6
If (PaletteSymbol = "*td")				; glyph 216, Triangle down
Send n-7
If (PaletteSymbol = "*/")				; glyph 217, Slashed forwards
Send n-8
If (PaletteSymbol = "*\")				; glyph 218, Slashed backwards
Send n-9
If (PaletteSymbol = "*d")				; glyph 219, Diamond
Send n-10
If (PaletteSymbol = "*do")				; glyph 220, Diamond old
Send n-11
If (PaletteSymbol = "*c")				; glyph 221, Circled
Send n-12
If (PaletteSymbol = "*cl")				; glyph 222, Circled large
Send n-13
If (PaletteSymbol = "*lar")				; glyph 223, Large arrow
Send n-14
If (PaletteSymbol = "*ab")				; glyph 224, Alt brevis
Send n-15
If (PaletteSymbol = "*//")				; glyph 225, Slash
Send n-16
If (PaletteSymbol = "sol")				;  glyph 226, Sol
Send n-17
If (PaletteSymbol = "la")				; glyph 227, La
Send n-18
If (PaletteSymbol = "fa")				; glyph 228, Fa
Send n-19
If (PaletteSymbol = "mi")				; glyph 229, Mi
Send n-20
If (PaletteSymbol = "do")				; glyph 230, Do
Send n-21
If (PaletteSymbol = "re")				; glyph 231, Re
Send n-22
If (PaletteSymbol = "ti")				; glyph 232, Ti
Send n-23

; ♣==================================== LINES ==========================================
; shortcuts in this section
; ,s,<,>,c,d,mfcp,1v,2v,3v,2vo,8va,8vb,15ma,15mb,22ma,22mb
; ,pss,ps*,psr,psc,pcc,pcr,trl,upl,dpl,ppl,tl,l,am,lr,gv,gvw,vsaw,tsaw,pm
; NB: nal -> note anchored line

If (PaletteSymbol = "s")				; glyph 240, Slur
Send l-1-
If (PaletteSymbol = "<")				; glyph 241, HairPin crescendo
Send l-2-
If (PaletteSymbol = ">")				; glyph 242, HairPin decrescendo
Send l-3-
If (PaletteSymbol = "c")				; glyph 243, Cresc
Send l-4
If (PaletteSymbol = "d")				; glyph 244, Dim
Send l-5
If (PaletteSymbol = "mfcp")				; glyph 245, mf cresc pin
Send l-6
If (PaletteSymbol = "1v")				; glyph 246, Prima Volta
Send l-7
If (PaletteSymbol = "2v")				; glyph 247, Seconda volta
Send l-8
If (PaletteSymbol = "3v")				; glyph 248, Terza volta
Send l-9
If (PaletteSymbol = "2vo")				; glyph 249, Seconda volta open
Send l-10
If (PaletteSymbol = "8va")				; glyph 250, 8va
Send l-11
If (PaletteSymbol = "8vb")				; glyph 251, 8vb
Send l-12
If (PaletteSymbol = "15ma")				; glyph 252, 15 ma
Send l-13
If (PaletteSymbol = "15mb")				; glyph 253, 15 mb
Send l-14
If (PaletteSymbol = "22ma")				; glyph 254, 22 ma
Send l-15
If (PaletteSymbol = "22mb")				; glyph 255, 22 mb
Send l-16
If (PaletteSymbol = "pss")				; glyph 256, Ped start stop
Send l-17
If (PaletteSymbol = "ps*")				; glyph 257, Ped start asterisk
Send l-18
If (PaletteSymbol = "psr")				; glyph 258, Pedline start-release
Send l-19
If (PaletteSymbol = "psc")				; glyph 259, Pedline start-continue
Send l-20
If (PaletteSymbol = "pcc")				; glyph 260, Pedline continue-continue
Send l-21
If (PaletteSymbol = "pcr")				; glyph 261, Pedline continue-release
Send l-22
If (PaletteSymbol = "trl")				; glyph 262, Trill line
Send l-23
If (PaletteSymbol = "upl")				; glyph 263, Upprall line
Send l-24
If (PaletteSymbol = "dpl")				; glyph 264, Downprall line
Send l-25
If (PaletteSymbol = "ppl")				; glyph 265, Prall prall line
Send l-26
If (PaletteSymbol = "tl")				; glyph 266, Text line
Send l-27
If (PaletteSymbol = "l")				; glyph 267, Line
Send l-28
If (PaletteSymbol = "am")				; glyph 268, Ambitus
Send l-29
If (PaletteSymbol = "lr")				; glyph 269, Let ring
Send l-30
If (PaletteSymbol = "gv")				; glyph 270, Guitar vibrato
Send l-31
If (PaletteSymbol = "gvw")				; glyph 271, Guitar vibrato wide
Send l-32
If (PaletteSymbol = "vsaw")				; glyph 272, Vibrato sawtooth
Send l-33
If (PaletteSymbol = "tsaw")				; glyph 273, Tremolo sawtooth wide
Send l-34
If (PaletteSymbol = "pm")				; glyph 274, Palm mute
Send l-35

; ♣=================================== BARLINES ========================================
; shortcuts in this section
; ,bn,|,bd,||,bsr,|:,ber,:|,besr,:||:,dash,----,bf,|||,b.,....,bps,bt1,bt2,bs1,bs2,1:||:2

If (PaletteSymbol = "bn") || (PaletteSymbol = "|")	; glyph 290, Barline normal
Send b-1-
If (PaletteSymbol = "bd") || (PaletteSymbol = "||")	; glyph 291, Barline double
Send b-2
If (PaletteSymbol = "bsr") || (PaletteSymbol = "|:")	; glyph 292, Barline start repeat
Send b-3
If (PaletteSymbol = "ber") || (PaletteSymbol = ":|")	; glyph 293, Barline end repeat
Send b-4
If (PaletteSymbol = "besr") || (PaletteSymbol = ":||:")
|| (PaletteSymbol = "1:||:2")				; glyph 294, Barline end-start repeat
Send b-5
If (PaletteSymbol = "dash") || (PaletteSymbol = "----")	; glyph 295, Barline dashed
Send b-6
If (PaletteSymbol = "bf") || (PaletteSymbol = "|||")	; glyph 296, Barline final
Send b-7
If (PaletteSymbol = "b.") || (PaletteSymbol = "....")	; glyph 297, Barline dotted
Send b-8
If (PaletteSymbol = "bt1")				; glyph 298, Barline tick 1 span
Send b-9
If (PaletteSymbol = "bt2")				; glyph 299, Barline tick 2 span
Send b-10
If (PaletteSymbol = "bs1")				; glyph 300, Barline short 1 span
Send b-11
If (PaletteSymbol = "bs2")				; glyph 301, Barline short 2 span
Send b-12
If (PaletteSymbol = "bps")				; pseudo barline (symbol)
Send b-13

; ♣============================= ARPEGGIOS and GLISSANDI ===============================
; shortcuts in this section
; ,|a,arp,|apu,apu,arpup,|apd,apd,arpdown,|ab,ab,|aau,aau,|aad,aad,|gls,gls,|glw,glw
; ,|f,fall,|d,doit,|p,plop,|s,scoop,|sod,sod,|sou,sou,|sia,sia,|sib,sib

If (PaletteSymbol = "|a") || (PaletteSymbol = "arp")	; glyph 310, Arp
Send v-1-
If (PaletteSymbol = "|apu") || (PaletteSymbol = "apu") || (PaletteSymbol = "arpup")	; glyph 311, Arp point up
Send v-2
If (PaletteSymbol = "|apd") || (PaletteSymbol = "apd") || (PaletteSymbol = "arpdown")	; glyph 312, Arp point down
Send v-3
If (PaletteSymbol = "|ab") || (PaletteSymbol = "ab")	; glyph 313, Arp bracket
Send v-4
If (PaletteSymbol = "|aau") || (PaletteSymbol = "aau")	; glyph 314, Arp arrow up
Send v-5
If (PaletteSymbol = "|aad") || (PaletteSymbol = "aad")	; glyph 315, Arp arrow down
Send v-6
If (PaletteSymbol = "|gls") || (PaletteSymbol = "gls")	; glyph 316, Gliss line straight
Send v-7
If (PaletteSymbol = "|glw") || (PaletteSymbol = "glw")	; glyph 317, Gliss line wiggle
Send v-8
If (PaletteSymbol = "|f") || (PaletteSymbol = "fall")	; glyph 318, Fall
Send v-9
If (PaletteSymbol = "|d") || (PaletteSymbol = "doit")	; glyph 319, Doit
Send v-10
If (PaletteSymbol = "|p") || (PaletteSymbol = "plop")	; glyph 320, Plop
Send v-11
If (PaletteSymbol = "|s") || (PaletteSymbol = "scoop")	; glyph 321, Scoop
Send v-12
If (PaletteSymbol = "|sod") || (PaletteSymbol = "sod")	; glyph 322, Slide out down
Send v-13
If (PaletteSymbol = "|sou") || (PaletteSymbol = "sou")	; glyph 323, Slide out up
Send v-14
If (PaletteSymbol = "|sia") || (PaletteSymbol = "sia")	; glyph 324, Slide in above
Send v-15
If (PaletteSymbol = "|sib") || (PaletteSymbol = "sib")	; glyph 325, Slide in below
Send v-16

; ♣=================================== TREMOLOS ========================================
; shortcuts in this section
; ,8,q,16,.6,sq,32,.2,dsq,64,.4,hdsq,br,buzz,8=,q=,16=,6=,sq=,32=,2=,dsq=,64=,4=,hdsq=

If (PaletteSymbol = "8") || (PaletteSymbol = "q")
Send w-1				; glyph 360, 1/8 - Quaver stroke through stem
If (PaletteSymbol = "16") || (PaletteSymbol = ".6") || (PaletteSymbol = "sq")
Send w-2				; glyph 361, 1/16 - SemiQ stroke through stem
If (PaletteSymbol = "32") || (PaletteSymbol = ".2") || (PaletteSymbol = "dsq")
Send w-3				; glyph 362, 1/32 - DemiSQ stroke through stem
If (PaletteSymbol = "64") || (PaletteSymbol = ".4") || (PaletteSymbol = "hdsq")
Send w-4				; glyph 363, 1/64 - HemiDSQ stroke through stem
If (PaletteSymbol = "br") || (PaletteSymbol = "buzz")
Send w-5				; glyph 364, Buzz roll
If (PaletteSymbol = "8=") || (PaletteSymbol = "q=")
Send w-6				; glyph 365, 1/8 - Quaver between notes
If (PaletteSymbol = "16=") || (PaletteSymbol = "6=") || (PaletteSymbol = "sq=")
Send w-7				; glyph 366, 1/16 - SemiQ between notes
If (PaletteSymbol = "32=") || (PaletteSymbol = "2=") || (PaletteSymbol = "dsq=")
Send w-8				; glyph 367, 1/32 - DemiSQ between notes
If (PaletteSymbol = "64=") || (PaletteSymbol = "4=") || (PaletteSymbol = "hdsq=")
Send w-9				; glyph 368, 1/64 - HemiDSQ between notes

; ♣==================================== TEXT ===========================================
; shortcuts in this section
; #t,st,staff,#e,ex,expr,#ci,ci,#stc,stc,#rm,rm,#sw,sw,#s,sy,sys,system
; ,#p,pi,pizz,#a,ar,arco,#tr,trem,tremolo,#m,mu,mute,#o,op,open

If (PaletteSymbol = "#t") || (PaletteSymbol = "st") || (PaletteSymbol = "staff")
Send t-1-					; glyph 380, Staff text
If (PaletteSymbol = "#e") || (PaletteSymbol = "ex") || (PaletteSymbol = "expr")
Send t-2					; glyph 381, Expression text
If (PaletteSymbol = "#ci") || (PaletteSymbol = "ci")
Send t-3					; glyph 382, Change Instrument
If (PaletteSymbol = "#stc") || (PaletteSymbol = "stc")
Send t-4					; glyph 383, Staff type change
If (PaletteSymbol = "#rm") || (PaletteSymbol = "rm")
Send t-5					; glyph 384, Rehearsal mark
If (PaletteSymbol = "#sw") || (PaletteSymbol = "sw")
Send t-6					; glyph 385, Swing
If (PaletteSymbol = "#s") || (PaletteSymbol = "sy") || (PaletteSymbol = "sys") || (PaletteSymbol = "system")
Send t-7					; glyph 386, System text
If (PaletteSymbol = "#p") || (PaletteSymbol = "pi") || (PaletteSymbol = "pizz")
Send t-8					; glyph 387, Pizzicato
If (PaletteSymbol = "#a") || (PaletteSymbol = "ar") || (PaletteSymbol = "arco")
Send t-9					; glyph 388, Arco
If (PaletteSymbol = "#tr") || (PaletteSymbol = "trem") || (PaletteSymbol = "tremolo")
Send t-10					; glyph 389, Tremolo
If (PaletteSymbol = "#m") || (PaletteSymbol = "mu") || (PaletteSymbol = "mute")
Send t-11					; glyph 390, Mute
If (PaletteSymbol = "#o") || (PaletteSymbol = "op") || (PaletteSymbol = "open")
Send t-12					; glyph 391, Open

; ♣==================================== TEMPO ==========================================
; shortcuts in this section
; ,m2,m2.,m4,m4.,m8,m8.,gra,grav,grave,lar,larg,largo,len,lent,lento,ada,adag,adagi,adagio
; ,and,anda,andan,andante,mod,mode,moder,moderato,alto,a>,allegre,allegretto
; ,alro,a<,allegro,viv,viva,vivace,pre,pres,prest,presto,
; ,mm4=4.,mmc=c.,mm4.=4,mmc.=c,mm2=4,mmm=c,mm4=2,mmc=m,mm8=8,mmq=q,mm4=4,mmc=c

If (PaletteSymbol = "m2") || (PaletteSymbol = "minim")
Send m-1-			; glyph 400, Half note =80
If (PaletteSymbol = "m4") || (PaletteSymbol = "crotchet")
Send m-2-			; glyph 402, Quarter =80	
If (PaletteSymbol = "m8") || (PaletteSymbol = "quaver")
Send m-3			; glyph 404, Eight =80
If (PaletteSymbol = "m2.") || (PaletteSymbol = "minim.")
Send m-4			; glyph 401, Half note dotted =80
If (PaletteSymbol = "m4.") || (PaletteSymbol = "crotchet.")
Send m-5			; glyph 403, Quarter dotted =80
If (PaletteSymbol = "m8.") || (PaletteSymbol = "quaver.")
Send m-6			; glyph 405, Eight dotted =80
If (PaletteSymbol = "gra") || (PaletteSymbol = "grav") || (PaletteSymbol = "grave")
Send m-7			; glyph 406, Grave 35
If (PaletteSymbol = "lar") || (PaletteSymbol = "larg") || (PaletteSymbol = "largo")
Send m-8			; glyph 407, Largo 50
If (PaletteSymbol = "len") || (PaletteSymbol = "lent") || (PaletteSymbol = "lento")
Send m-9			; glyph 408, Lento 52
If (PaletteSymbol = "ada") || (PaletteSymbol = "adag") || (PaletteSymbol = "adagi") || (PaletteSymbol = "adagio")
Send m-10			; glyph 409, Adagio 71
If (PaletteSymbol = "and") || (PaletteSymbol = "anda") || (PaletteSymbol = "andan") || (PaletteSymbol = "andante")
Send m-11			; glyph 410, Andante 92
If (PaletteSymbol = "mod") || (PaletteSymbol = "mode") || (PaletteSymbol = "moder") || (PaletteSymbol = "moderato")
Send m-12			; glyph 411, Moderato 114
If (PaletteSymbol = "alto") || (PaletteSymbol = "a>") || (PaletteSymbol = "allegre") || (PaletteSymbol = "allegretto")
Send m-13			; glyph 412, Allegretto 116
If (PaletteSymbol = "alro") || (PaletteSymbol = "a<") || (PaletteSymbol = "allegro")
Send m-14			; glyph 413, Allegro 144
If (PaletteSymbol = "viv") || (PaletteSymbol = "viva") || (PaletteSymbol = "vivace")
Send m-15			; glyph 414, Vivace 172
If (PaletteSymbol = "pre") || (PaletteSymbol = "pres") || (PaletteSymbol = "prest") || (PaletteSymbol = "presto")
Send m-16			; glyph 415, Presto 187
If (PaletteSymbol = "mm4=4.") || (PaletteSymbol = "mmc=c.")
Send m-17			; glyph 416, Metric modulation quarter=dotted quarter
If (PaletteSymbol = "mm4.=4") || (PaletteSymbol = "mmc.=c")
Send m-18			; glyph 417, Metric modulation dotted quarter=quarter
If (PaletteSymbol = "mm2=4") || (PaletteSymbol = "mmm=c")
Send m-19			; glyph 417, Metric modulation dotted quarter=quarter
If (PaletteSymbol = "mm4=2") || (PaletteSymbol = "mmc=m")
Send m-20			; glyph 419, Metric modulation quarter=half
If (PaletteSymbol = "mm8=8") || (PaletteSymbol = "mmq=q")
Send m-21			; glyph 420, Metric modulation eight=eight
If (PaletteSymbol = "mm4=4") || (PaletteSymbol = "mmc=c")
Send m-22			; glyph 421, Metric modulation quarter=quarter

; ♣=================================== DYNAMICS ========================================
; shortcuts in this section
; ,ppp,pp,p,mp,mf,f,ff,fff,fp,sf,sfz,sff,sffz,sfp,sfpp,rfz,rf,fz,m*,r*,s*,z*,n*

If (PaletteSymbol = "ppp")				; glyph 440, ppp
Send d-1-
If (PaletteSymbol = "pp")				; glyph 441, pp
Send d-2-
If (PaletteSymbol = "p")				; glyph 442, p
Send d-3
If (PaletteSymbol = "mp")				; glyph 443, mp
Send d-4
If (PaletteSymbol = "mf")				; glyph 444, mf
Send d-5
If (PaletteSymbol = "f")				; glyph 445, f
Send d-6
If (PaletteSymbol = "ff")				; glyph 446, ff
Send d-7
If (PaletteSymbol = "fff")				; glyph 447, fff
Send d-8
If (PaletteSymbol = "fp")				; glyph 448, fp
Send d-9
If (PaletteSymbol = "sf")				; glyph 449, sf
Send d-10
If (PaletteSymbol = "sfz")				; glyph 450, sfz
Send d-11
If (PaletteSymbol = "sff")				; glyph 451, sff
Send d-12
If (PaletteSymbol = "sffz")				; glyph 452, sffz
Send d-13
If (PaletteSymbol = "sfp")				; glyph 453, sfp
Send d-14
If (PaletteSymbol = "sfpp")				; glyph 454, sfpp
Send d-15
If (PaletteSymbol = "rfz")				; glyph 455, rfz
Send d-16
If (PaletteSymbol = "rf")				; glyph 456, rf
Send d-17
If (PaletteSymbol = "fz")				; glyph 457, fz
Send d-18
If (PaletteSymbol = "m*")				; glyph 458, m
Send d-19
If (PaletteSymbol = "r*")				; glyph 459, r
Send d-20
If (PaletteSymbol = "s*")				; glyph 460, s
Send d-21
If (PaletteSymbol = "z*")				; glyph 461, z
Send d-22
If (PaletteSymbol = "n*")				; glyph 462, n
Send d-23

; ♣================================== FINGERING ========================================
; shortcuts in this section
; ,q0,q1,q2,q3,q4,q5,,,p,,i,,,m,,,a,,,c,0,1,2,3,4,5,,,t
; ,0c,1c,2c,3c,4c,5c,6c,tp,lt,l1,l2,l3

If (PaletteSymbol = "q0")				; glyph 480, 0 - piano
Send f-1-
If (PaletteSymbol = "q1")				; glyph 481, 1 - piano
Send f-2-
If (PaletteSymbol = "q2")				; glyph 482, 2 - piano
Send f-3-
If (PaletteSymbol = "q3")				; glyph 483, 3 - piano
Send f-4
If (PaletteSymbol = "q4")				; glyph 484, 4 - piano
Send f-5
If (PaletteSymbol = "q5")				; glyph 485, 5 - piano
Send f-6
If (PaletteSymbol = "-p")				; glyph 486, p
Send f-7
If (PaletteSymbol = "-i")				; glyph 487, i
Send f-8
If (PaletteSymbol = "-m")				; glyph 488, m
Send f-9
If (PaletteSymbol = "-a")				; glyph 489, a
Send f-10
If (PaletteSymbol = "-c")				; glyph 490, c
Send f-11
If (PaletteSymbol = "0")				; glyph 491, 0 - LH Guitar
Send f-12
If (PaletteSymbol = "1")				; glyph 492, 1 - LH Guitar
Send f-13
If (PaletteSymbol = "2")				; glyph 493, 2 - LH Guitar
Send f-14
If (PaletteSymbol = "3")				; glyph 494, 3 - LH Guitar
Send f-15
If (PaletteSymbol = "4")				; glyph 495, 4 - LH Guitar
Send f-16
If (PaletteSymbol = "5")				; glyph 496, 5 - LH Guitar
Send f-17
If (PaletteSymbol = "th")				; glyph 497, LH guitar fingering T
Send f-18
If (PaletteSymbol = "0c")				; glyph 498, 0 in circle
Send f-19
If (PaletteSymbol = "1c")				; glyph 499, 1 in circle
Send f-20
If (PaletteSymbol = "2c")				; glyph 500, 2 in circle
Send f-21
If (PaletteSymbol = "3c")				; glyph 501, 3 in circle
Send f-22
If (PaletteSymbol = "4c")				; glyph 502, 4 in circle
Send f-23
If (PaletteSymbol = "5c")				; glyph 503, 5 in circle
Send f-24
If (PaletteSymbol = "6c")				; glyph 504, 6 in circle
Send f-25
If (PaletteSymbol = "tp")				; glyph 505, Thumb pos
Send f-26
If (PaletteSymbol = "lt")				; glyph 506, Lute thumb fing (RH fingering thumb)
Send f-27
If (PaletteSymbol = "l1")				; glyph 507, Lute 1 fing (RH first finger)
Send f-28
If (PaletteSymbol = "l2")				; glyph 508, Lute 2 fing (RH second finger)
Send f-29
If (PaletteSymbol = "l3")				; glyph 509, Lute 3 fing (RH third finger)
Send f-30

; ♣=============================== REPEATS and JUMPS ===================================
; shortcuts in this section
; ,rm!,!rm,r-m,r m,s!,!s,segno,s1,ss,sv,s2,c!,!c,coda,c1,vc,cv,c2,f!,!f,fine
; ,tc,dc,dcaf,dcac,dsac,dsaf,ds,sr,er,esr

If (PaletteSymbol = "rm!") || (PaletteSymbol = "!rm") || (PaletteSymbol = "r-m")
|| (PaletteSymbol = "r m")				; glyph 520, Repeat bar
Send r-1-
If (PaletteSymbol = "s!") || (PaletteSymbol = "!s")
|| (PaletteSymbol = "segno") || (PaletteSymbol = "s1")	; glyph 521, Segno
Send r-2
If (PaletteSymbol = "ss") || (PaletteSymbol = "sv")
|| (PaletteSymbol = "s2")				; glyph 522, Segno variation §
Send r-3
If (PaletteSymbol = "c!") || (PaletteSymbol = "!c")
|| (PaletteSymbol = "coda") || (PaletteSymbol = "c1")	; glyph 523, Coda Φ
Send r-4
If (PaletteSymbol = "vc") || (PaletteSymbol = "cv")
|| (PaletteSymbol = "c2")				; glyph 524, Varied coda
Send r-5
If (PaletteSymbol = "f!") || (PaletteSymbol = "!f")
|| (PaletteSymbol = "fine")				; glyph 525, Fine
Send r-6
If (PaletteSymbol = "tc")				; glyph 526, To Coda
Send r-7
If (PaletteSymbol = "dc")				; glyph 527, Da Capo
Send r-8
If (PaletteSymbol = "dcaf")				; glyph 528, Da Capo al Fine
Send r-9
If (PaletteSymbol = "dcac")				; glyph 529, Da Capo al Coda
Send r-10
If (PaletteSymbol = "dsac")				; glyph 530, Dalle Segno al Coda
Send r-11
If (PaletteSymbol = "dsaf")				; glyph 531, Dalle Segno al Fine
Send r-12
If (PaletteSymbol = "ds")				; glyph 532, D.S.
Send r-13
If (PaletteSymbol = "sr")				; glyph 533, Start repeat
Send r-14
If (PaletteSymbol = "er")				; glyph 534, End repeat
Send r-15
If (PaletteSymbol = "esr")				; glyph 535, End-start repeat
Send r-16

; ♣============================= FRETBOARD DIAGRAMS ====================================
; shortcuts in this section
; ,qa,qam,qa7,qb,qbm,qb7,qc,qcm,qc7,qd,qdm,qd7,qe,qem,qe7,qf,qfm,qf7,qg,qgm,qg7

If (PaletteSymbol = "qc")				; glyph 550, C
Send q-1-
If (PaletteSymbol = "qcm")				; glyph 551, Cm
Send q-2-
If (PaletteSymbol = "qc7")				; glyph 552, C7
Send q-3
If (PaletteSymbol = "qd")				; glyph 553, D
Send q-4
If (PaletteSymbol = "qdm")				; glyph 554, Dm
Send q-5
If (PaletteSymbol = "qd7")				; glyph 555, D7
Send q-6
If (PaletteSymbol = "qe")				; glyph 556, E
Send q-7
If (PaletteSymbol = "qem")				; glyph 557, Em
Send q-8
If (PaletteSymbol = "qe7")				; glyph 558, E7
Send q-9
If (PaletteSymbol = "qf")				; glyph 559, F
Send q-10
If (PaletteSymbol = "qfm")				; glyph 560, Fm
Send q-11
If (PaletteSymbol = "qf7")				; glyph 561, F7
Send q-12
If (PaletteSymbol = "qg")				; glyph 562, G
Send q-13
If (PaletteSymbol = "qgm")				; glyph 563, Gm
Send q-14
If (PaletteSymbol = "qg7")				; glyph 564, G7
Send q-15
If (PaletteSymbol = "qa")				; glyph 565, A
Send q-16
If (PaletteSymbol = "qam")				; glyph 566, Am
Send q-17
If (PaletteSymbol = "qa7")				; glyph 567, A7
Send q-18
If (PaletteSymbol = "qb")				; glyph 568, B
Send q-19
If (PaletteSymbol = "qbm")				; glyph 569, Bm
Send q-20
If (PaletteSymbol = "qb7")				; glyph 570, B7
Send q-21

; ♣============================= BREAKS and SPACERS ====================================
; shortcuts in this section
; ,sb,pb,xb,ssd,ssu,ssf

If (PaletteSymbol = "sb")				; glyph 600, System break
Send bs1
If (PaletteSymbol = "pb")				; glyph 601, Page break
Send bs2
If (PaletteSymbol = "xb")				; glyph 602, Section break
Send bs3
If (PaletteSymbol = "ssd")				; glyph 603, Staff spacer down
Send bs4
If (PaletteSymbol = "ssu")				; glyph 604, Staff spacer up
Send bs5
If (PaletteSymbol = "ssf")				; glyph 605, Staff spacer fixed down
Send bs6

; ♣============================= FRAMES and MEASURES ===================================
; shortcuts in this section
; ,vf,hf,tf,1m

If (PaletteSymbol = "vf")				; glyph 610, Insert vertical frame
Send fm1

If (PaletteSymbol = "hf")				; glyph 611, Insert horizontal frame
Send fm2

If (PaletteSymbol = "tf")				; glyph 612, Insert text frame
Send fm3

If (PaletteSymbol = "1m")				; glyph 613, Insert one measure
Send fm4

; ♣================================== BRACKETS =========================================
; shortcuts in this section
; ,[[,[{,[l,[s

If (PaletteSymbol = "[[")				; glyph 070, Bracket
Send bracket1
If (PaletteSymbol = "[{")				; glyph 071, Brace
Send brace
If (PaletteSymbol = "[s")				; glyph 072, Square
Send sq
If (PaletteSymbol = "[l")				; glyph 073, Line
Send br-line

; ♣=============================== BEAM PROPERTIES =====================================

; shortcuts in this section
; ,=sb,=mb,=nb,=16b,=32b,=ab,=fbs,=fbf

If (PaletteSymbol = "=sb")				; glyph 620, Start a beam
Send bp1-
If (PaletteSymbol = "=mb")				; glyph 621, Middle beam
Send bp2-
If (PaletteSymbol = "=nb")				; glyph 622, No beam
Send bp3-
If (PaletteSymbol = "=16b")				; glyph 623, Start second level beam - Beam 16th sub
Send bp4-
If (PaletteSymbol = "=32b")				; glyph 624, Start third level beam - Beam 32th sub
Send bp5-
If (PaletteSymbol = "=ab")				; glyph 625, Autobeam
Send bp6-
If (PaletteSymbol = "=fbs")				; glyph 626, Feathered beam slower
Send bp7-
If (PaletteSymbol = "=fbf")				; glyph 627, Feathered beam faster
Send bp8-

Sleep, 100
Send ^!p					; MSc user defined shortcut 'Apply current palette element' (*change*?)
Sleep, 200
; MsgBox, 4097, Test, Check content Searchbox	; for test purposes
; IfMsgBox, Cancel				; activate this by removing the semicolons
;    Return

; ♣======================== EXTRA OPERATIONS ON SOME GLYPHS ============================

; extra operations on some glyphs
; (1) some glyphs need more time: especially globally operating glyphs
; keysignatures, timesignatures, barlines, and sectionbreaks
; glissando lines,fretboard diagrams,brackets and beam properties need more time as well.
; (2) add more 16th and 32nd gracenotes before and after - g3,g6,g3a,g6a
; after first gracenote press Y to create another, press N to stop adding grace notes
; (3) add slur from  first grace-note-before to main note - g3s,g6s
; (4) add slur from main note including following gracenotes to next main note - g3as,g6as


If PaletteSymbol in 1#,2#,3#,4#,5#,6#,7#,7b,6b,5b,4b,3b,2b,1b,0#0b,xsig
, 2/4,3/4,4/4,5/4,6/4,3/8,6/8,7/8,9/8,12/8,c4/4,2/2,3/2
,bn,|,bd,||,bsr,|:,ber,:|,besr,:||:,dash,----,bf,|||,b.,....,1:||:2
,bt1,bt2,bs1,bs2,hgls,gls,hglw,glw,er,sr,esr,qa,qam,qa7,qb,qbm,qb7,qc,qcm,qc7
,qd,qdm,qd7,qe,qem,qe7,qf,qfm,qf7,qg,qgm,qg7,xb,[[,[{,[l,[s

Sleep, 400					; (1) some glyphs need more time

If PaletteSymbol in bn,|,bd,||,bsr,|:,ber,:|,besr,:||:,dash,----,bf,|||,b.,....,1:||:2
Sleep, 400					; still more time for barlines

If PaletteSymbol in g3,g6,g3a,g6a
{						; (2) add more 16th and 32nd gracenotes before and after - g3,g6,g3a,g6a
    Loop
    {
        Input, MoreGrNs, L1, , y,n
        If (MoreGrNs = "y")
        {
            Send ^!p				; MSc user defined shortcut 'Apply current palette element' (*change*?)
            Sleep, 200
            Continue
        }
        If (MoreGrNs = "n")
        Break
    }
    Sleep, 300
}

If PaletteSymbol in g3s,g6s
{						; (3) add slur from  first grace-note-before to main note- g3s,g6s
    Loop
    {
        Input, MoreGrNs, L1, , y,n
        If (MoreGrNs = "y")
        {
            Send ^!p				; MSc user defined shortcut 'Apply current palette element' (*change*?)
            Sleep, 200
            Continue
        }
        If (MoreGrNs = "n")
	Send s					; slur
	Send +{right %A_Index%}			; shift right x number of loop iterations
        Sleep, 100
	Send +{left}				; minus one note
	Send {Escape}
        Sleep, 50
        Break
    }
    Sleep, 800
}

If PaletteSymbol in g3as,g6as
{						; (4) add slur from main note including following gracenotes to next main note- g3as,g6as
    Loop
    {
        Input, MoreGrNs, L1, , y,n
        If (MoreGrNs = "y")
        {
            Send ^!p				; MSc user defined shortcut 'Apply current palette element' (*change*?)
            Sleep, 200
            Continue
        }
        If (MoreGrNs = "n")
	Send {left %A_Index%}
        Sleep, 100
	Send s
	Send +{right %A_Index%}
        Sleep, 100
	Send {Escape}
        Sleep, 50
        Break
    }
    Sleep, 1200					; needs much time to finish
}

If PaletteSymbol in 1:||:2			; can be tricky with many staves
{
Send !{left}
    Sleep, 50
    ImageSearch, , , SB_X1, SB_Y1, SB_X2, SB_Y2, *40 Statusbar_Rest_Duration_Measure.png
    if (ErrorLevel = 0)
    Goto, SkipCtrlLeft
    if (ErrorLevel = 1)
    Send ^{left}
    SkipCtrlLeft:
    Sleep, 50
    Send ^{F9}					; Palette Search (Ctrl + F9) (*change*?)
    Sleep, 100
;    Send ^a					; select content
    Sleep, 300
    Send l-7 					; glyph 246, Prima Volta
    Sleep, 200
    Send ^!p					; MSc user defined shortcut 'Apply current palette element' (*change*?)
    Sleep, 200
    Send ^{F9}					; Palette Search (Ctrl + F9) (*change*?)
    Sleep, 100
;    Send ^a					; select content
    Sleep, 100
    Send l-10					; glyph 249, Seconda volta open
    Sleep, 100
    Send {Escape}
    Sleep, 100
    Send ^{right}
    Sleep, 200
    Send ^!p					; MSc user defined shortcut 'Apply current palette element' (*change*?)
    Sleep, 200
}

; ♣========================== AFTER OPERATION on some GRACENOTES =======================

If (PaletteSymbol = "acs") || (PaletteSymbol = "aps")
{
    Send +!{up}						; grace note diatonically raised
    Send s						; slurred
    Send {Escape}
    Send {right}
    Return
}    

; ♣============================ SUPPLEMENT PSEUDO BARLINE ==============================

If (PaletteSymbol = "bps")
{
    CoordMode, Mouse, Screen
    CoordMode, Pixel, Screen
    ImageSearch, , , IM_01_X1, IM_01_Y1, IM_01_X2, IM_01_Y2, *40 IM_01_Inspector_Inspector.png
    If ErrorLevel
    {
        Send {Click}
        Sleep, 100
        Send {Escape}				; to suppress the contextual menu
        Sleep, 50
        MsgBox, 4144, Inspector Check, The screen is not in the defined state.`nThis makes it impossible to move`nthe pseudo barline to its correct position.
        Return
    }
    Click, %IN_021_X%, %IN_021_Y%		; I(021) Y-offset - OVERLAP - ELEMENT
    Send {left}
    Sleep, 50
    Send {BS 4}
    Sleep, 50
    Send 4
    Sleep, 500					; give symbol time to move in the staff
    PixelSearch, ElementX, ElementY, % CSA_X1, % CSA_Y1, % CSA_X2, % CSA_Y2, ColorV1, , Fast RGB	; voice 1
    if ErrorLevel
    {
        MsgBox, 4112, Pseudo barline, The symbol was not found.`nTry a higher zoomfactor.`n`nWith group # 3 active:`nPress WIN + N to returm to a note.
        Return
    }

Click, %ElementX%, %ElementY%
Return
}

; ♣============================== SUPPLEMENT lINES nal =================================

If (PaletteSymbol = "nal")				; note anchored line
{
    Send ^{F9}
    Sleep, 100
    Send {del}
    Send !a						; Alt + A, to menu Add
    Sleep, 50
    Send {up}						; lines
    Sleep, 50
    Send {right}
    Sleep, 50
    Send {up}						; shortest way
    Sleep, 50
    Send {Enter}					; note anchored line
    Return
}
Return
