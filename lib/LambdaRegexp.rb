require "LambdaRegexp/version"

module ULL
    module ETSII
        module Alu3177
            module LambdaRegexp

                module_function

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
                    ->(x) { plus(r)[x] or epsilon[x] }
                end
            end
        end
    end
end

class String
    include ULL::ETSII::Alu3177::LambdaRegexp

    def re
        char(self)
    end
end

class Proc
    include ULL::ETSII::Alu3177::LambdaRegexp

    def - (r)
        seq(self, r)
    end

    def | (r)
        alt(self, r)
    end

    def +@
        plus(self)
    end

    def ~@
        star(self)
    end
end
