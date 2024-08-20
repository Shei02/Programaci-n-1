Program Ejercicio3;
////Dado un arreglo ARR_SEC de carácteres con secuencias (donde una secuencia de caracteres es
//un serie consecutiva de chars diferentes a blancos) ordenar descendentemente el arreglo en base a
//la longitud de sus secuencias de ARR_SEC.
//Metodo 

Const
    Min = 1;
    Max = 100;
    Discernible = '/';
    Blanco = ' ';
    
Type
    TarregloCHAR = Array [Min..Max] of Char;
    
Procedure Carga(var Arreglo:TArregloCHAR; var Frontera:Integer);
Var
	I: integer;
    Dato: Char;
Begin
	I:= Min;
    Dato:= '0';
    while (I <= Max) and (Dato <> Discernible) do 
    	Begin
        	Write('Ingrese un dato : ');
            Readln(Dato);
            Arreglo[I]:= Dato;
            I+=1;
        End;
    Frontera:= I - 2;
End;

Function PosInicial(Arreglo:TArregloCHAR; Frontera, Comienzo:Integer):Integer;
var
    I,PosI:Integer;
Begin
    I:=Comienzo;
    PosI:= 0;
    While (I <= Frontera) and (Arreglo[I] = Blanco) do
        I += 1;
    If (Arreglo[I] <> Blanco) then
        PosI:= I
    Else
        PosI:= -1;
    PosInicial:= PosI;
End;

Function PosFinal(Arreglo:TArregloCHAR; Frontera, PosI:Integer):Integer;
var
    I, PosF:Integer;
Begin
    I:= PosI;
    PosF:= 0;
    While (I <= Frontera) and (Arreglo[I] <> Blanco) do
            I+=1;
    If (Arreglo[I] = Blanco) then
        PosF:= I - 1
    Else
        PosF:= Frontera;
    PosFinal:= PosF;
End;

Function Long(Inicio, Fin:Integer):Integer;
Var 
    Longitud:Integer;
Begin
    Longitud:= (Fin-Inicio) +1;
    Long:= Longitud;
End;

Function CantBlancos(Arreglo:TArregloCHAR; Frontera, PosI:Integer):Integer;
var
    I, CantB:Integer;
Begin
    I:=PosI;
    While (I <= Frontera) and (Arreglo[I] = Blanco) do
        I += 1;
    CantB:= I-PosI;
    CantBlancos:= CantB;
End;

Procedure MostrarArr(Arreglo:TArregloCHAR; Frontera:Integer);
var
 	I:Integer;
Begin
	For I:= Min to Frontera do
    Begin
    	Write(Arreglo[I] , ' | ');
    End;
End;
Procedure Corrimiento(var Arreglo:TArregloCHAR; Frontera,PosIM,PosFM,PosicionInicialCorrimiento, PosFinCorr:Integer);
var	
    I,J,Longitud,Cant:Integer;
	Aux: Char;
Begin
    Longitud:= Long(PosIM,PosFM);
    Writeln('soy long corrimiento: ', Longitud);
    Writeln('soy posinicialmayor: ', PosIM);
    Writeln('soy posfinalmayor: ', PosFM);
    Writeln('soy posinicialcorr: ', PosicionInicialCorrimiento);
    Cant:= CantBlancos(Arreglo,Frontera,PosFinCorr+1);
    Writeln('Soy blancos:' , Cant);
	For I:= 1 to Longitud + Cant do
    Begin
    	Aux:= Arreglo[PosIM+I-1];
    	Writeln('caracter actual corr:' , Aux);
        For J:= PosIM+I-1 downto PosicionInicialCorrimiento+I do
            Begin
            	Arreglo[J]:= Arreglo[J-1];
            	Writeln('soy j corrimiento: ' , J);
            End;
        Arreglo[J-1]:= Aux;
        Writeln('soy j2 corrimiento: ' , J);
        MostrarArr(Arreglo,Frontera);
    End;
End;

Procedure SecMayor(Arreglo:TArregloCHAR; Frontera:Integer);
var
    I,J,LongMayor,LongActual,PosInicialMayor,PosFinalMayor,PosInicActual,PosFinActual, ActualInicio,FinActual:Integer;
    Corte:Boolean;
Begin
    I:=Min;
    Corte:=False;
    While (I < Frontera) and (not Corte) do 
        Begin
            PosInicialMayor:= PosInicial(Arreglo,Frontera,I);
            If (PosInicialMayor = -1) then
                Corte:=True
            Else
                Begin
                    PosFinalMayor:= PosFinal(Arreglo,Frontera,PosInicialMayor);
                    Writeln(PosInicialMayor);
                    Writeln(PosFinalMayor);
                    ActualInicio:= PosInicialMayor;
                    FinActual:= PosFinalMayor;
                    J:= FinActual + 1;
                    Writeln('soy frontera: ', Frontera);
                    While (J < Frontera) do
                        Begin
                            PosInicActual:= PosInicial(Arreglo,Frontera,J);
                            PosFinActual:= PosFinal(Arreglo,Frontera, PosInicActual);
                            Writeln('palabra actual: ', PosInicActual);
                            Writeln('palabra actual final: ', PosFinActual);
                            LongActual:= Long(PosInicActual,PosFinActual);
                            LongMayor:= Long(PosInicialMayor, PosFinalMayor);
                            If (LongActual > LongMayor) then
                                Begin
                                    PosInicialMayor:= PosInicActual;
                                    PosFinalMayor:= PosFinActual;
                                End;
                            J:= PosFinActual + 1;
                            Writeln('soy j: ', J);
                        End;
                    Corrimiento(Arreglo,Frontera,PosInicialMayor,PosFinalMayor,ActualInicio,FinActual);
                    I := ActualInicio + LongMayor;
                End;
        End;
End;

var
	ArrSec:TArregloCHAR;
	Frontera:Integer;
Begin
    Frontera:= 0;
	Carga(ArrSec,Frontera);
	SecMayor(ArrSec,Frontera);
    MostrarArr(ArrSec,Frontera);
End.