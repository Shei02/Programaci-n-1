Program Matriz6
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
    Fi,Co,Dato:integer;
Begin
    Randomize;
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum do
        Matriz[Fi,Co]:= Random(101);
End;

Procedure OrdenarPorBurbujeo (var Matriz:Mat; FilaActual:Integer);
Var
    Co,Aux,N:Integer;
Begin
    For N:= Inicio to MaxColum do
        For Co:= Inicio to MaxColum-1 do
            If (Matriz[FilaActual,Co] > Matriz[FilaActual,Co+1]) then 
                Begin
                    Aux:= Matriz[FilaActual,Co];
                    Matriz[FilaActual,Co]:= Matriz[FilaActual,Co+1];
                    Matriz[FilaActual,Co+1]:= Aux;
                End;
End;

Procedure OrdenarSeleccion(var Matriz:Mat);
var 
    Fi,Co,Aux,J,Menor:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum-1 do
            Begin
                Menor:=Co;
                    For J:= Menor+1 to MaxColum do
                        Begin
                            If (Matriz[Fi,Co] > Matriz[Fi,J]) then
                                Begin
                                    Menor:=J;
                                    Aux:= Matriz[Fi,J];
                                    Matriz[Fi,J]:= Matriz[Fi,Co];
                                    Matriz[Fi,Co]:= Aux;
                                End;
                        End;
            End;
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
    Fi,Dato:Integer;
Begin
    Writeln('Ingrese una opcion: ');
    Writeln('1-Burbujeo');
    Writeln('2-Seleccion');
    Writeln('3-Insercion');
    Readln(Dato);
    For Fi:= Inicio to MaxFila do
        While (Dato <> 1) and (Dato <> 2) and (Dato <> 3) do
            Begin
                Writeln('Ingrese un numero dentro de las 3 opciones: ');
                Readln(Dato);
            End;
        If (Dato = 1) then 
            OrdenarPorBurbujeo(Matriz, Fi);
        If (Dato = 2) then
            OrdenarSeleccion(Matriz);
        If (Dato = 3) then 
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
