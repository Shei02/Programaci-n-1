Program Final7
//Posee la matriz NROS de M x N números enteros positivos que se pueden ver como 
//secuencias separadas por uno o más ceros en las filas. Se pide que identifique la 
//secuencia cuya sumatoria sea la menor de la matriz y la lleve al principio de su
//fila corriendo los elementos que están antes en su orden hacia la derecha. 
//Si hay más de una secuencia considerar la primer ocurrencia. No se podrán utilizar
//estructuras auxiliares. Considere la matriz cargada. Es necesario, además de 
//definir las estructuras y realizar el procedimiento, que éste esté correctamente 
//modularizado y graficado el DE.

Uses Sysutils;
Const 
    Inicio = 1;
    maxFila = 7;
    maxCol = 9;
    
Type mat = Array [Inicio..maxFila,Inicio..maxCol] of Integer;

Procedure cargaMatriz (var Matriz:mat);
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do 
        For Co:= Inicio to maxCol do 
            Begin
                Write ('Ingrese valores en la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Procedure Imprimir (Matriz:Mat);
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do 
        Begin
            For Co:= Inicio to maxCol do
                Begin  
                    Write(Matriz[Fi,Co]:2 , ' | ');
                End;
            Writeln;
        End;
End;

Function Sumatoria (Matriz:mat; posI,posF,Fi:Integer):Integer;
var
    Suma,I:Integer;
Begin
    Suma:= 0;
    For I:= posI to posF do 
        Suma:= Suma + Matriz[Fi,I];
    Sumatoria:= Suma;
End;

Procedure detectaSec (Matriz:Mat; var posI,posF:Integer; Fi,Co:Integer);
var
    Colum:Integer;
Begin
    Colum:=Co;
    While (Colum <= maxCol) and (Matriz[Fi,Colum] = 0) do 
        Begin
            Colum += 1;
        End;
        If (Colum <= maxCol) then
            Begin
                posI:= Colum;
            End;
    While (Colum <= maxCol) and (Matriz[Fi,Colum] <> 0) do 
        Begin
            Colum += 1;
        End;
        posF:= Colum-1;
End;

Procedure corrimiento (var Matriz:Mat; posI,posF,Fi:Integer);
var
    I,J,Aux:Integer;
Begin   
    While (posI-1 >= Inicio) and (Matriz[Fi,posI-1] = 0) do 
        Begin
            posI -= 1;
            For I:= posI to posF-1 do 
                Matriz[Fi,I]:= Matriz[Fi,I+1];
            Matriz[Fi,posF]:= 0;
        End;
            For J:= posI to posF do 
                Begin
                    Aux:= Matriz[Fi,posF];
                    For I:= posF downto (Inicio+1) do
                        Matriz[Fi,I]:= Matriz[Fi,I-1];
                    Matriz[Fi,Inicio]:= Aux;
                End;
End;

Procedure detectaYOrdena (var Matriz:Mat);
Var
    I,J,Fi,auxI,auxF,posI,posF,sumaMayor,Suma:Integer;
Begin
    I:= Inicio;
    J:= Inicio;
    auxI:= Inicio;
    auxF:= Inicio;
    Suma:= 10000;
    While (I <= maxFila) do 
        Begin
            J:= Inicio;
            While (J <= maxCol) do 
                Begin
                    detectaSec(Matriz,auxI,auxF,I,J);
                    sumaMayor:= Sumatoria(Matriz,auxI,auxF,I);
                    If (sumaMayor < Suma) and (sumaMayor <> 0) then
                        Begin
                            Suma:= sumaMayor;
                            posI:= auxI;
                            posF:= auxF;
                            Fi:= I;
                        End;
                    J:= auxF + 1;
                End;
            I += 1;
        End;
        Writeln('soy posI: ', posI);
        Writeln('soy posF: ', posF);
        Writeln('soy Fila: ', Fi);
    Corrimiento(Matriz,posI,posF,Fi);
End;

//programa principal
var
    Nros:Mat;
Begin
    cargaMatriz(Nros);
    Imprimir(Nros);
    detectaYOrdena(Nros);
    Imprimir(Nros);
End.