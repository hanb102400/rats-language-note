flex=flex
bison=bison
cc=gcc

build:hello.txt
    $(flex) wc.lex
    $(cc) -o wc lex.yy.c
    wc < hello.txt

hello.txt:
    echo This program is distributed in the hope that it will be useful > hello.txt
    
clean:
    del *.c
    del wc