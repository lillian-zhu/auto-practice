words.txt: /usr/share/dict/words 
	cp $< $@
	
all: words.txt

clean:
	rm -f words.txt