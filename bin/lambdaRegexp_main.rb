require 'LambdaRegexp'

include ULL::ETSII::Alu3177::LambdaRegexp

a = char 'a'
b = char 'b'

re = seq(a,b)
puts re['ab']

re = alt(a,b)
puts re['ab']

re = plus(a)
puts re['aaaa']

re = star(a)
puts re['aaaa']
