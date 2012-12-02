require 'LambdaRegexp'

describe ULL::ETSII::Alu3177::LambdaRegexp do

    include ULL::ETSII::Alu3177::LambdaRegexp

    before :all do
        @er1 = char('a')
        @er2 = char('b')
    end

    it "Se debe poder crear una ER que sea una constante literal" do
        er_literal = char('ab')
        s = 'ab'
        remaining = er_literal[s] # er_literal.call(s)
        remaining.should == ""
    end

    it "Se debe poder concatenar dos ER" do
        er_concat = seq(@er1, @er2)
        s = 'ab'
        remaining = er_concat[s]
        remaining.should == ""
    end

    it "Se debe definir la operacion 'or' para ER" do
        er_alt = alt(@er1, @er2)
        s = 'ab'
        remaining = er_alt[s]
        remaining.should == "b"
    end

    it "Se debe implementar el cierre positivo para una ER" do
        er_plus = plus(@er1)
        s = 'aaaaa'
        remaining = er_plus[s]
        remaining.should == ""
        remaining = er_plus[''] # El operador + NO permite cadenas vacias
        remaining.should == false
    end

    it "Se debe implementar el cierre de Kleene para una ER" do
        er_star = star(@er1)
        s = 'aaaaa'
        remaining = er_star[s]
        remaining.should == ""
        remaining = er_star[''] # El operador * SI permite cadenas vacias
        remaining.should == ""
    end

    # Overriding de operadores

    it "Debe existir un operador 're' que genera una constante literal" do
        er_literal = 'ab'.re
        s = 'ab'
        remaining = er_literal[s]
        remaining.should == ""
    end

    it "Debe existir un operador - paraconcatenar dos ER" do
        er_concat = @er1 - @er2
        s = 'ab'
        remaining = er_concat[s]
        remaining.should == ""
    end

    it "Debe existir un operador | para la operacion 'or' en ER" do
        er_alt = @er1 | @er2
        s = 'ab'
        remaining = er_alt[s]
        remaining.should == "b"
    end

    it "Debe existir un operador + para el cierre positivo en una ER" do
        er_plus = + @er1
        s = 'aaaaa'
        remaining = er_plus[s]
        remaining.should == ""
        remaining = er_plus[''] # El operador + NO permite cadenas vacias
        remaining.should == false
    end

    it "Debe existir un operador ~ para el cierre de Kleene en una ER" do
        er_star = ~ @er1
        s = 'aaaaa'
        remaining = er_star[s]
        remaining.should == ""
        remaining = er_star[''] # El operador * SI permite cadenas vacias
        remaining.should == ""
    end

end
