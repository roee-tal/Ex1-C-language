CC=gcc
AR=ar
OBJECTS_MAIN=main.o
OBJECTS_BASIC=basicClassification.o
OBJECTS_ADV_LOOP=advancedClassificationLoop.o
OBJECTS_ADV_REC=advancedClassificationRecursion.o
FLAGS= -Wall -g

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so mains maindloop maindrec

#programs:

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a

maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so 

maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so    

#libraries:

loopd: libclassloops.so
libclassloops.so: $(OBJECTS_BASIC) $(OBJECTS_ADV_LOOP)
	$(CC) -shared -o libclassloops.so $(OBJECTS_BASIC) $(OBJECTS_ADV_LOOP)

loops: libclassloops.a
libclassloops.a: $(OBJECTS_BASIC) $(OBJECTS_ADV_LOOP)
	$(AR) -rcs libclassloops.a $(OBJECTS_BASIC) $(OBJECTS_ADV_LOOP) 

recursived: libclassrec.so
libclassrec.so: $(OBJECTS_BASIC) $(OBJECTS_ADV_REC)
	$(CC) -shared -o libclassrec.so $(OBJECTS_BASIC) $(OBJECTS_ADV_REC)

recursives: libclassrec.a
libclassrec.a: $(OBJECTS_BASIC) $(OBJECTS_ADV_REC)
	$(AR) -rcs libclassrec.a $(OBJECTS_BASIC) $(OBJECTS_ADV_REC)	

#O files:	 
 
basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(FLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

#clean:

clean:
	rm -f *.o *.a *.so mains maindloop maindrec
  