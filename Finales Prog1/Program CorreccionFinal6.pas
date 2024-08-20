Program Final6;
//Se tiene un matriz de MaxF*MaxC caracteres llamada Letras.Dado un carácter Car 
//leido por pantalla, se pide que se detecte la repetición consecutiva de ese 
//carácter de mayor longitud de toda la matriz ( hacer la búsqueda por columna) y 
//desplazarla hacia el final de la columna donde se encuentra, produciendo un
//corrimiento hacia arriba de los caracteres posteriores a la secuencia detectada. 
//Si hay más de una secuencia de mayor longitud tomar la primera que se detecta. Se 
//pide que realice el Diagrama de Estructuras y el código pascal para resolver el 
//problema. No pueden utilizarse estructuras auxiliares. Es fundamental realizar 
//una buena modularización. Codifique en programa principal asumiendo que Letras 
//está cargada.

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 8;
    maxCol = 7;
    maxArr = 1;
    
Type mat = array [Inicio..maxFila,Inicio..maxCol] of char;
    Arr = Array [Inicio..maxArr] of Char;
    
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
                    Write(Matriz[Fi,Co], ' | ');
                End;
            Writeln;
        End;
End;

Procedure cargaCaracter (var Arreglo:Arr);
var
    I:Integer;
Begin
    I:= Inicio;
    Writeln('Ingrese el caracter: ');
    Readln(Arreglo[I]);
End;

Function Longitud (posI,posF:Integer):Integer;
var
    Long:Integer;
Begin
    Long:= (posF-posI)+1;
    Longitud:= Long;
End;

Procedure buscaCaracter (Matriz:Mat; Arreglo:Arr; var posF:Integer; Fi,Co:Integer);
var
    Fila,I:Integer;
Begin
    Fila:= Fi;
    I:= Inicio;
    While (Fila <= maxFila) and (Matriz[Fila,Co] = Arreglo[I]) do 
        Begin   
            Fila += 1;
        End;
    If (Fila > maxFila) or (Matriz[Fila,Co] <> Arreglo[I]) then
        posF:= Fila-1
    Else
        If (Fila = Fi) then
            posF:= -1;
End;

Procedure desplazarCaracter (var Matriz:mat; Arreglo:Arr; posI,posF,Co:Integer);
var
    I,J:Integer;
    Aux:Char;
Begin
    For I:= posF+1 to maxFila do 
        Begin
            Aux:= Matriz[maxFila,Co];
                For J:= maxFila downto Inicio do 
                    Begin
                        Matriz[J,Co]:= Matriz[J-1,Co];
                    End;
            Matriz[Inicio,Co]:= Aux; 
        End;
End;

Procedure detectaYOrdena (var Matriz:mat; Arreglo:Arr);
var
    I,J,Co,auxF,posI,posF,MayorLong,Compara:Integer;
Begin
    I:= Inicio;
    J:= Inicio;
    auxF:= Inicio;
    MayorLong:= 0;
    While (J <= maxCol) do 
        Begin
            I:= Inicio;
            While (I <= maxFila) do 
                Begin
                    Writeln('soy elemento actual: ', Matriz[I,J]);
                    Writeln('soy Fila actual:', I);
                    Writeln('soy columna actual: ', J);
                    If (Matriz[I,J] = Arreglo[Inicio]) then
                        Begin
                            Writeln('A PARTIR DE ACA BUSCO secuencia;');
                            buscaCaracter(Matriz,Arreglo,auxF,I+1,J);
                            Writeln('fila limite de la secuencia');
                            If (auxF <> I) then
                                Begin
                                    Compara:= Longitud(I,auxF);
                                    Writeln('soy compara: ', Compara);
                                    Writeln('soy Fila:', I);
                                    Writeln('soy columna: ', J);
                                    Writeln('soy auxF: ', auxF);
                                    If (Compara > MayorLong) then
                                        Begin
                                            MayorLong:= Compara;
                                            posI:= I;
                                            posF:= auxF;
                                            Co:= J;
                                        End;
                                    I:= auxF+1;
                                End
                            Else
                                I += 1;
                        End
                    Else
                        I += 1;
                End;
            J += 1;
        End;
    Writeln('soy posI: ', posI);
    Writeln('soy posF: ', posF);
    Writeln('soy la columna: ', Co);
    desplazarCaracter(Matriz,Arreglo,posI,posF,Co);
End;

//Programa Principal
var
    Letras:Mat;
    Car:Arr;
Begin
    cargaMatriz(Letras);
    Imprimir(Letras);
    cargaCaracter(Car);
    detectaYOrdena(Letras,Car);
    Writeln;
    Imprimir(Letras);
End.