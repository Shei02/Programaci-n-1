Program Ejercicio12;
//Este programa reemplaza los elementos de una pila segun la posicion y el numero que le ingresemos
//Realizando asi la suma de el valor que tiene la pila en esa posicion mas el valor que le indicamos
//Reemplazando el resultado de esta suma en la posicion dicha anteriormente.
{$INCLUDE/IntroProg/Estructu}

Procedure EliminarR(var A:Pila);
var 
Retenedor, Aux, Fin, Eliminados:Pila;
Begin
    InicPila(Retenedor,' ');
    InicPila(Aux,' ');
    InicPila(Fin,' ');
    InicPila(Eliminados,' ');
    
    While Not PilaVacia(A) Do
    Begin
        Apilar(Retenedor, Desapilar(A));
        While Not PilaVacia(A) Do
        Begin
            If Tope(A) = Tope(Retenedor) Then
               Apilar(Eliminados, Desapilar(A))
            Else
                Apilar(Aux, Desapilar(A));
        End;
        
        Apilar(Fin, Desapilar(Retenedor));
        
        While Not PilaVacia(Aux) Do
            Apilar(A, Desapilar(Aux));
    End;
    While Not PilaVacia(Fin) Do
        Apilar(A, Desapilar(Fin));
End;

Procedure CantElem(A:Fila; var Num:Integer);
var 
Aux:Fila;
Contador:Integer;
Begin
    InicFila(Aux,' ');
    Contador:= 0;
    While Not FilaVacia(A) Do
    Begin
        Agregar(Aux, Extraer(A));
        Contador:= Contador + 1;
    End;
    Num:= Contador
End;

Procedure ReemplazarPosicion(var A:Fila; Posicion:Pila; Reemplazo:Pila);
var 
Eliminado:Pila;
Aux:Fila;
Contador, NumElementos, NuevoValor:Integer;
Begin
    InicFila(Aux,' ');
    InicPila(Eliminado,' ');
    Contador:= 1;
    NumElementos:= 0;
    CantElem(A, NumElementos);
    
    While Not PilaVacia(Posicion) and not PilaVacia(Reemplazo) Do
    Begin
        If NumElementos >= Tope(Posicion) Then
        Begin
            While Not FilaVacia(A) and not PilaVacia(Posicion) and not PilaVacia(Reemplazo) Do
            Begin
                If Contador = Tope(Posicion) Then
                Begin
                    NuevoValor:= (Primero(A) + Tope(Reemplazo));
                    Agregar(Aux, NuevoValor);
                    Apilar(Eliminado, Extraer(A));
                    Apilar(Eliminado, Desapilar(Posicion));
                    Apilar(Eliminado, Desapilar(Reemplazo));
                    Contador:= Contador + 1;
                End
                Else
                    Begin
                        Agregar(Aux, Extraer(A));
                        Contador:= Contador + 1;
                    End;
            End;
        End
            Else
            Begin
                Apilar(Eliminado, Desapilar(Posicion));
                Apilar(Eliminado, Desapilar(Reemplazo));
            End;
            
        While Not FilaVacia(A) Do
            Agregar(Aux, Extraer(A));
        While Not FilaVacia(Aux) Do
            Agregar(A, Extraer(Aux));
        
        Contador:= 1;
    End;
End;

var 
Datos:Fila;
Posiciones, Reemplazos:Pila;
Begin
    ReadFila(Datos);
    Writeln('Ingrese Posiciones: ');
    ReadPila(Posiciones);
    EliminarR(Posiciones);
    ReadPila(Reemplazos);
    ReemplazarPosicion(Datos, Posiciones, Reemplazos);
    WriteFila(Datos);
End.