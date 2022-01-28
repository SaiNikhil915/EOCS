(START)
@KBD
D=M
@87              // ASCII code for W
D=D-A
@START
D;JNE

// Middle Column Code 
@16399            // 16384 + 15  (Column Block address)
D=A
@R0
M=D              // R0=16399

@255             // 255 lines 
D=A 
@R1 
M=D              // R1=255  

@1   
D=A
@R2
M=D               // R2=1

(COLUMN)
@R1
D=M
@BLOCKS
D;JEQ
@R2
D=M
@i
M=D

(COL)
@i
D=M
@R0
A=M+D
M=-1               // Setting values to ram address
@i
M=M-1
D=M
@COL
D;JGE

@32                  // Code to go to next line
D=A
@R0
M=M+D
@R1
M=M-1
@COLUMN
0;JMP

// Upper and bottom Block Code
(BLOCKS)
@16408            // 16384 + 24  (First Block address)
D=A
@R3
M=D
@22528             // Second Block address
D=A
@R4
M=D

@64              
D=A 
@R5                // R5=64  for number of lines in that block
M=D
@64
D=A
@R6
M=D

@7   
D=A
@R7                // R7=7 for number of lines in on block width 
M=D
@7
D=A
@R8
M=D

(RECT_ONE)
@R5
D=M
@RECT_TWO
D;JEQ
@R7
D=M
@i
M=D

(RECT1)
@i
D=M
@R3
A=M+D
M=-1                // setting Value in Screen address
@i
M=M-1
D=M
@RECT1
D;JGE

@32                
D=A
@R3
M=M+D
@R5
M=M-1
@RECT_ONE
0;JMP

(RECT_TWO)
@R6
D=M
@END                  
D;JEQ
@R8
D=M
@n
M=D
(RECT2)             
@n
D=M
@R4
A=M+D
M=-1              
 
 @n
 M=M-1              
 D=M
 @RECT2              // Repeating Inner Loop 2
 D;JGE
 @32                 // Code to go to next line
 D=A
 @R4
 M=M+D
 @R6
 M=M-1
 @RECT_TWO           //Repeating Outer Loop 2
 0;JMP

(END)                // Program Termination
 @END                // Infinite Loop
0;JMP