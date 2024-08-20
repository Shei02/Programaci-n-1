Program Arreglo5A;
//Realizar un procedimiento ó función(según sea lo mas adecuado) que retorne el máximo número
//de un arreglo de enteros desordenado

const 
    Min = 0;
    Max = 100;
    Disernible = -1;
type TArregloInt= Array[Min..Max] of integer;

function ElementoMayor(Arr:TArregloInt):Integer;

var
    I,Dato,Menor,Mayor:Integer;
begin
    I:=Min;
    While (I <= Max) and (Dato <> Disernible) do
    Begin
        writeln('Ingrese Datos: ');
        readln(Dato);
        Arr[I]:= Dato;
        I+= 1;
    end;
    Menor:= Arr[1];
    Mayor:= 1;
    for I:= Min to Max do
        if (Arr[I] > Menor) then
            begin
                Menor:= Arr[I];
                Mayor:= Arr[I];
            end;
    ElementoMayor:=(Menor or Mayor);
end;
var
    Arr:
    TArregloInt;
    Resultado: Integer;
begin
    Resultado:= ElementoMayor(Arr);
    writeln('Resultado');
    writeln(Resultado);
end.