TARGET = traceroute

CXX = g++
CXXFLAGS = -Wall -Wextra -O3 --std=c++20
CPP_SOURCES = $(TARGET).cpp
OBJECTS = $(TARGET).o

all: $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -f $(OBJECTS)

distclean: clean
	rm -f $(TARGET)

.PHONY: all clean distclean
