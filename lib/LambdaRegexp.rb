require "LambdaRegexp/version"

module ULL
    module ETSII
        module Alu3177
            module LambdaRegexp

                def epsilon
                    ->(x) { x }
                end

                def char(c) # c: Cadena comprobar si casa 'x' que es la RegExp
                    ->(x) { x[0, c.length] == c and x[c.length..-1] } # x[c.length..-1] Desde donde no casó hasta el final
                end

                def seq(l, r) # Recibe RegExp (Lambdas) a la izquierda y a la derecha
                    ->(x) { w = l[x] and r[w] }
                end

                def alt(l, r) # Recibe RegExp (Lambdas) a la izquierda y a la derecha
                    ->(x) { l[x] or r[x] }
                end

                def plus(r)
                    ->(x) { seq(r, star(r))[x] }
                end

                def star(r)
                    ->(x) { epsilon[x] or plus(r)[x] }
                end

            end
        end
    end
end



=begin
Apuntes en LAB:
    array1=[1,2,3,4]
    array2=[5,6,7,8]

[**] Explicacion Bloques: (Un bloque es una estructura sintáctica)
    array1.collect! do |n| # collect! = metodo enumerable q coge cada uno y hace con él lo que pone en el bloque
        n**2 # Eleva al cuadrado
    end
    array2.collect! do |n|  # Tenemos que hacer lo mismo para el otro bloque...
        n**2
    end

* Escribamos un metodo collect (pero con otro nombre, iterate!), que al ser de Array, debo hacerlo en la clase Array...

class Array
    def iterate!
        self.each_index do |i, n|
            self[i] = yield (n)
        end
end

* Ahora llamamos a nuestro método

    array1.iterate! do |n|
        n**2 # Eleva al cuadrado
    end
    array2.iterate! do |n|
        n**2
    end

[**] Ahora 'a la' PROC : Un proc es un objeto

class Array
    def iterate! (&code) # & implica proc
        self.each_index do |i, n|
            self[i] = code.call (n)
        end
end
* Las llamadas anteriores siguen funcionando, ya que convierte el bloque en un proc al llamar a iterate! ahora.
* Pero nos vamos a crear un proc que contiene el bloque de antes.

cuadrado = Proc.new do |n|
    n**2
end

array1.iterate! (cuadrado)
array2.iterate! (cuadrado)

array1.iterate! (lambda{|n| n**2}) # Tembien se puede con Lambda
array1.iterate! (->(n) {n**2})     # Lambda sintaxis 2

[**] EXPLICACION de la PRÁCTICA ...


=end
