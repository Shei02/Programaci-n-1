Program Ejercicio2;
//este programa invierte los elementos dentro de la fila dada
{$INCLUDE/IntroProg/Estructu}
Var
 Dada:Fila;
 Aux:Pila;

Begin
   ReadFila(Dada);
   InicPila(Aux,' ');
   
   While not FilaVacia(Dada) do
      Apilar(Aux, Extraer(Dada));
   While not PilaVacia(Aux) do
      Agregar(Dada, Desapilar(Aux));
      
Writeln('Esta es la fila invertida');
WriteFila(Dada);

End.