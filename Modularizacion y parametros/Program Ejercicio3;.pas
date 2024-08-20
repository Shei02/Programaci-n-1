Program Ejercicio3;
//Este programa intercala dos filas de manera creciente, mostrando en una fila final, la fila obtenida
{$INCLUDE/IntroProg/Estructu}

Procedure OrgFilas (var Resultado:Fila; Ordenada1, Ordenada2:Fila);
Begin
  While not FilaVacia(Ordenada1) and not FilaVacia(Ordenada2) do 
     Begin
        If Primero(Ordenada1)<Primero(Ordenada2) then
          Begin
             Agregar(Resultado, Extraer(Ordenada1));
          End
        Else
          Begin
            Agregar(Resultado, Extraer(Ordenada2));
          End;
     End;
     
            If FilaVacia(Ordenada1) then
              While not FilaVacia(Ordenada2) do 
                Begin
                   Agregar(Resultado, Extraer(Ordenada2));
                End
            Else
              While not FilaVacia(Ordenada1) do
                Agregar(Resultado, Extraer(Ordenada1));
End;

Var
   Ordenada1, Ordenada2, Resultado:Fila;
Begin
  ReadFila(Ordenada1);
  ReadFila(Ordenada2);
  InicFila(Resultado,' ');
  OrgFilas(Resultado, Ordenada1, Ordenada2);
  WriteFila(Resultado);
End.
  