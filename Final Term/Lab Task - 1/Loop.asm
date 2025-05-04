.MODEL SMALL
.STACK 100H
.DATA  

    MSG1 DB 10,13,"HELLO$"

.CODE
MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV CX,5  
     MOV BL,31H
     TOP:
     
        MOV AH,9
        LEA DX,MSG1
        INT 21H 
       
        MOV AH,2
        MOV DL," "
        INT 21H
        
       
        MOV DL,BL
        MOV AH,2
        INT 21H 
        
       
        INC BL
        
        LOOP TOP

    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
