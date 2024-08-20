Program Repaso6
Uses Crt;
Const
    MaxEnt= 100;
    Discernible = -1;
    
Type
    SecNumeros = Array[1..MaxEnt] of Integer;
    
Procedure Carga(var Arreglo:SecNumeros; var Frontera:Integer);
var 
    I,Dato:Integer;
Begin
    I:=1;
    Dato:= 0;
    While (I <= MaxEnt) and (Dato <> Discernible) do
        Begin
            Writeln('Ingrese datos al arreglo: ');
            Read(Dato);
            Arreglo[I]:=Dato;
            I += 1;
        End;
    Frontera:= I - 2;
End;

Function Sumatoria (Arreglo:SecNumeros;PosI,Posf:Integer):Integer;
Var 
    I,Suma:Integer;
Begin
    Suma:= 0 ;
    For I := PosI to PosF do
        Suma := Suma + Arreglo[I];
    Sumatoria:= Suma;
End;

Procedure BuscaOtraSec(Arreglo:SecNumeros; var PosI,Posf:Integer;PosActual,Frontera:Integer);
var
    I:Integer;
Begin
    I:= PosActual;
    PosI:= PosActual;
    While (I <= Frontera) and (Arreglo[I] <> 0) do
        I += 1;
    PosF:= I - 1;
End;

Procedure BuscaMenor(Arreglo:SecNumeros; var PosI,PosF:Integer; Frontera:Integer);
var
    I, SecMenor,Suma,PosIAux,PosFAux:Integer;
Begin
    I:= 1;
    PosIAux:= 1;
    PosfAux:= 1;
    While(I <= Frontera) and (Arreglo[I] = 0) do
        I+= 1; 
    BuscaOtraSec(Arreglo,PosIAux,PosFAux,I,Frontera);
    
    SecMenor:= Sumatoria(Arreglo,PosIAux,PosFAux);
    PosI:= PosIAux; 
    PosF:= PosFAux;
    While (I <= Frontera) do
    Begin
        If (Arreglo[I] <> 0) then
        Begin
            BuscaOtraSec(Arreglo,PosIAux,PosFAux,I,Frontera);
            Suma:= Sumatoria(Arreglo,PosIAux,PosFAux);
            If (Suma < SecMenor) then
                Begin
                    SecMenor:= Suma;
                    PosI:= PosIAux;
                    PosF:= PosFAux;
                End;
            I:= PosFAux;       
        End;
        I+= 1;
    End;
End;

Function Longitudes(Arreglo:SecNumeros; PosI,PosF:Integer):Integer;
var
    Long:Integer;
Begin
    Long:=(PosF-Posi + 1);
    Longitudes:= Long;
End;

Procedure Corrimiento (var Arreglo:SecNumeros; PosI,PosF,Frontera:Integer);
var
    I,J,Guarda:integer;
Begin
    If (Arreglo[1] <> 0) and (PosI <> 1) then
        Begin
            TextColor(Blue);
            For I:= PosI - 1 downto 2 do
                Arreglo[I]:= Arreglo[i-1];
            Arreglo[1]:= 0; // Le Pongo Color Rojo Cuando utiliza Este caso 
    End;
    For I:= 1 to Longitudes(Arreglo,PosI,PosF) do
        Begin
            Guarda:= Arreglo[PosF];
            For J:= PosF downto 2 do
                Arreglo[J]:= Arreglo[J-1];
            Arreglo[1]:= Guarda;
        End;
End;

Procedure Imprimir(Arreglo:SecNumeros;Frontera:Integer);
var 
    I:Integer;
Begin   
    For I:= 1 to Frontera do
        Write(Arreglo[I] ,'|');
End;

var
    Arreglo:SecNumeros;
    PosI,PosF,Frontera:Integer;
Begin
    PosI:= 1;
    PosF:=1;
    Frontera:= 0;
    Carga(Arreglo,Frontera);
    BuscaMenor(Arreglo,PosI,PosF,Frontera);
    Corrimiento(Arreglo,PosI,PosF,Frontera);
    Imprimir(Arreglo,Frontera);
End.