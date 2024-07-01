;Escribir en la pantalla la palabra microprocesador y a continuación la misma palabra invertida de derecha a izquierda.
org 100h  

.data    
    vector db 'Microprocesador'  
 
.code
    mov ax,0b800h     
    mov es,ax             
    
    mov si, offset vector ; Offset inicial en la memoria de video
    mov cx, 15            ; Longitud de la palabra "Microprocesador"
    mov di, 0
    mov ah, 0Eh      

mostrar:
    lodsb                 ; Cargar el siguiente byte del vector en AL y aumentar SI
    mov es:[di], ax       ; Escribir el carácter en la memoria de video
    add di,2              ; Incrementar DI para apuntar al siguiente byte (atributo)
    loop mostrar          ; Repetir hasta que CX sea 0  
    
    mov cx, 15            ; Longitud de la palabra "Microprocesador"  
    add di,2              ; Dejo un espacio
         
espejo:  
    dec si                ; Voy recorriendo el vector
    mov al, [si]          ; pero al revés
    mov es:[di],ax        ; Escribir el carácter espejo
    add di,2              ; Mover hacia adelante en la pantalla
    loop espejo           ; Repetir hasta que terminemos   
ret   