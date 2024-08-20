Program Ejercicio5;
//este programa pasa sus elementos a otra fila hasta que encuentra un 0 o quede vacia 
{$INCLUDE/IntroProg/Estructu}
Var
  Origen, Destino:Fila;
  
Begin
  ReadFila(Origen);
  InicFila(Destino,' ');
  
  While not FilaVacia(Origen) and (Primero(Origen)<>0) do
     Agregar(Destino, Extraer(Origen));
     
Writeln('FILA ORIGEN');
WriteFila(Origen);
Writeln('FILA DESTINO');
WriteFila(Destino);

End.