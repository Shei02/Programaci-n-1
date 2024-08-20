Program Ejercicio4;
//Este programa saca el ultimo elemento de una fila y lo pone en primer lugar
{$INCLUDE/IntroProg/Estructu}
Var
  Datos:Fila;
  Aux1, Aux2:Pila;

Begin
  ReadFila(Datos);
  InicPila(Aux2,' ');
  InicPila(Aux1,' ');
  
  While not FilaVacia(Datos) do
     Apilar(Aux1, Extraer(Datos));
     
  If not PilaVacia(Aux1) then
     Agregar(Datos, Desapilar(Aux1));
     
  While not PilaVacia(Aux1) do
      Apilar(Aux2, Desapilar(Aux1));
      
  While not PilaVacia(Aux2) do
      Agregar(Datos, Desapilar(Aux2));
      
Writeln('Asi quedaria la fila Datos con el ultimo elemento en primer lugar');
WriteFila(Datos);

End.