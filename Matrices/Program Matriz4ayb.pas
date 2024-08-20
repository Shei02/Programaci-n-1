Program Matriz4ayb
//Dadas dos matrices enteras realizar:
//Intercambiar dos filas dadas de una matriz
//Intercambiar dos columnas dadas de una matriz

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

Procedure IntercambiarFilas (Var Matriz:Mat; Fi1, Fi2:Integer);
//Intercambia dos filas dada de una matriz
Var
    Co, Aux:Integer;
Begin
    If (Fi1 <= Max) and (Fi2 <= Max) and (Fi1 >= Inicio) and (Fi2 >= Inicio) then
        For Co:= Inicio to Max do
            Begin
                Aux:= Matriz[Fi2,Co];
                Matriz[Fi2,Co]:= Matriz[Fi1,Co];
                Matriz[Fi1,Co]:= Aux;
            End
    Else
        Writeln('Las filas que quiere intercambiar no existen');
End;

Procedure IntercambiarColumnas (var Matriz:Mat; Co1,Co2:Integer);
//Intercambia dos columnas dadas de una matriz
Var
    Fi, Aux:Integer;
Begin
    If (Co1 <= Max) and (Co2 <= Max) and (Co1 >= Inicio) and (Co2 >= Inicio) then
        For Fi:= Inicio to Max do
            Begin
                Aux:= Matriz[Fi,Co2];
                Matriz[Fi,Co2]:= Matriz[Fi,Co1];
                Matriz[Fi,Co1]:= Aux;
            End
    Else
        Writeln('Las columnas que quiere intercambiar no existen');
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
var
    Matriz1:Mat;
    Fila1,Fila2,Colum1,Colum2:Integer;
Begin
    CargaMatriz(Matriz1);
    ImprimirMatriz(Matriz1);
    Writeln('Ingrese las filas que desea cambiar: ');
    Read(Fila1);
    Read(Fila2);
    IntercambiarFilas(Matriz1,Fila1,Fila2);
    Writeln('Ingrese las columnas que desea cambiar: ');
    Read(Colum1);
    Read(Colum2);
    IntercambiarColumnas(Matriz1,Colum1,Colum2);
    ImprimirMatriz(Matriz1);
End.