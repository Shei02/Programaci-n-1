Program Recuperatorio
//Este programa busca en una matriz el arreglo dado y si se encuentra se debe pisar con ceros
//y luego desplazar esa fila al final de la matriz

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 6;
    maxCol = 10;
    max = 10;
    
Type mat = array [Inicio..maxFila, Inicio..maxCol] of Integer;
     num = array [Inicio..max] of Integer;
     
//asumo que la matriz y el arreglo ya estan cargados
Procedure CargaMatriz (var Matriz:mat);
//carga la matriz
var
    Fi,Co:integer;
Begin
    For Fi:= inicio to maxFila do
        For Co:= Inicio to maxCol do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Procedure CargaArreglo (var Arreglo:num);
//carga del arreglo
var
    I,Dato:Integer;
Begin  
    dato:= 0;
    I:= Inicio;
    While (i <= max) do
        begin
            write('ingrese datos: ');
            readln(dato);
            arreglo[i]:= dato;
            i += 1;
        End;
End;

Function buscaArreglo (matriz:mat; arreglo:num; Fila:Integer):boolean;
//busca el arreglo dentro de la matriz y me dice si esta o no
var
    I:Integer;
    Encontro:Boolean;
Begin
    I:= Inicio;
    while (I <= maxCol) and (matriz[Fila,I] = Arreglo[I]) do
        I += 1;
    If (I > maxCol) then
        Encontro:= True
    Else 
        Encontro:= False;
    buscaArreglo:= Encontro;
End;

Procedure bajarCeros (var matriz:mat; Fila,Co:integer);
//deja las columnas con los 0 al final 
var
    I:Integer;
Begin 
    For I:= Fila to maxFila-1 do
        matriz[I,co]:= matriz[I+1,co];
    matriz[maxFila,co]:= 0; 
End;

Procedure reemplazaCerosYOrdena (var matriz:mat; Arreglo:num);
//si el arreglo esta dentro de la matriz lo cambia por 0 y realiza el corrimiento
var
    Fi,Co,I:Integer;
    Esta:Boolean;
Begin
    For Fi:= Inicio to maxFila do
        Esta:= buscaArreglo(matriz,arreglo,fi);
        If (Esta = true ) then
            For co:= Inicio to maxCol do
                Begin
                    Matriz[Fi,Co]:= 0;
                    bajarCeros(Matriz,Arreglo,Co);
                End;
End;

Procedure ImprimirMatriz (matriz:mat);
//muestra la matriz
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        Begin
            For Co:= Inicio to maxCol do
                Write('|', Matriz[Fi,Co], '|');
                Writeln;
        End;
End;

Procedure ImprimirArreglo (arreglo:Num);
//muestra el arreglo
var
    I:integer;
Begin   
    I:= inicio;
    While (I <= max) do
        Begin
            Writeln(Arreglo[I]);
            i += 1;
        End;
End;

//Programa principal
var
    matNros:mat;
    arrNum:num;
Begin
    cargaMatriz(matNros);
    imprimirMatriz(matNros);
    cargaArreglo(arrNum);
    imprimirArreglo(arrNum);
    reemplazaCerosYOrdena(matNros,arrNum);
    ImprimirMatriz(matNros);
End.