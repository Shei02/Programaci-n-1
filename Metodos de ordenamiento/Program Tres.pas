Program Ejercicio3;
//Dado un arreglo ARR_SEC de carácteres con secuencias (donde una secuencia de caracteres es un serie consecutiva 
//de chars diferentes a blancos) ordenar descendentemente el arreglo en base a la longitud de sus secuencias de ARR_SEC
Const
    Inicio = 1;
    Max=20;

Type arr = array [Inicio..Max] of char;

Procedure proximaSec (arreglo:arr; var posInic:integer; var posFinal:integer);
var
    J:integer;
Begin
    posInic:= posFinal + 1;
    J:= posInic;   
        If (J < Max) and (arreglo[J+1] = ' ') and (arreglo[J] <> ' ') then
            posFinal:= J;
            
        While (J < max) and not ((arreglo[J] <> ' ') and (arreglo[J+1] = ' ')) do 
                    Begin
                        J:=J+1;
                        If (J < max) and (arreglo[J+1] = ' ') and (arreglo[J] <> ' ') then
                            posFinal:= J;
                    End;
            If (J = max) then
                posFinal:= J;
End;

Function cant_elem_psec (arreglo:arr; posInic, posFinal:integer):integer;
//me cuenta la cantidad de elementos que tiene mi secuencia (sin incluir a los 0s)
var
    I,Cantidad:integer;
Begin
    Cantidad:=0;
    For I:=posInic to posFinal do
        //desde una posInicial (que va a ser un 0 si estamos en todas las sec menos la primera, esa pueda o no empezar con 0) hasta una posfinal
        Begin
            If (arreglo[I] <> ' ') then
                Cantidad:= Cantidad+1;
        End;
    cant_elem_psec:= Cantidad;
End;

Procedure movDeSecuencias (var arreglo:arr; var posInic:integer; var posFinal:integer; cantidad_menor, cantidad_mayor:integer);
var
    I,J,posFin,nmr_blancos_entresec:integer;
Begin
    I:=1;
    posFin:= posFinal;
    nmr_blancos_entresec:= posFinal-(posInic-1)-cantidad_mayor;
    
    While (I <= nmr_blancos_entresec) do
        Begin
            For J:=posInic to (posFin-1) do
                arreglo[J]:= arreglo[J+1];
            I:= I+1;
            posFinal:= posFinal-1;
        End;

    For J:= Inicio to cantidad_menor do
        Begin
            arreglo[posFin]:= arreglo[posInic-1];
            posFin:= posFin-1;
            posInic:= posInic-1;
                For I:=posInic to (posFinal-1) do
                    arreglo[I]:= arreglo[I+1];
        
            posFinal:= posFinal-1;      
        End;
            
    For I:= Inicio to nmr_blancos_entresec do
        arreglo[posFinal+i]:= ' ';        
        
    I:= posInic;
    
    While (I > Inicio) and not ((arreglo[I] = ' ') and (arreglo[I-1] <> ' ')) do
        Begin
            I:= I-1;
                If (I > Inicio) and (arreglo[I] = ' ') and (arreglo[I-1] <> ' ') then
                    posInic:=i;
        End;

    If (I = 1) then
        posInic:= I;
End;

Procedure Ordenar (var arreglo:arr; var posInic:integer; var posFinal:integer);
var
    I,J,Cant,cant_sec:integer;
Begin
    I:= Inicio;
    posInic:=0;
    posFinal:=0;
    cant_sec:=0;
    
    While (posInic <= posFinal) and ((posFinal+1) < max) do
        Begin
            proxsec(arreglo,posInic,posFinal);
            cant_sec:= cant_sec+1;
        End;                       

    While (I <= cant_sec) do
        Begin
            Cant:= 0;
            posInic:= 0;
            posFinal:= 0;
                
            J:= Inicio;
            proxsec(arreglo,posInic,posFinal);
            cant:=cant_elem_psec(arreglo, posInic, posFinal);
                    
                While (J < cant_sec) and (posInic <= posFinal) do
                    Begin
                        proxsec(arreglo, posInic, posFinal);
                    
                        If (Cant >= cant_elem_psec(arreglo, posInic, posFinal)) then
                            Begin
                                Cant:= cant_elem_psec(arreglo, posinic, posfinal);
                                J:= J+1;
                            End;
                        If (Cant < cant_elem_psec(arreglo, posInic, posFinal)) then
                            Begin
                                movDeSecuencias(arreglo, posInic, posFinal,Cant,cant_elem_psec(arreglo, posInic, posFinal));
                                proxsec(arreglo, posInic, posFinal);
                                Cant:= cant_elem_psec(arreglo, posInic, posFinal);  
                            End;  
                    End;
        I:= I+1;        
        End; 
End;

Procedure cargaArreglo(var arreglo:arr);
var
    I:integer;
Begin
    For I:= Inicio to max do
        Begin
            write('Ingrese datos en el arreglo: ');
            readln(arreglo[I]);
        End;
End;

Procedure imprimirArreglo (arreglo:arr);
var
    I:integer;
Begin
    For I:= Inicio to max do
        Begin 
            write(arreglo[I]);
            write('|');
        End;
        writeln;
End;

var
    arr_Sec:arr;
    posInic,posFinal:Integer;
Begin
    cargaArreglo(arr_Sec);
    ordenar(arr_Sec, posInic, posFinal);
    imprimirArreglo(arr_Sec);
End.