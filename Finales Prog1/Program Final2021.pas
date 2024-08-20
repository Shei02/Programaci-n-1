Program Final2021

Uses Sysutils;
Const
    Inicio = 1;
    maxFila = 8;
    maxCol = 8;
    
Type Mat = Array [Inicio..maxFila,Inicio..maxCol] of Integer;

procedure cargaMatriz (var Matriz:mat);
var
    Fi,Co:Integer;
Begin  
    For fi:= Inicio to maxFila do   
        For co:= Inicio to maxCol do 
            Begin
                If (Fi = Co) then
                    Begin
                        Write('Ingrese datos en la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                        Readln(Matriz[Fi,Co]);
                    End
                Else
                    Matriz[Fi,Co]:= -1;
            End;
End;

procedure imprimir (Matriz:Mat);
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

Function Sumatoria (Matriz:Mat; Fi,Co,posI,posF:Integer):Integer;
//Realiza la suma de la secuencia desde su posicion inicial hasta su posicion final 
var
    Suma,I:Integer;
Begin
    Suma:= 0;
    I:= Fi;
    For I:= posI to posF do 
        Suma:= Suma + Matriz[I,Co];
    Sumatoria:= Suma;
End;

Procedure buscaSec (Matriz:Mat; Fi,Co:Integer; var posI,posF:Integer);
//Busca la secuencia en la matriz y me devuelve desde donde empieza hasta donde termina 
var
    I,J:Integer;
Begin
    I:= Fi;
    J:= Co;
    While (I <= maxFila) and (J <= maxCol) and (Matriz[I,J] = 0) do 
        Begin
            I += 1;
            J += 1;
        End;
    posI:= Matriz[I,J];
    While (I <= maxFila) and (J <= maxCol) and (Matriz[I,J] <> 0) do 
        Begin
            I += 1;
            J += 1;
        End;
    posF:= Matriz[I-1,J-1];
End;

Function buscaMenor (Matriz:mat; Fi,Co,posI,posF:Integer):Integer;
//Busca el menor elemento de una secuencia y me Guardo su posicion en la matriz
var
    Menor,subFi,subCo,I:Integer;
Begin
    Menor:= 0;
    For I:= posI to posF do //desde la posInicial a la posFinal de la secuencia recorro
        Begin
            If (Matriz[I,I] > Menor) then //si es mayor a Menor
                Begin
                    Menor:= Matriz[Fi,Co]; //menor toma el valor de la matriz
                    subFi:= Fi; //guardo la fila del elemento menor
                    subCo:= Co; //guardo la columna del elemento menor
                End;
        End;
    Writeln('Estoy en la fila: ', subFi);
    Writeln('Estoy en la columna: ', subCo);
    buscaMenor:= Menor; 
End;

Procedure Reemplaza (var Matriz:Mat);
//Recorre la daigonal y reemplaza la primer ocurrencia menor de una secuencia por
//la sumatoria de dicha secuencia
var
    I,J,posI,posF,Suma,Menor,aux:Integer;
Begin
    Suma:= 0;
    Menor:= 0;
    Aux:= 0;
    I:= Inicio;
    J:= Inicio;
    While (I <= maxFila) do 
        Begin
            While (J <= maxCol) do 
                Begin
                    buscaSec(Matriz,I,J,posI,posF); //busco la secuencia 
                    aux:= Matriz[posI,posI]; //guardo el primer elemento de la secuencia encontrada
                    Suma:= Sumatoria(Matriz,I,J,posI,posF); //guardo la suma de dicha secuencia 
                    Menor:= buscaMenor(Matriz,I,J,posI,posF); //guardo el elemento menor de la secuencia
                    If (Aux = Menor) then // si el primer elemento de la sec es igual a el menor elemento encontrado en la secuencia ese se convierte en la suma
                        Aux:= Suma
                    Else  // sino avanzo en la diagonal por la secuencia 1 en fila y 1 en columna
                        posI += 1;
                End;
            //I y J toman el valor de posicion de la ultima secuencia +1 para seguir realizando los procedimeintos anteriores con la prox secuencia de la diagonal
            I:= posF+1;
            J:= posF+1;
        End;
End;

//programa Principal
var
    Matriz:Mat;
Begin
    cargaMatriz(Matriz);
    Imprimir(Matriz);
    Reemplaza(Matriz);
End.