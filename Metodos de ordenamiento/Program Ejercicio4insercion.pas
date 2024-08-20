Program Ejercicio4insercion
//Ordenar un arreglo de numeros pares e impares, de forma tal que 
//todos sus numeros impares queden al principio ordenados de mayor a menor y sus 
//numeros pares queden en el final ordenados de menor a mayor.

Const   
    Inicio = 1;
    Fin = 100;
    Discernible = -1;

Type    
    TipoNumeros = Array [Inicio..Fin] of Integer;

Function BuscaFrontera(Arreglo:TipoNumeros):Integer;
var 
    Pos:Integer;
Begin
    Pos:= Inicio;
    While (Arreglo[Pos] <> Discernible) and (Pos <= Fin) do
        Pos += 1;
    BuscaFrontera:= Pos - 1;
End;

Procedure Carga(var Arreglo:TipoNumeros);
var 
    I, Dato:Integer;
Begin
    I:= Inicio;
    While (I <= Fin) and (Dato <> Discernible) do
    Begin
        Write('Ingrese elemento: ');
        Readln(Dato);
        Arreglo[I]:= Dato;
        I += 1;
    End;
End;

Procedure OrdenarInsercion(var Arreglo:TipoNumeros);
var 
    I,J,Insert,Pos, Aux:Integer;
Begin
    I:= Inicio;
    Insert:= 0;
    For I:= 1 to BuscaFrontera(Arreglo) - 1 do
    Begin
        Insert:= Arreglo[I];
        J:= I - 1;
        While (J >= Inicio) and (Arreglo[I] > Insert) do
        Begin
            Arreglo[J+1]:= Arreglo[J];
            J -= 1;
        End;
        Arreglo[J+1]:= Insert;
    End;
End;

Procedure Impares(var Arreglo:tipoNumeros);
var 
    I, Frontera, Pos, Aux:Integer;
Begin
    Frontera:= BuscaFrontera(Arreglo);
    Pos:=1;
    While (Pos <= Frontera) do
        If (Arreglo[Pos] Mod 2) <> 0 then
            Begin
                Aux:= Arreglo[Pos];
                For I:=Pos downto Inicio+1 do
                    Arreglo[I]:= Arreglo[I-1];
                Arreglo[Inicio]:= Aux;
                Pos+=1;
            End
            Else
                Pos+=1;
End;

var 
    MaxEnteros:TipoNumeros;
    I:Integer;
Begin
    Carga(MaxEnteros);
    OrdenarInsercion(MaxEnteros);
    I:=Inicio;
    While I <= BuscaFrontera(MaxEnteros) do
    Begin
        Write(MaxEnteros[I], ' | '); 
        I+=1;
    End;
    Writeln('');
    
    Impares(MaxEnteros);
    I:=1;
    While I <= BuscaFrontera(MaxEnteros) do
    Begin
        Write(MaxEnteros[I], ' | '); 
        I+=1;
    End;
End.