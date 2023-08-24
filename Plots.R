data.accuracy$CardsIncorrect <- 1 - data.accuracy$Accuracy

d <- Rmisc::summarySE(data.accuracy, measurevar = "CardsIncorrect", groupvars = c("Furniture"))
ggplot(d, aes(x = Furniture, y = CardsIncorrect, fill = Furniture)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin=CardsIncorrect-ci, ymax=CardsIncorrect+ci)) + scale_fill_manual(values=c("#66c2a5", "#fc8d62")) + 
  labs(y = "Cards Incorrect", x = "")

######################################################
d <- Rmisc::summarySE(data.accuracy, measurevar = "CardsIncorrect", groupvars = c("Condition"))
ggplot(d, aes(x = Condition, y = CardsIncorrect, fill = Condition)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin=CardsIncorrect-ci, ymax=CardsIncorrect+ci)) + scale_fill_manual(values=c("#e41a1c", "#377eb8", "#984ea3", "#ff7f00")) + 
  labs(y = "Cards Incorrect", x = "")

######################################################
d <- Rmisc::summarySE(data.accuracy, measurevar = "EuclideanError", groupvars = c("Furniture"))
ggplot(d, aes(x = Furniture, y = EuclideanError, fill = Furniture)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin=EuclideanError-ci, ymax=EuclideanError+ci)) + scale_fill_manual(values=c("#66c2a5", "#fc8d62"))+ 
  labs(y = "Euclidean Distance Error", x = "")

######################################################
d <- Rmisc::summarySE(data.accuracy, measurevar = "EuclideanError", groupvars = c("Condition"))
ggplot(d, aes(x = Condition, y = EuclideanError, fill = Condition)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin=EuclideanError-ci, ymax=EuclideanError+ci)) + scale_fill_manual(values=c("#e41a1c", "#377eb8", "#984ea3", "#ff7f00"))+ 
  labs(y = "Euclidean Distance Error", x = "")


######################################################
mean_Chart <- aggregate(cbind(Mental, Physical, Temporal, Performance, Effort, Frustration, Mean)~Furniture , data=data.subjective , mean)
rownames(mean_Chart) <- mean_Chart[,1]
mean_Chart <- as.matrix(mean_Chart[,-1])

lim <- 1.2*max(mean_Chart)

error.bar <- function(x, y, upper, lower=upper, length=0.1,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

stdev_Chart <- aggregate(cbind(Mental, Physical, Temporal, Performance, Effort, Frustration, Mean)~Furniture , data=data.subjective , sd)
rownames(stdev_Chart) <- stdev_Chart[,1]
se_Baseline <- as.matrix(stdev_Chart[,-1]) / sqrt(12)

ze_barplot <- barplot(mean_Chart , beside=T , legend.text=T,col=c("#66c2a5", "#fc8d62") , ylim=c(0,lim) , ylab="NASA-TLX Score", args.legend = list(x = "topright", inset = c(0, -0.15)), cex.names=0.8)
error.bar(ze_barplot, mean_Chart, se_Baseline)

######################################################
mean_Chart <- aggregate(cbind(Mental, Physical, Temporal, Performance, Effort, Frustration, Mean)~Condition , data=data.subjective , mean)
rownames(mean_Chart) <- mean_Chart[,1]
mean_Chart <- as.matrix(mean_Chart[,-1])

lim <- 1.2*max(mean_Chart)

error.bar <- function(x, y, upper, lower=upper, length=0.05,...){
  arrows(x,y+upper, x, y-lower, angle=90, code=3, length=length, ...)
}

stdev_Chart <- aggregate(cbind(Mental, Physical, Temporal, Performance, Effort, Frustration, Mean)~Condition , data=data.subjective , sd)
rownames(stdev_Chart) <- stdev_Chart[,1]
se_Baseline <- as.matrix(stdev_Chart[,-1]) / sqrt(12)

ze_barplot <- barplot(mean_Chart , beside=T , legend.text=T,col=c("#e41a1c", "#377eb8", "#984ea3", "#ff7f00") , ylim=c(0,lim) , ylab="NASA-TLX Score", args.legend = list(x = "topright", inset = c(0, -0.15)), cex.names=0.8)
error.bar(ze_barplot, mean_Chart, se_Baseline)

######################################################
d <- Rmisc::summarySE(data.rating, measurevar = "Rating", groupvars = c("Furniture"))
ggplot(d, aes(x = Furniture, y = Rating, fill = Furniture)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin=Rating-ci, ymax=Rating+ci)) + scale_fill_manual(values=c("#66c2a5", "#fc8d62"))+ 
  labs(y = "User Rating", x = "")


######################################################
d <- Rmisc::summarySE(data.rating, measurevar = "Rating", groupvars = c("Condition"))
ggplot(d, aes(x = Condition, y = Rating, fill = Condition)) + geom_bar(stat = "identity") + geom_errorbar(aes(ymin=Rating-ci, ymax=Rating+ci)) + 
  scale_fill_manual(values=c("#e41a1c", "#377eb8", "#984ea3", "#ff7f00"))+ 
  labs(y = "User Rating", x = "")

######################################################
d <- Rmisc::summarySE(data.locomotion.condition.eliminated, measurevar = "Rotation", groupvars = c("Condition"))
ggplot(d, aes(x = Condition, y = Rotation, fill = Condition)) + geom_bar(stat = "identity") + 
  geom_errorbar(aes(ymin=Rotation-ci, ymax=Rotation+ci)) + scale_fill_manual(values=c("#e41a1c", "#377eb8", "#984ea3", "#ff7f00"))+ 
  labs(y = "Head Rotation", x = "")