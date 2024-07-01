;Mediante iteraciones rotar los 8 LSB del registro BL hacia el registro BH.
org 100h
   mov bx,10110011b
   ror bx,8
ret