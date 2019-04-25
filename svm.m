function misclassifications = svm()
    [rTrainX, rTrainY, trainX, trainY, testX, testY, crossX, crossY] = irisFunction();
    classes = size(trainY, 2);
    mult = [1 2 3];
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