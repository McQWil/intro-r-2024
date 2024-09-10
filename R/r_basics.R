#### R Basics ####
# "A foolish consistency is the hobgoblin of 
#   little minds"   -Ralph Waldo Emerson 

# Literals ----
"this is a string literal" #double quotes preferred by not required
42

# Operators ----
#arithmetic
2+3  # note the spacing for legibility2
2-3
2*6
2/6
2**3  #this is an exponent
2^3  #this is also an exponent

#comparison
2 == 2  #test for equality
"chris" == "Chris"
2==(1+1)
2!=1 #test inequality, asserting that 2 is not equal 1 and r says true
2<3
3>2
2<=2
2>=3

#somewhat of a cruel joke
TRUE == 1 
FALSE == 0
isTRUE(TRUE) #function testing if the argument is literally true
isTRUE(1) # 
?isTRUE() #queries built-in help

2<3 & 2>3 #will return false, both have to be true to return true
2<3 | 1>2  # or statement
2<3 & (2==1 | 2==2) # grouping statements for ordering

#type matters (sometimes)
"joe" # string or character
typeof("joe")
42  # numeric type (double or precise in decimal)
typeof(42)
typeof(TRUE) #logical or boolean
42=="42" #equality can cross types
identical(42,"42") #type matters



# variables ----
x <- "this is a string"  
x
typeof(x)
x<- 10
x
x^2

pizza<-x
pizza

my_var = 42  #works but not standard in r
my_var <- 42
x<- my_var
x

# data structures ----
# vectors have a single dimension, like a column or row of data
a<- c("1", "2", "3")
a
a<- c(1,2,3)
a
a+1 #vectorized operation

a <- c(1,2,3,"4")
typeof(a) #r will figure out the type that can apply to all, in this case it falls back to all characters
a+1 #a is no longer numeric, errors out

a<3
a<- c(1,2,3)
a<3
any(a< 3) #tests whether any value
3 %in% a #test membership in a vector
4 %not in% a #this is not a function
!4 %in% a  #this works


# data frames - the key structure for data science, multi-dimensional
#   collections of vectors
df<- data.frame(a =  c(1,2,3),
                b = c("chris", "Chris", "kris"))

df$a #single column
df$b

df$moe <-c("bike", "car", "bus")  #adding a column
df
summary(df) #summarize by column


# Special type: factors, and putting it all together ----
# factors are categorical variables with a fixed set of
#   potential values


