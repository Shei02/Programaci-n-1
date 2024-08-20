Program Ejercicio2;
//Este programa comprueba si un numero es par o impar, devolviendo verdadero o falso 
//respectivamente
{$INCLUDE/IntroProg/Estructu}

Function ParImpar (N:Integer):Boolean;
Begin
  If N mod 2=0 then 
    ParImpar:=True
  Else 
    ParImpar:= False
End;

Var
 Numero, Resultado:Integer;
Begin
  Write('Ingrese un numero: ');
  Readln(Numero);
  If ParImpar(Numero) = True then
    Write('El numero ingresado es par')
  Else
    Write('El numero ingresado es impar');
End.