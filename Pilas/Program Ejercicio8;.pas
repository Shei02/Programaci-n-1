Program Ejercicio8;
{$INCLUDE/IntroProg/Estructu}
Var
  Origen, Destino, Aux:Pila;
Begin
   ReadPila(Origen);
   InicPila(Destino,' ');
   InicPila(Aux,' ');
   
While not PilaVacia(Origen) do
   Begin
      Apilar(Aux, Desapilar(Origen));
   End;
   
   While not PilaVacia(Aux) do
      Begin
         Apilar(Destino, Desapilar(Aux));
      End;

Writeln('La Pila quedaria');
WritePila(Destino);

End.  