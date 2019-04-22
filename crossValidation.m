function bestLambda = crossValidation(trainX, trainY, crossX, crossY)
    lambdaMisses = 0;
    newLambdaMisses = 0;
    lambda = 0;
    lambdaMisses = sum(testing(training(trainX, trainY, 0), crossX, crossY));
    lambda = .001;
    bestLambda = 0;
    for i = 1:6
        lambda = lambda * 10;
        newLambdaMisses = sum(testing(training(trainX, trainY, 0), crossX, crossY));
        if(newLambdaMisses < lambdaMisses) then
            lambdaMisses = newLambdaMisses;
            bestLambda = lambda;
        end
    end
end