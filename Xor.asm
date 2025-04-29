// Load the value from R0
@R0
D=M
// Perform AND between R0 and R1
@R1
D=D&M
// Store the result into R3
@R3
M=D

// Load R0 again
@R0
D=M
// Perform OR between R0 and R1
@R1
D=D|M
// Store the result into R4
@R4  
M=D 

// Load the value in R3
@R3
D=M
// Bitwise NOT of R3
D=!D

// Load R4
@R4
// Bitwise AND between !R3 and R4
D=D&M

// Store the final result into R2
@R2 
M=D

(END)
@END
0;JMP
