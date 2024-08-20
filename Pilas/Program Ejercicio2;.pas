Program Ejercicio2;
//2.a ingreso 6 10 19 quedaria, 6 y 10 en la Pila1 y 19 en OtroResultado y Resultado queda vacia
//2.b ingreso 6 10 8 quedaria, 6 y 10 en Pila1 y 8 en Resultado y OtroResultado queda vacia
//2.1 Quedaria 6 en Pila1, 19 en Resultado y 10 en OtroResultado
//2.1 Quedaria 6 en Pila1, 8 en Resultado y 10 en OtroResultado
//2.2 No cumplen la misma tarea las porciones de codigo porque una ejecuta una condicion
// y la otra ejecuta sin condicion, lo que hace el if es fijarse si los numeros son menor que 10
//los apila en una pila y si es falso los apila en otra.
{$INCLUDE/IntroProg/Estructu}
Var
   Pila1, Resultado, OtroResultado: pila;
Begin
   ReadPila(Pila1);
   InicPila(Resultado,'');
   InicPila(OtroResultado,'');
   
   
     Apilar(Resultado, Desapilar (Pila1));
     Apilar(OtroResultado, Desapilar (Pila1));
     
    WritePila(Pila1);
    WritePila(Resultado);
    WritePila(OtroResultado);

End.