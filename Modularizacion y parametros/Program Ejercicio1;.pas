Program Ejercicio1;
//Este programa elimina repetidos de una fila dada
{$INCLUDE/IntroProg/Estructu}

Procedure EliminarRepetidos (Var Dada:Pila; Aux, Descarte, Distintos:Pila);

Begin 
    While not PilaVacia(Dada) do
     Begin
        Apilar(Aux, Desapilar(Dada));    //apilo un elemento de dada en aux
           While not PilaVacia(Dada) do 
             Begin 
                If (Tope(Dada)) = (Tope(Aux)) then  //comparo los topes de ambas
                   Apilar(Descarte, Desapilar(Dada)) // si son iguales, borro el elemento de dada
                Else 
                   Apilar(Distintos, Desapilar(Dada)); // si no los apilo en distintos
             End;
           While not PilaVacia(Distintos) do
                Apilar(Dada, Desapilar(Distintos));  // apilo los distintos en dada
     End;
     While not PilaVacia(Aux) do
         Apilar(Dada, Desapilar(Aux)); //apilo los elementos originales en dada
End;

Var
  Dada, Aux, Descarte, Distintos:Pila;

Begin
   ReadPila(Dada);
   InicPila(Aux,' ');
   InicPila(Descarte,' ');
   InicPila(Distintos,' ');
   EliminarRepetidos(Dada, Aux, Descarte, Distintos);
   WritePila(Dada);
End.
     
                        