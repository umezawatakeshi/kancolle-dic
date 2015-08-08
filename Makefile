TGT=kancolle-dic.zip
all: $(TGT)

FILES=readme.txt ship1.txt ship2.txt shiptype.txt weapon.txt misc.txt

$(TGT): $(FILES)
	rm -f $(TGT)
	zip $@ $(FILES)

ship2.txt: ship1.txt
	(./chtype.pl < ship1.txt > ship2.txt) 2>&1 | nkf -Sw

clean:
	rm -f $(TGT) ship2.txt
