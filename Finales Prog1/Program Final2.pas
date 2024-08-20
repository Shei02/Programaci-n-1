Program Final2
//Dada la matriz Datos cuadrada de M x M caracteres, buscar en la diagonal principal una palabra 
//dada en el arreglo Patron de N caracteres con N<M. Si se encuentra desplazarlo al inicio de
//la diagonal haciendo un corrimiento hacia abajo en la diagonal del resto.

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 6;
    maxCol = 6;
    maxArr = 3;
    Discernible = '*';
    
Type mat = Array [Inicio..maxFila, Inicio..maxCol] of Char;
    Arreglo = Array [Inicio..maxArr] of Char;
    
Procedure cargaMatriz (var Matriz:mat);
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to maxFila do
        For Co:= Inicio to maxCol do
            Begin
                If (Fi = Co) then
                    Begin
                        Write('Ingrese datos en la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                        Readln(Matriz[Fi,Co]);
                    End
                Else
                    Matriz[Fi,Co]:= chr(Random(26)+97);
            End;
End;

Procedure cargaArreglo (var Arr:Arreglo; var Frontera:Integer);
var
    I:Integer;
    Dato:Char;
Begin
    I:= Inicio;
    Dato:= '0';
    While (I <= maxArr) and (Dato <> Discernible) do
        Begin
            Write('Ingrese datos al arreglo: ');
            Readln(Dato);
            Arr[I]:= Dato;
            I += 1;
            Frontera += 1;
        End;
    If (Frontera < maxArr) then
        Frontera -= 1;
End;

Function encuentraPalabra (Matriz:Mat; Arr:Arreglo; Frontera,Posicion:Integer):Boolean;
var
    MatrizI,ArregloJ:Integer;
    Encontro:Boolean;
Begin
    Encontro:= false;
    MatrizI:= Posicion;
    ArregloJ:= Inicio;
    While (Matriz[MatrizI,MatrizI] = Arr[ArregloJ]) do
        Begin
            MatrizI += 1;
            ArregloJ += 1;
        End;
    If (ArregloJ > Frontera) then
        Encontro:= True
    Else 
        Encontro:= False;
    encuentraPalabra:= Encontro;
End;

Function posFinal (Posicion,Frontera:Integer):Integer;
var
    posF:Integer;
Begin
    posF:= (posicion + Frontera)-1;
    posFinal:= posF;
End;

Procedure corrimiento (var Matriz:Mat; Frontera,posI:Integer);
var
    I,J,pos,posFin:Integer;
    Aux:Char;
Begin
    pos:= posI;
    posFin:= posFinal(pos,Frontera);
    For I:= Inicio to Frontera do 
        Begin
            Aux:= Matriz[posFin,posFin];
            For J:= posFin downto Inicio do 
                Matriz[J,J]:= Matriz[J-1,J-1];
            Matriz[Inicio,Inicio]:= Aux;
        End;
End;

Procedure palabra (var Matriz:mat; Arr:Arreglo; Frontera:Integer; var posInicial:Integer);
var
    Fi,Co:Integer;
    Esta:Boolean;
Begin
    Fi:= Inicio;
    Co:= Inicio;
    Esta:= False;
    While (Fi <= maxFila) and (Esta <> True) do
        Begin
            If (Matriz[Fi,Fi] = Arr[Co]) then
                Esta:= encuentraPalabra(Matriz,Arr,Frontera,Fi);
            Fi += 1;
        End;
        posInicial:= Fi-1;
    If (Esta = True) then
        Corrimiento(Matriz,Frontera,posInicial)
    Else 
        Writeln();
        writeln('El arreglo no esta en la matriz');
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
            Writeln();
        End;
End;

Procedure ImprimirArreglo (Arr:Arreglo);
Var
    I:Integer;
Begin
    For I:= Inicio To maxArr Do
        Write(Arr[I], ' ');
End;

//Programa Principal
var
    Arr:Arreglo;
    Matriz:Mat;
    Frontera,posicionInicial:Integer;
Begin
    Randomize;
    Frontera:= 0;
    posicionInicial:= 0;
    cargaMatriz(Matriz);
    Writeln('Esta es la matriz: ');
    Imprimir(Matriz);
    Writeln();
    cargaArreglo(Arr,Frontera);
    Write('Este es el arreglo: ');
    ImprimirArreglo(Arr);
    Palabra(Matriz,Arr,Frontera,posicionInicial);
    Writeln();
    Imprimir(Matriz);
End.