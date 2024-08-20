Program Ejercicio4;
//Este Programa de una pila calcula el promedio de sus elementos
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

Function Cuenta(Dada:Pila):Integer;
var
  Pos, Cant:Integer;
Begin
 Cant:=0;
 Pos:= 1;
  While not PilaVacia(Dada) do
    Begin
      Cant:= Cant + Pos;
      Desapilar(Dada);
    End;
    Cuenta:=Cant;
End;

Function Promedio(Dada:Pila):Real;
Begin
  If not PilaVacia(Dada) then
    Promedio:= Suma(Dada) / Cuenta(Dada)
  Else 
    Promedio:=0;
End;

var
 Dada:Pila;
Begin
    Write('Ingrese los elementos en la pila: ');
    ReadPila(Dada);
    Write('El Promedio de la pila es: ', Promedio(Dada):0:2);
End.