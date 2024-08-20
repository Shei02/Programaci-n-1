Program Ejercicio10
//Dada la matriz LETRAS cuadrada de M x M caracteres, buscar en la diagonal 
//principal una palabra dada en el arreglo Palabra de N caracteres con N < M.
//Si se encuentra desplazarlo al final de la diagonal haciendo un 
//corrimiento hacia arriba en la diagonal del resto de los caracteres posteriores

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 5;
    maxCol = 5;
    maxArr = 3;
    Discernible = '*';

Type mat = Array [Inicio..maxFila,Inicio..maxCol] of Char;
     arr = Array [Inicio..maxArr] of Char;
     
Procedure CargaMatriz (Var Matriz:Mat);
//Realiza la carga de la matriz
Var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        For Co:= Inicio to maxCol do
            Begin
                If (Fi = Co) then
                    Begin
                        Write('Ingrese valores en la diagonal[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                        Readln(Matriz[Fi,Co]);
                    End
                Else
                    Matriz[Fi,Co]:=chr(Random(26)+97);
            End;
End;

Procedure CargaArr (var Arreglo:Arr; var Frontera:Integer);
//Realiza la carga del arreglo;
var 
    I:Integer;
    Dato:Char;
Begin
    Dato:= '-';
    I:= Inicio;
    While (I <= maxArr) and (Dato <> Discernible) do
        Begin
            Write('Ingrese elementos: ');
            Readln(Dato);
            Arreglo[I]:= Dato;
            I += 1;
            Frontera += 1;
        End;
    If (Frontera < maxArr) then
        Frontera -= 1;
End;

Function buscaPalabra (Matriz:mat; Arreglo:arr; Frontera,posicion:Integer):Boolean;
//Devuelve si la palabra esta o no en la diagonal principal
var
    MatrizI,ArrJ:Integer;
    Esta:Boolean;
Begin
    Esta:= False;
    MatrizI:= posicion;
    ArrJ:= Inicio;
    While (Matriz[MatrizI,MatrizI] = Arreglo[ArrJ]) do
        Begin
            MatrizI += 1;
            ArrJ += 1;
        End;
    If (ArrJ > Frontera) then
        Esta:= True
    Else
        Esta:= False;
    buscaPalabra:= Esta;
End;

Function posFinal (posicion,Frontera:Integer):Integer;
var
    posF:Integer;
Begin
    posF:= (posicion + Frontera)-1;
    posFinal:= posF;
End;

Procedure Corrimiento (var Matriz:Mat; Frontera,posI:Integer);
var 
    Pos,I,J,posFin:Integer;
    Auxiliar:Char;
Begin
    Pos:= posI;
    posFin:= posFinal(Pos,Frontera);
    For I:= posFin+1 to maxCol do
        Begin
            Auxiliar:= Matriz[maxCol,maxCol];
            For J:= maxCol downto pos+1 do
                Matriz[J,J]:= Matriz[J-1,J-1];
            Matriz[pos,pos]:= Auxiliar;
        End;
End;

Procedure palabra (var Matriz:Mat; Arreglo:Arr; Frontera:Integer; var posInicial:Integer);
var
    I,J:Integer;
    Encontro:Boolean;
Begin
    I:= Inicio;
    J:= Inicio;
    Encontro:= False;
    While (I <= maxFila) and (Encontro <> True) do
        Begin
            If (Matriz[I,I] = Arreglo[J]) then
                Encontro:= buscaPalabra(Matriz,Arreglo,Frontera,I);
            I += 1;
        End;
    posInicial:= I-1;
    If (Encontro = True) then
        Corrimiento(Matriz,Frontera,posInicial)
    Else 
        writeln('El arreglo no esta en la matriz');
End;

Procedure Imprimir (Matriz:Mat);
//Muestra la matriz
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

//Programa Principal
var
    Letras:Mat;
    Palabras:Arr;
    Frontera,posInicial:Integer;
Begin
    Randomize;
    Frontera:= 0;
    posInicial:= 0;
    CargaMatriz(Letras);
    Imprimir(Letras);
    CargaArr(Palabras,Frontera);
    palabra(Letras,Palabras,Frontera,posInicial);
    Imprimir(Letras);
End.