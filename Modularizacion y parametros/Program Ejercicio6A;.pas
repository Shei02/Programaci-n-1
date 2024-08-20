Program Ejercicio6A;
//dadas dos pilas(conjuntos), realizar un procedimiento que calcula en una pila C la operacion
//de union, sin alterar las pilas originales.
{$INCLUDE/IntroProg/Estructu}

Procedure PasarPila(var A:Pila; var B:Pila);
Begin
   While not PilaVacia(A) do
     Apilar(B, Desapilar(A));
End;

Procedure EliminaRepetidos(var C:Pila);
var 
  Aux:Fila;
  Aux1, Distintos:Pila;
Begin
  InicPila(Aux1,' ');
  InicFila(Aux,' ');
  
    While not PilaVacia(C) do
      Begin
        Agregar(Aux, Desapilar(C));
         While not PilaVacia(C) do
           If (tope(C)=Primero(Aux)) then
             Desapilar(C)
           Else
              Apilar(Distintos, Desapilar(C));
              PasarPila(Distintos, C);
              If not FilaVacia(Aux) then
                Apilar(Aux1, Extraer(Aux));
      End;
      PasarPila(Aux1, C);
End;

Var
 A, B, C:Pila;
 
 Begin
   ReadPila(A);
   ReadPila(B);
   InicPila(C,' ');
      PasarPila(A,C);
      PasarPila(B,C);
      EliminaRepetidos(C);
   WritePila(C);
 End.