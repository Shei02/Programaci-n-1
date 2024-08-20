Program Incognita;
{$INCLUDE/IntroProg/Estructu}
//lo que quiere cumplir este programa es que mientras que origen no este vacia y su tope sea igual a 2,
//apile en descarte los 2 y aux con 0, si esto no se cumple se apila aux con origen.
//luego pregunta si aux esta vacia y si no es asi, se apila origen con lo que tiene aux, que serian 0 en el lugar del 2.
Var
  Origen, Descarte, Aux:pila;
Begin
   ReadPila(Origen);
   InicPila(Aux,' ');
   InicPila(Descarte,' ');
   
   While not PilaVacia(Origen) do
     Begin
        If tope(Origen) = 2 then
          Begin
            Apilar(Descarte,Desapilar(Origen));
            Apilar(Aux, 0)
          End
        Else
            Apilar(Aux,Desapilar(Origen));
     End;
     
   While not PilaVacia(Aux) do
       Apilar(Origen, Desapilar(Aux));
      
      
WritePila(Origen);

End.