@Escribir un programa que utilice una función que calcula la suma de dos números. 
@El programa principal le pasa los parámetros a la función mediante la pila

.equ SWI_Exit, 0x11
.data
	resultado: .word 0 @ Variable para almacenar la suma
.text
.global main

main:
    ldr r0, =resultado   @ r0 tiene la dirección de la variable resultado
	mov r1, #1
	mov r2, #2
	stmfd sp!,{r1-r2} @ Guardo en pila el r1 y r2 
	
	bl suma @ Llamo a la funcion suma

    str r0, [r0]      @ Almaceno el valor de r1 en la variable resultado
    swi SWI_Exit      
	
suma:
	ldmfd sp!,{r1-r2} @ Saco de la pila el r1 y r2
	add r0, r1, r2 @ Sumo a r0 el r1 y r2
	bx lr @ Vuelve de donde lo llamaron (bl suma)