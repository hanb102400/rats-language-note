bison=bison
flex=flex
cc=gcc

build:
	$(flex) rats.l
	$(cc) -c lex.tab.h lex.yy.c 
	$(cc) lex.yy.o -o rats

clean:
	rm -rf lex.yy.c
	rm -rf lex.yy.o
	rm -rf y.tab.h 
	rm -rf y.tab.c
	rm -rf rats