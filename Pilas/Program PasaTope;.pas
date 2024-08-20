Program PasaTope;
{$INCLUDE/IntroProg/Estructu}
//Dada una pila pasar el Tope a su ultima posicion, el resto queda igual
Var
   Dada, AuxTope, Aux:pila;
Begin 
   ReadPila(Dada);
   InicPila(AuxTope,' ');
   InicPila(Aux,' ');
   
   Apilar(AuxTope, Desapilar (Dada));
   
   While not PilaVacia(Dada) do
   Begin
      Apilar(Aux, Desapilar (Dada));
   End;
   
   Apilar(Dada, Desapilar(AuxTope));
   
   While not PilaVacia(Aux) do
   Begin
      Apilar(Dada , Desapilar(Aux));
   End;
   
   Writeln('Resultado Final');    
   WritePila(Dada);
End.