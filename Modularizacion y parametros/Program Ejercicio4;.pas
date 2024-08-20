Program Ejercicio4;
//Replateo de solucion, ejercicio 12 del practico 2
{$INCLUDE/IntroProg/Estructu}

Procedure IndicarParte (var Parte:Pila; Grande, AuxP, AuxG:Pila);
Begin
   While not PilaVacia(Parte) and not PilaVacia(Grande) do
     Begin
        If tope(Parte)=tope(Grande) then
          Begin
            Apilar(AuxP, Desapilar(Parte));
            Apilar(AuxG, Desapilar(Grande));
          End
        Else
          Begin
            While not PilaVacia(AuxP) do
               Apilar(Parte, Desapilar(Auxp));
               Apilar(AuxG, Desapilar(Grande));
          End;
     End;
End;
 
Var
   Parte, Grande, AuxP, AuxG:Pila;
Begin
  ReadPila(Parte);
  ReadPila(Grande);
  InicPila(AuxP,' ');
  InicPila(AuxG,' ');
  IndicarParte(Parte, Grande, AuxP, AuxG);
  If PilaVacia(Parte) then
      Writeln('La pila parte esta vacia')
  Else 
      Writeln('La pila parte no esta vacia');
End.    