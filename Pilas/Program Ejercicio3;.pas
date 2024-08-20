Program Ejercicio3;
//3.1 condicion del ciclo es que mientras pila1 no este vacia, apilo pila2 con lo que tengo en descarte
//3.2 el ciclo no finaliza nunca porque dice que mientras pila1 este vacia apile pila2 y despile descarte
//3.3 modificacion del codigo
//3.4 el codigo de este programa carga tres pilas y luego pasa los elementos de la Pila1 hasta 
//quedar vacia a la pila2
//3.5 se asegura que un programa llega a un corte dentro del ciclo de repeticion cuando dicha
//condicion deja de ser verdadera
//3.6 si es posible usando un IF NOT pilavacia(pila1) then
                               //apilar (pila2, desapilar(pila1));
//por cada elemento de pila1 hasta que quede vacia                               
{$INCLUDE/IntroProg/Estructu}
Var
   Pila1,Pila2, Descarte:pila;
Begin 
   ReadPila(Pila1);
   ReadPila(Pila2);
   ReadPila(Descarte);
   
   While not PilaVacia(Pila1) do
   Begin
      Apilar(Pila2, Desapilar (Pila1));
   End;
   
   Writeln('Valores de pila1');
   WritePila(Pila1);
   Writeln('Valores de pila2');
   WritePila(Pila2);
   Writeln('Valores de descarte');
   WritePila(Descarte);
   
End.
   