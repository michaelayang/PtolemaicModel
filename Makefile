CC = gcc
CXX = g++
CXXFLAGS = -g
LIBS = -lm

all:  PtolemaicInstance

SRCS = PtolemaicOrbit.cpp \
	PtolemaicInstance.cpp

OBJS = $(SRCS:.cpp=.o)

PtolemaicInstance:  $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(LIBS)

%.o:  %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm PtolemaicInstance *.o
