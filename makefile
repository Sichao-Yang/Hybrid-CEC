SRCS = $(shell find . -maxdepth 1 -name "*.c*") 

OBJS = $(addsuffix .o, $(basename $(SRCS)))

EXEC = hybrid_cec

# Debug version with -g flag and kissat library
LIBS = -g -lkissat -LhKis/build

# Debug flags: remove optimization, add debug symbols and warnings
CXXFLAGS = -g -O0 -IhKis -std=c++17 -Wall -Wextra -DDEBUG

# Optional: Add sanitizers for better debugging
# CXXFLAGS += -fsanitize=address -fsanitize=undefined

$(EXEC): $(OBJS)
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)

%.o: %.cpp
	$(CXX) -c $< -o $@ $(CXXFLAGS)

clean:
	rm -f $(OBJS) $(EXEC)