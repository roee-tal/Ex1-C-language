CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_LIB=mylib.o
FLAGS= -Wall -g

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a

maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so 

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so      

libclassloops.so: basicClassification.o advancedClassificationLoop.o
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o

loops: libclassloops.a
libclassloops.a: basicClassification.o advancedClassificationLoop.o
	$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o  
 
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

libclassrec.so: basicClassification.o advancedClassificationRecursion.o
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
  