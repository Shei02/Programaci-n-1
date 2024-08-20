Program Ejercicio6B;
//dadas dos pilas, conjuntos. realizar un procedimiento que retorne en la pila C
//la operacion de interseccion, sin alterar las pilas originales
{$INCLUDE/IntroProg/Estructu}

Procedure Interseccion(Var C:Pila; A, B:Pila);
var 
  Aux:Pila;
Begin
  While not PilaVacia(A) and not PilaVacia(B) do
    Begin
        While not PilaVacia(A) and not PilaVacia(B) do
        Begin
          If tope(A) = tope(B) then
            Apilar(C, Desapilar(A))
          Else
            Apilar(Aux, Desapilar(A));
        End;
        While not PilaVacia(Aux) do
          Begin
            Apilar(A, Desapilar(Aux));
          End;
        If not PilaVacia(B) then
          Desapilar(B);
    End;
End;
          
var
   A, B, C:Pila;
Begin
  ReadPila(B);
  ReadPila(C);
  InicPila(A,' ');
  Interseccion(A, B, C);
  WritePila(B);
  WritePila(C);
  WritePila(A);
End.