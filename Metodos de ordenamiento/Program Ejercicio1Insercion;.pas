Program Ejercicio1;
// Ordenar un arreglo de caracteres según los siguientes métodos:
//● Inserción 

Const
    Inicio = 1;
    Fin = 100;
    Discernible = '*';
    
Type 
    Intersecion = Array [Inicio..Fin] of Char;

procedure Carga(var Arreglo:Intersecion; Var Frontera:Integer);
var 
    I:Integer;
    Dato:Char;
Begin
    I:=Inicio;
    Dato:= '0';
    While (I<= Fin) and (Dato <> Discernible) do
    Begin
        Write('Ingrese un elemento: ');
        Readln(Dato);
        Arreglo[I]:=Dato;
        I:= I + 1;
    End;
    Frontera:= I;
End;

Procedure OrdenarPorInterseccion(var Arreglo:Intersecion; var Frontera:Integer);
var 
    I,J:Integer;
    A_insertar:Char;
Begin
    A_Insertar:= '-';
    For I:=Inicio +1 to Frontera do
    Begin
        A_Insertar:= Arreglo[I];
        J:=I -1;
        While (J >= Inicio) and (Arreglo[J] > A_Insertar) do 
        Begin
            Arreglo[J+1]:=Arreglo[J];
            J:= J-1;
        End;
        Arreglo[J+1] := A_Insertar;
    End;
End;

Procedure Impresion(var Arreglo:Intersecion);
var
    I:Integer;
Begin
    For I:= Inicio to Fin do
      If (Arreglo[I] <> Discernible) and (Arreglo[I] <> '0') then
        Write(Arreglo[I], ' ');
End;

var
    Arreglo:Intersecion;
    Frontera:Integer;
Begin
    Frontera:= 0;
    Carga(Arreglo,Frontera);
    OrdenarPorInterseccion(Arreglo,Frontera);
    Impresion(Arreglo);
End.