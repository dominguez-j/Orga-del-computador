;Escribir un programa con una macroinstrucción que sume los dos números
;almacenados en las direcciones 200h y 201h de la memoria y que al resultado lo
;multiplique por un tercer número almacenado en la dirección 203h. Los tres números
;son enteros positivos.

sumar macro num1,num2, num3
    mov al,0
    add al, num1
    add al, num2
    mul num3    ;Multiplica a al por el num3        
endm

org 100h
    sumar [200h],[201h],[203h] 
ret
