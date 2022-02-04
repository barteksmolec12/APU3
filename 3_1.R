install.packages("neuralnet")
library(neuralnet)
trainInput <-  as.data.frame(runif(500, min=1, max=100))
trainOutput <- (trainInput^3) - 
traindata <- cbind(trainInput,trainOutput)
colnames(traindata) <- c("Input","Output")
net.sqrt <- neuralnet(Output~Input,traindata, hidden=7, threshold=0.01, stepmax=1e7)
print(net.sqrt)
plot(net.sqrt, rep = "best")
dataTest<- as.data.frame(runif(500, min=1, max=100))
cleanOut <- cbind(dataTest,dataTest^3-2*dataTest,
                  as.data.frame(net.results$net.result))
colnames(cleanOut) <- c("Input","Expected Output","Neural Net Output")
print(cleanOut)