;Un byte se encuentra en la direcci�n 0100. Ubicar en la direcci�n 0101 su nible m�s significativo.
org 100h      
    mov al,[100h]  
    and al, 11110000b    
    rol al,4
    mov [101h],al
ret