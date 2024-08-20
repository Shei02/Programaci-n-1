Program Matriz4CYD
//Dadas dos matrices enteras realizar:
//Sumar una fila dada de A con una fila dada de B
//Sumar una columna dada de A con una columna dada de B

Uses Sysutils;
Const
    Inicio = 1;
    Max = 4;
    Max1 = 4;
    
Type Mat = Array [Inicio..Max, Inicio..Max] of Integer;
     Mata = Array [Inicio..Max1, Inicio..Max1] of Integer;
     
Procedure CargaMatriz(var Matriz:Mat);
//Realiza la carga de la matriz
var
    Fi, Co, Dato:Integer;
Begin
    Randomize;
    For Fi:= Inicio to Max do
        For Co:= Inicio to Max do
            Matriz[Fi,Co]:= Random(101);
End;

Procedure CargaMatriz2(var Matriz:Mata);
//Realizar la Carga de la matriz
Var
    Fi1,Co1,Date:Integer;
Begin
    Randomize;
    For Fi1:= Inicio to Max1 do
        For Co1:= Inicio to Max1 do
            Matriz[Fi1,Co1]:= Random(120);
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

Procedure SumarFilas (var Matriz:Mat; Matriz2:Mata; Fi1,Fi2:Integer);
//realiza la suma de filas dadas de matrices distintas
Var
    Co:Integer;
Begin
    If (Fi1 >= Inicio) and (Fi1 <= Max) and (Fi2 >= Inicio) and (Fi2 <= Max1) then
        Begin
            For Co:= Inicio to Max do
                Begin
                    Matriz[Fi1,Co]:= Matriz[Fi1,Co] + Matriz2[Fi2,Co];
                End;
        End
    Else
        Writeln('La fila que desea sumar no existe');
End;

Procedure SumarColumnas (var Matriz:Mat; Matriz2:Mata; Co1,Co2:Integer);
//realiza la suma de columnas dadas de matrices distintas
Var
    Fi:Integer;
Begin
    If (Co1 >= Inicio) and (Co1 <= Max) and (Co2 >= Inicio) and (Co2 <= Max1) then
        Begin
            For Fi:= Inicio to Max do
                Begin
                    Matriz[Fi,Co1]:= Matriz[Fi,Co1] + Matriz2[Fi,Co2];
                End;
        End
    Else
        Writeln('La columna que desea sumar no existe');
End;

Procedure ComparaMatriz(Matriz:Mat; Matriz2:Mata; Fi1,Fi2,Co1,Co2:Integer);
Begin
    If (Max = Max1) then
        Begin
            SumarFilas(Matriz,Matriz2,Fi1,Fi2);
            ImprimirMatriz(Matriz);
            Writeln();
            SumarColumnas(Matriz,Matriz2,Co1,Co2);
            ImprimirMatriz(Matriz);
        End
    Else
        Writeln('No se pueden sumar porque las matrices son de diferentes dimenciones');
End;
        
Procedure ImprimirMatriz2(Matriz2:Mata);
//Muestra la matriz final;
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to Max1 do
        Begin
            For Co:= Inicio to Max1 do
                Begin
                    Write('|');
                    If (Matriz2[Fi,Co] < 10) then
                        Write(' ' , Matriz2[Fi,Co])
                    Else 
                        Write(Matriz2[Fi,Co]);
                End;    
            Write('|');
            Writeln();
        End;
End;

//Programa Principal
var
    Matriz1:mat;
    Matriz2:Mata;
    Fila1,Fila2,Colum1,Colum2:Integer;
Begin
    CargaMatriz(Matriz1);
    ImprimirMatriz(Matriz1);
    Writeln();
    CargaMatriz2(Matriz2);
    ImprimirMatriz2(Matriz2);
    Writeln('Ingrese la fila que quiere sumar de la primera matriz: ');
    Readln(Fila1);
    Writeln('Ingrese la fila que quiere sumar de la segunda matriz: ');
    Readln(Fila2);
    Writeln('Ingrese la columna que quiere sumar de la primera matriz: ');
    Readln(Colum1);
    Writeln('Ingrese la columna que quiere sumar de la segunda matriz: ');
    Readln(Colum2);
    ComparaMatriz(Matriz1,Matriz2,Fila1,Fila2,Colum1,Colum2);
End.