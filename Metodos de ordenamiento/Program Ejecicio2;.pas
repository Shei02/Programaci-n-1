Program Ejecicio2;
//Realizar un procedimiento que tome un arreglo VALORES y genere el arreglo POSNUEVAS de
//manera que estas posiciones permitan acceder a los elementos de valores en forma ordenada
//ascendente

Const
    Min = 1;
    Max = 20;
    Disernible = '*'; 

Type
    TArregloChar = Array [Min..Max] of Char;
    TArregloInt = Array [Min..Max] of Integer;

Procedure Carga(var ArrValores:TArregloChar; var Frontera:Integer);
var
    I:Integer;
    Dato:Char;
Begin
    I:= 1;
    Dato:= '0';
    Writeln('Digite Datos');
    While (I <= Max) and (Dato <> Disernible) do
        begin
            Readln(Dato);
            Writeln('Valor: ');
            ArrValores[I]:=Dato;
            I+= 1 ;
        End;
        Frontera:= I - 2 ;
End;

Function BuscaMenor(ArrValores:TArregloChar; Frontera:Integer):Integer;
var
    I,Pos:Integer;
Begin
    Pos:= Min;
    While (Pos <= Frontera) and (ArrValores[Pos] = '{') do
    Begin
        Pos+=1;
            For I:= (Pos + 1) to Frontera do
                Begin
                    If (ArrValores[I]  <> '{') and (ArrValores[I] < ArrValores[Pos]) and (ArrValores[I] <> ArrValores[Pos]) then
                        Pos:= I;
                End;
    End;
    BuscaMenor:= Pos;
End;

Procedure GenerarPosNueva(ArrValores:TArregloChar; var ArrPosNueva:TArregloInt; Frontera:Integer);
var
    I,posNueva:Integer;
Begin
    For I:=Min to Frontera do
        Begin
            PosNueva:= BuscaMenor(ArrValores,Frontera);
            ArrPosNueva[I]:= PosNueva;
            ArrValores[PosNueva]:= '{';
        End;
End;

Procedure Imprimir(ArrPosNueva:TArregloInt; var Frontera:Integer);
var
    I:integer;
Begin
    I:= Min;
    For I:= Min to Frontera do
        Begin
            Writeln(ArrPosNueva[I],'');
        End;
End;

Var
    ArrValores:TArregloChar;
    ArrPosNueva:TArregloInt;
    Frontera:Integer;
Begin
    Frontera:= 0;
    Carga(ArrValores,Frontera);
    BuscaMenor(ArrValores,Frontera);
    GenerarPosNueva(ArrValores,ArrPosNueva,Frontera);
    Imprimir(ArrPosNueva,Frontera);
End.