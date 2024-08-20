Program Ejercicio11;
{$INCLUDE/IntroProg/Estructu}
Var
  Pozo, Jugador1, Jugador2:Pila;
Begin
   ReadPila(Pozo);
   InicPila(Jugador1,' ');
   InicPila(Jugador2,' ');
   
   While not PilaVacia(Pozo) do  
     Begin
           Apilar(Jugador1, Desapilar(Pozo));
        If not PilaVacia(Pozo) then
           Apilar(Jugador2, Desapilar(Pozo));
     End;
  
   WritePila(Pozo);
   WritePila(Jugador1);
   WritePila(Jugador2);
  
End.     
     