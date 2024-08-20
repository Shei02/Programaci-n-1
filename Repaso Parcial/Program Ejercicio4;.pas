Program Ejercicio4;
//Arreglo cargado con palabras, sin estar separadas ni en ningun orden. Los espacios que sobran del
//arreglo estan cargados con espacios en blanco (Discernible), para saber donde empieza o termina
//una palabra del arreglo, se tiene en cuenta su longitud que guarda la cantidad de posiciones que 
//ocupa cada palabra (Ejemplo: Casa ocupa 4 pos).
//Dada la posicion y palabra que el usuario ingrese se deben modificar los arreglos de palabras y de 
//Longitud de palabras e ingresar en dicha pos la nueva palabra realizando un corrmiento y tampando 
//espacios en blanco necesarios

Const
    MinCar = 1;
    MaxCar = 50;
    MinPal = 1;
    MaxPal = 50;
    Min = 1;
    Max = 50;
    Discernible = ' ';
    DisNum = -1;
Type
    TarregloCar = Array[MinCar..MaxCar] of Char;
    TarregloPal = Array[MinPal..MaxPal] of char;
    TarregloInt = Array[Min..Max] of Integer;
    
Procedure CargaDisernible(var ArrPalabras:TarregloCar; var PalabraNueva:TarregloPal);
var
    I:Integer;
Begin
    For I:=MinCar to MaxCar do
        ArrPalabras[I]:= Discernible;
    For I:= MinPal to MaxPal do
        PalabraNueva[I]:= Discernible;
End;

Procedure CargaP(var ArrPalabras:TarregloCar);
var
    I:Integer;
    Dato: Char;
Begin
    I:= MinCar;
    Dato:= '0';
    Writeln('Ingrese Palabras: ');
    While (I <= MaxCar) and (Dato <> Discernible) do
        Begin
            Readln(Dato);
            ArrPalabras[I]:= Dato;
            I += 1 ;
        End;
End;

Procedure CargaLongDis(var Longitudes:TarregloINT);
var
    I:Integer;
Begin
    For I:= Min to Max do
        Longitudes[I]:= DisNum;
End;

Procedure LongitudPalabras(var Longitudes:TarregloINT);
var
    I,Dato:Integer;
Begin
    I:= Min;
    Dato:= 0;
    writeln('Ingrese su longitud: ');
    While (I <= Max) and (Dato <> DisNum) do
        Begin
            Readln(Dato);
            Longitudes[I]:= Dato;
            I+= 1;
        End;
End;

Procedure CargaPN(var PalabraNueva:TarregloPal; var Longitudes:TarregloINT; Pos:Integer);
var
    I,Longitud:Integer;
    Dato:Char;
Begin
    Longitud:= 0;
    I:= MinPal;
    Dato:= '0';
    Writeln('Digite una palabra a insertar: ');
    While (I <= MaxPal) and (Dato <> Discernible) do
        Begin
            Readln(Dato);
            PalabraNueva[I]:= Dato;
            I+=1;
        End;
    I:= MinPal;
    while (PalabraNueva[I] <> Discernible) do
        Begin
            Longitud+= 1;
            I+= 1;
        End;
    For I:= Max downto Pos+1 do
        Begin
            Longitudes[I]:= Longitudes[I-1];
        End;
            Longitudes[Pos]:= Longitud;
End;

Function Sumatoria(Longitudes:TarregloINT; Pos:Integer):Integer;
var
    I,Suma:Integer;
Begin
    I:= Min;
    Suma:= 0;
    while (I < Pos) do
        Begin
            Suma:= Longitudes[I] + Suma;
            I += 1;
        End;
    Sumatoria:= Suma;
End;

Procedure InsertarPalabra(var ArrPalabras:TarregloCar; PalabraNueva:TarregloPal;Longitudes:TarregloINT; Pos:Integer);
var
   I,J,PosIngresar:Integer;
Begin
    posIngresar:= Sumatoria(Longitudes,Pos);
    For I:= Min to Longitudes[Pos] do
    begin
        For J:= Max downto PosIngresar +1 do
            ArrPalabras[J]:= Arrpalabras[J-1];
    End;
    For I:= Min to Longitudes[Pos] do
        ArrPalabras[PosIngresar + I]:= PalabraNueva[I];
End;

Procedure CargaGeneral(var ArrPalabras:TarregloCar; var PalabraNueva:TarregloPal; var Longitudes:TarregloINT);
Begin
    CargaDisernible(ArrPalabras,PalabraNueva);
    CargaP(ArrPalabras);
    CargaLongDis(Longitudes);
    LongitudPalabras(Longitudes);
End;

Procedure Imprimir(ArrPalabras:TarregloCar);
var
    I:Integer;
Begin
    I:= Min;
    While (I <= MaxCar) and (ArrPalabras[I] <> Discernible) do
        Begin
            Write(ArrPalabras[I],'|');
            I+= 1;
        End;
End;

var
    ArrPalabras:TarregloCar;
    PalabraNueva:TarregloPal;
    Longitudes:TarregloINT;
    Pos:Integer;
Begin
    CargaGeneral(ArrPalabras,PalabraNueva,Longitudes);
    Writeln('Ingrese una posicion a Insertar: ');
    Readln(Pos);
    CargaPn(PalabraNueva,Longitudes,Pos);
    InsertarPalabra(ArrPalabras,PalabraNueva,Longitudes,Pos);
    Imprimir(ArrPalabras);
End.