;A partir de la dirección 0200 hay un número de 3 bytes de longitud. Luego 
;de ese número, en la dirección siguiente de la memoria, hay otro número 
;de 24 bits. Sumar los dos números y guardar el resultado a partir de la 
;dirección posterior al segundo número.
org 100h   
   mov di,0     ;Iterador
   mov cx,3     ;Cantidad de repeticiones
   clc          ;Reseteo el carry 
a:    
   mov al,[200h +di]
   adc al,[203h +di] ;Sumo y tambien sumo el carry
   mov [206h +di],al
   inc di
   loop a   
ret