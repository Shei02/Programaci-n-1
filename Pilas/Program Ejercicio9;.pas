Program Ejercicio9;
//Pasar la base de la pila Dada a tope dejando los otros elementos en su lugar
{$INCLUDE/IntroProg/Estructu}
Var
   Dada,AuxBase, Aux:Pila;
   
Begin
   ReadPila(Dada);
   InicPila(AuxBase,' ');
   InicPila(Aux,' ');
   
  While not PilaVacia(Dada) do
     Begin
     Apilar(Aux, Desapilar(Dada));
     End;
     
     Apilar(AuxBase, Desapilar(Aux));
    
   While not PilaVacia(Aux) do
      Begin
      Apilar(Dada, Desapilar(Aux));
      End;
      
      Apilar(Dada, Desapilar (AuxBase));
      
WritePila(Dada);
End.