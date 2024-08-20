Program Arreglo11;

Const
  Inicio = 1;
  Fin=100;
  Discernible = -1;
Type Capicuas = Array[Inicio..Fin] of Integer;

Procedure Carga (var Arreglo:Capicuas; var Frontera:Integer);
var 
     I:Integer;
     Dato:integer;
Begin
    I:= 1 ;
    While (I<= Fin) and (Dato <> Discernible) do
    Begin
        Write('Ingrese un elemento: ');
        Readln(Dato);
        Arreglo[I]:=Dato;
        I:= I + 1;
    End;
    Frontera:= I - 2;
End;

Function Capicua(Arr:Capicuas; Frontera:Integer):Boolean;
var 
    InicioI:Integer;
    Medio:Integer;
    Resultado:Boolean;
Begin
    Capicua:= True;
    InicioI:= 1;
    Medio := (Inicio + Frontera) div 2;
        While (InicioI <= Frontera) do
        Begin
            If (Arr[InicioI] <> Arr[Frontera]) then
                Capicua := False;
                InicioI += 1;
                Frontera := Frontera - 1;
        End;
End;

var
    Arreglo:Capicuas;
    Frontera:Integer;
    ResultadoFinal:Boolean;
Begin
    Carga(Arreglo,Frontera);
    ResultadoFinal:= Capicua(Arreglo,Frontera);
    If (ResultadoFinal = True) then
        Writeln('El numero ingresado es capicua')
    Else
        Writeln('El numero ingresado no es capicua');
End.