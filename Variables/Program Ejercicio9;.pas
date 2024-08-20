Program Ejercicio9;
//Este programa calcula la suma de un primer elemento, luego la suma de ese mas pos siiguiente y asi
//Mostrando en una pila resultado el calculo de los mismos
{$INCLUDE/IntroProg/Estructu}

Procedure Suma(Numeros:Fila; var Resultado:Pila);
var 
 Descarte, Aux, Aux1:Pila;
 Valor: Integer;
Begin
    Valor:= 0;
    While not FilaVacia(Numeros) do
        Begin
            Valor:= Valor + Primero(Numeros);
            Apilar(Descarte, Extraer(Numeros));
            Apilar(Aux1, Valor);
            Apilar(Aux, Valor);
        End;
    While not PilaVacia(Aux1) do
        Apilar(Resultado, Desapilar(Aux1));
End;

Var
  Origen:Fila;
  Resultado:Pila;
Begin
    InicPila(Resultado,' ');
    Write('Ingrese elementos en la fila: ');
    ReadFila(Origen);
    Suma(Origen, Resultado);
    Writeln('Resultado de la sumatoria: ');
    WritePila(Resultado);
End.