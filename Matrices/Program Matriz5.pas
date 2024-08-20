Program Matriz5
//Verificar que una matriz cuadrada de 10 elementos de lado es palíndrome 
//(capicúa en todas sus filas y columnas)
Uses Sysutils;
Const   
    Inicio = 1;
    MaxFila = 3;
    MaxColum = 3;
    
Type Mat = Array [Inicio..MaxFila,Inicio..MaxColum] of Integer;

Procedure CargaMatriz(var Matriz:Mat);
//Realiza la carga de la matriz
var
    Fi, Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        For Co:= Inicio to MaxColum do
            Begin
                Write('Ingrese valores a la matriz[' + IntToStr(Fi) + ',' + IntToStr(Co) +']: ');
                Readln(Matriz[Fi,Co]);
            End;
End;

Function Palindrome (Matriz:Mat):Boolean;
var
    Fi,Co:Integer;
    Resultado:Boolean;
Begin
    Resultado:= True;
    Fi:= Inicio;
    Co:= Inicio;
    While (Fi <= MaxFila) and Resultado do
        Begin
            While (Co <= (MaxColum div 2)) and Resultado do
                Begin
                    If (Matriz[Fi,Co] <> Matriz[Fi,MaxColum-Co+1]) then
                        Resultado:= False;
                    Co:= Co+1;
                End;
            Fi:= Fi+1;
        End;
        
        Fi:= Inicio;
        Co:= Inicio;
        While (Co <= MaxColum) and Resultado do
            Begin
                While (Fi <= (MaxFila div 2)) and Resultado do
                    Begin
                        If (Matriz[Fi,Co] <> Matriz[MaxFila-Fi+1,Co]) then
                            Resultado:= False;
                        Fi:= Fi+1;
                    End;
                Co:= Co+1;
            End;
    Palindrome:= Resultado;
End;

Procedure ImprimirMatriz(Matriz:Mat);
//Muestra la matriz final
var
    Fi,Co:Integer;
Begin
    For Fi:= Inicio to MaxFila do
        Begin
            For Co:= Inicio to MaxColum do
                Write(' | ', Matriz[Fi,Co], ' | ');
                Writeln;
        End;
End;

Var
    Matriz:Mat;
    Fi,Co:Integer;
Begin
    CargaMatriz(Matriz);
    ImprimirMatriz(Matriz);
    If (Palindrome(Matriz) = True) then
        Writeln('La Matriz es capicua')
    Else
        Writeln('La Matriz no es capicua');
End.