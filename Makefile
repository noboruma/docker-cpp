all: b.out

b.out: main.cc
	g++ -std=c++2a -o b.out main.cc
