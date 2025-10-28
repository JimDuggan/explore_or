library(ggplot2)
unique(diamonds$cut)
unique(diamonds$color)
unique(diamonds$clarity)

ggplot(diamonds,aes(x=cut)) +
  geom_bar()

ggplot(diamonds,aes(x=color)) +
  geom_bar()

ggplot(diamonds,aes(x=color,fill=cut)) +
  geom_bar()

ggplot(diamonds,aes(x=color,fill=clarity)) +
  geom_bar()

ggplot(diamonds,aes(x=color,fill=clarity)) +
  geom_bar(position="dodge")

ggplot(diamonds,aes(x=color,fill=clarity)) +
  geom_bar(position="fill")

ggplot(diamonds,aes(x=color,fill=cut)) +
  geom_bar(position="fill")

ggplot(diamonds,aes(x=cut,y=carat)) + geom_boxplot()

ggplot(diamonds,aes(x=cut,y=carat,colour=color)) + geom_boxplot()





