@Programar en ARM la suma de dos números ubicados en el área .data con la directiva .word

.equ SWI_Exit, 0x11
.data
	num1: .word 1 @ Variable para numero 1
	num2: .word 2 @ Variable para numero 2
	resultado: .word 0 @ Variable para almacenar la suma
.text
.global main

main:
	ldr r4,=resultado@ r4 tiene la dirección de la variable resultado
	
	ldr r0,=num1 @ r0 tiene la direccion del num1
	ldr r1,[r0]  @ r1 tiene el valor almacenado en la direccion de r0
	
	ldr r0,=num2 @ r0 tiene la direccion del num2
	ldr r2,[r0]  @ r2 tiene el valor almacenado en la direccion de r0
	
	add r3,r1,r2 @ r3 tiene la suma de los valores
	
	str r3,[r4] @ guardo el valor de r0 ahora es el de r3
	swi SWI_Exit