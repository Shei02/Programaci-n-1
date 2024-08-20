Program Ejercicio8;
{$INCLUDE/IntroProg/Estructu}
Var
   Origen, Aux1, Aux2 :Pila;
Begin
   ReadPila(Origen);
   InicPila(Aux1,' ');
   InicPila(Aux2,' ');
   
   While not PilaVacia(Origen) do
       Begin 
       Apilar (Aux1, Desapilar(Origen));
       End;
   While not PilaVacia(Aux1) do
      Begin
      Apilar(Aux2, Desapilar(Aux1));
      End;
    While not PilaVacia(Aux2) do
       Begin
       Apilar(Origen,Desapilar (Aux2));
       End;
       
       
Writeln('La pila queda invertida');
WritePila(Origen);

End.