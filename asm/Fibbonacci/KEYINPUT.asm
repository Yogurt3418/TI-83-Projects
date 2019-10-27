.nolist
#include "ti83plus.inc"
.list

	.org userMem-2
	.db $BB,$6D
	 b_call(_RunIndicOff)       ; Kill the run indicator.
    b_call(_ClrLCDFull)
    LD     B, 127
    JR     Display    ; Display initial value of B.
KeyLoop:
    PUSH   BC         ; This will prevent B from being destroyed by _GetKey.
    b_call(_GetKey)
    POP    BC
    CP     kUp        ; If the up arrow key was pressed.
    JR     Z, Increase
    CP     kDown      ; If the down arrow key was pressed.
    JR     Z, Decrease
    CP     kClear     ; If the CLEAR key was pressed.
    RET    Z
    JR     KeyLoop    ; If any other key was pressed, redo _GetKey.
Increase:
    LD     A, B
    CP     255        ; Don't increment B if it's at its maximum value.
    JR     Z, KeyLoop
    INC    B
    JR     Display    ; Display new value of B.
Decrease:
    LD     A, B
    CP     0          ; Don't decrement B if it's at its minimum value.
    JR     Z, KeyLoop
    DEC    B
Display:
    LD     HL, 0       ; Reset cursor to top of screen.
    LD     (CurRow), HL
    LD     L, B
    PUSH   BC         ; Prevent B from destruction at the hands of _DispHL.
    b_call(_DispHL)
    POP    BC
    JR     KeyLoop    ; Get another key.
	ret