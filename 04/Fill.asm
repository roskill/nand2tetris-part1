// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/BLACK.asm

// Runs an infinite KEYCHECK that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(SETUP)
    @8192 // 32 words * 256 rows
    D=A
    @lastword
    M=D // lastword = 8192
    @SCREEN
    D=A // D = 16384
    @address
    M=D // address = 16384
    
(RESET)
    @i
    M=0 // i = 0

(KEYCHECK)
    @KBD
    D=M
    @BLACK
    D;JNE // if key pressed, goto BLACK
    @WHITE
    D;JEQ // else goto WHITE
    @KEYCHECK
    0;JMP

(WHITE)
    @i
    D=M // D = i
    @address
    A=M+D // A = 16384 + i
    M=0 // set RAM[16384 + i] = 0
    @lastword
    D=D-M // D = i - 8192
    @RESET
    D;JEQ // if (i - 8192) == 0, goto RESET
    @i
    M=M+1 // i++
    @KEYCHECK
    0;JMP

(BLACK)
    @i
    D=M // D = i
    @address
    A=M+D // A = 16384 + i
    M=-1 // set RAM[16384 + i] = 1111111111111111
    @lastword
    D=D-M // D = i - 8192
    @RESET
    D;JEQ // if (i - 8192) == 0, goto RESET
    @i
    M=M+1 // i++
    @KEYCHECK
    0;JMP