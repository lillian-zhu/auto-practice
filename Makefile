words.txt: /usr/share/dict/words 
	cp $< $@
	
all: report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.html
	
histogram.tsv: histogram.r words.txt
	Rscript $<
	

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf
	
report.html: report.Rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'
	

	