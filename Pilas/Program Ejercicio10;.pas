Program Ejercicio10;
{$INCLUDE/IntroProg/Estructu}
Var
   Dada, Modelo, Aux:Pila;
Begin
   ReadPila(Dada);
   ReadPila(Modelo);
   InicPila(Aux,' ');
   
   While not PilaVacia(Dada) do
   Begin
     If tope(Dada) = tope(Modelo) then
       Desapilar(Dada)
     Else
       Apilar(Aux, Desapilar(Dada));
   End;
   
   While not PilaVacia(Aux) do
      Apilar(Dada, Desapilar(Aux));
   
WritePila(Dada);
WritePila(Modelo);

End.