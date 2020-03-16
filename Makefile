all: b.out

b.out: main.cc
	g++ -O3 -std=c++2a -o b.out main.cc -pthread -lboost_system
