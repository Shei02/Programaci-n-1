Program Ejercicio1;
//Programa: trabaja con un arreglo de enteros positivos que busca la menor secuencia en cuanto 
//a la sumatoria y ponerla al final del arreglo junto con los 0 que se encuentren a su izquierda
//si hay mas de dos secuencias menores se utiliza la primera(el arreglo siempre comienza con 0)

Const
    Inicio = 1;
    Fin = 100;
    Discernible = -1;

Type 
    Vector = Array [Inicio..Fin] of Integer;

Procedure Carga (var Arreglo:Vector; var Frontera:Integer);
var
    I, Dato:Integer;
Begin
    I:= Inicio;
    Dato:= 0;
    While (I< Fin) and (Dato <> Discernible) do 
    Begin
        Write('Ingrese Elementos en el arreglo: ');
        Readln(Dato);
        Arreglo[I]:=Dato;
        I += 1;
    End;
    Frontera:= I-2;
End;

Function Sumatoria (Arreglo:Vector; InicSec, FinSec:Integer):Integer;
var
    I, Contador:Integer;
Begin
    I:= Inicio;
    Contador:= 0;
    For I:= InicSec to FinSec do
        Contador += Arreglo[I];
        
    Sumatoria:= Contador;
End;

Procedure BuscaSecuencia(Arreglo:Vector; Frontera:Integer; var InicSec, FinSec:Integer);
var
    I,Min,Max,SecMenor,Suma:Integer;
Begin
    I:= Inicio;
    SecMenor:= 0;
    While (I< Frontera) do
    Begin
        Min:= I;
        While (I< Frontera) and (Arreglo[I] = 0) do
            I += 1;
        While (I< Frontera) and (Arreglo[I] <> 0) do
            I +=1;
        Max:= I-1;
        Suma:= Sumatoria(Arreglo, Min, Max);
        If (SecMenor = 0) then
        Begin
            SecMenor:= Suma;
            InicSec:= Min;
            FinSec:= Max;
        End
        Else 
            If (Suma < SecMenor) then
            Begin
                SecMenor:= Suma;
                InicSec:= Min;
                FinSec:= Max;
            End;
    End;
End;

Procedure Corrimiento(var Arreglo:Vector; InicSec, FinSec, Frontera:Integer);
var
    Auxiliar,I,J:Integer;
Begin
    For I:= FinSec+1 to Frontera do
    Begin
        Auxiliar:= Arreglo[I];
        For J:= I downto InicSec do
            Arreglo[J]:= Arreglo[J-1];
        Arreglo[J]:= Auxiliar;
        InicSec += 1;
    End;
End;

Procedure MostrarArreglo(Arreglo:Vector; Frontera:Integer);
Var
    I:Integer;
Begin
    For I:= Inicio to Frontera do
        Write(Arreglo[I], ' | ');
End;

Var
    Arreglo:Vector;
    Frontera, InicSec, FinSec, Suma:Integer;
Begin
    Frontera:= 0;
    InicSec:= 0;
    FinSec:= 0;
    Carga(Arreglo, Frontera);
    Suma:= Sumatoria(Arreglo, InicSec, FinSec);
    BuscaSecuencia(Arreglo, Frontera, InicSec, FinSec);
    Corrimiento(Arreglo, InicSec, FinSec, Frontera);
    MostrarArreglo(Arreglo, Frontera);
End.