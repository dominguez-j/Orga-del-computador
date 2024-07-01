;Sumar el conjunto de datos de 16 bits que comienzan en la dirección 203 
;y tiene una longitud dada por el dato almacenado en la dirección 202. 
;Elegir los datos para que su suma sea menor a 65.536. Almacenar el 
;resultado a partir de la dirección 200.
org 100h
   mov di,1
   mov ah,[203h]
   mov al,[203h +di] 
   mov cx,[202h]
   
suma:               
    inc di
    adc ah,[203h +di]
    inc di
    adc al,[203h +di]
    loop suma
    
    mov [200h],ah
    mov [201h],al
ret