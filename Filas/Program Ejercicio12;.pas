Program Ejercicio12;
//este programa compara los elementos de una pila, con otra de forma tal
//que si los elementos de una estan dentro de la otra y en el mismo orden, 
//la pila parte quedara vacia.
{$INCLUDE/IntroProg/Estructu}
Var
  Parte, Grande, AuxP, AuxG:Pila;
  
  
Begin
  ReadPila(Parte);
  ReadPila(Grande);
  InicPila(AuxP,' ');
  InicPila(AuxG,' ');
  
  While not PilaVacia(Grande) and not (PilaVacia(Parte)) do
    Begin
       If tope(Grande)=tope(Parte) then
        Begin
          Apilar(AuxP, Desapilar(Parte));
          Apilar(AuxG, Desapilar(Grande));
        End
    
       Else 
         Begin
           While not PilaVacia(AuxP) do
             Apilar(Parte, Desapilar(AuxP));
             Apilar(AuxG, Desapilar(Grande));
         End;
    End;     
    
       If PilaVacia(Parte) then
           Writeln('Parte quedo vacia');
           WritePila(Parte);
          
End.
          
          
          
    