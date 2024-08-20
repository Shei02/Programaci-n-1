Program ArregloCuatro;
//Realice un procedimiento ó función(según sea lo mas adecuado) de búsqueda binaria que
//devuelva la posición de un elemento en un arreglo ordenado. Sino está el elemento devuelve -1

Uses Crt;
Const
    Min = 1;
    Max = 100;
    
Type ArrBinario= Array[Min..Max] of Integer;

Procedure CargarElementos(var Arreglo:ArrBinario);
var
    I,Dato:integer;
Begin
    I:= Min;
    Dato:= 1;
        For I:= Min to Max do
        Begin
            Arreglo[I]:= I*5;
        End;
    For I:= Min to Max do
        Begin
            TextColor(Yellow);
            Write(Arreglo[I],'-');
        End;
End;

Function BusquedaBinaria(Arreglo:ArrBinario):Integer;
var 
  Inicio,Medio,Fin,Elemento,Pos,Aux:Integer;
Begin
    Pos:= -1;
    Inicio:= Min;
    Fin:= Max ;
    Textcolor(White);
    Writeln(#10'Ingrese un Elemento: ');
    TextColor(LightBlue);
    Readln(Elemento);
    Aux:= 0 ;
    Medio:= 1;
    While (Medio <> Aux) do
        Begin
            Medio:= (Inicio + Fin) div 2;
            If Fin < Inicio Then
                Medio:= Aux
            Else 
                If Elemento > Arreglo[Medio] Then
                    Inicio:= Medio +1
                Else
                    If Elemento < Arreglo[Medio] Then
                        Fin:= Medio -1
                    Else
                        If Elemento = Arreglo[Medio] Then
                            Begin  
                                Pos:= Medio;
                                Medio:= Aux;
                            End;
        End;
        BusquedaBinaria:= Pos;
End;
   
var
    Arreglo:Arrbinario;
    Resultado:Integer;
Begin
    CargarElementos(Arreglo);
    Resultado:= BusquedaBinaria(Arreglo);
    Writeln('El Elemento Esta en la Poscicion: ');
    Writeln(Resultado);
End.