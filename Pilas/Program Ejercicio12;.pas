Program Ejercicio12;
//Este programa lo que hace es reemplazar los elementos de Origen
//que sean iguales a tope de modelo por el tope que tiene reemplazo

{$INCLUDE/IntroProg/Estructu}
Var
 Origen, Modelo, Reemplazo, Aux:Pila;
 
Begin
   ReadPila(Origen);
   InicPila(Modelo,'7');
   InicPila(Reemplazo,'10');
   InicPila(Aux,' ');


    While not PilaVacia(Origen) do
       Begin  
         If tope(Origen)=tope(Modelo) then
            Begin
                Desapilar(Origen);
                Apilar(Aux, tope(Reemplazo));
            End
         Else
            Apilar(Aux, Desapilar(Origen));
       End;
       
    While not PilaVacia(Aux) do
            Apilar(Origen, Desapilar(Aux));
          If not PilaVacia(Origen) then
             Begin
                 WritePila(Origen);
             End;
             
             
End.