;A partir de la direcci�n 204 hay un conjunto de datos de longitud igual al 
;dato almacenado en la direcci�n 203. 
;Almacenar en la direcci�n 200 la cantidad de datos igual a cero, en la 201 
;la cantidad de datos positivos y en la 202 la cantidad de datos negativos.    
org 100h                  
    mov cx,[203h]
    mov di,0

suma:
    mov al,[204h +di]
    inc di
    cmp al, 0    
    js negativo      ;Salta si el n�mero es negativo (SF = 1)
    jz cero          ;Salta si el n�mero es cero (ZF = 1)
    jns positivo     ;Salta si el n�mero es positivo (SF = 0)
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