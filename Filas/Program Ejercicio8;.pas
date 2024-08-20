Program Ejercicio8;
//est programa inserta el tope de una pila aux, dentro de una fila ordenada de 
//menor a mayor de tal forma que siga ordenada en ese orden.
{$INCLUDE/IntroProg/Estructu}
Var
  Origen, Origen1:Fila;
  Aux:Pila;
  
Begin
   ReadFila(Origen);
   ReadPila(Aux);
   InicFila(Origen1,' ');
   
   While not FilaVacia(Origen) do
     Begin
       If not PilaVacia(Aux) then
         Begin
           If (tope(Aux)>Primero(Origen)) then
             Agregar(Origen1, Extraer(Origen))
           Else
             Agregar(Origen1, Desapilar(Aux));
         End
       Else
         Agregar(Origen1, Extraer(Origen));
     End;
     
WriteFila(Origen1);
End.