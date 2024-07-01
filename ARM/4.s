@Escribir un programa que eleve al cuadrado cada elemento de un arreglo y los sume

.equ SWI_Exit, 0x11
.data
	vector:    .word 1, 2, 3, 4, 5, 6, 7, 8  @ Vector de 8 elementos
	resultado: .word 0                       @ Variable para almacenar la suma
.text
.global main

main:
    mov r2, #8        @ Inicializo el contador del programa en 8
    ldr r0, =vector   @ r0 tiene la dirección del vector
    ldr r4, =resultado@ r4 tiene la dirección de la variable resultado

sumar:
    ldr r1, [r0], #4  @ Carga en r1 el valor apuntado por r0 y avanza r0 en 4
	mul r1,r1		  @ Eleva al cuadrado el valor de r1
    add r3, r3, r1    @ r3 suma r1
    sub r2, r2, #1    @ Decremento en 1 el valor de r2
	cmp r2, #0		  @ Comparo si r4 es 0
    bne sumar         @ Repetir sumar hasta que r2 sea 0

    str r3, [r4]      @ Almacenar el valor de r3 en la variable resultado
    swi SWI_Exit      