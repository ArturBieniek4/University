#Przepraszam bardzo za opóźnienie, wywołane anginą.

class Masa
    def initialize(masa)
        @kg = masa
    end
    def kg
        @kg
    end
    def kg=(masa)
        @kg=masa
    end
    def gram
        @kg*1000
    end
    def gram=(masa)
        @kg=masa/1000
    end
    def ounce
        @kg*35.2739619
    end
    def ounce=(masa)
        @kg=masa/35.2739619
    end
    def pound
        @kg*2.20462262
    end
    def pound=(masa)
        @kg=masa/2.20462262
    end
end

class Dlugosc
    def initialize(dlugosc)
        @m = dlugosc
    end
    def metr
        @m
    end
    def metr=(dlugosc)
        @m = dlugosc
    end
    def cm
        @m*100
    end
    def cm=(dlugosc)
        @m = dlugosc/100
    end
    def inch
        @m*39.3700787
    end
    def inch=(dlugosc)
        @m = dlugosc/39.3700787
    end
    def foot
        @m*3.2808399
    end
    def foot=(dlugosc)
        @m = dlugosc/3.2808399
    end
    def mile
        @m*0.000621371192
    end
    def mile=(dlugosc)
        @m = dlugosc/0.000621371192
    end
end

class Powierzchnia
    def initialize(metr)
        @m2 = metr
    end
    def m2
        @m2
    end
    def m2=(m2)
        @m2=m2
    end
    def hektar
        @m2/10000
    end
    def hektar=(ha)
        @m2=ha*10000
    end
    def cal2
        conv=Dlugosc.new(1).inch
        @m2*conv*conv
    end
    def cal2=(c2)
        conv=Dlugosc.new(1).inch
        @m2=c2/conv/conv
    end 
end

class Cisnienie
    # 1 Pa = 1 kg/(m*s^2)
    def initialize(pascal)
        @p = Masa.new(pascal)
    end
    def pascal
        @p.kg
    end
    def pascal=(pa)
        @p.kg = pa
    end
    def bar
        @p.kg/100000
    end
    def bar=(bar)
        @p.kg=bar*100000
    end
    def psi
        #kg/m*9.81m/s^2 -> pound/cal2
        conv2=Powierzchnia.new(1).cal2
        @p.pound/conv2/9.80665
    end
    def psi=(psi)
        conv2=Powierzchnia.new(1).cal2
        @p.pound=psi*conv2*9.80665
    end 
end

# masa = Masa.new(13.5)
# puts masa.gram
# puts masa.ounce
# puts masa.pound

# puts ''

# dlugosc=Dlugosc.new(23.5)
# puts dlugosc.cm
# dlugosc.cm=100
# puts dlugosc.inch
# puts dlugosc.foot
# puts dlugosc.mile
# pow=Powierzchnia.new(1.0)
# puts pow.hektar
# puts pow.cal2

# press=Cisnienie.new(1.0)
# puts press.bar
# press.bar=10.0
# puts press.pascal
# press.bar=100
# puts press.psi

puts "m^2\tinch^2"
puts "#{Powierzchnia.new(1).m2}\t#{Powierzchnia.new(1).cal2}"
puts "#{Powierzchnia.new(7).m2}\t#{Powierzchnia.new(7).cal2}"
puts "#{Powierzchnia.new(42).m2}\t#{Powierzchnia.new(42).cal2}"

puts ""

puts "Bar\tPSI"
puts "#{Cisnienie.new(100000).bar}\t#{Cisnienie.new(100000).psi}"
puts "#{Cisnienie.new(700000).bar}\t#{Cisnienie.new(700000).psi}"
puts "#{Cisnienie.new(4200000).bar}\t#{Cisnienie.new(4200000).psi}"