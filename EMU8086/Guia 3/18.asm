;Almacenar en la direcci�n 200 la cantidad de unos que tiene el dato almacenado en la direcci�n 201.
org 100h
   mov al,[201h]    ;Guardo el valor de la dir 201 en al
   mov [200h],0     ;Setteo en cero la direccion 200 
   mov cx,8         ;8 bits es mi maximo de longitud
   
contar_unos:
	mov bl,01h      ;M�scara para contar unos
    and bl,al
    cmp bl,01h
    je contar
continuar:
    ror al,1        ;Roto un bit a la derecha para preguntar por el sig bit
    loop contar_unos           
ret  

contar:
    add [200h],1
    jmp continuar