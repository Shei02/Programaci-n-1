Program Ejercicio13;
//determina si la cantidad de elementos de dada son par o impar
{$INCLUDE/IntroProg/Estructu}
Var
  Dada, Par, Impar, Aux,  Aux1, Aux2:Pila;
Begin
  ReadPila(Dada);
  InicPila(Aux,'1');
  InicPila(Aux1,'');
  InicPila(Aux2,' ');
  InicPila(Par,' ');
  InicPila(Impar,' ');
  
  While not PilaVacia(Dada) do
    Begin
        Apilar(Aux1, Desapilar(Dada));
                If not PilaVacia(Dada) then    //Significa que si esta vacia es impar
                   Apilar(Aux2, Desapilar(Dada))
                Else
                 Begin
                   Apilar(Impar, Desapilar(Aux));
                   Writeln('Impar');
                 End;
    End;
    
    If PilaVacia(Impar) then //Significa que no detecte elementos impar      
      Begin 
         Apilar(Par, Desapilar(Aux));
         Writeln('Par');
      End;
      
  
End.            