Program Ejercicio5;
//Este programa compara un numero con los elementos de una pila, y devuelve un booleano segun corresponda
{$INCLUDE/IntroProg/Estructu}

Function Compara(Dada:Pila; Num:Integer):Boolean;
Begin
  While not PilaVacia(Dada) and (Tope(Dada)<>Num) do
   Begin
      Desapilar(Dada);
   End;
   If PilaVacia(Dada) then
      Compara:=False
   Else
      Compara:= True;
End;

var
 Origen:Pila;
 Elem:Integer;
Begin
  Write('Ingrese elementos en la pila: ');
  ReadPila(Origen);
  Write('Ingrese un valor a Elem: ');
  Readln(Elem);
  If Compara(Origen, Elem)=True then
    Write('Elem SI esta en la pila')
  Else
    Write('Elem NO esta en la pila');
End.