Program Ejercicio6D;
//Este programa realiza un procedimiento para determinas si b esta incluido en a
{$INCLUDE/IntroProg/Estructu}

Procedure Includ(var A:Pila; var B:Pila); 
var
 AuxA, AuxB:Pila;
Begin 
  While not PilaVacia(A) and not (PilaVacia(B)) do
    Begin
       If tope(A)=tope(B) then
        Begin
          Apilar(AuxB, Desapilar(B));
          Apilar(AuxA, Desapilar(A));
        End
    
       Else 
         Begin
           While not PilaVacia(AuxB) do
             Apilar(B, Desapilar(AuxB));
             Apilar(AuxA, Desapilar(A));
         End;
    End;
End;
    
Var
  A, B:Pila;
Begin
  ReadPila(A);
  ReadPila(B);
  Includ(A, B);
  If PilaVacia(A) then
    Writeln('B NO esta incluido en A')
  Else
    Writeln('B esta incluido en A');
End.