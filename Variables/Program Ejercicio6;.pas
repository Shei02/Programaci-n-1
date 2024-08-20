Program Ejercicio6;
//Con el programa anterior, compara la cantidad de dias entre dos fechas 
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

Procedure Diferencia(A1,M1,D1,A2,M2,D2:Integer; var Dif:Integer);
Begin
 Dif:=0;
  
 While A1<>A2 do
   Begin
    A1:= A1+1;
    Dif:= Dif + 360;
   End;
      While M1<>M2 do
        Begin
          M1:= M1 + 1;
          Dif:= Dif + 30;
        End;
          While D1<>D2 do
            Begin
               D1:= D1 + 1;
               Dif:= Dif + 1;
            End;
End;
 

var 
  A1, M1,D1, A2, M2, D2, Dif:Integer;
  Resultado:Boolean;

Begin
  Dif:= 0;
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
  If Resultado=False then
   Begin
    Diferencia(A2,M2,D2,A1,M1,D1,Dif);
    Writeln('La diferencia es: ', Dif);
   End    
  Else
   Begin
    Diferencia(A1,M1,D1,A2,M2,D2,Dif);
    Writeln('La diferencia es: ', Dif);
   End;
End.