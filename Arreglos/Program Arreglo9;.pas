Program Arreglo9;
//Realizar un procedimiento / función (según corresponda) que, dada una posición válida, borre un
//caracter en un arreglo realizando el corrimiento a izquierda y completando con blanco la última
//posición.

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
     Maximo, C, I:Integer;
     Dato: Char;
Begin
    I:= 1;
    Maximo:= 0;
    writeln('Ingrese posicion: ');
    Read(C);
    Maximo:= Aux - 1;
    While (C <= Maximo) Do
    Begin
        Arreglo[C]:= Arreglo[C + 1];
        C+= 1;
    End;    
        Arreglo[C]:= ' ';
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