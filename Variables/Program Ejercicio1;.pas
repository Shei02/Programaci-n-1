Program Ejercicio1;
//este programa Intercambia los valores de dos variables tipo entero
{$INCLUDE/IntroProg/Estructu}

Procedure Intercambio(var A:Integer; var B:Integer);
var 
  Aux:Integer;
Begin
   Aux:= 0;
   Aux:= A;
   A:= B;
   B:= Aux;
End;

var
  A, B:Integer;
  
Begin
  A:= 2;
  B:= 8;
  Intercambio(A,B);
  Writeln('El valor de A ahora es: ', A);
  Writeln('El valor de B ahora es: ', B);
End.