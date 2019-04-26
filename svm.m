function misclassifications = svm()
    %iris
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = irisFunction();
    classes = size(trainY, 2);
    A = ones(classes);
    mult = sum(triu(A));
    trainY = trainY .* mult;
    trainY = sum(trainY, 2);
    Mdl = fitcecoc(trainX,trainY);
    labels = predict(Mdl, testX);
    
    
    misclassifications = zeros(classes, classes);
    testY = testY .* mult;
    testY = sum(testY, 2);
    for i = 1:size(testX, 1)
       misclassifications(testY(i), labels(i)) = misclassifications(testY(i), labels(i)) + 1;
    end
    misclassifications
    
    %wine
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = wineFunction();
    classes = size(trainY, 2);
    A = ones(classes);
    mult = sum(triu(A));
    trainY = trainY .* mult;
    trainY = sum(trainY, 2);
    Mdl = fitcecoc(trainX,trainY);
    labels = predict(Mdl, testX);
    
    
    misclassifications = zeros(classes, classes);
    testY = testY .* mult;
    testY = sum(testY, 2);
    for i = 1:size(testX, 1)
       misclassifications(testY(i), labels(i)) = misclassifications(testY(i), labels(i)) + 1;
    end
    misclassifications
    
    %caesarian
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = caesarianFunction();
    classes = size(trainY, 2);
    A = ones(classes);
    mult = sum(triu(A));
    trainY = trainY .* mult;
    trainY = sum(trainY, 2);
    Mdl = fitcecoc(trainX,trainY);
    labels = predict(Mdl, testX);
    
    
    misclassifications = zeros(classes, classes);
    testY = testY .* mult;
    testY = sum(testY, 2);
    for i = 1:size(testX, 1)
       misclassifications(testY(i), labels(i)) = misclassifications(testY(i), labels(i)) + 1;
    end
    misclassifications
    
    %fertility
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = fertilityFunction();
    classes = size(trainY, 2);
    A = ones(classes);
    mult = sum(triu(A));
    trainY = trainY .* mult;
    trainY = sum(trainY, 2);
    Mdl = fitcecoc(trainX,trainY);
    labels = predict(Mdl, testX);
    
    
    misclassifications = zeros(classes, classes);
    testY = testY .* mult;
    testY = sum(testY, 2);
    for i = 1:size(testX, 1)
       misclassifications(testY(i), labels(i)) = misclassifications(testY(i), labels(i)) + 1;
    end
    misclassifications