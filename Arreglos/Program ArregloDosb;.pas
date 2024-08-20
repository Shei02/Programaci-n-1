Program ArregloDosb;

Const
    Min=1;
    Max=100;
    
Type
    SumaDeReales=Array[Min..Max] of Real;
    
Function Suma(Arreglo:SumadeReales):Real;
var
    I,Aux:Integer;
    Sumar,Dato:Real;
    Frontera:Integer;
Begin
    I:= Min;
    Sumar:= 0;
    Frontera:= 0;
    Write('Ingrese el valor de la Frontera: ');
    Read(Aux);
    While (I <= Max) and (Frontera < Aux) Do
        Begin
            Writeln('Ingrese El Numero Real: ');
            ReadLN(Dato);
            Arreglo[I]:= Dato;
            Sumar:= Sumar + Arreglo[I];
            I+=1;
            Frontera:= Frontera + 1;
        end;
    While (I <= Max) Do
        Begin
            Writeln('Ingrese El Numero Real: ');
            ReadLN(Dato);
            Arreglo[I]:= Dato;
            I+=1;
        End;
    Suma:=Sumar;
End;
var
    Arreglo:SumadeReales;
    I:Integer;
    SumaDeV:Real;
Begin
    SumaDeV:= Suma(Arreglo);
    Writeln(SumaDeV:0:2);
End.