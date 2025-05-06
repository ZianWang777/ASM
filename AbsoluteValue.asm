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
// If R0 < 0, jump to IS_NEGATIVE
@IS_NEGATIVE
D;JLT     

// If R0 >= 0, store R0 into R1
@R1
M=D        
@END
0;JMP      

(IS_NEGATIVE)
// If R0 is negative, set R2 = 1
@R2
M=1
// Load R0 again
@R0
D=M 
// Negate the value to get absolute value
D=-D       
// Store the absolute value into R1
@R1
M=D

(END)
@END
0;JMP  
