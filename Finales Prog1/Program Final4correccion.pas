Program Final4correccion
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

Function encuentraPatron (Matriz:mat; Arreglo:Arr; Fi,Co:Integer):Integer;
var
    MatrizI,posF,Fila:Integer;
Begin
    posF:= -1;
    MatrizI:= Inicio;
    Fila:= Fi;
    While (Fila <= maxFila) and (Matriz[Fila,Co] = Arreglo[MatrizI]) do 
        Begin
            Fila += 1;
            MatrizI += 1;
        End;
    If (MatrizI > maxArr) then
        Begin
            posF:= Fila-1;
            Writeln('spy posfinal;' , posF);
            Writeln('el arreglo esta en la matriz');
        End
    Else
        Begin
            posF:= -1;
            Writeln('el arreglo no esta en la matriz');
        End;
    encuentraPatron:= posF;
End;

Procedure poneBlancos (var Matriz:mat;Fi,Co,posFin:Integer);
var
    Fila:Integer;
Begin
    Fila:= Fi;
    While (Fila <= maxFila) and (Fila <= posFin) do
        Begin
            Matriz[Fila,Co]:= ' ';
            Fila += 1;
        End;
End;

Procedure ordenarLetras (var Matriz:mat; Fi,Co,posF:Integer);
var
    Fila,I,posOcu:Integer;
    Aux:char;
Begin
    posOcu:= posF;
    If (Matriz[Inicio,Co] <> ' ') then
        For Fila:= Fi-1 downto Inicio do 
                Begin
                    Aux:= Matriz[posOcu,Co];
                    Matriz[posOcu,Co]:=  Matriz[Fila,Co];
                    Matriz[Fila,Co]:= Aux;
                    posOcu -= 1;
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
    Fi,Co,posFin:Integer;
    noencontrado:Boolean;
Begin
    For Co:= Inicio to maxCol do
        Begin
            Fi:= Inicio;
            noencontrado:= false;
            While (Fi <= maxFila) and (noencontrado = False) do
                Begin
                    Writeln('elemento actual:', Matriz[Fi,Co]);
                    writeln('soy el arreglo: ', Arreglo[Inicio]);
                    Writeln('fila', Fi);
                    Writeln('Columna', Co);
                    If (Matriz[Fi,Co] = Arreglo[Inicio]) then
                        Begin
                            Writeln('empiezo a buscar patron: fila', Fi);
                            Writeln('empiezo a buscar patron: Columna', Co);
                            posFin:= encuentrapatron(matriz,Arreglo,Fi,Co);
                        
                            If (posFin <> -1) then 
                                Begin
                                    Writeln('soy pposI: ', Fi);
                                    writeln('soy posfin: ', posFin);
                                    poneBlancos(Matriz,Fi,Co,posFin);
                                    ordenarLetras(Matriz,Fi,Co,posFin);
                                    noencontrado:= True;
                                End;
                        End;
                    Fi += 1;
                End;
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