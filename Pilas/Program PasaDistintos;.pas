Program PasaDistintos;
//Este Programa Carga por teclado la pila Origen y pasa a la pila distinto todos
//aquellos elementos que preceden al valor 5 
//5.a No, no resuelve el problema planteado
//5.b Los errores que se ven son que la iteracion y la seleccion estan mal escritas, despues que 
//necesitamos una pila aux para poner los iguales a 5, otro error es que no muestra al final como quedan las pilas
//5.c asi quedaria el programa resolviendo lo que se pide
//5.d las componnetes del programa son las sentencias, la iteracion y las selecciones
{$INCLUDE/IntroProg/Estructu}
Var 
  Origen, Distinto: Pila;
Begin
  ReadPila(Origen);
  InicPila(Distinto,' ');
  
  
  While not (PilaVacia(Origen)) and (tope(Origen) <> 5) do
           Apilar (Distinto, Desapilar (Origen));
           
     Writeln('Valores iguales que 5');
     WritePila(Origen);
     Writeln('Valores distintos que 5');
     WritePila(Distinto);
End.  