class Function
    def initialize(f)
        @f = f
    end
    def value(x)
        @f[x]
    end
    def zero(a,b,e)
        act=a
        solutions=[]
        while act+e<=b
            act=act+e
            if (@f[act]).abs<@f[e]
                solutions.append(act)
            end
        end
        solutions
    end
    def field(a,b)
        act=a
        res=0.0
        e=0.0001 # parametr określający dokładność
        while act+e<=b
            act=act+e
            res=res+@f[act]
        end
        res*e # mnożymy na końcu żeby nie psuć dokładności
    end
    def deriv(x)
        e=0.0001 # parametr określający dokładność
        (@f[x+e]-@f[x])/e
    end
end

f=Function.new(proc { | x | x*x })
puts f.value(2)
puts f.zero(-1.0, 1.0, 0.01)
puts f.field(-1.0, 2.0)
puts f.deriv(1)