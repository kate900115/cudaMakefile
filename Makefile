PROJECT_NAME = game_of_life

NVCC = nvcc
CC = g++

CUDAPATH = /usr/local/cuda

BUILD_DIR = /usr/local/cuda

CFLAGS = -c -I$(CUDAPATH)/include
NVCCFLAGS = -c -I$(CUDAPATH)/include
LFLAGS = -L$(CUDAPATH)/lib -lcuda -lcudart -lm

all: build clean

build: build_dir gpu cpu
	$(NVCC) $(LFLAGS) -o $(build_dir)/$(PROJECT_NAME) *.o

build_dir:
	mkdir -p $(BUILD_DIR)

gpu:
	$(NVCC) $(NVCCFLAGS) *.cu

cpu:
	$(CC) $(CFLAGS) *.cpp

clean:
	rm *.o

run:
	./$(BUILD_DIR)/$(PROJECT_NAME)

