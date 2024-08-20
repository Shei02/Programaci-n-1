Program Ejercicio2C;
//Este Programa es modeficacion del 1 con el procedimeinto del ejercicio 2 de este 
//no se puede porque el ejercicio 1 trabaja con una pila, y el procedure del 2 trabaja con dos pilas
{$INCLUDE/IntroProg/Estructu}

Procedure Eliminar (Var Dada, Aux:Pila; Modelo:Pila);
 
Begin 
   While not PilaVacia(Dada) do
     Begin
       Apilar(Modelo, Desapilar(Dada));
         While not PilaVacia(Dada) do 
          Begin
              If (tope(Dada)) = (tope(Modelo)) then
                  Desapilar(Dada)
              Else
                  Apilar(Aux, Desapilar(Dada));
          End;
     End;
     While not PilaVacia(Aux) do
        Apilar(Dada, Desapilar(Aux));
End;
 Var
     Dada, Aux, Modelo:Pila;
     
Begin
    ReadPila(Dada);
    InicPila(Modelo,' ');
    InicPila(Aux,' ');
    Eliminar (Dada, Aux, Modelo);
    WritePila(Dada);
End.