Program Ejercicio1;
//este programa Intercambia los valores de dos variables tipo entero
{$INCLUDE/IntroProg/Estructu}

Procedure Intercambio(var A:Char; var B:Char);
var 
  Aux:Char;
Begin
   Aux:= 'G';
   Aux:= A;
   A:= B;
   B:= Aux;
End;

var
  A, B:Char;
  
Begin
  A:= 'H';
  B:= 'C';
  Intercambio(A,B);
  Writeln('El valor de A ahora es: ', A);
  Writeln('El valor de B ahora es: ', B);
End.