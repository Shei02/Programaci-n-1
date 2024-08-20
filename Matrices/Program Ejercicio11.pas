Program Ejercicio11
//Este programa dada una matriz, reemplaza por 0 los numeros consecutivos que se 
//repitan mas de una ves en las columna, luego desplaza todos los 0 hacia al final de
//las columnas e intercambia las columnas ordenandolas de mayor a menor segun su
//cantidad de ceros 

Uses Sysutils;
Const 
    Inicio = 1;
    maxFila = 6;
    maxCol = 5;
    
Type Mat = Array [Inicio..maxFila, Inicio..maxCol] of Integer;

Procedure CargaMatriz (Var Matriz:Mat);
//Realiza la carga de la matriz
Var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        For Co:= Inicio to maxCol do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Procedure poneCeros (var Matriz:Mat; Co:Integer);
//Pisa los elementos repetidos consecutivos poniendo un 0
Var
    Fi:Integer;
Begin
    For Fi:= Inicio to maxFila-1 do
        If (Matriz[Fi,Co] = Matriz[Fi+1,Co]) then
            Matriz[Fi,Co]:= 0;
End;

Procedure desplazarCeros (var Matriz:Mat; Co:Integer);
//Modifica la matriz dejando todos los 0 de las columnas al final de cada una de ellas
var
    Fi,I,Aux,Contador:Integer;
Begin
    For Fi:= Inicio to maxFila do
        Begin
            Contador:= maxFila-1;
            While (Matriz[Fi,Co] = 0) and (Contador >= 0) do 
                Begin
                    Aux:= Matriz[Fi,Co];
                    For I:= Fi to maxFila-1 do
                        Matriz[I,Co]:= Matriz[I+1,Co];
                    Matriz[maxFila,Co]:= Aux;
                    Contador -= 1;
                End;
        End;
End;

Procedure recorreYReemplaza (var Matriz:Mat);
//Este procedimiento recorre la columna y pisa los numeros repetidos consecutivos por 0
var 
    Co:Integer;
Begin
    For Co:= Inicio to maxCol do
        Begin
            poneCeros(Matriz,Co);
            desplazarCeros(Matriz,Co);
        End;
End;

Function cuentaCeros (Matriz:Mat; Co:Integer):Integer;
//Cuenta la cantidad de ceros de una columna;
var
    Fi,Cant:Integer;
Begin
    Cant:= 0;
    For Fi:= Inicio to maxFila do
        If (Matriz[Fi,Co] = 0) then
            Cant += 1;
    cuentaCeros:= Cant;
End;

Function columnaMenor (Matriz:Mat; Columna:Integer):Integer;
//Esta funcion se queda con la columna menor en cuanto la cantidad de ceros
var 
    Co,coMenorActual,Aux,Fila,colum:Integer;
Begin  
    Aux:= 0;
    For Co:= Columna to maxCol do 
        Begin                               
            Fila:= Inicio;
            coMenorActual:= cuentaCeros(Matriz,Co);
            If (Fila <= maxFila) and (Aux < coMenorActual) then
                Begin
                    Aux:= coMenorActual;
                    colum:= Co;
                End;
        End;
    columnaMenor:= colum;
End;

Procedure IntercambioColumnas(var Matriz:Mat; Col,Colum:Integer);
//Ubica la columna con mayor cantidad de 0 al principio
var 
    Fi,Aux:Integer;
Begin
    For Fi:= Inicio to maxFila do
        Begin   
            Aux:= Matriz[Fi,Col];
            Matriz[Fi,Col]:= Matriz[Fi,Colum];
            Matriz[Fi,Colum]:= Aux;
        End;
End;

Procedure Ordenar (var Matriz:Mat);
//devuelve la matriz como debe quedar ordenada finalmente
var
    Fi,CM,Co:Integer;
Begin
    For Co:= Inicio to maxCol do
        Begin
            CM:= columnaMenor(Matriz,Co);
            If (CM <> Co) then
                intercambioColumnas(Matriz,Co,CM);
        End;
End;

Procedure Imprimir (Matriz:Mat);
//Muestra la matriz
var 
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        Begin
            For Co:= Inicio to maxCol do 
                Write('|', Matriz[Fi,Co], '|');
                Writeln;
        End;
End;

//Programa Principal
Var
    matNum:Mat;
Begin
    CargaMatriz(matNum);
    Imprimir(matNum);
    recorreYReemplaza(matNum);
    Writeln('La matriz con los numeros consecutivos reemplazados y desplazados es: ');
    Imprimir(matNum);
    ordenar(matNum);
    Writeln('Matriz final: ');
    Imprimir(matNum);
End.