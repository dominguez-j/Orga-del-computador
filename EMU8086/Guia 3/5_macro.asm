;Pintar la pantalla de la consola con los colores de tu equipo de futbol favorito.
printc macro color, cont
    local imprimir       ; Definir una etiqueta local dentro del macro
    mov cx, cont         ; Mover el valor de cont a CX
    imprimir:
        mov [bx], color  ; Guardar carácter y atributo en la memoria de pantalla
        add bx, 2        ; Avanzar al siguiente carácter en la memoria de pantalla
        loop imprimir    ; Repetir hasta que CX llegue a 0
endm
org 100h  
    mov  ax,0B800h         ; Segmento de la memoria de pantalla
    mov  ds,ax             ; Apuntar segmento de datos a la misma
    mov  bx,0              ; Apuntar al primer carácter ASCII de la pantalla    
    ;280h (640 decimal = 280 hexadecimal) Cantidad de bytes de un "tercio" de la pantalla y 2D0h es lo mismo pero la del medio
    printc 9020h,280h         ;Fondo azul y sin letra    
    printc 6620h,2D0h         ;Fondo amarillo y sin letra
    printc 9020h,280h         ;Fondo azul y sin letra
ret