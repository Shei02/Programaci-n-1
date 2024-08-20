Program Ejercicio6;
{$INCLUDE/IntroProg/Estructu}

Function Mayor(Dada:Pila):Integer;
var 
    Descarte:Pila;
    Aux:Integer;
Begin
    InicPila(Descarte,'');
    Aux:= 0;
    If Not PilaVacia(Dada) Then
        Aux:= Tope(Dada);
    While Not PilaVacia(Dada) Do
        Begin
            If (Aux > Tope(Dada)) Then
                Apilar(Descarte, Desapilar(Dada))
            Else
                Begin
                    Aux:= Tope(Dada);
                    Apilar(Descarte,Desapilar(Dada));
                End;
        End;    
        Mayor:=Aux;
End;
    
Procedure Elimina_Mayor(var Dada:Pila);
var 
Descarte, EliminaMayor:Pila; 
Aux:Integer;
Begin
    InicPila(EliminaMayor, '');
    InicPila(Descarte,'');
    Aux:= Mayor(Dada);
    
    While Not PilaVacia(Dada) And PilaVacia(EliminaMayor) Do 
        Begin
            If Tope(Dada) = Aux Then 
                Apilar(EliminaMayor, Desapilar (Dada))
            Else
                Apilar(Descarte, Desapilar(Dada)); 
        End;
    
    While Not PilaVacia(Dada) Do
        Begin
            Apilar(Descarte, Desapilar(Dada));
        End;
    
    While Not PilaVacia(Descarte) Do
        Begin
            Apilar(Dada, Desapilar(Descarte));
        End;
End;

var 
Dada:Pila; 
Resultado:Integer;
Begin
    ReadPila(Dada);
    Writeln('El numero mayor es: ');
    Resultado:=Mayor(Dada);
    Elimina_Mayor(Dada);
    Writeln(Resultado);
    writePila(Dada);
End.