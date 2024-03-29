cc = g++
flags= -lssl -lcrypto #-L/usr/lib
flagsWin= -lssl -lcrypto
all: server client pwd

windows: server.c++ client.c++ encodings.o crypto.o
	${cc} -o server.exe server.c++ encodings.o crypto.o ${flagsWin} 
	${cc} -o client.exe client.c++ encodings.o crypto.o ${flagsWin} 
server: server.c++ encodings.o crypto.o
	${cc} -o server.out server.c++ encodings.o crypto.o ${flags} 
client: client.c++ encodings.o crypto.o
	${cc} -o client.out client.c++ encodings.o crypto.o ${flags} 
encodings.o: encodings.c++ encodings.h
	${cc} -c encodings.c++ -o encodings.o
crypto.o: crypto.c++ crypto.h
	${cc} -c crypto.c++ -o crypto.o

pwd: pwd_client.c++
	${cc} -o pwd_client.out pwd_client.c++
clean:
	rm server.out client.out encodings.o crypto.o pwd_client.out 
clean-windows:
	rm server.exe client.exe encodings.o crypto.o

