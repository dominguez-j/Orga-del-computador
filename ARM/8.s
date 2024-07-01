@Leer un número de un archivo de texto, multiplicarlo por 2 y escribir el resultado en otro archivo

.equ SWI_Open_File, 0x66
.equ SWI_Read_Int, 0x6C
.equ SWI_Print_Int, 0x6B
.equ SWI_Close_File, 0x68
.equ SWI_Exit, 0x11

.data
filename: .asciz "entero.txt"

.text
.global main

main:
	ldr r0, =filename @ r0 tiene la dirección de la variable filename  
	mov r1, #0
	swi SWI_Open_File @ Abro el archivo 
	mov r5, r0 @ r5 maneja el archivo
	
	swi SWI_Read_Int @ Leo entero y lo guardo en r2
	mov r2, r0
	
	mov r0, r5
	swi SWI_Close_File @ Cierro el archivo
	
	cmp r2, #0 @ chequear si el entero leído es menor a 0
	
	mov r3, #0 
	submi r2, r3, r2 @ Si lo es: sobreescribo el entero con su negación aritmética
	
	mov r0, #1
	mov r1, r2
	swi SWI_Print_Int @ Muestro el entero

	swi SWI_Exit
