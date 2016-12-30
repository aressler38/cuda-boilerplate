CXX=g++
CXXFLAGS=-std=c++14
SRC_DIR=src
NVCC=nvcc
BUILD_DIR=build
NVCC_FLAGS=-arch=sm_52 -rdc=true
INCLUDES=-I/usr/local/cuda/include
LINKS=-L/usr/local/cuda/lib64 -lcuda -lcudart
CUDA_LINK_OBJECTS=$(BUILD_DIR)/cuda-wrapper.o $(BUILD_DIR)/complex_t.o
FINAL_OBJECTS=$(BUILD_DIR)/cuda-device-code.o $(CUDA_LINK_OBJECTS)


.PHONY: all
all: clean program

.PHONY: program
program: cuda-device-code.o
	@echo Creating program...
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/program $(FINAL_OBJECTS) $(SRC_DIR)/main.cpp $(INCLUDES) $(LINKS)

.PHONY: cuda-device-code.o
cuda-device-code.o: cuda-wrapper.o
	@echo making cuda device code
	$(NVCC) $(NVCC_FLAGS) -dlink -o $(BUILD_DIR)/cuda-device-code.o $(CUDA_LINK_OBJECTS) -lcudadevrt -lcudart

complex_t.o:
	@echo making complex_t
	$(NVCC) $(NVCC_FLAGS) -o $(BUILD_DIR)/complex_t.o -c $(SRC_DIR)/complex_t.cu

cuda-wrapper.o: complex_t.o
	@echo making wrapper
	$(NVCC) $(NVCC_FLAGS) -o $(BUILD_DIR)/cuda-wrapper.o -c $(SRC_DIR)/cuda-wrapper.cu

.PHONY: clean
clean:
	rm -rf program $(BUILD_DIR)/*.o
