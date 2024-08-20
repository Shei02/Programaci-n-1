Program Matriz3
//Se tiene una matriz de 10x10 y de ella se debe calcular: 
//Suma de una columna
//Suma de una fila
//Promedio de una Fila
//Promedio de una Columna

Const
    Inicio = 1;
    MaxFila = 10;
    MaxColum = 10;
    
Type Mat = Array [Inicio..MaxFila, Inicio..MaxColum] of Integer;

Procedure CargaMatriz(var Matriz:Mat);
//Carga la matriz
var
    Fi,Co,Dato:integer;
Begin
    Randomize;
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum do
        Matriz[Fi,Co]:= Random(101);
End;

Function SumaColumna (Matriz:Mat; CoBuscar:Integer):Integer;
//realiza la suma de una columna dada
var
    Fi,Co,Suma:Integer;
Begin
    Suma:=0;
    If (CoBuscar >= Inicio) and (CoBuscar <= MaxColum) then
        Begin
            For Fi:= Inicio to MaxFila do
                Begin
                    For Co:= Inicio to MaxColum do
                        If (CoBuscar = Co) then
                            Suma:= Suma + Matriz[Fi,Co];
                End;
        End
    Else 
        Writeln('La columna es incorrecta');
    SumaColumna:= Suma;
End;

Function SumaFila (Matriz:Mat; FiBuscar:Integer):Integer;
//realiza la suma de una fila dada
Var
    Fi,Co,SumaF:Integer;
Begin
    SumaF:=0;
    If (FiBuscar >= Inicio) and (FiBuscar <= MaxFila) then
        Begin
            For Fi:= Inicio to MaxFila do
                Begin
                    For Co:= Inicio to MaxColum do
                        Begin
                            If (FiBuscar = Fi) then
                                SumaF:= SumaF + Matriz[Fi,Co];
                        End;
                End;
        End
    Else
        Writeln('La fila es incorrecta');
    SumaFila:= SumaF;
End;

Function PromFila (Matriz:Mat; FiBuscar:Integer):Real;
//Realiza el promedio de una fila dada
Var
    Promedio:Real;
Begin
    Promedio:= SumaFila(Matriz, FiBuscar) / MaxColum;
    PromFila:= Promedio;
End;

Function PromColum (Matriz:Mat; CoBuscar:Integer):Real;
//Realiza el promedio de una columna dada
Var
    PromedioC:Real;
Begin
    PromedioC:= SumaColumna(Matriz, CoBuscar) / MaxFila;
    PromColum:= PromedioC;
End;

Procedure ImprimirMatriz(Matriz:Mat);
//Muestra la matriz final
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        Begin
            For Co:= Inicio to MaxColum do
                Write(' | ', Matriz[Fi,Co], ' | ');
                Writeln;
        End;
End;

//Programa Principal
Var
    Matriz:Mat;
    CoBuscar,FiBuscar, SumaColum, SumaFi:Integer;
    PromedioF, PromedioC:Real;
Begin
    CoBuscar:= 0;
    FiBuscar:= 0;
    CargaMatriz(Matriz);
    ImprimirMatriz(Matriz);
    Writeln('Ingrese la columna que desea sumar: ');
    Read(CoBuscar);
    SumaColum:= SumaColumna(Matriz,CoBuscar);
    Writeln('La Suma de la columna es: ', SumaColum);
    Writeln('Ingrese la fila que desea sumar: ');
    Read(FiBuscar);
    SumaFi:= SumaFila(Matriz,FiBuscar);
    Writeln('La suma de la fila es: ', SumaFi);
    PromedioF:= PromFila(Matriz, FiBuscar);
    Writeln('El promedio de la fila dada es: ', PromedioF);
    PromedioC:= PromColum(Matriz, CoBuscar);
    Writeln('El promedio de la columna dada es: ', PromedioC);
End.