words <- readLines('words.txt')
Length <- nchar(words)
tab <- table(Length)
write.table(tab, "histogram.tsv", sep = "\t", row.names = FALSE, quote = FALSE)
