Program Ejecicio1;
//este programa pasa los elementos de una fila a otra fila
{$INCLUDE/IntroProg/Estructu}
Var
   Origen, Destino:fila;
Begin
   ReadFila(Origen);
   InicFila(Destino,' ');
   
   While not FilaVacia(Origen) do
     Agregar(Destino, Extraer (Origen));


Writeln('Esta es la fila Origen');
WriteFila(Origen);
Writeln('Esta es la fila Destino');
WriteFila(Destino);
End.