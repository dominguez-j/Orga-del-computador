;A partir de la dirección 3002 hay un conjunto de datos de longitud dada 
;en la dirección 3001. Almacenar en la dirección 3000 el dato menor. 
org 100h
    mov cx,[3001h]
    mov bx,0

ciclo:
    mov ax,[3002h]
    cmp bx,ax
    jns menor       ;Si el cmp me da positivo ax es menor a bx y por lo tanto salto
continuar:
    loop ciclo    
ret
menor:
    mov bx,ax
    mov [3000h],bx
    jmp continuar       