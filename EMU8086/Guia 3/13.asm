;Realizar el checksum (suma de chequeo mediante XOR) del conjunto de 
;datos que comienzan en la direcci�n 202 y tiene una longitud dada por el 
;dato almacenado en la direcci�n 201. Almacenar el resultado en la 
;direcci�n 200.
org 100h    
    mov al,0    
    mov di,0
    mov cx,[201h]
suma:
    xor al,[202h +di]
    inc di
    loop suma
    
    mov [200h],al    
ret