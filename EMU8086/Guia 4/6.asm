;Escriba una macroinstrucción llamada subn similar a la instrucción sub, que le
;reste al primer parámetro el segundo complementado. Por ejemplo subn num1,
;num2 debe restar num1 menos el número que surja de invertir “1” por “0” y “0” por
;”1” a cada bit de num 2.

subn macro num1, num2
    mov ah,num2
    not ah
    mov al,num1
    sub al, ah   
endm

org 100h
    subn 0Ah,05h
ret