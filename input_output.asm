.MODEL SMALL
.STACK 100h
.CODE

MAIN PROC
     MOV AH,1  
     INT 21H    ;input code
     MOV BL,AL 
     
     MOV AH,2
     MOV DL,BL  ;output
     int 21h
     
     exit:
     mov ah,4ch
     int 21h
     main endp
end main