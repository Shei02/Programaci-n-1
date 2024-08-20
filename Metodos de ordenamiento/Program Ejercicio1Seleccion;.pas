Program Ejercicio1;
// Ordenar un arreglo de caracteres según los siguientes métodos:
//● Selección

Const
    MIN = 1;
    MAX = 10;
    Disernible = -1;
Type
    Vector = Array[MIN..MAX] of Char;

Procedure CargarArreglo(var Arreglo:Vector);
var
    I:Integer;
    Dato:Char;
Begin
    Dato:= '-';
    I:= Min;
    Writeln('Ingrese Datos');
    For I:= Min to Max do 
        Begin
            Readln(Dato);
            Arreglo[I]:= Dato;
        End;
End;

Function BuscaMenor(Arreglo:Vector; Pos:Integer):Integer;
var
    I,J:Integer;
Begin
    I:= Pos;
    For J:= (Pos + 1) to Max do
        If (Arreglo[J] < Arreglo[I]) then 
            I:= J;
    BuscaMenor:=I;
End;

Procedure Intercambiar(var Arreglo:Vector; Pos1, Pos2:Integer);
var 
Aux:Char;
Begin
    Aux := Arreglo[Pos1];
    Arreglo[Pos1] := Arreglo[Pos2];
    Arreglo[Pos2] := Aux;
End;

Procedure OrdenarPorSeleccion(var Arreglo:Vector);
var 
I, PosMenor:Integer;
Begin
    For I := MIN to (MAX - 1) do begin
        PosMenor := BuscaMenor(Arreglo, I);
        If (PosMenor <> i) then
            Intercambiar(Arreglo, I, PosMenor);
    End;
End;

Procedure ImprimirArreglo(Arreglo:Vector);
var
    I:Integer;
Begin
    Writeln('Imprimiendo...');
    For I:= Min to max do
        Writeln(Arreglo[I]);
End;

var 
Arreglo:Vector;
Begin
    CargarArreglo(Arreglo);
    OrdenarPorSeleccion(Arreglo);
    ImprimirArreglo(Arreglo);
End.