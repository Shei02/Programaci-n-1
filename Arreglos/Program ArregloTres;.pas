Program ArregloTres;
//Realice un procedimiento ó función(según sea lo mas adecuado) de búsqueda lineal que
//devuelva la posición de un elemento en un arreglo desordenado. Sino está el elemento devuelve -1.

Const
Inicio=1;
Fin=5;

Type Vector=Array [Inicio..Fin] of Integer;

Procedure Cargar(var Arreglo:Vector);
var
  I, Datos:Integer;
Begin
     I:=Inicio;
     While (I<=Fin) Do
      Begin
        Write('Ingrese un elemento: ');
        Readln(Datos);
        Arreglo[I]:= Datos;
        I:= I + 1;
      End; 
End; 
 
Function PosElem(Arreglo:Vector; Elem:Integer):Integer;
Var
  I:Integer;
Begin
  I:= Inicio;
  While (Arreglo[I]<>Elem) and (I<= Fin) Do
    Begin
      I:= I+1;
    End;

    If (Arreglo[I]=Elem) Then
      PosElem:= I
    Else
     Begin
      PosElem:= -1;
     End;
End;

var
  Arreglo:Vector;
  Elem, Resultado:Integer;
Begin
  Cargar(Arreglo);
  Write('Ingrese el elemento que desea buscar: ');
  Read(Elem);
  Resultado:= PosElem(Arreglo, Elem);
  Write('La posicion del elemento es: ');
  Write(Resultado);
End.