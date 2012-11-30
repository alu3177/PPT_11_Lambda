require 'LambdaRegexp'

describe ULL::ETSII::Alu3177::LambdaRegexp do

    let (:cadena) { "abcd" }
    let (:prefix) { cadena[0] }
    let (:left) { cadena[0] }
    let (:right) { cadena[1] }
    let (:non_prefix) { cadena[cadena.length-1] }
    let (:resto)  { cadena[1..cadena.length-1] }


    include ULL::ETSII::Alu3177::LambdaRegexp

    before :all do
        @er1 = char('a')
        @er2 = char('b')
    end

    it "Se debe poder crear una ER qye sea una cte literal" do
        er_literal = char('ab')
        s = 'ab'
        remaining = er_literal[s] # er_literal.call(s)
        remaining.should == ""
    end

    it "concatenar" do
        er_literal = seq(@er1, @er2)
        s = 'ab'
        remaining = er_literal[s]
        remaining.should == ""
    end

    it "alt" do
        er_literal = alt(@er1, @er2)
        s = 'a'
        remaining = er_literal[s]
        remaining.should == ""
    end

    it "Debe poseer un metodo char(c) y este debe retornar una Lambda." do
        (char(prefix).lambda?).should == true
    end

    it "La Lambda del metodo char(c) devuelve 'false' si c no es prefijo de x" do
        (char(non_prefix) [cadena]).should == false
    end

    it "La Lambda del metodo char(c) devuelve el resto de x si c es prefijo de x" do
        (char(prefix) [cadena]).should == resto
    end

    it "Debe poseer un metodo seq(c) y este debe retornar una Lambda." do
        (seq(left,right).lambda?).should == true
    end

    it "La Lambda del metodo epsilon devuelve la varibla del bloque pasado" do
    end

end
