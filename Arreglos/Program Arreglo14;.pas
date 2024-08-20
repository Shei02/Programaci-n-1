Program Arreglo14;
//Dados dos arreglos de caracteres, TEXTO y PATRON, realizar un procedimiento/función
//(según corresponda) que devuelva la posición del inicio de PATRON dentro de TEXTO, si es que
//PATRON aparece en TEXTO, sino devuelve -1 

Const
    Inicio = 1;
    Fin = 100;
    Discernible = '/';
    
Type Letras= Array [Inicio..Fin] of Char;

Function EncontrarFrontera(Arreglo:Letras):Integer;
var 
I:Integer;
begin
    EncontrarFrontera:= 0;
    I:= 1;
    While Arreglo[i] <> Discernible do
    Begin
        EncontrarFrontera += 1;
        I += 1;
    End;
End;

Procedure Carga(var Arreglo:Letras);
var 
I:Integer;
Dato:Char;
Begin
    Dato:= 'R';
    I:= 1;
    While (I <= Fin) and (Dato <> Discernible) do
    begin
        Write('Ingrese elemento: ');
        Readln(Dato);
        Arreglo[I]:=Dato;
        I+=1;
    End;
End;

Procedure Buscar(Texto, Patron:Letras; var PosF:Integer; var SeEncuentra:Boolean);
var 
PosPatron, Frontera, Posicion, PosInterna:Integer;
Cortar:Boolean;
Begin
    SeEncuentra:=False;
    Cortar:=True;
    Frontera:= EncontrarFrontera(Texto);
    Posicion:= Inicio;
    PosPatron:= Inicio;
    
    While (Posicion <= Frontera) and (SeEncuentra <> True) do
    Begin
        PosF:= Posicion;
        PosPatron:= Inicio;
        If Texto[Posicion] = Patron[PosPatron] then
        begin
            PosInterna:= Posicion;
            PosPatron:= Inicio;
            While (PosInterna < (PosF + EncontrarFrontera(Patron))) and (Cortar = True) do
            Begin
                If Texto[PosInterna] <> Patron[PosPatron] then
                    Cortar:= False;
                PosInterna += 1;
                PosPatron += 1; 
            End;
        End;
        
        If (Cortar = False) and ((Posicion+EncontrarFrontera(Patron)) < Frontera) then
            Cortar:= True
            Else
            If (Cortar = True) then
                SeEncuentra:= True
            Else
                SeEncuentra:= False;
        Posicion += 1;
    End;
End;
    
var 
Texto, Patron:Letras;
PosF, Nulo: Integer;
SeEncuentra:Boolean;

Begin
    Nulo:= -1;
    Writeln('Carge el arreglo TEXTO');
    Carga(Texto);
    Writeln('Carge el arreglo PATRON');
    Carga(Patron);
    Buscar(Texto, Patron, PosF, SeEncuentra);
    If SeEncuentra then
        Writeln('El patron se encuentra en la posicion ', PosF)
    Else
        Writeln(Nulo);
End.