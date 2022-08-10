// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// r2 = r0 * r1
//
// r2=0
// for (i = 0, i++, i < r1) {
//   r2 += r0
// }

    @i
    M=0
    @R2
    M=0
(LOOP)
    @i
    D=M
    @R1
    D=M-D
    @END
    D;JEQ
    @R0
    D=M
    @R2
    M=M+D
    @i
    M=M+1
    @LOOP
    0;JMP
(END)
    @END
    0;JMP
