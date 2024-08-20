Program Arreglo13A;
//Implementar una función/procedimiento que: a) Verifique si un arreglo está ordenado
//ascendentemente.

Const
    Inicio = 1;
    Fin = 100;
    Discernible = -1;

    
Type TipoValores= Array [Inicio..Fin] of Integer;

Procedure Carga(var Arreglo:TipoValores; var Front:Integer);
var 
I,Dato:Integer;
Begin
    While (I<= Fin) and (Dato <> Discernible) do
    Begin
        Write('Ingrese elemento: ');
        Read(Dato);
        Arreglo[I]:= Dato;
        I+=1;
    End;
    Front += 1;
End;

Function Ascendente(Arreglo:TipoValores; var Front:Integer):Boolean;
var 
I:Integer;
Begin
    Ascendente:= True;  
    I:=Inicio;
    While (Ascendente = True) and (I <= Front) do
        Begin
            If Arreglo[I] > Arreglo[I+1] then
                Ascendente:= False;
            I += 1;
            Front -= 1;
        End;
End;

var 
    Arr:TipoValores;
    Front:Integer;
Begin
    Carga(Arr, Front);
    If Ascendente(Arr, Front) then
        Writeln('El arreglo esta en orden')
    Else
        Writeln('El arreglo no esta en orden');
End.