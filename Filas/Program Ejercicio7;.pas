Program Ejercicio7;
//este programa hace lo mismo que el anterior pero se le suma que ademas de tener
//la misma cantidad de elementos las filas deben tener sus elementos en el mismo orden
//si esto se cumple se pasa el valor de resultado a igual, sino es asi se pasa a falso.
{$INCLUDE/IntroProg/Estructu}
Var
  FilaA, FilaB, Descarte: Fila;
  Resultado, Igual, Distintas: Pila;
  
Begin
   ReadFila(FilaA);
   ReadFila(FilaB);
   InicPila(Resultado,'1');
   InicPila(Igual,' ');
   InicPila(Distintas,' ');
   
 
  While (Not FilaVacia(FilaA)) and (not FilaVacia(FilaB)) and (Primero(FilaA) = Primero(FilaB)) do
    Begin
      Agregar(Descarte, Extraer(FilaA));
      Agregar(Descarte, Extraer(FilaB));
    End;
    
 If FilaVacia(FilaA) and FilaVacia(FilaB) then
    Writeln('Las filas tenian la misma cantidad de elementos y el mismo orden');
    Apilar(Igual, Desapilar(Resultado));
    WritePila(Igual);
 If FilaVacia(FilaA) and not FilaVacia(FilaB) then
    Writeln('La fila B tiene mas elementos que la fila A');
    Apilar(Distintas, Desapilar(Resultado));
    WritePila(Distintas);
 If not FilaVacia(FilaA) and FilaVacia(FilaB) then
    Writeln('La fila A tiene mas elementos que la fila B');
    Apilar(Distintas, Desapilar(Resultado));
    WritePila(Distintas);
 If not FilaVacia(FilaA) and not FilaVacia(FilaB) then
    Writeln('Las filas tenian los elementos en distintos orden');
    Apilar(Distintas, Desapilar(Resultado));
    
End.