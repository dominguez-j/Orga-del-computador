@Escribir el código ARM que convierta una palabra de minúscula a mayúscula

.equ SWI_Exit, 0x11
.data
	palabra: .ascii "organizacion"
.text
.global main

main:
	ldr r0, =palabra @ r0 tiene la dirección de la variable palabra
	mov r1, #0
	mov r2, #0
	
convertir:
	ldrb r2, [r0,r1] @ r2 tiene la direccion de la palabra en el indice r0[r1]
	cmp r2, #0 @ Si llegue al final de la palabra, termino 
	beq fin
	
	sub r2, r2, #32 @ Le resto 32 en ascii para pasar de minus a mayus
	strb r2, [r0,r1] @ Escribo el caracter nuevo en la misma posicion de memoria
	add r1,r1,#1 @ Aumento para pasar a la siguiente posicion
	b convertir	
	
fin:
	swi SWI_Exit
