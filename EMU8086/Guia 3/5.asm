;Pintar la pantalla de la consola con los colores de tu equipo de futbol favorito. 
org 100h
        mov  cx,280h           ; CX = 280h (640 decimal = 280 hexadecimal) Cantidad de bytes de un "tercio" de la pantalla
        mov  ax,0B800h         ; segmento de la memoria de pantalla
        mov  ds,ax             ; apuntar segmento de datos a la misma
        mov  bx,0              ; apuntar al primer carácter ASCII de la pantalla    
    
az1:    mov  [BX],9020h  	   ; sin caracter fondo azul   
        add bx,2
        loop  az1                ; si CX no es 0, saltar a az    
    
        mov  cx,2D0h   
am:     mov  [bx],6620h 
        add bx,2
        loop  am                ; si CX no es 0, saltar a am     
    
        mov  cx,280h 
az2:    mov  [bx],9020h  	   ; sin caracter fondo azul   
        add bx,2
        loop  az2                ; si CX no es 0, saltar a ar            
ret       