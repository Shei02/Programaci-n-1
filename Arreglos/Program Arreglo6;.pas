Program Arreglo6;
//Realizar un procedimiento ó función (según corresponda) que inserte un caracter dado en un
//arreglo ordenado alfabéticamente, conservando el orden y haciendo un corrimiento a derecha

Const
  Inicio=1;
  Fin=40;
  Discerniblex = '-';
  
Type ArrAlfabeto = Array[Inicio..Fin] of Char;

Procedure Carga (var Arreglo:ArrAlfabeto;var aux:integer );
var 
 I:Integer;
 Dato:Char;
Begin
    I:=Inicio;
    While (I<= Fin) and (Dato <> Discerniblex) do
    Begin
        Write('Ingrese un elemento: ');
        Readln(Dato);
        Arreglo[I]:=Dato;
        I:= I + 1;
    End;
    Aux:= I;
End;

Procedure Corrimiento (var Arreglo:ArrAlfabeto;var Aux:Integer);
var 
     Maximo:Integer;
     Dato: Char;
Begin
    Maximo:= 0;
    writeln('Dato');
    Read(Dato);
    Maximo:= Aux +1;
    While (Dato <> Arreglo[Maximo]) Do
    Begin
        Arreglo[Maximo]:= Arreglo[Maximo - 1];
        Maximo-= 1;
    End;
    If (Dato = Arreglo[Maximo]) Then
        Arreglo[Maximo]:= Dato;
End;

Procedure ImprimirArreglo(Arreglo:ArrAlfabeto);
var 
I:Integer;
Begin
    For I:= Inicio To Fin Do
        Write(Arreglo[I], ' ');
End;

Var 
    Arreglo:ArrAlfabeto;
    Aux:Integer;
Begin
    Carga(Arreglo,Aux);
    Corrimiento(Arreglo,Aux);
    ImprimirArreglo(Arreglo);
End.