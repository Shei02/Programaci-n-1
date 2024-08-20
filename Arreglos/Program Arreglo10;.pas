Program Arreglo10;
//Realizar un procedimiento que dado un arreglo de N caracteres, carga en un arreglo de N-1
//valores booleanos, las comparaciones de los pares de valores consecutivos del primer arreglo. El
//valor booleano es en la primer posición es True si el primer carácter es menor o igual que el
//segundo, y False si es mayor

Const
  Inicio = 1;
  Fin = 100;
  Discernible = -1;
  
Type Vector=Array[Inicio..Fin] of Integer;
     Vector2= Array[Inicio..Fin-1] of Boolean;     

Procedure CargaArreglo(var Arreglo:Vector; var Arreglo2:Vector2; var Front:Integer);
var
 N, I:Integer;
Begin
  I:= Inicio;
  N:= 0;
  While (I < Fin) And (N <> Discernible) do
    Begin
        Write('Ingrese elementos: ');
        Read(N);
        Arreglo[I]:= N;
        I += 1;
    End;
    
    I:= 1;
    While (Arreglo[I] <> Discernible) and (I < Fin) do 
    Begin
      If (Arreglo[I+1] <> Discernible) then
       Begin
            Front +=1;
            If Arreglo[I] <= Arreglo[I+1] then
                Arreglo2[I]:= True
            Else
                Arreglo2[I]:= False;
        End;
    I += 1;
    End;
End;
 
Procedure ImprimirArray(Arreglo:Vector; Arreglo2:Vector2; Front:Integer);
var 
I:Integer;
begin
    for I:= Inicio to Front do
        If (Arreglo[I] <> Discernible) then
          Write(Arreglo2[I], ' ');
end;
 
var
    Arreglo:Vector;
    Arreglo2:Vector2;
    Front:Integer;
Begin
    Front:= 0;
    CargaArreglo(Arreglo, Arreglo2, Front);
    ImprimirArray(Arreglo, Arreglo2, Front);
End.