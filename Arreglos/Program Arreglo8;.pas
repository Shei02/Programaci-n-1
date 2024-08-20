Program Arreglo8;
// Realizar un procedimiento ó función (según corresponda) que borre un caracter dado en un
//arreglo ordenado alfabéticamente, conservando el orden y haciendo un corrimiento a izquierda y
//completando con blanco la última posición

Const
  Inicio=1;
  Fin=40;
  Discerniblex = '-';
  
Type ArrAlfabeto = Array[Inicio..Fin] of Char;

Procedure Carga (var Arreglo:ArrAlfabeto;var Aux:Integer );
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
     Maximo, C:Integer;
     Dato: Char;
Begin
    Maximo:= 0;
    C:= 1;
    writeln('Dato');
    Read(Dato);
    Maximo:= Aux - 1;
    While (Arreglo[C] <> Dato ) do
        C += 1;
    While (C < Maximo) Do
    Begin
        Arreglo[C]:= Arreglo[C + 1];
        C+= 1;
    End;    
        Arreglo[Maximo]:= ' ';
End;

Procedure ImprimirArreglo(Arreglo:ArrAlfabeto);
var 
I:Integer;
Begin
    For I:= Inicio To Fin Do
      Begin
       If Arreglo[I] <> Discerniblex then
        Write(Arreglo[I], ' ');
      End;
End;

Var 
    Arreglo:ArrAlfabeto;
    Aux:Integer;
Begin
    Carga(Arreglo,Aux);
    Corrimiento(Arreglo,Aux);
    ImprimirArreglo(Arreglo);
End.