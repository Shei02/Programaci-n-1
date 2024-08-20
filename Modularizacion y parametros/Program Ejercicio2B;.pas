Program Ejercicio2B;
//Este programa elimila de la pila dada todos los elementos que existan en modelo
{$INCLUDE/IntroProg/Estructu}

var Dada, Modelo, Aux:Pila;

Procedure Eliminar (Var Dada:Pila; Modelo:Pila);

Begin
    While not PilaVacia(Dada) and not PilaVacia(Modelo) do
       Begin
          While not PilaVacia(Dada) and not PilaVacia(Modelo) do
             Begin
                If (tope(Dada)) = (tope(Modelo)) then
                  Desapilar(Dada)
                Else 
                  Apilar(Aux, Desapilar(Dada));
             End;   
             While not PilaVacia(Aux) do
              Begin
                Apilar(Dada, Desapilar (Aux));
              End;       
              If not PilaVacia(Modelo) then
                Desapilar(Modelo);
       End;
End;

Begin
   ReadPila(Dada);
   ReadPila(Modelo);
   InicPila(Aux,' ');
   Eliminar (Dada, Modelo);
   WritePila(Dada);
   WritePila(Modelo);
End.