Program Ejercicio3;
//este programa pasa el primer elemento de una fila a la ultima posicion
{$INCLUDE/IntroProg/Estructu}
Var
  Dada, Aux:Fila;
  
Begin
  ReadFila(Dada);
  InicFila(Aux,' ');
 
  If not FilaVacia(Dada) then
     Agregar(Aux,Extraer(Dada));
     
Writeln('Asi queda la pila sacando el primer elemento');     
WriteFila(Dada);
  
  If not FilaVacia(Aux) then
     Agregar(Dada,Extraer(Aux));
     
Writeln('Asi quedaria la Fila, el primero paso a ultimo');
WriteFila(Dada);

End.
  