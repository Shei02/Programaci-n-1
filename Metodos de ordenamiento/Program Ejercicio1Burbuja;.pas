Program Ejercicio1;
//Ordenar un arreglo de caracteres según los siguientes métodos:
//● Burbujeo

Const 
    Min = 1;
    Max = 10;
    Disernible = '*' ;
Type
    Vector = Array[Min..Max] of Char;
    
Procedure Carga(var Arreglo:Vector; var Frontera:Integer);
var
    I:Integer;
    Dato:Char;
begin
    Dato:= '0';
    I:=Min;
    Writeln('Ingrese un elemento: ');
    While (I <= Max) and (Dato <> Disernible) do
        Begin
            Readln(Dato);
            Arreglo[I]:=Dato;
            I:= I + 1;
        End;
    Frontera:= I;
end;

Procedure OrdenarBurbuja(var Arreglo:Vector; var Frontera:Integer);
var
    I:Integer;
    J:Char;
    Ordenado:Boolean;
begin
    Ordenado:= False;
    while not(Ordenado) do
        begin
            Ordenado:= True;
                for I:= Min to (Frontera-1) do
                    Begin
                        If Arreglo[I] > Arreglo[I+1] then
                            begin
                                Ordenado:= False;
                                J:= Arreglo[I];
                                Arreglo[I]:= Arreglo[I+1];
                                Arreglo[I+1]:= J;
                            End;
                    End;
        End;
End;

Procedure Impresion(var Arreglo:Vector; Frontera:Integer);
var
    I:Integer;
Begin
    For I:= Min to Frontera do
      If (Arreglo[I] <> Disernible) and (Arreglo[I] <> '0') then
        Write(Arreglo[I], ' ');
End;

var
    Arreglo:Vector;
    Frontera:Integer;
Begin
    Frontera:= 0;
    Carga(Arreglo,Frontera);
    OrdenarBurbuja(Arreglo,Frontera);
    Impresion(Arreglo,Frontera);
End.