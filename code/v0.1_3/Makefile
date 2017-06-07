bison=bison
flex=flex
cc=gcc

build:
	$(flex) rats.l
	$(bison) --yacc -dv rats.y
	$(cc) -c y.tab.h y.tab.c 
	$(cc) -c y.tab.h lex.yy.c
	$(cc) -o rats lex.yy.o y.tab.o

clean:
	rm -rf lex.yy.c
	rm -rf y.*
	rm -rf *.o
	rm -rf rats