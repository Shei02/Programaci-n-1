Program Ejercicio14;
//modificacion del ejercicio 9 para que ponga en primer lugar los iguales a modelo
//despues
{$INCLUDE/IntroProg/Estructu}
Var
  Origen, Modelo, Aux, Aux1:Fila;

Begin
   ReadFila(Origen);
   ReadFila(Modelo);
   InicFila(Aux,' ');
   InicFila(Aux1,' ');
   
   While not FilaVacia(Origen) do
     Begin
       If Primero(Origen)=Primero(Modelo) then
         Begin
           Agregar(Aux1, Extraer(Origen));
         End
       Else
         Begin
            Agregar(Aux, Extraer(Origen));
         End;
     End;
     
    While not FilaVacia(Aux1) do
      Begin
         Agregar(Origen, Extraer(Aux1));
      End;
    While not FilaVacia (Aux) do
      Begin
         Agregar(Origen, Extraer(Aux));
      End;
      
Writeln('Origen');
WriteFila(Origen);
    
End.