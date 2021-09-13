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

    @i
    M=0 // initialise i to 0
    @R2
    M=0 // set RAM[2] to 0

(LOOP)
    @i
    D=M // D = i
    @R0
    D=D-M // D = i - RAM[0]
    @END
    D;JGE // if (i - RAM[0]) >= 0 goto END
    @R1
    D=M // D = RAM[1]
    @R2
    M=D+M // RAM[2] = RAM[1] + RAM[2]
    @i
    M=M+1 // i = i + 1
    @LOOP
    0;JMP // goto LOOP

(END)
    0;JMP // infinite loop