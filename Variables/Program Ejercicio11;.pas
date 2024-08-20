Program Ejercicio11;
{$INCLUDE/IntroProg/Estructu}

Procedure ContarElementos(Dada:Pila; var N:Integer);
var 
Contador:Integer;
Aux:Pila;
Begin
    Contador:= 0;
    InicPila(Aux,' ');
    
    While Not PilaVacia(Dada) Do
    Begin
        Apilar(Aux, Desapilar(Dada));
        Contador:= Contador + 1;
    End;
    
    N:= Contador;
End;

Procedure OrganizarPila(var Dada:Pila);
var 
Descarte, Aux:Pila;

Begin
    InicPila(Aux,' ');
    InicPila(Descarte,' ');
    While Not PilaVacia(Dada) and (Tope(Dada)=0) Do
        Apilar(Descarte, Desapilar(Dada));
    
    While Not PilaVacia(Dada) Do
        Apilar(Aux, Desapilar(Dada));
    
    If Not PilaVacia(Aux) and (Tope(Aux)<>0) Then
        Apilar(Dada, 0);
    
    While Not PilaVacia(Aux) Do
        Apilar(Dada, Desapilar(Aux));
End;

Procedure ExtraerSec(var Entrada:Pila; var Salida:Pila);
var
    Inversora:Pila;
Begin
    InicPila(Inversora,' ');
    While Not PilaVacia(Entrada) and (Tope(Entrada)<>0) Do
        Apilar(Inversora, Desapilar(Entrada));
        
    While Not PilaVacia(Inversora) Do
        Apilar(Salida, Desapilar(Inversora));
End;

Procedure ValorSecuencias(Entrada:Pila; var Salida:Pila);
var 
Secuencia, Descarte, Aux:Pila;
NumElementos:Integer;
Begin
    InicPila(Aux,' ');
    InicPila(Secuencia,' ');
    InicPila(Descarte,' ');
    
    While Not PilaVacia(Entrada) Do
    Begin
    NumElementos:= 0;
    ExtraerSec(Entrada, Secuencia);
    ContarElementos(Secuencia, NumElementos);
    Apilar(Aux, NumElementos);
    OrganizarPila(Entrada);
    While Not PilaVacia(Secuencia) Do
        Apilar(Descarte, Desapilar(Secuencia));
    End;
    
    While Not PilaVacia(Aux) Do
        Apilar(Salida, Desapilar(Aux));
End;

Procedure SumarPila(Dada:Pila; var Suma:Integer);
var 
Acumulador:Integer;
Aux:Pila;
Begin
  Acumulador:= 0;
  InicPila(Aux,' ');
    
    While Not PilaVacia(Dada) Do
    Begin
        Acumulador:= Acumulador + Tope(Dada);
        Apilar(Aux, Desapilar(Dada));
    End;
    Suma:= Acumulador;
End;

var 
Dada, Resultado:Pila;
SumaPila, ElementosResultado:Integer;
Begin
    ReadPila(Dada);
    OrganizarPila(Dada);
    InicPila(Resultado,' ');
    SumaPila:= 0;
    ElementosResultado:= 0;
    valorSecuencias(Dada, Resultado);
    SumarPila(Resultado, SumaPila);
    ContarElementos(Resultado, ElementosResultado);
    
    If ElementosResultado<>0 then
        Apilar(Resultado, (SumaPila div ElementosResultado));
    WritePila(Resultado);
End.