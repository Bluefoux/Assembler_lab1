.data
test:
.word 1
.word 3
.word 5
.word 0
textA: .asciz "Lab1 , Assignment  2\n"
textB: .asciz "The max is: "
textC: .asciz "\nDone"
.text
.global main
.extern printf

findMax:
STMDB sp!, {r3, lr}
MOV r2, #0
again:
LDR r1, [r0]
CMP r1, #0
BEQ finish
CMP r1, r2
BLT goagain
MOV r2, r1
goagain:
ADD r0, r0, #4
BAL again
finish:
LDMIA sp!, {r3, pc}

main:
STMDB sp!, {r4, lr}
MOV r0, #1
LDR r1, =textA
SWI 0x69
LDR r0 , =test
BL findMax
MOV r1 , r0
MOV r0, #1
LDR r1 , =textB
SWI 0x69
MOV r1, r2
SWI 0x6b
MOV r0, #1
LDR r1 , =textC
SWI 0x69
SWI 0x11
.end

