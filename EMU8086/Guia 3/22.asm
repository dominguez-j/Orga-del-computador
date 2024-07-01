;Dos cadenas de caracteres, A y B, de longitudes iguales e igual al dato 
;almacenado en la dirección 201 comienza en las direcciones 202 y 234 
;respectivamente. Si la cadena A es mayor o igual a la cadena B según el 
;orden alfabético, almacenar 0 en la dirección 200. En caso contrario 
;almacenar 1.
org 100h
    mov cx,[201h]
    mov si,202h
    mov di,234h
    mov ax,0
    mov bx,0
    
ciclo:
    mov al, [si]
    mov bl, [di]
    cmp al,bl
    jae char_a_mayor
    inc bh
continuar:
    inc si
    inc di
    loop ciclo
    
    cmp ah,bh
    jae cadena_a_mayor
    mov [200h],1    
ret    

cadena_a_mayor:    
    mov [200h],0
ret

char_a_mayor:
    inc ah
    jmp continuar
     