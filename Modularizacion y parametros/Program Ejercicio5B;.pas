Program Ejercicio5B;
//dado una pila DADA y otra Elem, determinar si el tope de ELEM esta en dada
//devolviendo el resultado en verdadero o falso segun corresponda
{$INCLUDE/IntroProg/Estructu}

Procedure TopeElem (Dada, Elem:Pila; var Modelo:Pila);
Begin
 While not PilaVacia(Dada) and PilaVacia(Modelo) do
  Begin
    If tope(Dada)=tope(Elem) then
       Apilar(Modelo,1)
    Else
     Begin
        Desapilar(Dada);
     End;
     If PilaVacia(Dada) then 
       Apilar(Modelo,2);
  End;
     If tope(Modelo)=1 then
       Begin
         Writeln('El tope SI esta en dada')
       End
     Else
        If tope(Modelo)=2 then
          Begin
            Writeln('El tope NO esta en dada')
          End;
End;
 
 var
    Dada, Elem, Modelo:Pila;
 Begin
  ReadPila(Dada);
  ReadPila(Elem);
  InicPila(Modelo,' ');
  TopeElem(Dada, Elem, Modelo);
End.