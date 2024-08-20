Program Ejercicio6;
//Este programa compara la cantidad de elementos entre dos filas y si son 
//iguales pasa el tope de pilaresultado a una pila verdadera sino a una pil falsa
{$INCLUDE/IntroProg/Estructu}
Var
 Origen1, Origen2, Descarte:Fila;
 Resultado, Verdadero, Falso:Pila;
 
Begin
  ReadFila(Origen1);
  ReadFila(Origen2);
  InicFila(Descarte,' ');
  InicPila(Resultado,'1');
  InicPila(Verdadero,' ');
  InicPila(Falso,' ');
  
  While (not FilaVacia(Origen1)) and (not FilaVacia(Origen2)) do 
    Begin
      Agregar(Descarte, Extraer(Origen1));
      Agregar(Descarte, Extraer(Origen2));
    End;
    
  If FilaVacia(Origen1) And FilaVacia(Origen2) then
      Apilar(Verdadero, Desapilar(Resultado))
  Else
      Apilar(Falso, Desapilar(Resultado));
    
Writeln('Las Filas son iguales, si verdadero = 1');      
WritePila(Verdadero);
Writeln('Las Filas son distintas, si falso = 1');
WritePila(Falso);


End.
      
      
      