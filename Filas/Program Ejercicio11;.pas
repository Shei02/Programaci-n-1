Program Ejercicio11;
//Este programa une dos pilas, y la que tiene menos elementos debe quedar abajo de la otra
//de tener la misma cantidad de elementos no importa cual queda abajo
{$INCLUDE/IntroProg/Estructu}
Var
  Uno, Dos, Aux1, Aux2, PilaFinal:Pila;
  
Begin
   ReadPila(Uno);
   ReadPila(Dos);
   InicPila(Aux1,' ');
   InicPila(Aux2,' ');
   InicPila(PilaFinal,' ');
   
   While not PilaVacia(Uno) and (not PilaVacia(Dos)) do
     Begin
       Apilar(Aux1, Desapilar (Uno));
       Apilar(Aux2, Desapilar (Dos));
     End;

     If not PilaVacia(Uno) and PilaVacia(Dos) then
       Begin
        While not PilaVacia(Aux2) do
          Apilar(PilaFinal, Desapilar(Aux2));
        While not PilaVacia(Uno) do
          Apilar(Aux1, Desapilar(Uno));
        While not PilaVacia(Aux1) do
          Apilar(PilaFinal, Desapilar(Aux1));
       End;
       
        If PilaVacia(Uno) and PilaVacia(Dos) then
         Begin
         While not PilaVacia(Aux1) and not PilaVacia(Aux2) do
           Begin
            Apilar(PilaFinal, Desapilar(Aux1));
            Apilar(PilaFinal, Desapilar(Aux2));
           End;
         End;
         
        If PilaVacia(Uno) and not PilaVacia(Dos) then
          Begin
          While not PilaVacia(Aux1) do
           Apilar(PilaFinal, Desapilar(Aux1));
          While not PilaVacia(Dos) do
           Apilar(Aux2, Desapilar(Dos));
          While not PilaVacia(Aux2) do
           Apilar(PilaFinal, Desapilar(Aux2));
          End;

WritePila(Uno);
WritePila(Dos);
WritePila(Aux1);
WritePila(Aux2);
WritePila(PilaFinal);
    
End.
       
       
       