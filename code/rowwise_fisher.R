#https://gist.github.com/dceoy/4d75564e5f44702ee3bc

#!/usr/bin/env Rscript

# fisher test on each row
##alt = 'two.sided' in original code.
row_fisher <- function(row, alt = 'greater', cnf = 0.95) {
  f <- fisher.test(matrix(row, nrow = 2), alternative = alt, conf.level = cnf)
  return(c(row,
           p_val = f$p.value,
           or = f$estimate[[1]],
           or_ll = f$conf.int[1],
           or_ul = f$conf.int[2]))
}

# generate sample data for test
#set.seed(1234); test_df <- data.frame(matrix(abs(ceiling(rnorm(40) * 100)), ncol = 4))
#colnames(test_df) <- c('a', 'b', 'c', 'd')

# run
#p <- t(apply(test_df, 1, row_fisher))
#print(p); head(p); dim(p)

##
#validate on result from row 2:
#fisher.test(matrix( c( 28, 99,  49,  47) ,nrow = 2), 
#            alternative = 'two.sided', conf.level = 0.95)

