library(datasets)

x <- c(1:101)
y <- c(1:100,2)
plot(x,y)

#histograma
hist(airquality$Ozone)

#Scatterplot
with(airquality,plot(Wind,Ozone))

#Boxplot
airquality <- transform(airquality,Month= factor(Month))
boxplot(Ozone ~ Month,airquality, xlab='Month', ylab ='Ozone (ppb)')


with(airquality,plot(Wind,Ozone))
with(subset(airquality,Month == 5),points(Wind,Ozone,col='red'))


with(airquality,plot(Wind,Ozone))
with(subset(airquality,Month == 5),points(Wind,Ozone,col='red'))
with(subset(airquality,Month != 5),points(Wind,Ozone,col='blue'))
legend('topright',pch = 1 , col =c('blue','red'),legend=c('May','Other months'))


with(airquality,plot(Wind,Ozone),pch=20)
model <- lm(Ozone ~Wind,airquality)
abline(model,lwd=2)
