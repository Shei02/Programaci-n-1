Program Matriz4eyf
//Dadas dos matrices enteras realizar:
//Multiplicar una fila por una constante 
//Multiplicar una columna por una constante

Uses Sysutils;
Const
    Inicio = 1;
    Max = 4;
    
Type Mat = Array [Inicio..Max, Inicio..Max] of Integer;

Procedure CargaMatriz(var Matriz:Mat);
//Realiza la carga de la matriz
var
    Fi, Co:Integer;
Begin
    For Fi:= Inicio to Max do
        For Co:= Inicio to Max do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Procedure MultiplicacionFila (var Matriz:Mat; Fila, Numero:Integer);
//Realiza la multiplicacion de una fila dada por un numero ingresado
var
    Co:Integer;
Begin
    If (Fila >= Inicio) and (Fila <= Max) then
        Begin
            For Co:= Inicio to Max do
                Begin
                    Matriz[Fila,Co]:= Matriz[Fila,Co] * Numero;
                End;
        End
    Else
        Writeln('La fila es incorrecta');
End;

Procedure MultiplicacionColumna (var Matriz:Mat; Columna, Numero:Integer);
//Realiza la multiplicacion de una Columna dada por un numero ingresado
var
    Fi:Integer;
Begin
    If (Columna >= Inicio) and (Columna <= Max) then
        Begin
            For Fi:= Inicio to Max do
                Begin
                    Matriz[Fi,Columna]:= Matriz[Fi,Columna] * Numero;
                End;
        End
    Else
        Writeln('La Columna es incorrecta');
End;

Procedure ImprimirMatriz(Matriz:Mat);
//Muestra la matriz final;
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to Max do
        Begin
            For Co:= Inicio to Max do
                Begin
                    Write('|');
                    If (Matriz[Fi,Co] < 10) then
                        Write(' ' , Matriz[Fi,Co])
                    Else 
                        Write(Matriz[Fi,Co]);
                End;    
            Write('|');
            Writeln();
        End;
End;

//Programa Principal 
Var
    Matriz:Mat;
    Fila,Columna,Numero:Integer;
Begin
    CargaMatriz(Matriz);
    ImprimirMatriz(Matriz);
    Writeln('Ingrese la fila que desea multiplicar: ');
    Read(Fila);
    Writeln('Ingrese el numero por el cual desea multiplicar la fila: ');
    Read(Numero);
    MultiplicacionFila(Matriz, Fila, Numero);
    ImprimirMatriz(Matriz);
    Writeln('Ingrese la columna que desea multiplicar: ');
    Read(Columna);
    Writeln('Ingrese el numero por el cual desea multiplicar la columna: ');
    Read(Numero);
    MultiplicacionColumna(Matriz,Columna,Numero);
    ImprimirMatriz(Matriz);
End.