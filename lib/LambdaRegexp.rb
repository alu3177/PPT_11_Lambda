require "LambdaRegexp/version"

module ULL
    module ETSII
        module Alu3177
            module LambdaRegexp

                module_function

                # Transición épsilon:
                #
                # * Devuelve la entrada sin consumir ningun símbolo.
                def epsilon
                    ->(x) { x }
                end

                # Constante literal:
                #
                # * Crea una expresion regular que es una constante literal.
                # * Devuelve <em>false</em> si <b>c</b> no es prefijo de <b>x</b>.
                # * Devuelve el resto que no case con <b>x</b>, si hubo matching.
                def char(c) # c: Cadena comprobar si casa 'x' que es la RegExp
                    ->(x) { x[0, c.length] == c and x[c.length..-1] } # x[c.length..-1] Desde donde no casó hasta el final
                end

                # Concatenación:
                #
                # * Concatena dos expresiones regulares.
                # * Devuelve <em>false</em> si no se produce matching.
                # * Devuelve el resto que no case con <b>l</b> concatenado con <b>r</b>, si hubo matching.
                def seq(l, r) # Recibe RegExp (Lambdas) a la izquierda y a la derecha
                    ->(x) { w = l[x] and r[w] }
                end

                # Disyunción:
                #
                # * Concatena dos expresiones regulares.
                # * Devuelve <em>false</em> si no se produce matching.
                # * Devuelve el resto que no case con <b>l</b> o con <b>r</b>, si hubo matching.
                def alt(l, r) # Recibe RegExp (Lambdas) a la izquierda y a la derecha
                    ->(x) { l[x] or r[x] }
                end

                # Cierre positivo:
                #
                # * Realiza el cierre positivo de una expresión regular <b>r</b>
                def plus(r)
                    ->(x) { seq(r, star(r))[x] }
                end

                # Cierre Kleene:
                #
                # * Realiza el cierre de Kleene de una expresión regular <b>r</b>
                def star(r)
                    ->(x) { plus(r)[x] or epsilon[x] }
                end
            end
        end
    end
end

class String
    include ULL::ETSII::Alu3177

    # Constante literal:
    #
    # * Crea una expresion regular que es una constante literal.
    # * Devuelve <em>false</em> si <b>c</b> no es prefijo de <b>x</b>.
    # * Devuelve el resto que no case con <b>x</b>, si hubo matching.
    def re
        LambdaRegexp::char(self)
    end
end

class Proc
    include ULL::ETSII::Alu3177

    # Concatenación:
    #
    # * Concatena dos expresiones regulares.
    # * Devuelve <em>false</em> si no se produce matching.
    # * Devuelve el resto que no case con <b>l</b> concatenado con <b>r</b>, si hubo matching.
    def - (r)
        LambdaRegexp::seq(self, r)
    end

    # Disyunción:
    #
    # * Concatena dos expresiones regulares.
    # * Devuelve <em>false</em> si no se produce matching.
    # * Devuelve el resto que no case con <b>l</b> o con <b>r</b>, si hubo matching.
    def | (r)
        LambdaRegexp::alt(self, r)
    end

    # Cierre positivo:
    #
    # * Realiza el cierre positivo de una expresión regular <b>r</b>
    def +@
        LambdaRegexp::plus(self)
    end

    # Cierre Kleene:
    #
    # * Realiza el cierre de Kleene de una expresión regular <b>r</b>
    def ~@
        LambdaRegexp::star(self)
    end
end
