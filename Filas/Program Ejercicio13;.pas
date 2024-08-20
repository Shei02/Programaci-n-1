Program Ejercicio13;
//este programa imprime si una fila esta ordenada de menor a mayor 
{$INCLUDE/IntroProg/Estructu}
Var
  AtencionClientes, Aux: Fila;
  Aux1:Pila;
  
Begin
  ReadFila(AtencionClientes);
  InicFila(Aux,' ');
  InicPila(Aux1,' ');
  
  Agregar(Aux, Extraer(AtencionClientes));
  
  
  While not FilaVacia(AtencionClientes) and PilaVacia(Aux1) do
   Begin
     If Primero(Aux)<=Primero(AtencionClientes) then
       Begin
         Agregar(Aux, Extraer(AtencionClientes));
       End
     Else
       Begin
         Apilar(Aux1,1);
       End;
   End;
   
   If PilaVacia(Aux1) then 
     Begin
       While not FilaVacia(Aux) do
         Begin
           Agregar(AtencionClientes, Extraer(Aux));
         End;
         Writeln('La fila estaba ordenada');
         WriteFila(AtencionClientes);
     End
     Else
       Begin
         While not FilaVacia(AtencionClientes) do
           Begin 
              Agregar(Aux, Extraer(AtencionClientes));
           End;
           While not FilaVacia(Aux) do
              Agregar(AtencionClientes, Extraer(Aux));
              
           Writeln('La fila no estaba ordenada');
           WriteFila(AtencionClientes);
       End;
       
End.