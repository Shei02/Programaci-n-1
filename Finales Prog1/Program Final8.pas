Program Final8
//se tiene la matriz MatLetras de maxfil*maxcol caracteres. Esta matriz esta 
//inicializada, sin espacios en blanco y sin ningun orden. Se pide que realize el DE
//y el codigo pascal para la siguiente solucion:
//Por cada fila, se eliminen las secuencias donde la misma letra se repita mas de una
//vez de manera consecutiva. La secuencia debe ser reemplazada solo por una de las 
//letras que se repiten, y el resto de los elementos se debe completar con espacios
//en blanco. los espacios en blanco deben quedar siempre al inicio de la fila y el 
//resto de los caracteres en el orden original
//ordenar ascendentemente la matriz por filas de acuerdo a la cantidad de espacios en
//blancos que tenga cada una.

Uses Sysutils;
Const 
    Inicio = 1;
    maxFila = 4;
    maxCol = 10;
    
Type mat = array [Inicio..maxFila,Inicio..maxCol] of Char;

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

Procedure borraLetra (var Matriz:Mat; Fi:Integer);
var
    Co:Integer;
Begin
    For Co:= Inicio to maxCol-1 do 
        If (Matriz[Fi,Co] = Matriz[Fi,Co+1]) then
            Matriz[Fi,Co]:= ' ';
End;

Procedure desplazarBlancos (var Matriz:mat; Fi:Integer);
var
    Co,I,Contador:Integer;
    Aux:Char;
Begin
    For Co:= maxCol downto Inicio+1 do
        Begin
            Contador:= maxCol-1;
            While (Matriz[Fi,Co] = ' ') and (Contador >= 0) do
                Begin
                    Aux:= Matriz[Fi,Co];
                    For I:= Co downto Inicio do
                        Matriz[Fi,I]:= Matriz[Fi,I-1];
                    Matriz[Fi,Inicio]:= Aux;
                    Contador -= 1;
                End;
        End;
End;

Procedure borraYReemplaza (var Matriz:mat);
var
    Fi:Integer;
Begin
    For Fi:= Inicio to maxFila do
        Begin
            borraLetra(Matriz,Fi);
            desplazarBlancos(Matriz,Fi);
        End;
End;

Function cuentaBlancos (Matriz:mat; Fi:Integer):Integer;
var
    Co,Cant:Integer;
Begin
    Cant:= 0;
    For Co:= Inicio to maxCol do
        Begin
            If (Matriz[Fi,Co] = ' ') then
                Cant += 1;
        End;
    cuentaBlancos:= Cant;
End;

Function filaMenor (Matriz:Mat; Fila:Integer):Integer;
var
    Fi,fiMenoractual,Aux,Co,Fil:Integer;
Begin
    Aux:= 0;
    For Fi:= Inicio to maxCol do 
        Begin
            Co:= Inicio;
            fiMenoractual:= cuentaBlancos(Matriz,Fi);
            If (Co <= maxCol) and (Aux < fiMenoractual) then
                Begin
                    Aux:= fiMenoractual;
                    Fil:= Fi;
                End;
        End;
    filaMenor:= Fil;
End;

Procedure intercambioFila (var Matriz:mat; Fi,Fil:Integer);
var
    Co:Integer;
    Aux:Char;
Begin
    For Co:= Inicio to maxCol do 
        Begin
            Aux:= Matriz[Fi,Co];
            Matriz[Fi,Co]:= Matriz[Fil,Co];
            Matriz[Fil,Co]:= Aux;
        End;
End;

Procedure Ordenar (var Matriz:mat);
var
    Fi,FM,Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do 
        Begin
            FM:= filaMenor(Matriz,Fi);
            If (FM <> Fi) then
                intercambioFila(Matriz,Fi,FM);
        End;
End;

//programa principal
var
    matLetras:mat;
Begin
    cargaMatriz(matLetras);
    Imprimir(matLetras);
    borraYReemplaza(matLetras);
    Writeln('La matriz con las letras consecutivas reemplazadas y desplazadas es: ');
    Imprimir(matLetras);
    ordenar(matLetras);
    Writeln('Matriz final: ');
    Imprimir(matLetras);
End.