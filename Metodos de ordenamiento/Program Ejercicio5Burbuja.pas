Program Ejercicio5Burbuja
//Dado un arreglo de enteros, ordenar todos los numeros positivos en el principio
//de menor a mayor y todos los numeros negativos en el final de mayor a menor.

Const   
    Inicio = 1;
    Fin = 100;
    Discernible = 0;

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
    While (I <= Fin) And (Dato <> Discernible) do
    Begin
        Write('Ingrese elemento: ');
        Readln(Dato);
        Arreglo[I]:= Dato;
        I+=1;
    End;
End;

Procedure OrdenarBurbuja(var Arreglo:TipoNumeros);
var 
    I, Pos, Aux:Integer;
Begin
    I:= 1;
    For I:= Inicio to BuscaFrontera(Arreglo) -1 do
    Begin
        Pos:= 1;
        While (Pos < BuscaFrontera(Arreglo)) do
        Begin
            If Arreglo[Pos] < Arreglo[Pos+1] then
                Begin
                    Aux:= Arreglo[Pos];
                    Arreglo[Pos]:= Arreglo[Pos+1];
                    Arreglo[Pos+1]:= Aux;
                End;
            Pos += 1;
        End;
    End;
End;

Procedure PositivosNegativos(var Arreglo:TipoNumeros);
var 
    I, Frontera, Pos, Aux:Integer;
Begin
    Frontera:= BuscaFrontera(Arreglo);
    Pos:=1;
    While Pos <= Frontera do
        If Arreglo[Pos] > 0 then
            Begin
                Aux:= Arreglo[Pos];
                For I:= Pos downto Inicio+1 do
                    Arreglo[I]:= Arreglo[I-1];
                Arreglo[inicio]:= Aux;
                Pos+=1;
            End
            Else
                Pos+=1;
End;

var 
    MaxEnteros:TipoNumeros;
    I:Integer;

Begin
    Writeln('Carge el arreglo y use el 0 como valor discernible');
    Carga(MaxEnteros);
    OrdenarBurbuja(MaxEnteros);
    I:=1;
    While I <= BuscaFrontera(MaxEnteros) do
    Begin
        Write(MaxEnteros[i], ' | '); 
        I+=1;
    End;
    Writeln('');
    
    PositivosNegativos(MaxEnteros);
    I:=1;
    While I <= BuscaFrontera(MaxEnteros) do
    Begin
        Write(MaxEnteros[I], ' | '); 
        I+=1;
    End;
End.