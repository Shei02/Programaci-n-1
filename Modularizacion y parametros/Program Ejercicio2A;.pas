Program Ejercicio2A;
//Este programa elemina el tope de modelo con procedimeintos. Modificacion del ejer.10 del prctico 1
{$INCLUDE/IntroProg/Estructu}

Procedure Eliminar (Var Dada:Pila; Modelo, Aux:Pila);

Begin
 While not PilaVacia(Dada) do
    Begin
      If (tope(Dada)) = (tope(Modelo)) then
         Desapilar(Dada)
      Else
         Apilar(Aux, Desapilar(Dada));
    End;
    
    While not PilaVacia(Aux) do
       Apilar(Dada,Desapilar(Aux));
    
End;

Var 
   Dada, Aux, Modelo:Pila;
   
Begin
   ReadPila(Dada);
   ReadPila(Modelo);
   InicPila(Aux,' ');
   Eliminar(Dada, Modelo, Aux);
   WritePila(Dada);
   WritePila(Modelo);
End.