Procedure OrdenarPorLongitud (var mat:matriz)
var
    fila: integer; n:integer;
begin
    for n:= 1 to max -1 do
        for fila:= min to max-1 do
            if CantidadSecuencias(mat,fila+1) > CantidadSecuencias(mat,fila) then
                IntercambiarFilas(mat,fila);
end;

Procedure bubble(var cosa:LoQueSea);
var
    PosActual,cantVeces: integer; n:integer;
begin
    for cantVeces:= 1 to max-1 do   // siendo max la dimension del arreglo
        for PosActual:= min to max-1 do
            if Criterio(PosActual) > Criterio(PosActual+1) then
                Intercambiar();
end;

procedure corrimiento(var mat:m; PosInicial:integer);
// desplazar PosInicial al final en diagonal principal
var i:integer;
    aux: char;
begin
    aux:= mat[PosInicial,PosInicial];
    for i:=PosInicial to max-1 do
        mat[i,i]:=mat[i+1,i+1];
    mat[max,max]:=aux;
end;

procedure corrimiento(var mat:m; PosInicial, fila:integer);
// desplazar PosInicial al final en una fila dada
var i:integer;
    aux: char;
begin
    aux:= mat[fila,PosInicial];
    for i:=PosInicial to max-1 do
        mat[fila,i]:=mat[fila,i+1];
    mat[fila,max]:=aux;
end;

procedure corrimiento(var mat:m; PosInicial, col:integer);
// desplazar PosInicial al final en una columna dada
var i:integer;
    aux: char;
begin
    aux:= mat[PosInicial,col];
    for i:=PosInicial to max-1 do
        mat[i,col]:=mat[i+1,col];
    mat[max,col]:=aux;
end;

