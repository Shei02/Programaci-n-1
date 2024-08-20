Program Matriz7fallido
//Dada una matriz de m × n caracteres, ordenar sus filas
//alfabéticamente como si fueran palabras.
Uses Sysutils;
Const 
    Inicio = 1;
    MaxFilas = 4;
    MaxColum = 4;
    
Type Mat = Array [Inicio..MaxFilas, Inicio..MaxColum] of Char;

Procedure Carga (var Matriz:Mat);
var
    Fi,Co:Integer;
Begin
    Randomize;
    For Fi:= Inicio to MaxFilas do
        For Co:= Inicio to MaxColum do
            Matriz[Fi,Co]:= Chr(Random(26)+97);
End;

Procedure OrdenarSeleccion (Var Matriz:Mat);
var
    Fi,Co,N,Menor:Integer;
    Aux:Char;
Begin
    For Fi:= Inicio to MaxFilas do
        For Co:= Inicio to MaxColum-1 do 
            Begin
                Menor:=Co;
                    For N:= Menor+1 to MaxColum do 
                        Begin   
                            If (Matriz[Fi,Co] > Matriz[Fi,N]) then
                                Begin
                                    Menor:= N;
                                    Aux:= Matriz[Fi,Co];
                                    Matriz[Fi,Co]:= Matriz[Fi,N];
                                    Matriz[Fi,N]:= Aux;
                                End;
                        End;
            End;
End;

Procedure ImprimirMatriz (Matriz:Mat);
//Muestra la matriz final
Var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to MaxFilas do
    Begin
        For Co:= Inicio to MaxColum do
            Write(' | ', Matriz[Fi,Co], ' | ');
            Writeln;
    End;
End;

Var
    Matriz:Mat;
Begin
    Carga(Matriz);
    ImprimirMatriz(Matriz);
    OrdenarSeleccion(Matriz);
    Writeln('Esta es la matriz Ordenada alfabeticamente: ');
    ImprimirMatriz(Matriz);
End.