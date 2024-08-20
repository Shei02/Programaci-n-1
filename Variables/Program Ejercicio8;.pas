Program Ejercicio8;
//Dadas dos pilas, Eliminar de una todas las posiciones que tiene la otra, usando los porcedimeintos anteriores.
//Note que al eliminar un elemento los restantes disminuyen uno en su ubicacion.
{$INCLUDE/IntroProg/Estructu}

Procedure PasarPila(var A, B:Pila);
Begin
    While Not PilaVacia(A) Do
        Apilar(B, Desapilar(A));
End;

Procedure OrdenarPila(var A:Pila);
var 
Final, Retenedor, Menores, Mayores, Eliminados:Pila;
Begin
    InicPila(Final, '');
    InicPila(Retenedor, '');
    InicPila(Menores, '');
    InicPila(Mayores, '');
    InicPila(Eliminados, '');
    While Not PilaVacia(A) Do 
    Begin
        Apilar(Retenedor, Desapilar(A));
        While Not PilaVacia(A) Do
        Begin
            If Tope(Retenedor) < Tope(A) Then
                Apilar(Mayores, Desapilar(A))
                Else
                If Tope(Retenedor) > Tope(A) Then
                    Apilar(Menores, Desapilar(A))
                    Else
                        If Tope(Retenedor) = Tope(A) Then
                            Apilar(Eliminados, Desapilar(A));
        End;
        
        If PilaVacia(Menores) Then
        Begin
            Apilar(Final, Desapilar(Retenedor));
            PasarPila(Mayores, A);
        End
            Else
            Begin
                PasarPila(Mayores, A);
                PasarPila(Retenedor, A);
                PasarPila(Menores, A);
            End;
    End;
    PasarPila(Final, A);
End;

Procedure NumeroDeElementos(A:Pila; var Num:Integer);
var 
Aux:Pila;
Contador:Integer;
Begin
    InicPila(Aux, '');
    Contador:= 0;
    
    While Not PilaVacia(A) Do
    Begin
        Apilar(Aux, Desapilar(A));
        Contador:= Contador + 1;
    End;
    
    Num:= Contador
End;

Procedure EliminarPosiciones(var A:Pila; Posicion:Pila);
var 
Aux, AuxP, Eliminado:Pila;
Contador, ContadorEliminados, NumElementos:Integer;
Begin
    InicPila(Aux, '');
    InicPila(Eliminado, '');
    InicPila(AuxP, '');
    Contador:= 1;
    ContadorEliminados:= 0;
    NumElementos:= 0;
    NumeroDeElementos(A, NumElementos);
    
    While Not PilaVacia(Posicion) Do
    Begin
        Contador:= 1;
        If NumElementos >= Tope(Posicion) Then
        Begin
            While Not PilaVacia(A) Do
            Begin
                If (Contador + ContadorEliminados) = Tope(Posicion) Then
                Begin
                    Apilar(Eliminado, Desapilar(A));
                    Contador:= Contador + 1;
                    ContadorEliminados:= ContadorEliminados + 1;
                End
                    Else
                    Begin
                        Apilar(Aux, Desapilar(A));
                        Contador:= Contador + 1;
                    End;
            End;
            
            While Not PilaVacia(Aux) Do
                Apilar(A, Desapilar(Aux));
            
            Apilar(AuxP, Desapilar(Posicion));
        End
            Else
                Apilar(AuxP, Desapilar(Posicion));
    End;
End;
var
Dada, Posiciones:Pila;
Begin
    ReadPila(Dada);
    Writeln('Escriba las posicion que desea evaluar y eliminar: ');
    ReadPila(Posiciones);
    OrdenarPila(Posiciones);
    EliminarPosiciones(Dada, Posiciones);
    Writepila(Dada);
End.