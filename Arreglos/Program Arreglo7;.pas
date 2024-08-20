Program Arreglo7;
//Realizar un procedimiento ó función (según corresponda) que, dada una posición válida, inserte
//un caracter dado en un arreglo haciendo un corrimiento a derecha. 

Const
  Inicio=1;
  Fin=40;
  Discerniblex = '-';
  
Type ArrAlfabeto = Array[Inicio..Fin] of Char;

Procedure Carga (var Arreglo:ArrAlfabeto; var Aux:Integer);
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
    aux:= I;
End;

Procedure Corrimiento (var Arreglo:ArrAlfabeto; var Aux:Integer);
var 
     Posicion,Maximo:Integer;
     Dato: Char;
Begin
    Maximo := 0;
    Writeln('Dato');
    Read(Dato);
    Writeln('Posicion');
    Read(Posicion);
    Maximo:= Aux +1;
    While (Posicion <> Maximo) do
    Begin
        Arreglo[Maximo]:= Arreglo[Maximo - 1];
        Maximo-= 1;
    End;
    If (Posicion = Maximo) Then
        Arreglo[Maximo]:= Dato;
End;

Procedure ImprimirArray(Arreglo:ArrAlfabeto);
var 
I:Integer;
Begin
    For I:= Inicio to Fin do
        Write(Arreglo[I], ' ');
End;

var 
Arreglo:ArrAlfabeto;
Aux:Integer;
Begin
    Carga(Arreglo,Aux);
    Corrimiento(Arreglo,Aux);
    ImprimirArray(Arreglo);
End.