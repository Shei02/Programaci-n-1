Program Ejercicio3;
//Este programa invierte el mensaje que se encuentra entre parentesis de un arreglo, y a su ves 
//cambia los parentesis por comas, mostrando el mensaje correctamente en un segundo arreglo.

Const 
    Inicio = 1;
    Fin = 100;
    Discernible = '/';
    Blanco = ' ';

Type 
    Vector = Array [Inicio..Fin] of Char;
    
Procedure Carga (var Arreglo1:Vector; var Frontera:Integer);
var
    I:Integer;
    Dato:Char;
Begin
    I:=Inicio;
    Dato:= '0';
    While (I < Fin) and (Dato <> Discernible) do
        Begin
            Write('Ingrese datos al arreglo: ');
            Readln(Dato);
            Arreglo1[I]:= Dato;
            I += 1;
        End;
    Frontera:= I-2;
End;

Procedure ImprimirMensaje(var Arreglo1:Vector; Frontera:Integer);
Var
    I:Integer;
Begin
    Writeln('Desifrando...');
    For I:= Inicio to Frontera do
        Write(Arreglo1[I], ' ');
End;

Procedure DevuelveParentesis (Arreglo1:Vector; Var PosI, PosF:Integer; Frontera:Integer);
var 
    I:Integer;
Begin
    I:= Inicio;
    While (I <= Frontera) and (Arreglo1[I] <> '(') do
        I += 1;
            
    If (Arreglo1[I] = '(') then   
        PosI:= I;
    While (I <= Frontera) and (Arreglo1[I] <> ')' ) do
        I += 1;
        
    If (Arreglo1[I] = ')') then
        PosF:= I;
End;

Procedure Cambiar(var Arreglo1:Vector; PosI, PosF:Integer);
Begin
    Arreglo1[PosI]:= Blanco;
    Arreglo1[PosF]:= Blanco;
End;

Procedure InvertirMens (var Arreglo1:Vector; PosI,PosF, Frontera:Integer);
var
    I,J:Integer;
    Aux:Char;
Begin
    Cambiar(Arreglo1, PosI, PosF);
    PosI += 1;
    PosF -= 1;
    While (PosI < PosF) do
        Begin
            Aux:=Arreglo1[PosI];
            Arreglo1[PosI]:=Arreglo1[PosF];
            Arreglo1[PosF]:=Aux;
            PosI += 1;
            PosF -= 1;
        End;
End;

Procedure CodificarMens(var Arreglo2:Vector; Arreglo1:Vector; Frontera:Integer);
Var
    I:Integer;
Begin
    I:=Inicio;
    While (I <= Frontera) do
        Begin
            Arreglo2[I]:= Arreglo1[I];
            I += 1;
        End;
End;

Procedure Resolver (Var Arreglo2:Vector; Arreglo1:Vector; Frontera:Integer);
var
    I, PosI, PosF:Integer;
Begin
    I:=Inicio;
    PosI:= Inicio;
    PosF:= 0;
    While (I < Frontera) do
        Begin
            DevuelveParentesis(Arreglo1, PosI, PosF, Frontera);
            InvertirMens(Arreglo1, PosI, PosF, Frontera);
            I += 1;
            PosI:= PosF;
        End;
    CodificarMens(Arreglo2, Arreglo1, Frontera);
End;

Procedure Imprimir(Arreglo2:Vector; Frontera:Integer);
var
    I:Integer;
Begin
    For I:= Inicio to Frontera do
        Write(Arreglo2[I], ' ');
End;

Var
    MensajeIn, SecretoOut:Vector;
    Frontera:Integer;
Begin
    Frontera:= 0;
    Carga(MensajeIn, Frontera);
    ImprimirMensaje(MensajeIn, Frontera);
    Resolver(SecretoOut,MensajeIn, Frontera);
    Imprimir(SecretoOut, Frontera);
End.