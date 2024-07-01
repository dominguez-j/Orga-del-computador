;A partir de la direcci�n 0200 hay un n�mero de 3 bytes de longitud. Luego 
;de ese n�mero, en la direcci�n siguiente de la memoria, hay otro n�mero 
;de 24 bits. Sumar los dos n�meros y guardar el resultado a partir de la 
;direcci�n posterior al segundo n�mero.
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