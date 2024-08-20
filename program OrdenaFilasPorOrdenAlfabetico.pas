program OrdenaFilasPorOrdenAlfabetico

{este programa ordena filas alfabéticamente como si fueran palabras}


const
    minimo=1;
    maxFila=6;
    maxColumna=6; {simbólico}
    nulo= 'b';

    
type tipoMatriz= array[minimo..maxFila,minimo..maxColumna] of char;
{estipulo dimensiones}


procedure imprimirMatriz(mat: tipoMatriz);
{este procedimiento imprime una matriz dada}
var
    i,j: integer;
begin
    for i:= minimo to maxFila do begin
        writeln();
        for j:= minimo to maxColumna do begin
            write(' ',mat[i,j]);
        end;
    end;
end;


procedure cargarMatriz(var mat: tipoMatriz);
{este procedimiento carga una matriz con caracteres aleatorios}
var
    i,j: integer;
begin
    randomize;
    for i:= minimo to maxFila do
        for j:= minimo to maxColumna do
            mat[i,j]:=chr(random(26)+(97));
end;
    
    
function filaMenor(mat: tipoMatriz; fila: integer): integer;
{esta funcion detecta la fila menor alfabeticamente a partir de la fila pasada por parámetro}
// esta funcion se queda con la fila mas chica
var
    i,filaMenorActual,columna: integer;
begin
    filaMenorActual:=fila;
    for i:= (fila+1) to maxFila do begin        // voy por todas las filas
        columna:=minimo;
        if mat[i,columna]=mat[filaMenorActual,columna] then begin
            while (columna<=maxColumna) and (mat[i,columna]=mat[filaMenorActual,columna]) do
                columna:=columna+1;
            if (columna<=maxColumna) and (mat[i,columna] < mat[filaMenorActual,columna]) then
                filaMenorActual:=i;
        end else if mat[i,columna] < mat[filaMenorActual,columna] then    // si fila en y 
                filaMenorActual:=i
    end;
    filaMenor:=filaMenorActual;
end;


procedure intercambioDeFilas(var mat: tipoMatriz; fila: integer);
{este procedimiento ubica la fila menor en la primera posicion}
var
    j,fm: integer;
    aux: char;
begin
    fm:=filaMenor(mat,fila);
    for j:=minimo to maxColumna do begin
        aux:=mat[fila,j];       // guardo valor
        mat[fila,j]:=mat[fm,j]; // piso valor con la otra fila
        mat[fm,j]:=aux;         // guardo el valor en el 
    end;
end;


procedure OrdenaFilasAlfabeticamente(var mat: tipoMatriz);
{este procedimiento repite el intercambio analizando todas las filas de arriba a abajo}
var
    fila: integer;
begin
    for fila:=minimo to maxFila do
        intercambioDeFilas(mat,fila);
end;


var
    matriz: tipoMatriz;
    
begin
    cargarMatriz(matriz);
    imprimirMatriz(matriz);
    writeln();
    OrdenaFilasAlfabeticamente(matriz);
    imprimirMatriz(matriz);    
end.