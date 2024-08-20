Program Ejercicio10;
//este programa pasa el primer elemento detras de un elemento de valor 12
//en la misma fila, de no haber un valor 12, deja la fila como estaba.
{$INCLUDE/IntroProg/Estructu}
Var
  Origen, Aux, Aux1:Fila;
Begin
   ReadFila(Origen);
   InicFila(Aux,' ');
   InicFila(Aux1,' ');
   
   If Primero(Origen)<>12 then
      Agregar(Aux, Extraer(Origen));
   
   While not FilaVacia(Origen) do
       If Primero(Origen)=12 then
         Begin
          Agregar(Aux1, Extraer(Origen));
          Agregar(Aux1, Extraer(Aux))
         End
       Else
          Agregar(Aux1, Extraer(Origen));
          
  While not FilaVacia(Aux1) do         
   Agregar(Origen, Extraer(Aux1));
   WriteFila(Origen);
   
End.
        
      
