Program Ejercicio5C;
//dada dos pilas, concatenar en una nueva pila
{$INCLUDE/IntroProg/Estructu}

Procedure Concatenar(Pila1, Pila2, Pase:Pila; var PilaF:Pila);
Begin
  While not PilaVacia(Pila1) do 
    Begin
      Apilar(Pase, Desapilar(Pila1));
    End;
  While not PilaVacia(Pila2) do
    Begin
      Apilar(Pase, Desapilar(Pila2));
    End;
  While not PilaVacia(Pase) do
    Begin
      Apilar(PilaF, Desapilar(Pase));
    End;
    WritePila(PilaF);
End;

var
   Pila1,Pila2,Pase,PilaF:Pila;
   
Begin
  ReadPila(Pila1);
  ReadPila(Pila2);
  InicPila(Pase,' ');
  InicPila(PilaF,' ');
  Concatenar(Pila1, Pila2, Pase, PilaF);
End.