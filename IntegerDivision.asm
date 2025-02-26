// IntegerDivision.asm

// Save R0 and R1 into variables
@R0
D=M
@x
M=D
@R1
D=M
@y
M=D

// Initialize R4 to 0 (valid)
@R4
M=0

// Check if y is 0
@y
D=M
@INVALID
D;JEQ

// Determine the sign of x
@x
D=M
@sign_x
M=1
@X_NEG
D;JLT
(X_POS)
@sign_x
M=1
@COMPUTE_SIGN_Y
0;JMP
(X_NEG)
@sign_x
M=-1

// Determine the sign of y
(COMPUTE_SIGN_Y)
@y
D=M
@sign_y
M=1
@Y_NEG
D;JLT
(Y_POS)
@sign_y
M=1
@COMPUTE_AX_AY
0;JMP
(Y_NEG)
@sign_y
M=-1

// Compute absolute values of x and y
(COMPUTE_AX_AY)
@x
D=M
@ax
M=D
@MAKE_AX_POS
D;JGE
@ax
M=-D
(MAKE_AX_POS)

@y
D=M
@ay
M=D
@MAKE_AY_POS
D;JGE
@ay
M=-D
(MAKE_AY_POS)

// Perform division of ax by ay to get quotient_abs and remainder_abs
@quotient_abs
M=0
@ax
D=M
@temp
M=D

(DIV_LOOP)
@temp
D=M
@ay
D=D-M
@END_DIV
D;JLT
@ay
D=M
@temp
M=M-D
@quotient_abs
M=M+1
@DIV_LOOP
0;JMP

(END_DIV)
@temp
D=M
@remainder_abs
M=D

// Compute sign_m = sign_x * sign_y
@sign_x
D=M
@sign_y
D=D*M
@sign_m
M=D

// Compute m = quotient_abs * sign_m
@quotient_abs
D=M
@m
M=D
@sign_m
D=M
@SET_M_NEG
D;JLT
@COMPUTE_Q_VAL
0;JMP

(SET_M_NEG)
@m
M=-M

// Compute q = remainder_abs * sign_x
(COMPUTE_Q_VAL)
@remainder_abs
D=M
@q
M=D
@sign_x
D=M
@SET_Q_NEG
D;JLT
@STORE_RESULTS
0;JMP

(SET_Q_NEG)
@q
M=-M

// Store results in R2, R3 and exit
(STORE_RESULTS)
@m
D=M
@R2
M=D
@q
D=M
@R3
M=D
@END
0;JMP

// Handle invalid division (y=0)
(INVALID)
@R4
M=1

(END)
@END
0;JMP
