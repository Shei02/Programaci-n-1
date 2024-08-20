Program Ejercicio5D;
//dada la pila DADA, devolver en pila ALREVES los elementos de dada invertidos en orden
{$INCLUDE/IntroProg/Estructu}

Procedure InversionOrden(var Alreves:Pila; Dada:Pila);
Begin
  While not PilaVacia(Dada) do
    Begin
      Apilar(Alreves, Desapilar(Dada));
    End;
    Writeln('Pila Invertida en orden');
    WritePila(Alreves);
End;

var
  Alreves, Dada:Pila;
  
Begin
 ReadPila(Dada);
 InicPila(Alreves,' ');
 InversionOrden(Alreves, Dada);
End.