Program Ejercicio9;
//este programa compara si los elementos de una pila son igual a un unico 
//elemento de otra, modifica la fila inicial agregando el elemento de la otra en primer lugar.
{$INCLUDE/IntroProg/Estructu}
Var
 Origen, Modelo, Descarte:Fila;
 
Begin
   ReadFila(Origen);
   ReadFila(Modelo);
   InicFila(Descarte,' ');
   
   While not FilaVacia(Origen) do
     Begin
        If Primero(Origen)=Primero(Modelo) then
           Extraer(Origen)
        Else
           Agregar(Descarte, Extraer(Origen));
     End;
     
       Agregar(Origen, Extraer(Modelo));
       While not FilaVacia(Descarte) do
           Begin
              Agregar(Origen, Extraer(Descarte));
           End;
       
WriteFila(Origen);

End.
 