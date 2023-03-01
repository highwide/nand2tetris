// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@v
M=1
(LOOPV)
  @v
  D=M
  @256
  D=D-A
  @ENDV
  D;JGT

  @h
  M=1
  (LOOPH)
    @h
    D=M
    @512
    D=D-A
    @ENDH
    D;JGT

    // TODO: SCREENの番地をincrementしていく
    @SCREEN
    M=1

    @LOOPH
    0;JMP
  (ENDH)
  @LOOPV
  0;JMP
(ENDV)

