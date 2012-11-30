require 'LambdaRegexp'

describe ULL::ETSII::Alu3177::LambdaRegexp do

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
        s = 'ab'
        remaining = er_literal[s]
        remaining.should == "b"
    end

    it "plus" do
        er_literal = plus(@er1)
        s = 'aaaaa'
        remaining = er_literal[s]
        remaining.should == ""
    end

    it "star" do
        er_literal = star(@er1)
        s = 'aaaaa'
        remaining = er_literal[s]
        remaining.should == ""
    end

end
