
.PHONY: all clean

# Project settings
PROJECT_NAME = game
RAYLIB_PATH = C:/raylib/raylib
CXX = C:/raylib/w64devkit/bin/g++.exe

# Source and header files
SRC = $(wildcard src/*.cpp)
HEADERS = $(wildcard src/*.h)

# Include and library paths
INCLUDE = -I$(RAYLIB_PATH)/src -I$(RAYLIB_PATH)/src/external
LIBPATH = -L$(RAYLIB_PATH)/src

# Build configuration
BUILD_MODE ?= DEBUG

ifeq ($(BUILD_MODE),DEBUG)
    CXXFLAGS = -std=c++17 -Wall -Wextra -g -O0
else
    CXXFLAGS = -std=c++17 -Wall -Wextra -O2
endif

# Raylib libraries
LDLIBS = -lraylib -lopengl32 -lgdi32 -lwinmm

# Default target
all: $(PROJECT_NAME).exe

# Compile all source files
$(PROJECT_NAME).exe: $(SRC) $(HEADERS)
	$(CXX) $(SRC) -o $@ $(CXXFLAGS) $(INCLUDE) $(LIBPATH) $(LDLIBS)

# Clean build
clean:
	del /Q $(PROJECT_NAME).exe 2>NUL
