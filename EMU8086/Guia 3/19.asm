;A partir de la dirección 201 comienza una cadena de caracteres ASCII. 
;Este mensaje no incluye a los dos caracteres inicial y final ya que son: 
; -Caracter de control STX de Inicio de Texto (02h) 
; -Caracter de control ETX de Final de Texto (03h) 
;Almacenar en la dirección 200 la cantidad de caracteres del mensaje. 
org 100h      
   mov di,0
   
contar:
   mov al,[202h +di]     ;Se empieza el 202 ya que en la 201 esta el STX
   cmp al,03h            ;Máscara para cortar el ciclo
   je terminar
   inc di
   jmp contar

terminar:   
   mov [200h],di
ret