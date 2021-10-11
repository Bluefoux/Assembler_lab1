.data

.text
.global main

factorial:
STMDB sp!, {r4, lr} @Prolog
CMP r0, #1
BLE finish @if register r0 is bigger or equal to 1 
MUL r1, r0, r1
SUBS r0, r0, #1
BL factorial @recursiv
finish:
LDMIA sp!, {r4, pc}

main:
STMDB sp!, {r4, lr} @Prolog
MOV r3, #1
again:
CMP r3, #10
BGT finishend
MOV r1, #1
MOV r0, r3
BL factorial
MOV r0, #1
SWI 0x6b
ADD r3, r3, #1
BAL again
finishend:
SWI 0x11
.end