;Este ejercicio suma 10 números.
;para imprimir el resltado lo separa en unidad, decena y centena,
;a cada parte le suma 30 para transformar el número en su ASCII
;imprime el resultado llamando tres veces a una macro.  


.MODEL SMALL
.STACK ; asigna un STACK de 1K
.DATA
        cen db 0        ; variable para las centenas
        dece db 0       ; variable para las decenas
        uni db 0        ; variable para las unidades

DATOSSUM DB 01h, 02h, 03h, 04h, 05h ; datos que vamos
         DB 06h, 07h, 08h, 09h, 0Ah ; a procesar     
         
; esta macro imprime el carácter que está en AL y avanza
; la posición del cursor:
printc  macro   char
        mov dl,char 
        add dl,30h
        int 21h
endm
  ;include "emu8086.inc"


.CODE
SUMA PROC 
    mov ax, @DATA
    mov ds, ax
    xor bx, bx        ; indice de acceso al área de datos
    xor dl, dl        ; acumulador de datos
    mov cx, 0Ah       ; numero de datos a procesar  


;CALCULO DE LA SUMA    

ACUMULA:     

    add dl, DATOSSUM [BX]
    inc bx
    loop ACUMULA    
        
;SEPARACIÓN DEL RESULTADO EN UNIDAD, DECENA Y CENTENA
    
    mov al,dl   ;paso el resultado a AL (ejemplo 423) 
    aam         ;AL/10 coceinete en AH (42) y resto en AL (las unidades 3)
    
    mov uni,al  ;guardo las unidades en uni
    mov al,ah   ;muevo lo que tengo en AH (42) a AL para poder volver a separar los números
    
    aam         ; AL/10 cociente en AH (el 4) y el resto en AL= 2
    mov cen,ah  ;guardo las centenas en cen en este caso 4
    
    mov dece,al ;guardo las decenas en dec, en este caso 2
    
    
;IMPRESIÓN DE LOS TRES VALORESEMPEZANDO POR CENTENAS, DECENAS Y UNIDADES
    
    mov ah,02h
        
    printc cen
    printc dece
    printc uni    
    
    ;TERMINA EL PROGRAMA 
    
    mov ah,04ch
    int 21h        
    
    SUMA ENDP
    end