;Mostrar en la pantalla la suma de 10 datos.
org 100h  

.data
    vector db 1,2,3
    
.code     
    mov ax,@data     ; Cargo los datos
    mov ds,ax   
     
    mov bx,0         ; Indice para recorrer el vector
    mov dx,0         ; Registro para acumular la suma
    mov cx,3         ; Total de elementos 
    mov di,0         ; Offset inicial

suma:                                                 
    add dx,vector[bx]         ; Suma vector[bx] al acumulador dx  
    inc bx
    loop suma   
    
    mov ax,0B800h
    mov ds,ax                       
          
    add dx,30h          
    mov dh,0Eh
    mov [di],dx
ret