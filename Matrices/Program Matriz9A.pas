Program Matriz9A
//Se tiene la matriz Temperatura que contiene las temperaturas mínima y 
//máxima que se registraron para cada día del 2018. 
//Esta matriz tiene las siguientes dimensiones: [1..12, 1..30, 1..2].
//Las filas se corresponden con los meses, las columnas con los días 
//(sólo se consideran meses de 30 días) y en la tercera dimensión se almacena
//la temperatura mínima (en la primera posición) y la máxima (en la segunda).
//Estas temperaturas mínimas y máximas se registran para cada día del año.
//Codificar un procedimiento ó función para cada una de las siguientes 
//actividades:
//a) Dada la matriz, mostrar los meses ordenados en forma creciente según 
//las temperaturas máximas. 

Uses Sysutils;
Const
    Inicio = 1;
    maxMes = 3;
    maxDia = 4;
    maxTemp = 2;

Type Mat = Array [Inicio..maxMes,Inicio..maxDia,Inicio..maxTemp] of Integer;

Procedure cargaMatriz (var Matriz:mat);
//Realiza la carga de la matriz 
var
    Fi,Co,Di:Integer;
Begin
    For Fi:= Inicio to maxMes do
        For Co:= Inicio to maxDia do 
            For Di:= Inicio to maxTemp do
                Begin
                    Matriz[Fi,Co,Di]:= Random(60) - 30;
                    If (Di = 2) then
                        While (Matriz[Fi,Co,Di] < Matriz[Fi,Co,Di-1]) do
                            Matriz[Fi,Co,Di]:= Random(60) - 30;
                End;
End;

Procedure Intercambio (var Matriz:mat; Elem1,Elem2:Integer);
//Ordena la segunda dimencion
var
    Di,Aux:Integer;
Begin
    For Di:= Inicio to maxTemp do
        Begin
            Aux:= Matriz[Elem1,Elem2,Di];
            Matriz[Elem1,Elem2,Di]:= Matriz[Elem1,Elem2+1,Di];
            Matriz[Elem1,Elem2+1,Di]:= Aux;
        End;
End;

Procedure maxTemperaturaBurbuja (var Matriz:Mat);
//Ordena la matriz en la segunda dimencion segun la temp de menor a mayor
var
    Fi,Co,J:Integer;
Begin
    For Fi:= Inicio to maxMes do
        For Co:= Inicio to maxDia do 
            For J:= Inicio to maxDia-1 do
                If (Matriz[Fi,J,maxTemp] > Matriz[Fi,J+1,maxTemp]) then
                    Intercambio(Matriz,Fi,J);
End;

Procedure Imprimir (Matriz:mat);
//Muestra la matriz
var
    Fi,Co,Di:Integer;
Begin
    Di:= Inicio;
    For Fi:= Inicio to maxMes do
        Begin
            For Co:= Inicio to maxDia do 
                Begin
                    Write('|');
                    Write(Matriz[Fi,Co,Di],  ','  , Matriz[Fi,Co,Di+1]);
                End;
                Writeln('|');
        End;
End;

//Programa Principal
var
    Temperatura:Mat;
Begin
    Randomize;
    cargaMatriz(Temperatura);
    Imprimir(Temperatura);
    maxTemperaturaBurbuja(Temperatura);
    Writeln;
    Imprimir(Temperatura);
End.