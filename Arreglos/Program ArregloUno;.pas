Program ArregloUno;
//) Realizar un procedimiento que cargue caracteres (no más de 50) desde el teclado en un arreglo.
//El fin de la carga se detecta por el ingreso de un carácter “*”
{$INCLUDE/IntroProg/Estructu}

Const
    Inicio= 1;
    Fin= 50;
    
Type Arreglo1=Array [Inicio..Fin] of Char;

Procedure CargaArreglo (var Vector:Arreglo1);
var 
  Datos:Char;
  I:Integer;
Begin
Datos:='0';
I:=Inicio;
     While (Datos<>'*') and (I<=Fin) Do
      Begin
        Write('Ingrese un elemento: ');
        Readln(Datos);
        Vector[I]:= Datos;
        I+= 1;
      End; 
End;

Procedure Imprecion (Vector:Arreglo1);
var
  I:Integer;
Begin
  I:= 1;
  While (Vector[I]<>'*') and (I<Fin) Do
    Begin
      Writeln(Vector[I]);
      I:= I + 1;
    End;
End;

var
  Vector:Arreglo1;
Begin
  CargaArreglo(Vector);
  Writeln('Arreglo final: ');
  Imprecion(Vector);
End.