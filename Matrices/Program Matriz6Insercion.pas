Program Matriz6Insercion
//Dada una matriz de m × n enteros, ordenar cada una de sus filas usando 
//los 3 métodos de ordenamiento. Pude usar módulos definidos en otros prácticos

Const 
    Inicio = 1;
    MaxFila = 3;
    MaxColum = 3;
    
Type Mat = Array [Inicio..MaxFila,Inicio..MaxColum] of Integer;

Procedure CargaMatriz(var Matriz:Mat);
//Realiza la carga de la matriz con un numero random
var
    Fi,Co:integer;
Begin
    Randomize;
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum do
        Matriz[Fi,Co]:= Random(101);
End;

Procedure OrdenarInsercion(var Matriz:Mat);
var 
    Fi,Co,J,Insert:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio+1 to MaxColum do 
            For J:= Co downto Inicio+1 do 
                If (Matriz[Fi,J] < Matriz[Fi,J-1]) then
                    Begin
                        Insert:=Matriz[Fi,J-1];
                        Matriz[Fi,J-1]:=Matriz[Fi,J];
                        Matriz[Fi,J]:= Insert;
                    End;
End;

Procedure Ordenar (Var Matriz:Mat);
var
    Fi:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        OrdenarInsercion(Matriz);
End;

Procedure ImprimirMatriz(Matriz:Mat);
//Muestra la matriz final
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        Begin
            For Co:= Inicio to MaxColum do
                Begin
                    Write(' | ');
                    If (Matriz[Fi,Co] < 10) then
                        Write(' ', Matriz[Fi,Co])
                    Else
                        Write(Matriz[Fi,Co]);
                        Write(' | ');
                End;    
            Writeln;
        End;
End;

Var
    Matriz:Mat;
    Fi,Co:Integer;
Begin
    CargaMatriz(Matriz);
    ImprimirMatriz(Matriz);
    Writeln();
    Ordenar(Matriz);
    ImprimirMatriz(Matriz);
End.