Program E;

const
   min=1;
   max=5;
   
type 
    Arreglo = array [min..max] of char;
    ArregloEnteros = array [min..max] of Integer;
    
procedure CargarArreglo (var Valores:Arreglo);
var 
    i:integer;
begin
   i:=1;
    while (i<=max) do begin
        Write('Ingrese un valor: ');
        Readln(Valores[i]);
        i:=i+1
    end;
end;

procedure imprimirarreglo (var Valores:arreglo);
var i:integer;
begin
    i:=1;
    for i:= min to max do
     Write(Valores[i],'-');
end;

procedure imprimirarregloEnt (var PosNuevas:arregloEnteros);
var i:integer;
begin
    i:=1;
    for i:= min to max do
     Write(PosNuevas[i],'-');
end;


Function CantidadDeVeces (Valores:Arreglo):integer;
var Suma,i:Integer;
begin
        Suma:= 0;
        For i:= 1 to Max do begin
            Suma:= Suma + 1;
        end;
        CantidadDeVeces:= Suma
end;

procedure AsignarPosNuevas( Valores:Arreglo; var PosNuevas:ArregloEnteros);
var CantDeVeces,i,j,Suma:Integer;
begin
        CantDeVeces:= CantidadDeVeces(Valores);
        i:= 1;
        j:= 1;
        while (CantDeVeces > 0) do begin
          Suma:= 1;
          For i:= 1 to Max do begin
            if Valores [i] < Valores[j] then begin
                suma:= Suma + 1;
            end;
          end;
            PosNuevas[j]:= Suma;
            CantDeVeces:= CantDeVeces - 1;
            i:= 1;
            j:= j + 1;
        end;
end;

var Valores:Arreglo;
    PosNuevas:ArregloEnteros;
begin
    cargararreglo(Valores);
    ImprimirArreglo(Valores);
    AsignarPosNuevas(Valores,PosNuevas);
    writeln();
    ImprimirArregloEnt(PosNuevas);
end.