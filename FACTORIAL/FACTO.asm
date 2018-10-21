.MODEL SMALL
.STACK
.DATA 
SMS     DB 'INGRESE UN VALOR: $'
SMSR    DB 'FACTORIAL: $'

FACTO   DB ?
DER     DB ?
IZQ     DB ?

.386
.CODE
PROGRAMA:
    MOV AX,@DATA
    MOV DS,AX

    MOV DX,OFFSET SMS
    CALL IMPRIMIR 
     
    MOV AH,01H  ;RECIBIR UN DATO DEL TECLADO
    INT 21H
    SUB AL,30H
    MOV FACTO,AL
    
    CALL LINEA
    
    MOV DX, OFFSET SMSR
    CALL IMPRIMIR
    
    XOR AX,AX
    XOR CX,CX
    
    MOV CL,FACTO
    SUB CL,1
    MOV AL,FACTO
    CICLO:
        MUL CX
        LOOP CICLO
         
    TERMINA:
        AAM
        OR AX,3030H

        MOV DER,AH
        MOV IZQ,AL
        
        MOV AH,02H
        MOV DL,DER
        INT 21H
        
        MOV AH,02H
        MOV DL,IZQ
        INT 21H 
        CALL LINEA
        JMP SALIR
;--------------------PROCEDIMIENTOS--------------------PROCEDIMIENTOS--------------------PROCEDIMIENTOS--------------------PROCEDI
    IMPRIMIR PROC
        MOV AH,09H
        INT 21H
        RET
        IMPRIMIR ENDP
    
    LINEA PROC 
        MOV DL,10   
        MOV AH,02H
        INT 21H
        RET
        LINEA ENDP
        
    SALIR PROC  
        MOV AH,4CH
        INT 21H
        SALIR ENDP
END PROGRAMA