#Install packages
#
#renv::install("tidyverse")
#renv::snapshot()
#renv::lockfile_read()
#renv::activate

library("tidyverse")
library("ggplot2")

#see the structure of the data 
data(iris)

iris = as_tibble(iris)
head(iris)
tail(iris)
summary(iris)
str(iris)

iris
iris %>% summarize_if(is.numeric, mean)

###do some data manipulation 

df = tbl_df(iris) 
df
arrange(df, Sepal.Length, Petal.Width)
arrange(df, desc(Sepal.Length))

mutate(df, log.Sepal.length = log(Sepal.Length))

df %>% 
  group_by(Species) %>%
  summarise(mean(Petal.Length))

#plot the data 
#first one scatter plot
ggplot(data=df, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

#second one 
facet = ggplot(data=df, aes(Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point(aes(shape=Species), size=1.5) +
  xlab("Sepal Length") +
  ylab("Sepal Width") +
  ggtitle("Faceting") 
# Along columns
facet + facet_grid(. ~ Species)

#third one boxplot 

box = ggplot(data=df, aes(x=Species, y=Sepal.Length))

box + 
  geom_boxplot(aes(fill=Species)) +
  ylab("Sepal Length") +
  ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)


#renv::snapshot()
###deactivate the renv 
#renv::deactivate()

data(iris)

