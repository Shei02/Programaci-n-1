Program Ejercicio5A;
//compara el tamaño de dos pilas, devolviendo el resultado en igual , mayor, menor segun corresponda
{$INCLUDE/IntroProg/Estructu}

Procedure ComparaTam(Origen1,Origen2, Aux:Pila; var Igual:Pila; var Mayor:Pila; var Menor:Pila);
Begin
  While not PilaVacia(Origen1) and not PilaVacia(Origen2) do
    Begin
      Apilar(Aux, Desapilar(Origen1));
      Apilar(Aux, Desapilar(Origen2));
       If PilaVacia(Origen1) and not PilaVacia(Origen2) then
         Begin
           Apilar(Menor,1);
           Apilar(Mayor,2);
         End
       Else
         If not PilaVacia(Origen1) and PilaVacia(Origen2) then
          Begin
            Apilar(Menor,2);
            Apilar(Mayor,1);
          End;
    End;
      If PilaVacia(Menor) then
       Apilar(Igual,1);
End;

Procedure MostC(Igual, Mayor, Menor:Pila);
Begin
  If PilaVacia(Igual) then
    Begin
      Writeln('Pila Mayor');
      WritePila(Mayor);
      Writeln('Pila Menor');
      WritePila(Menor);
    End
  Else
    Writeln('Las dos pilas son iguales');
End;

Var
  Origen1,Origen2,Aux,Igual,Mayor,Menor:Pila;

Begin
  ReadPila(Origen1);
  ReadPila(Origen2);
  InicPila(Aux,' ');
  InicPila(Igual,' ');
  InicPila(Mayor,' ');
  InicPila(Menor,' ');
  ComparaTam(Origen1, Origen2, Aux, Igual, Mayor, Menor);
  MostC(Igual, Mayor, Menor);
 End.