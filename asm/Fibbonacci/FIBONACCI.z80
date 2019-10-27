.NOLIST
#INCLUDE "ti83plus.inc"
#DEFINE  ProgStart    $9D95
.LIST
.ORG    ProgStart - 2
.DB     t2ByteTok, tAsmCmp
#define A_SAVE	 LD (a), A 
#define A_LOAD   LD A, (a)

	;A_LOAD
	LD A, (a)
	LD B, 0
	LD C, 1
	LD D, 0
	
	
LOOP:

	A_SAVE
	;PUSH AB
	
	;LD  A, 0 					;A = 0
	;ADD A, B 					
	LD A, B
	ADD A, C 					;A <- B+C
	LD  D, A 					;D <- B+C

	LD C, B  					;C <- B
	LD B, D						;B <- D
	
	LD A, D
	LD (current), A				;a <- D
	
	LD HL, (current)
	bcall(_DispHL)				;Print out number
	bcall(_NewLine)
	
	A_LOAD						;If done then exit loop
	ADD A, -1
	jp nz, LOOP
	
EXIT:
	ret
	
a: .word 13
current: .word 0