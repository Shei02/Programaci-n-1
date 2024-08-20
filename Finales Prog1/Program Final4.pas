Program Final4
//Se tiene una matriz MatLetras de MAXFIL x MAXCOL caracteres. Esta matriz está inicializada, sin 
//espacios en blanco, y sin ningún orden. Además se tiene un arreglo de caracteres ya cargado 
//completamente sin blancos PATRON, de long MAX(MAX<=MAXCOLl).
//Se pide que realice el Diagrama de Estructura y el código Pascal para la siguiente solución:
//-Por cada columna, se busque la primer ocurrencia de Patrón. Si se encuentra se borra corriendo 
//todos los caracteres que están en las posiciones inferiores para ocupar esos lugares
//(respetando el orden entre ellos), rellenando las primeras MAX posiciones con blanco.
//-Ordenar descendentemente las columnas de la matriz en base al último carácter que tiene cada una.
//Realice la declaración de tipos, variables y el programa principal. Para aprobar es 
//fundamental realizar una buena modularización de la solución. No se pueden usar estructuras 
//auxiliares.

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 6;
    maxCol = 9;
    maxArr = 3;
    
Type mat = Array [Inicio..maxFila,Inicio..maxCol] of Char;
    Arr = Array [Inicio..maxArr] of Char;
    
Procedure cargaArreglo (var Arreglo:arr);
var
    I:Integer;
    Dato:Char;
Begin
    I:= Inicio;
    Dato:= '0';
    While (I <= maxArr) do 
        Begin
            Write ('Ingrese datos al arreglo: ');
            Readln(Dato);
            Arreglo[I]:= Dato;
            I += 1;
        End;
End;

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

Procedure ImprimirArr (Arreglo:Arr);
var
    I:Integer;
Begin
    For I:= Inicio to maxArr do 
        Write(Arreglo[I], ' ');
End;

Function encuentraPatron (Matriz:mat; Arreglo:Arr; Fi,Co:Integer):Boolean;
var
    Esta:Boolean;
    MatrizI:Integer;
Begin
    Esta:= False;
    MatrizI:= Inicio;
    While (Matriz[Fi,Co] = Arreglo[MatrizI]) do 
        Begin
            Fi += 1;
            MatrizI += 1;
        End;
    If (MatrizI > maxArr) then
        Begin
            Esta:= True;
            Writeln('el arreglo esta en la matriz');
        End
    Else
        Begin
            Esta:= False;
            Writeln('el arreglo no esta en la matriz');
        End;
    encuentraPatron:= Esta;
End;

Function posFinal (Fi:Integer):Integer;
var
    posF:Integer;
Begin
    posF:= (Fi+maxArr);
    posFinal:= posF;
End;

Procedure poneBlancos (var Matriz:mat;Fi,Co:Integer);
Var
    posFin:Integer;
Begin
    posFin:= posFinal(Fi);
    While (Fi <= maxFila) and (Fi < posFin) do
        Begin
            Matriz[Fi,Co]:= ' ';
            Fi += 1;
        End;
End;

Procedure ordenarLetras (var Matriz:mat; Fi,Co:Integer);
var
    Fila,I,posF:Integer;
    Aux:Char;
Begin
    posF:= posFinal(Fi)-1;
    For Fila:= maxFila downto Inicio do 
        Begin
            If (Matriz[Inicio,Co] <> ' ') then
                Begin
                    Aux:= Matriz[Inicio,Co];
                        For I:= Inicio to posF-1 do 
                            Begin
                                Matriz[I,Co]:= Matriz[I+1,Co];
                            End;
                        Matriz[posF,Co]:= Aux;
                End;
        End;
End;

Function buscaMenor(Matriz:mat; Co:Integer):Integer;
var
    Letra,Aux:Char;
    Fi,I,J:Integer;
Begin
    Fi:= maxFila;
    Aux:= '0';
    For I:= Inicio to Co do
        Begin
            Letra:= Matriz[Fi,I];
                If (Letra > Aux) then
                    Begin
                        Aux:= Letra;
                        J:=I;
                    End;
        End;
    buscaMenor:= J;
End;

Procedure ordenaDescendentemente (var Matriz:mat);
var     
    Fi,Co,Menor:Integer;
    Aux:Char;
Begin
    For Co:= maxCol downto Inicio do 
        Begin   
            Menor:= buscaMenor(Matriz,Co);
            If (Menor <> Co) then
                Begin
                    For Fi:= Inicio to maxFila do 
                        Begin
                            Aux:= Matriz[Fi,Co];
                            Matriz[Fi,Co]:= Matriz[Fi,Menor];
                            Matriz[Fi,Menor]:= Aux;
                        End;
                End;
        End;
End;

Procedure borraYOrdena (var Matriz:mat; Arreglo:arr);
var
    Fi,Co:Integer;
    Esta:Boolean;
Begin
    Esta:= False;
    For Fi:= Inicio to maxFila do 
        For Co:= Inicio to maxCol do
            Begin
                If (Matriz[Fi,Co] = Arreglo[Inicio]) then
                    Begin
                        Esta:= encuentrapatron(matriz,Arreglo,Fi,Co);
                    End;
                If (Esta = True) then 
                    Begin
                        poneBlancos(Matriz,Fi,Co);
                        ordenarLetras(Matriz,Fi,Co);
                    End;
                Esta:= False;
            End;
End;

//Programa principal
var
    Patron:Arr;
    Matriz:Mat;
Begin
    cargaMatriz(Matriz);
    Imprimir(Matriz);
    cargaArreglo(Patron);
    ImprimirArr(Patron);
    Writeln;
    borraYOrdena(Matriz,Patron);
    Imprimir(Matriz);
    Writeln;
    ordenaDescendentemente(Matriz);
    Imprimir(Matriz);
End.