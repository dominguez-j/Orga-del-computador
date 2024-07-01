;Escribir una fila con el abecedario. 
org 100h
    mov ax,0B800h         ; segmento de la memoria de pantalla
    mov ds,ax             ; apuntar segmento de datos a la misma
    mov bx,0              ; apuntar al primer carácter ASCII de la pantalla     
    mov AX,0F41h          ; letra A brillante
a:  mov [bx],ax
    add bx,2
    inc al
    cmp al,5Ah
    jle a 
ret