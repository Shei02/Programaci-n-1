Program Ejercicio3;
//coloca en una variable la posicion que tiene un elemento dado en una fila.
//si este elemento no se encuentra en la fila colocar en la variable -1
{$INCLUDE/IntroProg/Estructu}

Procedure Posicion(var Pos:Integer; Original:Fila; Elem:Integer);
Var
 Aux:Integer;
Begin
 Aux:= 1;
 
   While not FilaVacia(Original) and (Primero(Original) <> Elem)  do
        Begin
         Aux:=Aux+1;
         Extraer(Original)
        End;
    
    If FilaVacia(Original) then
      Pos:= -1
    Else
      Pos:= Aux;
End;

Var
  Pos, Elem:Integer;
  Original:Fila;
Begin
  Write('Ingrese valores en la Fila: ');
  ReadFila(Original);
  Write('Ingrese un valor a Elem: ');
  Readln(Elem);
  Posicion(Pos, Original, Elem);
  Write('La Posicion que ocupa Elem es: ');
  Writeln(Pos);
End.