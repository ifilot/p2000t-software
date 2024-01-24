10 REM P2000T programma laden via RS232
20 REM Versie 0.3 door Dion Olsthoorn
30 CLEAR 50,&H9DFF+256*32*(PEEK(&H605C)+(PEEK(&H605C)=1))
40 M=PEEK(&H605C) : Z = 32*(M+(M=1))
50 BASE = &H9E00 + 256*Z
60 T=0 : I=0 : PRINT CHR$(12)
70 READ P$ : IF P$="stop" THEN GOTO 110
80 P=VAL("&H"+P$) : POKE BASE+I,P
90 IF P=&H9E OR P=&H9F THEN POKE BASE+I,P+Z
100 I=I+1 : T=T+P : GOTO 70
110 IF T=11963 THEN GOTO 130
120 PRINT "Typfout gemaakt in DATA" : END
130 DEF USR1=BASE + &H1D
131 DEF USR2=BASE + &H6C
140 PRINT "Start ontvanger op P2000T met ?USR1(0)"
141 PRINT "of ?USR2(0) voor ontvang-bewaar modus"
150 PRINT "Dan op PC .cas bestand zenden naar COM"
160 PRINT "9600 baud, geen parity en 8 data bits"
200 DATA C5,DB,20,E6,01,20,FA,06,15,10
210 DATA FE,06,08,DB,20,1F,CB,19,C5,06
220 DATA 10,10,FE,C1,10,F3,79,C1,C9,F3
230 DATA 06,00,21,00,9F,CD,00,9E,77,23
240 DATA 10,F9,21,4F,9F,4E,2A,30,9F,18
250 DATA 07,06,00,CD,00,9E,10,FB,11,00
260 DATA 04,CD,00,9E,77,23,1B,7A,B3,20
270 DATA F6,0D,20,E9,11,47,65,2A,34,9F
280 DATA 19,22,05,64,22,07,64,22,09,64
290 DATA 3A,B9,63,C6,02,32,B9,63,32,59
300 DATA 62,3E,07,CD,4A,10,FB,C9,CD,1D
310 DATA 9E,21,30,9F,11,30,60,01,20,00
320 DATA ED,B0,3E,05,CD,18,00,C3,6C,9E
330 DATA stop