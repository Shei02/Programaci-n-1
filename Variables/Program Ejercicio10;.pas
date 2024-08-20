Program Ejercicio10;
//Este Programa elimina los 0 que se encuentran entre secuencias, y ademas cuenta la cantidad de secuencias.
{$INCLUDE/IntroProg/Estructu}

Procedure ExtraerSec(var Dada:Pila; var Secuencia:Integer);
var
Aux:Pila;
Begin
    While not PilaVacia(Dada) do
     If (Tope(Dada)<>0) then
         Begin
           Apilar(Aux, Desapilar(Dada))
         End
     Else
      Begin
       Desapilar(Dada);
       Secuencia+= 1;
      End;
       
    While not PilaVacia(Aux) do
       Apilar(Dada, Desapilar(Aux));
End;

var
 Origen:Pila;
 Secuencia:Integer;
Begin
    Secuencia:= 0;
    ReadPila(Origen);
    ExtraerSec(Origen, Secuencia);
    WritePila(Origen);
    Writeln('La cantidad de secuencias es: ', Secuencia);
End.