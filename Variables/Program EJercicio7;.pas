Program EJercicio7;
//Dada una pila con elementos y una variable con una posision
//eliminar dicha posicion si se encuentra de la pila, si no el programa no hace nada
{$INCLUDE/IntroProg/Estructu}

Procedure EliminaPos(Elem:Integer; var Original:Pila);
Var
 Aux:Integer;
 Aux1, Descarte:Pila;
Begin
 Aux:=1;
 InicPila(Descarte, ' ');
 InicPila(Aux1,' ');
   While not PilaVacia(Original) do   //mientras que secuencia no este vacia se cumple el siguiente ciclo
        Begin
            If Aux=Elem then    //si aux es igual a la posicion que ingrese
            Begin
              Apilar(Descarte, Desapilar(Original));   //saco de secuencia los elementos y apilo en descarte
              Aux:=Aux+1;                             //y aux incremeta en 1
            End
            Else                                     //sino
             Begin                            
              Apilar(Aux1, Desapilar(Original));       //saco de secuencia y apilo en otra pila
              Aux:= Aux + 1;                           //y tmbn incremento aux en 1
             End;
        End;
        While not PilaVacia(Aux1) do               //si aux1 no esta vacia paso los elementos de aux1 a la pila secuencia
          Apilar(Original, Desapilar(Aux1));
        If PilaVacia(Descarte) then               //si descarte esta vacia quiere decir que la posicion no existe
          Writeln('Esta posicion no existe');
End;

var
  Elem:Integer;
  Secuencia:Pila;
Begin
  ReadPila(Secuencia);
  Write('Ingrese el valor de la posicion: ');
  Readln(Elem);
  EliminaPos(Elem, Secuencia);
  WritePila(Secuencia);
End.