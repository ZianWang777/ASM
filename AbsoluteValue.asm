// Initialize R2 and R3 to 0
@0
D=A
@R2
M=D
@R3
M=D

// Load the value from R0
@R0
D=M 
// If R0<0, jump to IS_NEGATIVE
@IS_NEGATIVE
D;JLT     

// If R0>=0, store R0 into R1
@R1
M=D
@END
0;JMP

(IS_NEGATIVE)
// If R0 is neg, then R2=1
@R2
M=1

@R0
D=M 
// negate the value to positive
D=-D       
// store the absolute value
@R1
M=D

(END)
@END
0;JMP  

//it's very simple question
