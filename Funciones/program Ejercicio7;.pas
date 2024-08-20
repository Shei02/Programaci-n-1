program Ejercicio7;
{$INCLUDE/IntroProg/Estructu}
Function CAPICUA (Numero: Pila): boolean;
var 
    PASADOR: integer; 
    AUX,  INVERTIDOS: Pila;
    Escapicua: boolean;
begin
    Escapicua:=false;
    PASADOR:=0;
    InicPila (INVERTIDOS, '');
    InicPila (AUX,'');
    while not PilaVacia (Numero) do
    begin
        PASADOR:=Tope(Numero);
        Apilar(INVERTIDOS, PASADOR);
        Apilar(AUX, Desapilar(Numero));
    end;
        
    while not PilaVacia (AUX) do
    begin
        if (Tope(invertidos) = Tope(AUX)) then
        begin
            escapicua:=true;
            Desapilar(AUX);
        end
        else
        begin
            Desapilar(AUX);
            escapicua:=false;
        end;
    end;
    CAPICUA:=Escapicua;
end;
var
    Numero: pila;
begin
    ReadPila (Numero);
    If (Capicua(Numero)= true) then
      Write('El numero es capicua')
    Else
      Write('El numero no es capicua');
end.