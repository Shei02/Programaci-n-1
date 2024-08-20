const

    min = 1;
    max = 10;

type m = array[min..max,min..max] of char;
     palabra = array[1..5] of char;

procedure cargarRandom(var mat:m);
var i,j: integer;
begin
    randomize;
    for i:=min to max do
        for j:=min to max do
            mat[i,j]:=char(random(26)+97);
end;

procedure print(mat:m);
var i,j: integer;
begin
    for i:=min to max do begin
        for j:=min to max do
            write(mat[i,j], ' ');
        writeln();
    end;
end;

procedure corrimiento(var mat:m; PosInicial:integer);
var i,j:integer;
    aux: char;
begin
    aux:= mat[PosInicial,PosInicial];
    for i:=PosInicial to max-1 do
        mat[i,i]:=mat[i+1,i+1];
    mat[max,max]:=aux;
end;

function encontrarPosInicial(mat:m; buscar:palabra):integer;
var i,j: integer;
begin
    i:=min;
    j:=1;
    while (i <= max) and (j<=5) do begin
        j:=1;
        while (i <= max) and (j<=5) and (mat[i,i] = buscar[j]) do begin
            i:=i+1;
            j:=j+1;
        end;
        i:= i+1;
    end;
    if (j > 5) then
        encontrarPosInicial:= i-j
    else
        encontrarPosInicial:=-1;
end;

procedure cumplirEjercicio(var mat:m; palabrasss:palabra);
var PosInicial,i :integer;
begin
    PosInicial:= encontrarPosInicial(mat, palabrasss);
    if (PosInicial <> -1) then
        for i:=1 to 5 do
            corrimiento(mat,PosInicial);
end;


var
    mat: m;
    palabrasss:palabra;

begin
    cargarRandom(mat);
    print(mat);
    readln(palabrasss);
    cumplirEjercicio(mat,palabrasss);
    print(mat);
end.