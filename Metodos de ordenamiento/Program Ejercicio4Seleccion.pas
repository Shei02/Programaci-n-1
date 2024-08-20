Program Ejercicio4Seleccion
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

Function BuscaMenor (Arreglo:TipoNumeros; Elem:Integer):Integer;
var
    I,J:Integer;
Begin
    I:=Elem;
    For J:= Elem+1 to BuscaFrontera(Arreglo)-1 do
        If (Arreglo[J] < Arreglo[I]) then
            I:= J;
        BuscaMenor:= I;
End;

Procedure Intercambiar (Arreglo:TipoNumeros; Elem1,Elem2:Integer);
var
    Aux:Integer;
Begin
    Aux:=Elem1;
    Elem1:=Elem2;
    Elem2:=Aux;
End;

Procedure OrdenarSeleccion(var Arreglo:TipoNumeros);
var 
    I,Pos:Integer;
Begin
    I:= Inicio;
    For I:= Inicio to BuscaFrontera(Arreglo) -1 do
        Begin
            Pos:= BuscaMenor(Arreglo,I);
            If (Pos <> I) then
                Intercambiar(Arreglo, I, Pos);
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
    OrdenarSeleccion(MaxEnteros);
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