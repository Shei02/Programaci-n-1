Program Arreglo2;
//Realizar una función que sume los elementos reales de un arreglo de dimensión 100. 
//a)El control de llenado se hace con un valor discernible 
//b) El control de llenado se hace con una frontera

Const
    Min=1;
    Max=100;
    Disernible=-1;
Type
    SumaDeReales=Array[Min..Max] of Real;
    
Function Suma(Arreglo:SumadeReales):Real;
var
    I:Integer;
    Sumar,Dato:Real;
Begin
    I:= Min;
    Sumar:= 0;
    While (I <= Max) and (Arreglo[I] <> Disernible) Do
    Begin
        If (Arreglo[I] <> -1) Then
        Writeln('Ingrese El Numero Real: ');
        ReadLN(Dato);
        Arreglo[I]:= Dato;
        Suma:=Suma + Arreglo[I];
        I+=1;
    End;
    Sumar:=Suma;
End;
var
    Arreglo:SumadeReales;
    I:Integer;
    SumaDeV:Real;
Begin
    SumaDeV:= Suma(Arreglo);
    Writeln(SumaDeV:0:2);
End.