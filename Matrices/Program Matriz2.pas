Program Matriz2
//Realizar un procedimiento que dado como parámetro la matriz definida en el ejercicio anterior,
//la convierta en la matriz identidad realizando las operaciones correspondientes 
//(contiene unos en la diagonal y ceros en el resto de sus posiciones).

Const
    Inicio = 1;
    MaxFila = 3;
    MaxColum = 3;
    
Type 
    Mat = Array [Inicio..MaxFila, Inicio..MaxColum] of Integer;
    
Procedure CargaMatriz(var Matriz:Mat);
//Realiza la carga de la matriz
var
    Fi, Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum do
            Begin
                Writeln('Ingrese valores a la matriz: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Function DividirMat (Matriz:Mat; Fi,Co:Integer):Integer;
//Divide un numero por su mismo Numero para que de uno 
var
    Divi:Integer;
Begin
    Divi:= 0;
    Divi:= ((Matriz[Fi,Co]) div (Matriz[Fi,Co]));
    DividirMat:= Divi;
End;

Procedure Convertir (var Matriz:Mat);
//Convierte la matriz en una matriz identidad
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum do
            Begin
                If (Fi=Co) then
                    Matriz[Fi,Co]:= DividirMat(Matriz,Fi,Co)
                Else
                    Matriz[Fi,Co]:= 0;
            End;
End;
    
Procedure ImprimirMatriz (Matriz:Mat);
//Muestra la matriz final
Var
    Fi, Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
    Begin
        For Co:= Inicio to MaxColum do
            Write(' | ', Matriz[Fi,Co], ' | ');
            Writeln;
    End;
End;

//Programa Principal
var
    Matriz:Mat;
Begin
    CargaMatriz(Matriz);
    ImprimirMatriz(Matriz);
    Writeln(' ');
    Convertir(Matriz);
    ImprimirMatriz(Matriz);
End.