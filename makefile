# Set compiler to g++ or clang++ as needed
CXX := g++
CXXFLAGS := -g -O2 -Wall -std=c++20
LDFLAGS := 

ifeq ($(CXX), clang++)
# Use the LLD linker
LDFLAGS := -fuse-ld=lld
endif

CT_ERR = compile_errors.txt
RT_ERR = runtime_errors.txt
OUTPUT = output.txt

PROG = lab_xy
MAIN = main
LIB = cp

run: $(PROG)		
	./$(PROG) > $(OUTPUT) 2> $(RT_ERR)

$(PROG): $(MAIN).cpp
	$(CXX) $(MAIN).cpp $(CXXFLAGS) $(LDFLAGS) -l$(LIB) -o $(PROG) > $(CT_ERR) 2>&1


clean: 
	rm $(PROG)

.phony: run
