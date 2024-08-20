Program Ejercicio2;
//este programa suma los N primeros numeros
{$INCLUDE/IntroProg/Estructu}

Procedure Sumatoria(N:Integer);
var 
  Cont1, Cont:Integer;
Begin
   Cont:= 0;
   Cont1:= 0;
   
 While Cont <= N do
   Begin
    Cont1:= Cont1 + Cont;
    Cont:= Cont + 1;
   End;
   
   Write('La sumatoria de N es: ');
   Writeln(Cont1);
   
End;
 
var 
  N:Integer;
  
Begin
  Write('Ingrese un valor a N: ');
  Readln(N);
  Sumatoria(N);
End.