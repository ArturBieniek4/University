TARGET = transport

CXX = gcc
CXXFLAGS = -Wall -Wextra -O3 --std=c17
OBJECTS = $(TARGET).o

all: $(TARGET)

%.o: %.c
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

clean:
	rm -f $(OBJECTS)

distclean: clean
	rm -f $(TARGET)

.PHONY: all clean distclean
