;El caracter ASCII de control de retorno de carro CR es, en decimal, el 13. 
;Este caracter se encuentra al final de una cadena que comienza en la 
;dirección 202. Ubicar en las posiciones de memoria 200 y 201 la dirección 
;del último caracter antes del CR. 
org 100h
   mov di,202h           ;Asigno direccion 202 a di
     
iterar:
   mov al,[di]               
   cmp al,0Dh          ;13 decimal es 0D en hexa y es la mascara
   je encontrado
   inc di
   jmp iterar
    
encontrado:
    mov [200h],di
ret