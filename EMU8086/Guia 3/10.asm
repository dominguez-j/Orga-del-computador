;En las direcciones 0100 y 0101 hay dos enteros positivos. Ubicar en la dirección 0102 el menor de los dos
org 100h
   mov al,[100h]
   mov bl,[101h]
   
   cmp al,bl
   jnl b          ;Si bl es mayor a al salto hasta b:
    
   mov [102h],al
ret 

b: mov [102h],bl 
ret