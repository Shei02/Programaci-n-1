Program Ejercicio7;
//No, no funciona si dada esta vacia
{$INCLUDE/IntroProg/Estructu}
Var
  Dada, Limite, Mayores, Menores:pila;
Begin
  InicPila(Limite,'2');
  ReadPila(Dada);
  InicPila(Mayores,' ');
  InicPila(Menores,' ');

While not PilaVacia(Dada) do
  If tope(Dada)>=2 then
     Apilar(Mayores, Desapilar (Dada))
  Else
     Apilar(Menores, Desapilar (Dada));

Writeln('Lista de Mayores');
WritePila(Mayores);
Writeln('Lista de Menores');
WritePila(Menores);

End.