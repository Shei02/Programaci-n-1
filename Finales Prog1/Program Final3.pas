Program Final3
//Se tiene una matriz MatLetras de MAXFIL x MAXCOL caracteres donde cada fila contiene palabras 
//separadas por uno o más blancos pudiendo haber o no blancos al final o al inicio de cada fila 
//(nunca se corta una palabra).
//Se pide que se detecte la palabra de mayor longitud de toda la matriz (si hay más de una tomar 
//la última),y se la lleve al principio de su fila, realizando un corrimiento a derecha de los 
//elementos que se encuentran antes que la palabra y asegurando que al menos haya un blanco entre 
//la palabra de mayor longitud y la que le sigue en el orden.
//Realice el diagrama de Estructura y el programa principal con la declaración de tipos,variables 
//y todos los módulos que considere necesario. Para aprobar es fundamental realizar una buena 
//modularización de la solución. No se pueden usar estructuras auxiliares.

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 6;
    maxCol = 9;
    
Type Mat = Array [Inicio..maxFila, Inicio..maxCol] of Char;

Procedure cargaMatriz (var Matriz:Mat);
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        For Co:= Inicio to maxCol do 
            Begin
                Write('Ingrese datos en la matriz[' +IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Function longitud (posI,posF:Integer):Integer;
var
    long:Integer;    
Begin
    long:=(posF-posI)-1;
    longitud:=long;
End;

Procedure buscaPalabra (Matriz:Mat; Fi,Co:Integer; var posI,posF:Integer);
var
    Columna:Integer;
Begin
    Columna:= Co;
    While (Columna <= maxCol) and (Matriz[Fi,Columna] = ' ') do
        Begin    
            Columna += 1;
        End;
    posI:= Columna;
    While (Columna <= maxCol) and (Matriz[Fi,Columna] <> ' ') do 
        Begin    
            Columna += 1;
        End;
        posF:= Columna-1;
End;

Procedure ordenamiento (var Matriz:mat; posI,posF,Fi:Integer);
var
    cantVeces,I:Integer;
    Aux:Char;
Begin
    //todos los blancos de la izq, me los corre a dcha
    While (posI-1 >= Inicio) and (Matriz[Fi,posI-1] = ' ') do 
        Begin
            posI -= 1;
            For I:= posI to posF-1 do 
                Matriz[Fi,I]:= Matriz[Fi,I+1];
            Matriz[Fi,posF]:= ' ';
        End;
            //correr la palabara al principio
            For cantVeces:= posI to posF do
                Begin
                    Aux:= Matriz[Fi,posF];
                    For I:= posF downto (Inicio+1) do
                        Matriz[Fi,I]:= Matriz[Fi,I-1];
                    Matriz[Fi,Inicio]:= Aux;
                End;
End;

Procedure detectaYOrdena (var Matriz:mat);
var
    Fila,Columna,Fi,auxI,auxF,posI,posF,palMayor,Compara:Integer;
Begin
    palMayor:= 0;
    Compara:= 0;
    Fila:= maxFila;
    Columna:= Inicio;
    auxI:= Inicio;
    auxF:= Inicio;
    While (Fila >= Inicio) do
        Begin
            Columna:= Inicio;
            While (Columna <= maxCol) do
                Begin
                    buscaPalabra(Matriz,Fila,Columna,auxI,auxF);
                    Compara:=longitud(auxI,auxF);
                    If (Compara > palMayor) then
                        Begin
                            palMayor:= Compara;
                            posI:= auxI;
                            posF:= auxF;
                            Fi:= Fila;
                        End;
                    Columna:= auxF+1;
                End;
            Fila -= 1;
        End;
    ordenamiento(Matriz,posI,posF,Fi);
    Writeln('soy posI: ', posI);
    Writeln('soy posF: ', posF);
    Writeln('soy la fila: ', Fi);
End;

Procedure Imprimir (Matriz:Mat);
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

//Programa Principal
var
    matLetras:Mat;
Begin
    cargaMatriz(matLetras);
    Imprimir(matLetras);
    detectaYordena(matLetras);
    writeln;
    Imprimir(matLetras);
End.