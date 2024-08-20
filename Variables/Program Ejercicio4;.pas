Program Ejercicio4;
//este programa realiza la suma de una fila, y el conteo de otra
//y luego divida la suma por la cantidad de la otra fila
{$INCLUDE/IntroProg/Estructu}

Procedure Suma(Cheque:Fila; var Total:Integer);
Begin
  While not FilaVacia(Cheque) do
    Begin
       Total:= Total + Primero(Cheque);
       Extraer(Cheque);
    End;
End;

Procedure Contador(Socios:Fila; var Cant:Integer);
var
  Pos:Integer;
Begin
 Pos:= 1;
  While not FilaVacia(Socios) do
    Begin
      Cant:= Cant + Pos;
      Extraer(Socios);
    End;
End;

Procedure Divicion (var Monto:Integer; Cheque , Socios:Fila; Total, Cant:Integer);
Begin
   Suma(Cheque, Total);
   Contador(Socios,Cant);
   Monto:= Total div Cant;
End;

var
  Cheque, Socios:Fila;
  Monto, Total, Cant:Integer;
Begin
  Total:= 0;
  Cant:= 0;
  Monto:= 0;
  ReadFila(Cheque);
  ReadFila(Socios);
  Divicion(Monto, Cheque, Socios, Total, Cant);
  Write('Cada socio recibira un monto de: ');
  Writeln(Monto);
End.