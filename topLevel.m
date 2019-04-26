function t = topLevel()
    %iris
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = irisFunction();
    Iris50 = testing(training(trainX, trainY, crossValidation(trainX, trainY, crossX, crossY)), testX, testY)
    misses(3, Iris50)

    Iris10 = testing(training(rTrainX, rTrainY, crossValidation(rTrainX, rTrainY, crossX, crossY)), testX, testY)
    misses(3, Iris10)
    
    %wine
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = wineFunction();
    Wine50 = testing(training(trainX, trainY, crossValidation(trainX, trainY, crossX, crossY)), testX, testY)
    misses(size(trainY,2), Wine50)

    Wine10 = testing(training(rTrainX, rTrainY, crossValidation(rTrainX, rTrainY, crossX, crossY)), testX, testY)
    misses(size(trainY,2), Wine10)
    
    %caesarian
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = caesarianFunction();
    Caesarian50 = testing(training(trainX, trainY, crossValidation(trainX, trainY, crossX, crossY)), testX, testY)
    misses(size(trainY,2), Caesarian50)

    Caesarian10 = testing(training(rTrainX, rTrainY, crossValidation(rTrainX, rTrainY, crossX, crossY)), testX, testY)
    misses(size(trainY,2), Caesarian10)