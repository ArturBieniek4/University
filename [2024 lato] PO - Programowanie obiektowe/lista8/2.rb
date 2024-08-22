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
    def km
        @m/1000
    end
    def km=(km)
        @m=km*1000
    end
    def mm
        @m*1000
    end
    def mm=(mm)
        @m=mm/1000
    end
    def milemorskie
        @m/1852
    end
    def milemorskie=(mm)
        @m=mm*1852
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

class Czas
    def initialize(s)
        @s = s
    end
    def sekundy
        @s
    end
    def sekundy=(s)
        @s=s
    end
    def minuty
        @s/60
    end
    def minuty=(m)
        @s=m*60
    end
    def godziny
        @s/3600
    end
    def godziny=(h)
        @s=h*3600
    end
    def doby
        @s/3600/24
    end
    def doby=(h)
        @s=h*3600*24
    end
end

class Predkosc
    def initialize(s)
        @s=Dlugosc.new(s)
    end
    def ms
        @s.metr
    end
    def ms=(s)
        @s.metr=s
    end
    def kmh
        # m/s -> km/h
        conv=Czas.new(1.0).godziny
        @s.km/conv
    end
    def kmh=(s)
        conv=Czas.new(1.0).godziny
        @s.km=s*conv
    end
    def knots
        #m/s -> milemorskie/h
        conv=Czas.new(1.0).godziny
        @s.milemorskie/conv
    end
    def knots=(s)
        conv=Czas.new(1.0).godziny
        @s.milemorskie=s*conv
    end
end

class Przyspieszenie
    def initialize(s)
        @s=Dlugosc.new(s)
    end
    def mss
        @s.metr
    end
    def mss=(s)
        @s=s.metr
    end
    def mmh2
        # m/s^2 -> mm/h^2
        conv=Czas.new(1.0).godziny
        @s.mm/conv/conv
    end
    def mmh2=(s)
        conv=Czas.new(1.0).godziny
        @s.mm=s*conv*conv
    end
end

# czas = Czas.new(3000.0)
# puts czas.godziny
# puts czas.doby

# predkosc = Predkosc.new(1.0)
# puts predkosc.kmh
# puts predkosc.knots
# predkosc.knots=2
# puts predkosc.ms

# przyspieszenie = Przyspieszenie.new(0.01)
# puts przyspieszenie.mmh2

puts "m/s\tkm/h\tknots"
puts "#{Predkosc.new(1.0).ms}\t#{Predkosc.new(1.0).kmh}\t#{Predkosc.new(1.0).knots}"
puts "#{Predkosc.new(7.0).ms}\t#{Predkosc.new(7.0).kmh}\t#{Predkosc.new(7.0).knots}"
puts "#{Predkosc.new(42.0).ms}\t#{Predkosc.new(42.0).kmh}\t#{Predkosc.new(42.0).knots}"

puts ""

puts "m/s^s\tmm/h^2"
puts "#{Przyspieszenie.new(1.0).mss}\t#{Przyspieszenie.new(1.0).mmh2}"
puts "#{Przyspieszenie.new(7.0).mss}\t#{Przyspieszenie.new(7.0).mmh2}"
puts "#{Przyspieszenie.new(42.0).mss}\t#{Przyspieszenie.new(42.0).mmh2}"