;Una cadena de caracteres ASCII de longitud dada por el dato almacenado 
;en la dirección 201 se inicia en la dirección 202. Almacenar FF en la 
;dirección 200 si la paridad de todos los caracteres es par. En caso 
;contrario almacenar 00. 
org 100h
    mov cx,[201h]
    mov si,202h
    mov bx,0        ;Va a almacenar la cantidad de pares
    
ciclo:
    lodsb
    or al,0
    jpe contar_pares
continuar:     
    inc di
    loop ciclo 
    cmp bx,[201h]    ;Si la cantidad de pares es igual a la cantidad de caracteres
    jmp todos_pares    
    mov [200h],00h
ret

todos_pares:   
    mov [200h],0FFh
ret

contar_pares:
    inc bx
    jmp continuar
    