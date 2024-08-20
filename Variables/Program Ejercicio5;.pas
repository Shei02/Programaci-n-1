Program Ejercicio5;
//este programa compara dos fechas y en una variable booleana dice cual es menor.
{$INCLUDE/IntroProg/Estructu}

Procedure Comparacion(A1,M1,D1, A2,M2, D2:Integer; var Resultado:Boolean);

Begin
  If A1<A2 then
   Begin
    Writeln('A1 es menor que A2');
    Resultado:= True;
   End
  Else
    If A1=A2 then
     Begin
          If M1<M2 then
            Begin
              Writeln('M1 es menor que M2');
              Resultado:= True;
            End
          Else    
            If M1=M2 then
             Begin
                  If D1<D2 then
                    Begin
                       Writeln('D1 es menor que D2');
                       Resultado:= True;
                    End
             End;       
     End;
End;

var 
 A1,M1,D1, A2,M2,D2:Integer;
 Resultado:Boolean;
Begin
  Resultado:= False;
  Write('Ingrese el año: ');
  Readln(A1);
  Write('Ingrese el mes: ');
  Readln(M1);
  Write('Ingrese el dia: ');
  Readln(D1);
  Write('Ingrese el año: ');
  Readln(A2);
  Write('Ingrese el mes: ');
  Readln(M2);
  Write('Ingrese el dia: ');
  Readln(D2);
  Comparacion(A1,M1,D1, A2, M2, D2, Resultado);
  Writeln('El resultado es: ', Resultado);
End.