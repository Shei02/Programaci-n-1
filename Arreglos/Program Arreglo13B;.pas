Program Arreglo13B;
//Implementar una función/procedimiento que: b) Modificar el módulo para que 
//verifique si está ordenado descendentemente

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

Function Descendente(Arreglo:TipoValores; var Front:Integer):Boolean;
var 
I:Integer;
Begin
    Descendente:= True;  
    I:=Inicio;
    While (Descendente = True) and (I <= Front) do
        Begin
            If Arreglo[I] < Arreglo[I+1] then
                Descendente:= False;
            I += 1;
            Front -= 1;
        End;
End;

var 
    Arr:TipoValores;
    Front:Integer;
Begin
    Carga(Arr, Front);
    If Descendente(Arr, Front) then
        Writeln('El arreglo esta en orden')
    Else
        Writeln('El arreglo no esta en orden');
End.