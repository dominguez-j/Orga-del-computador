;Escribir todo el abecedario con un atributo diferente para cada letra.
org 100h
    mov ax,0B800h         ; segmento de la memoria de pantalla
    mov ds,ax             ; apuntar segmento de datos a la misma
    mov bx,0              ; apuntar al primer car�cter ASCII de la pantalla     
    mov ax,0F41h          ; letra A brillante
a:  mov [bx],ax
    add bx,2
    inc ah
    inc al
    cmp al,5Ah
    jle a 
ret