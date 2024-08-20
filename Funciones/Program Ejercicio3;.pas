Program Ejercicio3;
//Este programa realiza la suma de todos los elementos de una pila
{$INCLUDE/IntroProg/Estructu}

Function Suma(Dada:Pila):Integer;
var
 SumaT:Integer;
Begin
  SumaT:=0;
  While not PilaVacia(Dada) do
    Begin
     SumaT:= SumaT + Tope(Dada);
     Desapilar(Dada);
    End;
    Suma:=SumaT;
End;

Var
 Origen:Pila;
Begin
 Write('Ingrese elementos en la pila: ');
 ReadPila(Origen);
 Write('La suma de los elementos de la pila es: ', Suma(Origen));
End.