Program Matriz1
//Definir una matriz de números enteros que contenga a lo sumo 5 columnas y 5 filas. Realizar un
//procedimiento que posibilite el ingreso de datos para la misma
Uses Sysutils;
Const 
    Inicio = 1;
    MaxFila = 5;
    MaxCol = 5;

Type
    Matriz = Array [Inicio..MaxFila, Inicio..MaxCol] of Integer;
    
Procedure CargaMatriz(var Mat:Matriz);
//Realiza la carga de la matriz
var
    Fi, Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxCol do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Mat[Fi,Co]);
            End;
End;
    
Procedure ImprimirMatriz (Mat:Matriz);
//Muestra la matriz final
Var
    I, J:Integer;
Begin
    For I:= Inicio to MaxFila do
    Begin
        For J:= Inicio to MaxCol do
            Write(' | ', Mat[I,J], ' | ');
            Writeln;
    End;
End;

//Programa Principal
var
    Mat:Matriz;
Begin
    CargaMatriz(Mat);
    ImprimirMatriz(Mat);
End.Program MatrizUno;
//Definir una matriz de números enteros que contenga a lo sumo 5 columnas y 5 filas. Realizar un
//procedimiento que posibilite el ingreso de datos para la misma
Uses Sysutils;
Const 
    Inicio = 1;
    MaxFila = 5;
    MaxCol = 5;

Type
    Matriz = Array [Inicio..MaxFila, Inicio..MaxCol] of Integer;
    
Procedure CargaMatriz(var Mat:Matriz);
//Realiza la carga de la matriz
var
    Fi, Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxCol do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Mat[Fi,Co]);
            End;
End;
    
Procedure ImprimirMatriz (Mat:Matriz);
//Muestra la matriz final
Var
    I, J:Integer;
Begin
    For I:= Inicio to MaxFila do
    Begin
        For J:= Inicio to MaxCol do
            Write(' | ', Mat[I,J], ' | ');
            Writeln;
    End;
End;

//Programa Principal
var
    Mat:Matriz;
Begin
    CargaMatriz(Mat);
    ImprimirMatriz(Mat);
End.