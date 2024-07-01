;A partir de la dirección 204 hay un conjunto de datos de longitud igual al 
;dato almacenado en la dirección 203. 
;Almacenar en la dirección 200 la cantidad de datos igual a cero, en la 201 
;la cantidad de datos positivos y en la 202 la cantidad de datos negativos.    
org 100h                  
    mov cx,[203h]
    mov di,0

suma:
    mov al,[204h +di]
    inc di
    cmp al, 0    
    js negativo      ;Salta si el número es negativo (SF = 1)
    jz cero          ;Salta si el número es cero (ZF = 1)
    jns positivo     ;Salta si el número es positivo (SF = 0)
continuar:
    loop suma
ret    

cero:
    add [200h],al
    jmp continuar

positivo:
    add [201h],al
    jmp continuar 
    
negativo:
    add [202h],al
    jmp continuar    