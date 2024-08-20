Program Ejercicio1;
//RESPUESTA 1.1, Si importa el orden de las sentencias escritas porque si no cumplieran un orden, pasaria en este 
//caso por ejemplo que primero complete la pila CJTO2, en lugar de lo que nos esta 
//pidiendo el programa
//RESPUESTA 1.2, No funciona si Dada tiene menos de 3 elementos porque dentro del if tengo para cumplir
//tres sentencias una con cada elemento, por lo tanto al tener dos no se cumple el if
{$INCLUDE/IntroProg/Estructu}
Var
   Dada,CJTO1,CJTO2:pila;
Begin
   ReadPila(Dada);
   InicPila(CJTO1,' ');
   InicPila(CJTO2,' ');

   If not PilaVacia(Dada) then
      Apilar(CJTO1, Desapilar(Dada));
   If not PilaVacia(Dada) then
      Apilar(CJTO1, Desapilar(Dada));
   If not PilaVacia(Dada) then
      Apilar(CJTO2, Desapilar(Dada));
    
    
    WritePila(Dada);
    WritePila(CJTO1);
    WritePila(CJTO2);
End.