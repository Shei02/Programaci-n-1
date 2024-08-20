program parcial

const
    maxLET = 10;
    maxPAT = 2;
    
type
    tipoLET = array [1..maxLET] of char;
    tipoPAT = array [1..maxPAT] of char;

function verifica(arreglo:tipoLET; patron:tipoPAT; InicioBusqueda:integer):boolean;
var
    i, posPatron:integer;
    encontro: boolean;
begin
//inicia desde la primier ocurrencia de letras que viene por parametro 
    i:= inicioBusqueda;
    posPatron:= 1;
    encontro:= false;
    while (posPatron <= maxPAT) and (arreglo[i] = patron[posPatron]) do
    begin
        i += 1;    
        posPatron += 1;
    end;
//Recorrio todo el patron por lo que se encuentra contenido
    if (posPatron - 1) = maxPAT then
        encontro:= true
        else
            encontro:= false;
//uso la variable encontro para no usar la funcion recursivamente
    verifica:= encontro;
end;

function posFinalPatron(longPatron, posInicio:integer):integer;
begin
{No se justifica mucho la funcion posFinalPatron, cuando es una sola cuenta
conviene asignarla directamente a la variable.}
    posFinalPatron:= (posInicio + longPatron - 1);
end;

procedure corrimiento(var arreglo:tipoLET; posInicio:integer);
var
    i, j:integer;
    datoTemp:char;
begin
    datoTemp:= 't'; //solo por inicializarlo
    
//numero de veces que hara el corrimiento
    for i:= 1 to maxPAT do
    begin
        datoTemp:= arreglo[posFinalPatron(maxPAT, posInicio)];
//recordar que se entra al corrimiento cuando ya se midieron los limites del arreglo
        for j:= posFinalPatron(maxPAT, posInicio) downto 2 do
        {Convendria usar constantes tambien para el limite inferior de los arreglos
        es decir que quede 'downto minLET + 1'}
            arreglo[j]:= arreglo[j-1];
        arreglo[1]:= datoTemp;
    end;
end;
//posibles mensajes resultantes
procedure imprimirResultado(reps:integer);
begin
    if reps > 0 then
    begin
        if reps = 1 then
            writeln('Esta ', reps, ' vez')
            else
                writeln('Esta ', reps, ' veces, toma solo la primera ocurrencia');
    end
    else
        writeln('No se encontro el patron');
end;

procedure buscaPatron(var arreglo:tipoLET; patron:tipoPAT);
var
    i, repeticiones:integer;
    encontro:boolean;
begin  
    encontro:= false;
    i:= 1;
    repeticiones:= 0;
//no se encontro el patron pero sabemos su longitud a partir de la pos actual
    while (posFinalPatron(maxPAT, i) <= maxLEt) do
    //aca quedaria mas claro si la condicion fuera algo como
    //'i <= maxLET - longPatron + 1', ademas asi no tenes que llamar a la funcion en cada iteracion
    begin
        if arreglo[i] = patron[1] then
        begin
            encontro:= verifica(arreglo, patron, i);
//si lo encuentra aumenta el contador y para la primer ocurrencia hace el corrimiento
            if encontro then
            begin
                repeticiones += 1;
                if repeticiones = 1 then
                    corrimiento(arreglo, i);
//cada que encuentre un patron saltara esos espacios, teniendo en cuenta que despues se suma una pos
                i:= i + maxPAT - 1;
            end;
        end;
        i += 1;
    end;
    imprimirResultado(repeticiones);
end;

var
    carac:tipoLET;
    patron:tipoPAT;
begin
    //Se asume la carga
    buscaPatron(carac, patron);
    //Se asume que imprime el arreglo resultante
end.