@Escribir un código ARM para elevar al cuadrado un número

.equ SWI_Exit, 0x11
.data
	resultado: .word 0                       @ Variable para almacenar el resultado
.text
.global main

main:
    ldr r0, =resultado@ r4 tiene la dirección de la variable resultado
    mov r1, #5        @ Inicializo el registro con el numero 5
	mul r1,r1		  @ Elevo al cuadrado el numero	
	str r1,[r0]		  @ Almacenar el valor de r1 en la variable resultado
    swi SWI_Exit
.end