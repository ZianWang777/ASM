@0
D=A
@R2
M=D
@R3
M=D
@R0
D=M 
@IS_NEGATIVE
D;JLT     

@R1
M=D        
@END
0;JMP     

(IS_NEGATIVE)
@R2
M=1
@R0
D=M 
D=-D       
@R1
M=D
@END
0;JMP 

(END)

@END
0;JMP
