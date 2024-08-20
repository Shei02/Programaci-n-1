Program Arreglo12;
//Realizar un procedimiento que invierta los elementos de un arreglo sobre si mismo

Const
    Inicio = 1;
    Fin = 100;
    Discernible = -1;
    
Type Vector= Array [Inicio..Fin] of Integer;

Procedure Carga (var Arreglo:Vector);
var 
 I, Dato:Integer;
Begin
    I:=Inicio;
    While (I<= Fin) and (Dato <> Discernible) do
    Begin
        Write('Ingrese un elemento: ');
        Readln(Dato);
        Arreglo[I]:=Dato;
        I:= I + 1;
    End;
End;

Procedure Invertir (var Arreglo:Vector);
var 
    Frontera, Aux, I:Integer;
Begin
   I:= Inicio;
   Frontera:= I;
   Aux:= 0;
   While (Arreglo[I] <> Discernible) do
    Begin    
        Frontera += 1;
        I += 1;
    End;
    I:= Inicio;
        While (I <= Frontera) do
            Begin
                Aux:= Arreglo[I];
                Arreglo[I]:= Arreglo[Frontera];
                Arreglo[Frontera]:= Aux;
                Frontera -= 1;
                I += 1;
            End;
End;
   
Procedure Imprecion (var Arreglo:Vector);
var
  I:Integer;
Begin
    For I:= Inicio to Fin do
      If (Arreglo[I] <> Discernible) and (Arreglo[I] <> 0) then
        Write(Arreglo[I], ' ');
End;

Var
  Arreglo:Vector;
Begin
    Carga(Arreglo);
    Invertir(Arreglo);
    Writeln('El arreglo invertido es: ');
    Imprecion(Arreglo);
End.