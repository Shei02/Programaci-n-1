Program Ejercicio6C;
//Este programa hace la diferencia entre dos pilas A y B
//los elementos que estan solo en una de las pilas.
{$INCLUDE/IntroProg/Estructu}

Procedure Diferencia(var B:Pila; var A:Pila; var C:Pila);
var 
 Igual, Diferente:Pila;
Begin
 InicPila(Igual,' ');
 InicPila(Diferente,' ');
  While not (PilaVacia(A)) and (not PilaVacia(B)) do
   Begin    
    Begin
      While not PilaVacia(A) do
        Begin
          If tope(A)=tope(B) then //PARA USAR LA PILA INTERSEC TENES QUE LLAMAR AL PROCEDIMIENTO PRIMERO. AHI TE LO MARQUE
            Apilar(Igual, Desapilar(A))
          Else
            Apilar(Diferente, Desapilar(A));
        End;
    End;
    
    While not PilaVacia(Diferente) do
      Begin
        Apilar(A, Desapilar(Diferente));
      End;
      If not PilaVacia(B) then
        Desapilar(B);
  End;
  While not PilaVacia(A) do
   Apilar(C, Desapilar(A));
End;

var
  A, B, C:Pila;
Begin
  ReadPila(A);
  ReadPila(B);
  InicPila(C,' ');
  Diferencia(A,B,C);
  WritePila(C);
End.