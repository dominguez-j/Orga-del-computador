;Llenar una fila de la pantalla de la consola con la letra a. 
org 100h
    mov  cx,50h            ; CX = 50h (80 decimal = 50 hexadecimal) Cantidad de bytes de una linea
    mov  ax,0b800h         ; segmento de la memoria de pantalla
    mov  ds,ax             ; apuntar segmento de datos a la misma
    mov  bx,0              ; apuntar al primer carácter ASCII de la pantalla
	mov  ax,0F41h		   ; letra A brillante
a:  mov  [bx],ax  	     
    add  bx,2  
    loop a                ; CX=CX-1 -< queda un carácter menos si CX no es 0, saltar a a
ret