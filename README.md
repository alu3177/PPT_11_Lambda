# LambdaRegexp

## Objetivo

El objetivo es crear nuestro propio motor de expresiones regulares. Para ello, una expresión regular como c(a|d)+r debe ser expresada mediante una lambda. Una regexp como c(a|d)+r es el resultado de la composición de lambdas. Por ejemplo, la regexp c(a|d)+r se denotará por:

    seq(char('c'), seq(plus(alt(char('a'), char('d'))), char('r')))

# Cómo se hace

La idea es que char, seq, plus, etc. son métodos que retornan funciones (lambdas). La lambda retornada por char('d') reconoce el lenguaje 'd', la lambda retornada por star(char('c')) reconoce el lenguaje c* y la lambda retornada por seq(char('c'),     seq(plus(alt(char('a'), char('d'))), char('r'))) reconoce el lenguaje c(a|d)+r.

Mas en concreto, la lambda que representa la expresión regular r

    recibe una cadena x y
    devuelve false si no hay un prefijo de x que case con r
    y devuelve el resto no casado de la cadena x si hubo matching.

Por ejemplo, el método char recibe una cadena c y retorna una lambda que recibe una cadena x y

    devuelve false si c no es un prefijo de x.
    En caso contrario retorna el resto de la cadena.


## Definiendo Operadores

Es posible usar overriding de operadores para mejorar la expresividad de la notación. He aqui un ejemplo que utiliza una versión en la que se han definido los operadores:

    - es seq
    | es alt
    + unario es plus
    ~ es star
    El método re es una versión de char

## Objetivos

    Use TDD con RSpec
    Use Unit Testing
    Use Continuous Integration (Travis)
    Use Continuous Testing (Guard)
    Documente su gema (véase RDOC::Markup o RDOC o YARD).
    Véa un ejemplo ilustrativo de como debería quedar la documentación del módulo creado en module ULL::ETSII::AluXXX::LambdaRegexp
    Cree una gema ull-etsii-aluXX-lambdaregexp
    Publique la gema en RubyGems.org
    Indique la URL de su repositorio en GitHub
