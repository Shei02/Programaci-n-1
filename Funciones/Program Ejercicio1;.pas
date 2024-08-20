Program Ejercicio1;
//Este programa calcula el factorial de un numero
{$INCLUDE/IntroProg/Estructu}

Function Factorial (M:Real):Real;
Begin
    If M>0 then
        Factorial:= M * Factorial(M-1)
    Else
        Factorial:= 1;
End;

Var 
 Numero:Real;
Begin
    Write('Ingrese un numero:');
    Readln(Numero);
    Numero:=Factorial(Numero);
    Write('Su factorial es: ', Numero:0:2);
End.