;A partir de la direcci�n 204 hay un conjunto de datos de longitud igual al 
;dato almacenado en la direcci�n 203. Almacenar en la direcci�n 200 la 
;cantidad de datos que tienen el bit 3 en 1.
org 100h
    mov cx,[203h]
    mov bl,00001000b    ;Mascara para el tercer bit
    mov di,0
    
suma:
    mov al,[204h +di]
    and bl,al
    cmp bl,00001000b    ;Pregunto si es igual a la mascara
    je sumar            ;Si son iguales los sumo
    loop suma
ret

sumar:
    add [200h],al
    jmp suma