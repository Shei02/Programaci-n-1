Program Arreglo13C;
//Implementar una función/procedimiento que: c)Modificar el módulo para que verifique 
//si una un arreglo está ordenado ascendentemente entre una
//posición inicial y posición final.

Const
    Inicio = 1;
    Fin = 100;
    Discernible = -1;

    
Type TipoValores= Array [Inicio..Fin] of Integer;

Procedure Carga(var Arreglo:TipoValores);
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
End;

Function Creciente(Arreglo:TipoValores;Inicio,Fin:Integer):Boolean;
var 
I:Integer;
Begin
    Creciente:= True;  
    I:=Inicio;
    While (Creciente = True) and (I <= Fin) do
        Begin
            If Arreglo[I] > Arreglo[I+1] then
                Creciente:= False;
            I += 1;
        End;
End;

var 
    Arr:TipoValores;
    PosI, PosF:Integer;
Begin
    Carga(Arr);
    Writeln('Ingrese posicion inicial: ');
    Read(PosI);
    Writeln('Ingrese posicion final: ');
    Read(PosF);
    If Creciente(Arr, PosI, PosF) then
        Writeln('El arreglo esta en orden')
    Else
        Writeln('El arreglo no esta en orden');
End.