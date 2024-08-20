Program Matriz9B
//Se tiene la matriz Temperatura que contiene las temperaturas mínima y 
//máxima que se registraron para cada día del 2018. 
//Esta matriz tiene las siguientes dimensiones: [1..12, 1..30, 1..2].
//Las filas se corresponden con los meses, las columnas con los días 
//(sólo se consideran meses de 30 días) y en la tercera dimensión se almacena
//la temperatura mínima (en la primera posición) y la máxima (en la segunda).
//Estas temperaturas mínimas y máximas se registran para cada día del año.
//Codificar un procedimiento ó función para cada una de las siguientes 
//actividades:
//B)Dada la matriz Temperatura, genere el arreglo BajoCero de 12 elementos.
//En cada componente se debe almacenar un valor True si en ese mes hubo alguna 
//temperatura bajo cero y FALSE en caso contrario

Uses Sysutils;
Const
    Inicio = 1;
    maxMes = 12;
    maxDia = 30;
    maxTemp = 2;
    
Type Mat = Array [Inicio..maxMes,Inicio..maxDia,Inicio..maxTemp] of Integer;
     arr = Array [Inicio..maxMes] of Boolean;

Procedure cargaMatriz (var Matriz:mat);
//Realiza la carga de la matriz 
var
    Fi,Co,Di:Integer;
Begin
    For Fi:= Inicio to maxMes do
        For Co:= Inicio to maxDia do 
            For Di:= Inicio to maxTemp do
                Begin
                    Matriz[Fi,Co,Di]:= Random(60) - 10;
                    If (Di = 2) then
                        While (Matriz[Fi,Co,Di] < Matriz[Fi,Co,Di-1]) do
                            Matriz[Fi,Co,Di]:= Random(60) - 10;
                End;
End;

Function bajoCero (Matriz:mat; Mes:Integer):Boolean;
//devuelve verdadero, si la temp fue baja o falso, si la temp fue alta, en un mes dado
var
    Guarda:Boolean;
    Di,Co:Integer;
Begin
    Di:= Inicio;
    Guarda:= False;
    For Co:= Inicio to maxDia do
        If (Matriz[Mes,Co,Di] < 0) then
            Guarda:= True;
            
    bajoCero:= Guarda;
End;

Procedure cargaArr (var Arreglo:arr; Matriz:mat);
var
    Fi:Integer;
Begin
    For Fi:= Inicio to maxMes do
        Arreglo[Fi]:= bajoCero(Matriz,Fi);
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

Procedure ImprimirArr (arreglo:Arr);
//muestra el arreglo
var
    I:Integer;
Begin
    For I:= Inicio to maxMes do
        Write(Arreglo[I], '|');
End;

//Programa Principal
var
    Temperatura:Mat;
    Arreglo:Arr;
Begin
    Randomize;
    cargaMatriz(Temperatura);
    Imprimir(Temperatura);
    cargaArr(Arreglo,Temperatura);
    ImprimirArr(Arreglo)
End.