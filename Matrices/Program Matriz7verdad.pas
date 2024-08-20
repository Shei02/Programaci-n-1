Program Matriz7verdad
//Este programa ordena filas alfabéticamente como si fueran palabras
Const
    Inicio = 1;
    MaxFila = 6;
    MaxColumna = 6; 
    Nulo= 'b';

Type Mat = Array[Inicio..MaxFila, Inicio..MaxColumna] of Char;

Procedure CargaMatriz(var Matriz:Mat);
//Este procedimiento carga una matriz con caracteres aleatorios
var
    Fi,Co:Integer;
Begin
    Randomize;
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColumna do
            Matriz[Fi,Co]:= Chr(Random(26)+(97));
End;
    
Function FilaMenor(Matriz:Mat; Fila:Integer):Integer;
//Esta funcion detecta la fila menor alfabeticamente a partir de la fila pasada por parámetro
//Esta funcion se queda con la fila mas chica
var
    I,filaMenorActual,Columna:Integer;
Begin
    filaMenorActual:= Fila;
    For I:= (Fila+1) to maxFila do 
        Begin                               // voy por todas las filas
            Columna:= Inicio;
            While (Columna <= maxColumna) and (Matriz[I,Columna] = Matriz[filaMenorActual,Columna]) do
                Columna:= Columna+1;
            If (Columna <= maxColumna) and (Matriz[I,Columna] < Matriz[filaMenorActual,Columna]) then
                filaMenorActual:=I;
        End;
    FilaMenor:=filaMenorActual;
End;

Procedure IntercambioDeFilas(var Matriz:Mat; Fila:Integer);
//Este procedimiento ubica la fila menor en la primera posicion
var
    J,FM:Integer;
    Aux:Char;
Begin
    FM:=filaMenor(Matriz,Fila);
    For J:= Inicio to maxColumna do 
        Begin
            Aux:= Matriz[Fila,J];   
            Matriz[Fila,J]:= Matriz[FM,J]; 
            Matriz[FM,J]:= Aux;         
        End;
End;

Procedure OrdenaFilasAlfabeticamente(var Matriz:Mat);
//Este procedimiento repite el intercambio analizando todas las filas de arriba a abajo
var
    Fila:Integer;
Begin
    For Fila:= Inicio to maxFila do
        IntercambioDeFilas(Matriz,Fila);
End;

Procedure ImprimirMatriz (Matriz:Mat);
//Muestra la matriz final
Var
    I,J:Integer;
Begin
    For I:= Inicio to MaxFila do
        Begin
            For J:= Inicio to MaxColumna do
                Write(' | ', Matriz[I,J], ' | ');
                Writeln;
        End;
End;

var
    Matriz:Mat;
Begin
    CargaMatriz(Matriz);
    ImprimirMatriz(Matriz);
    Writeln();
    OrdenaFilasAlfabeticamente(Matriz);
    Writeln('La Matriz Ordenada Alfabeticamente Es: ');
    ImprimirMatriz(Matriz);    
End.