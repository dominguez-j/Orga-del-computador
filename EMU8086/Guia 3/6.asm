;Escribir “Organización del Computador” sin acentos en la memoria de video con letra roja sobre fondo amarillo.
org 100h  
 
.data    
    vector db 'Organizacion del computador'   

.code 

    mov ax, 0b800h        ; segmento de la memoria de pantalla
    mov es, ax            ; Apuntar ES al segmento del de la memoria de pantalla     
    
    mov si, offset vector ; Offset inicial en el vector de caracteres   
    mov cx, 27            ; Longitud de la palabra "Organizacion del Computador"
    mov di, 0             ; Offset inicial en la memoria de video (fila 0, columna 0)    
    mov ah, 11101100b     ; Atributo de color: amarillo sobre rojo claro
     
c:                                  
    lodsb                 ; Cargar el siguiente byte del vector en AL y aumentar SI
    mov es:[di], ax       ; Escribir el carácter en la memoria de video
    add di,2              ; Incrementar DI para apuntar al siguiente byte (atributo)
    loop c                ; Repetir hasta que CX sea 0        
ret