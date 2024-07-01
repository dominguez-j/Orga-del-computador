;Escribir la letra a en la memoria de video
org 100h
    mov  ax,0b800h         ; segmento de la memoria de pantalla
    mov  ds,ax             ; apuntar segmento de datos a la misma
    mov  bx,0              ; apuntar al primer carácter ASCII de la pantalla
	mov  ax,0F41h		   ; letra A brillante
    mov  [bx],ax  	   
ret