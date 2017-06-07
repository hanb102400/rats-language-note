flex = flex
bison = bison
cc=gcc

build:
	$(flex) calc.l
	$(bison) -y -dv calc.y
	$(cc) -o calc y.tab.c lex.yy.c

clean:
	rm -rf *.o
	rm -rf *.c
	rm -rf calc