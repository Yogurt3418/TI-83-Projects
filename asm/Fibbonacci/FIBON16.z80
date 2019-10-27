.NOLIST
#INCLUDE "ti83plus.inc"
#DEFINE  ProgStart    $9D95
.LIST
.ORG    ProgStart - 2
.DB     t2ByteTok, tAsmCmp

;#define BC_SAVE	  LD (bc_store), BC
;#define BC_LOAD   LD BC, (bc_store)
	LD BC, 0;
	;BC_SAVE
	LD DE, 0;
	LD HL, (a)					;Load the counter into HL
	
LOOP:
	LD (a), HL					;HL is now acting as the accumulator, the value of a is stored
	
	LD HL, 0
	LD  BC, (current) 			;BC = last number
	ADD HL, BC 
	ADD HL, DE 					;HL <- BC+DE

	LD D, B  					;DE <- BC
	LD E, C
	
	LD B, H						;BC <- HL
	LD C, L
	
	LD (current), HL			;Store current number to be printed
	
	PUSH HL
	PUSH BC
	PUSH DE
	
	bcall(_DispHL)				;Print out number
	bcall(_NewLine)
	
	POP DE
	POP BC
	POP HL
	
	LD HL, (a)					;The value of 'a', the counter, is now back in HL
	
	DEC HL						;Decrement HL
	
	LD A, H						;A = H+L
	ADD A, L
	
	jp z, EXIT					;If A = 0, then exit
	jp LOOP						;Otherwise go back to start
	
EXIT:
	
	ret
	
a: .word 23 ;Number of times to run the sequence
;bc_store .word 0
;hl_store .word 0
current: .word 1