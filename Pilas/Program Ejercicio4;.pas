Program Ejercicio4;
{$INCLUDE/IntroProg/Estructu}
Var
  Dada, Distintos, Aux:Pila;
Begin
  ReadPila(Dada);
  InicPila(Distintos,' ');
  
  While not PilaVacia(Dada) do 
  Begin 
     if tope(Dada)=8 then
        Apilar(Aux, Desapilar (Dada))
     Else
        Apilar(Distintos, Desapilar (Dada));
  End;
  
  While not PilaVacia (Aux) do
        Apilar(Dada, Desapilar(Aux));
        
WritePila(Dada);
WritePila(Distintos);

End.