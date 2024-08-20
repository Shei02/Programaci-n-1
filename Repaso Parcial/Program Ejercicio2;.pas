Program Ejercicio2;
//Este programa busca un numero ingresado por usuario en un arreglo cargado con secuencias, cuya 
//suma de las secuencias (individuales) sea igual a el numero ingresado, una ves encontrada esta 
//secuencia se realiza el orden de menor a mayor de la misma.

Const 
    Inicio = 1;
    Fin = 100;
    Discernible = -1;

Type
    Vector = Array[Inicio..Fin] of Integer;

Procedure Carga(Var Arreglo:Vector; var Frontera:Integer);
Var
    I, Dato:Integer;
Begin
    I:= Inicio;
    Dato:= 0;
    While (I<=Fin) and (Dato <> Discernible) do
    Begin
        Write('Ingrese Secuencias: ');
        Readln(Dato);
        Arreglo[I]:= Dato;
        I += 1;
    End;
    Frontera:= I - 2;
End;

Function Sumatoria (Arreglo:Vector; PosI, PosF:Integer): Integer;
Var
    I, Suma:Integer;
Begin
    Suma:= 0;
    For I:= PosI to PosF do
        Suma += Arreglo[I];
    Sumatoria:= Suma;
End;

Procedure DevuelveSec(Arreglo:Vector; var PosI, PosF:Integer; Frontera, Min:Integer);
var
   I:Integer; 
Begin
    I:= Min;
    If (not (I = Inicio) and (Arreglo[I-1] <> 0)) then
        While (I <= Frontera) and (Arreglo[I] <> 0) do
            I += 1;
            
    While (I <= Frontera) and (Arreglo[I] = 0) do   
        I += 1;
    PosI:= I;
    While (I <= Frontera) and (Arreglo[I] <> 0) do
    Begin
        I += 1;
    End;
    PosF:= I-1;
End;

Procedure Imprimir(Arreglo:Vector; Frontera:Integer);
var
    I:Integer;
Begin
    For I:= Inicio to Frontera do
        Write(Arreglo[I], ' | ');
End;

Procedure OrdenarSecSeleccion(var Arreglo: Vector; var PosI, PosF:Integer);
var
    Auxiliar,I,J:Integer;
Begin
    For I:= PosI to PosF-1 do 
    Begin
        For J:= I+1 to PosF do 
            If (Arreglo[I] > Arreglo[J]) then
                Begin
                    Auxiliar:= Arreglo[I];
                    Arreglo[I]:= Arreglo[J];  
                    Arreglo[J]:= Auxiliar;
                End;
    End;
End;

Procedure SumaBuscada(var Arreglo:Vector; PosI, PosF, Datito:Integer);
var
    I, J,SumaT:Integer;
Begin
    SumaT:= Sumatoria(Arreglo, PosI, PosF);
    If (SumaT = Datito) then
    Begin
        For J:= PosI to PosF do
            OrdenarSecSeleccion(Arreglo, PosI, PosF);
    End;
End;

Var
    Numeros:Vector;
    Frontera, PosI, PosF, Suma,I, Datito, Min:Integer;
Begin
    I:= Inicio;
    Frontera:= 0;
    PosI:= 0;
    PosF:= 0;
    Min:= 0;
    
    Carga(Numeros, Frontera);
    Write('Ingrese el numero que desea encontrar: ');
    Readln(Datito);
    While(I < Frontera) do
    Begin
        DevuelveSec(Numeros, PosI, PosF, Frontera, I);
        SumaBuscada(Numeros, PosI, PosF, Datito);
        I:= I + PosF;
    End;
    Imprimir(Numeros, Frontera);
End.