@Las divisiones con signo y sin signo SDIV y UDIV no se pueden simular en ARMSim.
@Escribir un programa que reproduzca el algoritmo de la división de modo que devuelva cociente y resto.

.equ SWI_Exit, 0x11
.data
	cociente: .word 0 @ Variable para almacenar el cociente
	resto: .word 0    @ Variable para almacenar el resto
.text
.global main

main:
	ldr r0, =cociente @ r0 tiene la dirección de la variable cociente
	ldr r1, =resto	  @ r1 tiene la dirección de la variable resto
	mov r2, #5		  @ Numerador
	mov r3, #2		  @ Denominador
	mov r4, #0		  @ r4 es el contador para hallar el cociente
	
dividir:
	cmp r2,r3
	bge restar
			
	str r4,[r0] @ Almacenar el valor de r4 en la variable cociente
	str r2,[r1] @ Almacenar el valor de r2 en la variable resto
	swi SWI_Exit 
	
restar:
	sub r2, r2, r3 @ Resto r2 - r3
	add r4, r4, #1 @ Aumento en uno el cociente
	b dividir 
