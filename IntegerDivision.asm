// Check if divisor (y) is zero.
    @R1
    D=M
    @INVALID      // if y == 0, jump to INVALID division routine
    D;JEQ
    @R4
    M=0         // valid division: flag = 0

    @R0
    D=M
    @R5
    M=D         // R5 <- x (original)
    @R1
    D=M
    @R6
    M=D         // R6 <- y (original)

    @R5
    D=M         // D = x
    @POSX
    D;JGE      // if x >= 0, jump to POSX
    // x is negative: compute |x| = -x
    @R5
    D=M
    D=-D
    @R7
    M=D         // R7 <- |x|
    @CONTX
    0;JMP
(POSX)
    @R5
    D=M         // x is nonnegative
    @R7
    M=D         // R7 <- x
(CONTX)

    @R6
    D=M         // D = y
    @POSY
    D;JGE      // if y >= 0, jump to POSY
    // y is negative: compute |y| = -y
    @R6
    D=M
    D=-D
    @R8
    M=D         // R8 <- |y|
    @CONTY
    0;JMP
(POSY)
    @R6
    D=M         // y is nonnegative
    @R8
    M=D         // R8 <- y
(CONTY)

    @R7
    D=M
    @R3
    M=D         // R3 <- |x|   (initial remainder)
    @R2
    M=0         // R2 <- 0    (initial quotient)

(LOOP)
    @R3
    D=M         // D = remainder
    @R8
    D=D-M     // D = remainder - |y|
    @ENDLOOP
    D;JLT      // if (remainder - |y|) < 0, exit loop
    // Otherwise, subtract |y| from remainder:
    @R3
    D=M         // D = remainder (reload)
    @R8
    D=D-M     // D = remainder - |y|
    @R3
    M=D         // update remainder: R3 = R3 - |y|
    // Increment quotient:
    @R2
    M=M+1
    @LOOP
    0;JMP
(ENDLOOP)

    @R5
    D=M         // D = x
    @XNEG
    D;JLT      // if x < 0, jump to XNEG branch
    // Here x is nonnegative.
    @R6
    D=M         // D = y
    @YNEGNONX
    D;JLT      // if y < 0 then need to negate quotient
    @DONEQ
    0;JMP
(YNEGNONX)
    @R2
    D=M
    D=-D
    @R2
    M=D
    @DONEQ
    0;JMP
(XNEG)
    // Here x is negative.
    @R6
    D=M         // D = y
    @YNEGX
    D;JLT      // if y < 0 then quotient stays positive
    @R2
    D=M
    D=-D        // else (x negative, y nonnegative): negate quotient
    @R2
    M=D
(YNEGX)
(DONEQ)

    @R5
    D=M         // D = x
    @DONER
    D;JGE      // if x >= 0, remainder remains positive
    @R3
    D=M
    D=-D
    @R3
    M=D
(DONER)

    @END
    0;JMP

(INVALID)
    @R4
    M=1         // flag = 1 indicates invalid division
    @R2
    M=0         // set quotient to 0
    @R3
    M=0         // set remainder to 0
    @END
    0;JMP

(END)
