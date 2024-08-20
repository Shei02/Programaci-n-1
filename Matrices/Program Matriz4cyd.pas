Program Matriz4cyd
//Dadas dos matrices enteras realizar:
//Sumar una fila dada de A con una fila dada de B
//Sumar una columna dada de A con una columna dada de B

Uses Sysutils;
Const
    Inicio = 1;
    Max = 4;
    Max1 = 5;
    
Type Mat = Array [Inicio..Max, Inicio..Max] of Integer;
     Mat1 = Array [Inicio..Max1, Inicio..Max1] of Integer;
     
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

Procedure CargaMatriz2(var Matriz:Mat1);
//Realizar la Carga de la matriz
Var
    Fi1,Co1:Integer;
Begin
    For Fi1:= Inicio to Max1 do
        For Co1:= Inicio to Max1 do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi1) + ',' + IntToStr(Co1) +']: ');
                Readln(Matriz[Fi1,Co1]);
            End;
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

Procedure SumarFilas (var Matriz:Mat; Matriz2:Mat1; Fi1,Fi2:Integer);
//realiza la suma de filas dadas de matrices distintas
Var
    Co:Integer;
Begin
    If (Fi1 >= Inicio) and (Fi1 <= Max) and (Fi2 >= Inicio) and (Fi2 <= Max1) then
        Begin
            If (Max = Max1) then
                For Co:= Inicio to Max1 do
                    Begin
                        Matriz[Fi1,Co]:= Matriz[Fi1,Co] + Matriz2[Fi1,Co];
                        ImprimirMatriz(Matriz);
                    End
            Else
                Writeln('Las dimenciones son distintas, no se puede relizar la suma');
        End
    Else
        Writeln('La/s fila/s ingresada/s no se encuentra/n');
End;

Procedure SumarColumnas (var Matriz:Mat; Matriz2:Mat1; Co1,Co2:Integer);
//realiza la suma de columnas dadas de matrices distintas
Var
    Fi:Integer;
Begin
    If (Co1 >= Inicio) and (Co1 <= Max) and (Co2 >= Inicio) and (Co2 <= Max1) then
        Begin
            If (Max = Max1) then
                For Fi:= Inicio to Max1 do
                    Begin
                        Matriz[Fi,Co1]:= Matriz[Fi,Co1] + Matriz2[Fi,Co2];
                        ImprimirMatriz(Matriz);
                    End
            Else
                Writeln('Las dimenciones son distintas, no se puede relizar la suma');
        End
    Else
        Writeln('La/s columna/s ingresada/s no se encuentra/n');
End;

Procedure ImprimirMatriz(Matriz:Mat1);
//Muestra la matriz final;
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to Max1 do
        Begin
            For Co:= Inicio to Max1 do
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
var
    Matriz1:Mat;
    Matriz2:Mat1;
    Fila1,Fila2,Columna1,Columna2:Integer;
Begin
    CargaMatriz(Matriz1);
    ImprimirMatriz(Matriz1);
    CargaMatriz2(Matriz2);
    ImprimirMatriz(Matriz2);
    Writeln('Ingrese la fila que quiere sumar de la primera matriz: ');
    Read(Fila1);
    Writeln('Ingrese la fila que quiere sumar de la segunda matriz: ');
    Read(Fila2);
    SumarFilas(Matriz1,Matriz2,Fila1,Fila1);
    Writeln('Ingrese la columna que quiere sumar de la primera matriz: ');
    Read(Columna1);
    Writeln('Ingrese la columna que quiere sumar de la segunda matriz: ');
    Read(Columna2);
    SumarColumnas(Matriz1,Matriz2,Columna1,Columna1);
End.