Menu, Tray, Icon, %A_ScriptDir%\lib\PaletteIconv3.ico


InfoShortcuts:
If (PaletteSymbol = "?")
{
MsgBox, 4096, Info about Portals,
(
In InputBox enter: first a QUESTIONMARK and then

- Accidentals			X
- Arpeggios & Glissandi		V	AG
- Articulations			A
- Barlines			B	BL
- Beam Properties			Z
- Brackets			[	BR
- Breaks & Spacers		I	BS
- Breath's & Pauses		P	BP
- Clefs				C
- Dynamics			D
- Fingering			F
- Frames & Measures		H	FM
- Fretboard Diagrams		Q	FD
- Grace Notes			G	GN
- Key Signatures			K	KS
- Lines				L
- Noteheads			N	NH
- Ornaments			O
- Repeats & Jumps		R	RJ
- Tempo				M
- Text				T
- Time Signatures			TS
- Tremolo			W	TR


Repeat last command
In InputBox enter			Z

Exit this script			EXIT
)
}

If (PaletteSymbol = "?x")
{
MsgBox, 4096, Accidentals - shortcuts,
(
In InputBox enter:

Flat					!
Natural					@
Sharp					#
Double sharp				d#
Double flat				d!
Natural Flat				@!
Natural Sharp				@#
Add brackets to accidental			[ ]
Add parentheses to element		( )

Keyboard layout
 flat	 nat.	sharpzz
 !	@	#
1	 2	3
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
MsgBox, 4096, Articulations - shortcuts alphabetically,
(
In InputBox enter:

Accent					A
Accent staccato				A.	.A	
Bend					B
Downbow				DB
Fade in					FI
Fade out					FO
Fermata					FM
Harmonic				H
Laissez vibrer				LV
Long fermata				LFM
Long fermata Henze			LFMH
Louré					L.
Marcato					M
Marcato staccato				M.	.M
Marcato tenuto				MT	TM
Muted					+
Open					O
Portato					P.
Sawtooth line segment			SLS
Sawtooth wide line segment		SWLS
Short fermata				SFM
Short fermata Henze			SFMH
Snap pizzicato				SP
Soft accent				SA
Soft accent staccato			SA.
Soft accent tenuto				SAT
Soft accent tenuto staccato			SAT.
Staccato					.
Staccatissimo				..
Staccatissimo stroke			..S	S..
Staccatissimo wedge			..W	W..
Stress					STR
Tenuto					T
Tenuto accent				TA	AT
Tenuto staccato				T.	.T
Tremolo bar				TB
Unstress					UNSTR
Upbow					UB
Very long fermata				VLFM
Very short fermata				VSFM
Vibrato large faster			VLF
Vibrato large slowest			VLS
Volume swell				VS
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

Alt brevis				*AB
Circled				*C
Circled large			*CL
Cross				*X
Diamond				*D
Diamond old			*DO
Large arrow			*LAR
Normal				*N
Plus				*+
Slash				*//
Slashed forwards			*/
Slashed backwards		*\
Triangle up			*TU
Triangle down			*TD
With X				*XX
X circle				*XC

Do				DO
Re				RE
Mi				MI
Fa				FA
Sol				SOL
La				LA
Ti				TI

Add parentheses to element	( )
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
				T - LH guitar	,T

0 in circle	0c		p	comma!	,P
1 in circle	1c		i		,I		
2 in circle	2c		m		,M		
3 in circle	3c		a		,A		
4 in circle	4c		c		,C		
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

MAJOR		MINOR	             ENTER

    G		    E		1#
    D		    B		2#
    A		    F♯		3#
    E		    C♯		4#
    B		    G♯		5#
    F♯		    D♯		6#
    C♯		    A♯		7#

    F		    D		1b
    B♭		    G		2b
    E♭		    C		3b
    A♭		    F		4b
    D♭		    B♭		5b
    G♭		    E♭		6b
    C♭		    A♭		7b

    C		    A		0#0b
    C		    A		0#
    C		    A		0b

    Open Atonal			XSIG
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
)
}

If (PaletteSymbol = "?l")
{
MsgBox, 4096, Lines - shortcuts,
(
In InputBox enter:

Ambitus #		AM	Palm mute		PM
Cresc			C	Prall prall line		PPL
Dim			D	Prima volta		1V
Downprall line		DPL	Seconda volta		2V
Guitar vibrato		GV	Seconda volta open	2VO
Guitar vibrato wide	GVW	Slur			S
Hairpin crescendo		<	Terza volta		3V
Hairpin decrescendo	>	Text line			TL
Let ring			LR	Tremolo sawtooth wide	TSAW
Line			L	Trill line			TRL
mf cresc pin		MFCP	Upprall line		UPL
Note anchored line	NAL	Vibrato sawtooth		VSAW

# Select clef

Pedline continue-continue	PCC	Octaves			8VA
Pedline continue-release	PCR				8VB
Pedline start-continue	PSC				15MA
Pedline start-stop		PSS				15MB
Pedline start-asterisk	PS*				22MA
Pedline start-release	PSR				22MB

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

1/8	between notes		8b		Qb
1/16	between notes		16b	6b	SQb
1/32	between notes		32b	2b	DSQb
1/64	between notes		64b	4b HDSQb

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

Quarter=dotted quarter		MM44.		MMCC.
Dotted quarter=quarter		MM4=4		MMC.C
Half=quarter			MM24		MMMC
Quarter=half			MM42		MMCM
Eight=eight			MM88		MMQQ
Quarter=quarter			MM44		MMCC
)
}

If (PaletteSymbol = "?r") || (PaletteSymbol = "?rj")
{
MsgBox, 4096, Repeats and Jumps - shortcuts,
(
In InputBox enter:

Repeat measure			RM!	!RM	R-M	R M
Segno				S!	!S	S1	SEGNO
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
⁞	6/8		  6/8
⁞	7/8		  7/8
⁞	9/8		  9/8
⁞	12/8		  12/8
)
}

If (PaletteSymbol = "?[") || (PaletteSymbol = "?br")
{
MsgBox, 4096, Brackets - shortcuts,
(
⁞	In InputBox enter:
⁞
⁞	Bracket		bracket
⁞	Brace		brace
⁞	Square		sqbrace
⁞	Line		lnbrace
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
In InputBox enter FIRST ","
Start a beam					SB
Middle beam					MB
No beam						NB
Start second level beam - Beam 16th sub		16B
Start third level beam - Beam 32th sub		32B
Autobeam					AB
Feathered beam slower #				FBS
Feathered beam faster #				FBF

# Select beam. Reset in Inspector
)
}
Return
