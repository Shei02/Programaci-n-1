Program Final1
//Dada la matriz Secuencias de MxN cuyas columnas contienen Secuencias de dígitos(1..9) separadas 
//por un cero. Buscar la secuencia de mayor sumatoria y ordenarlas sobre sí misma de mayor a menor.
//Las columnas pueden ó no terminar con un cero(0).
//Realice DE, prog.princ.y todos los módulos necesarios. No usar estructura de datos auxiliares.

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 6;
    maxCol = 5;

Type mat = Array [Inicio..maxFila, Inicio..maxCol] of Integer;

Procedure cargaMatriz (var Matriz:Mat);
var
    Fi,Co:Integer;
Begin
    For Co:= Inicio to maxCol do
        For Fi:= Inicio to maxFila do 
            Begin
                Write ('Ingrese valores en la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Function sumatoria (matriz:mat; Co,posI,posF:Integer):Integer;
var
    I,Suma:Integer;
Begin
    Suma:= 0;
    For I:= posI to posF do
        Suma:= Suma + Matriz[I,Co];
    Sumatoria:= Suma;
End;

Procedure buscaSec (matriz:mat; Fi,Co:Integer; var posI,posF:Integer);
var
    Fila:Integer;
Begin
    Fila:= Fi;
    While (Fila <= maxFila) and (Matriz[Fila,Co] = 0) do
        Begin
            Fila += 1;
        End;
        posI:= Fila;
    While (Fila <= maxFila) and (Matriz[Fila,Co] <> 0) do
        Begin
            Fila += 1;
        End;
        posF:= Fila-1;
End;

Procedure ordenamientoSeleccion (var Matriz:mat; posI,posF,Co:Integer);
var
    Fi,I,Aux,Mayor:Integer;
Begin
    For Fi:= posI to posF-1 do
        Begin
            Mayor:= Fi;
            For I:= Mayor+1 to posF do
                Begin
                    If (Matriz[Fi,Co] < Matriz[I,Co]) then
                        Begin
                            Mayor:=I;
                            Aux:= Matriz[I,Co];
                            Matriz[I,Co]:= Matriz[Fi,Co];
                            Matriz[Fi,Co]:= Aux;
                        End;
                End;
        End;
End;

Procedure detectaYOrdena (var Matriz:mat);
var
    I,J,Co,auxI,auxF,posI,posF,sumaMayor,Compara:Integer;
Begin
    sumaMayor:= 0;
    Compara:= 0;
    I:= Inicio;
    J:= Inicio;
    auxI:= Inicio;
    auxF:= Inicio;
    While (J <= maxCol) do
        Begin
            I:= Inicio;
            While (I <= maxFila) do
                Begin
                    buscaSec(Matriz,I,J,auxI,auxF);
                    Compara:=Sumatoria(Matriz,J,auxI,auxF);
                    If (Compara > sumaMayor) then
                        Begin
                            sumaMayor:= Compara;
                            posI:= auxI;
                            posF:= auxF;
                            Co:= J;
                        End;
                    I:= auxF + 1;
                End;
            J += 1;
        End;  
    ordenamientoSeleccion(Matriz,posI,posF,Co);
End;

Procedure Imprimir (Matriz:mat);
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        Begin
            For Co:= Inicio to maxCol do 
                Begin
                    Write(Matriz[Fi,Co], ' | ');
                End;
            Writeln;
        End;
End;

//Programa principal 
var
    Matriz:Mat;
Begin
    cargaMatriz(Matriz);
    Imprimir(Matriz);
    detectaYOrdena(Matriz);
    Writeln();
    Imprimir(Matriz);
End.