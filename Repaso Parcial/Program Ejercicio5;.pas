Program Ejercicio5;
Uses Crt;

Const
    Inicio = 1;
    Fin = 50;
    Discernible = -1;
    
Type 
    TArregloINT = Array [Inicio..Fin] of Integer;
    
Procedure CargaDis (var Arreglo:TArregloINT);
var
    I:Integer;
Begin
    For I:= Inicio to Fin do
        Arreglo[I]:= Discernible;
End;

Procedure Carga (var Arreglo:TArregloINT; var Frontera:Integer);
Var
    I, Dato:Integer;
Begin
    I:= Inicio;
    Dato:= 0;
    Writeln ('Ingrese Datos: ');
    While (I <= Fin) and (Dato <> Discernible) do
        Begin
            Readln(Dato);
            Arreglo[I]:= Dato;
            I += 1;
        End;
    Frontera:= I-2;
End;

Function Sumatoria (Arreglo:TArregloINT; PosI, PosF:Integer):Integer;
var
    Suma,I:Integer;
Begin
    Suma:= 0;
    For I:= PosI to PosF do
        Suma += Arreglo[I];
    Sumatoria:= Suma;
End;

Function Longitud(PosI,PosF:Integer):Integer;
var
    Long:Integer;
Begin
    Long:= (PosF - PosI) + 1;
    Longitud:= Long;
End;

Procedure Corrimiento (var Arreglo:TArregloINT; Frontera,PosI, PosF:Integer);
var
    I, J, Long:Integer;
Begin
    Long:= Longitud(PosI, PosF);
    For I:= Inicio to Long do
        For J:= Frontera downto (PosF+1) do
            Arreglo[J]:= Arreglo[J-1];
            
    For I:= PosI to PosF do
        Arreglo[I+Long]:= Arreglo[I];
End;

Procedure ImprimirConColor(Arreglo:TarregloINT;Frontera,PosI,PosF:Integer);
var
    I:Integer;
Begin
    For I:= Inicio to Frontera do
        Begin
            If ( I >= PosI) and (I <= PosF) then
                TextColor(Red)
            Else
                TextColor(Blue);
            Write(Arreglo[I],' | ');
        End;
End;

Procedure EvaluaEImprime(Arreglo:TArregloINT; Entra, Encontro:Boolean; Frontera, PosI, PosF:Integer);
Begin
    If (Encontro=True) then
        Begin
            If ((Longitud(PosI,PosF) + PosF) <= Frontera) then
                Entra:= True;
            If (Entra = True) then
                Begin
                    Corrimiento(Arreglo, Frontera, PosI,PosF);
                    ImprimirConColor(Arreglo,Frontera,PosI,PosF);
                End
            Else
                Write('La longitud supera al limite, no es posible duplicar')
        End
    Else 
        Write('El numero ingresado no se encuentra entre las secuencias');
End;

Procedure Recorrer (var Arreglo:TArregloINT; Frontera:Integer; var PosI, PosF, Elem:Integer);
var
    I,J,AuxF,AuxI:Integer;
    Encontro, Entra:Boolean;
Begin
    Encontro:= False;
    Entra:= False;
    I:=Frontera;
    While (I >= Inicio) and (Encontro = False) do
        Begin
            J:=I;
            AuxF:= I;
            AuxI:= J;
            While (J >= Inicio) and (Encontro = False) do
                Begin
                    While (J >= Inicio) and (Sumatoria(Arreglo,J, AuxF) < Elem) do
                        Begin
                            J -= 1;
                            AuxI -= 1;
                        End;
                    If (Sumatoria(Arreglo,J,AuxF) = Elem) then
                        Begin
                            Encontro:= True;
                            PosI:= AuxI;
                            PosF:= AuxF;
                        End
                    Else
                        J:= 0;
                End;
                I -= 1;
        End;
    EvaluaEImprime(Arreglo,Entra,Encontro,Frontera,PosI,PosF);    
End;

var
    Numero:TArregloINT;
    Frontera,PosI,PosF,Elem:Integer;
Begin
    Frontera:= 0;
    Write('Ingrese un elemento: ');
    Readln(Elem);
    While (Elem < 10) do
        Begin
            Write('Por favor ingrese un valor valido: ');
            Readln(Elem);
        End;
    CargaDis(Numero);
    Carga(Numero,Frontera);
    Recorrer(Numero,Frontera,PosI,PosF,Elem);
End.