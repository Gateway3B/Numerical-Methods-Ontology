function bestLambda = crossValidation(trainX, trainY, crossX, crossY)
    lambdaMisses = 0;
    newLambdaMisses = 0;
    lambda = 0;
    A = ones(size(trainY, 2));
    cancelMatrix = tril(A,-1) + tril(A,-1)';
    lambdaMisses = sum(testing(training(trainX, trainY, 0), crossX, crossY).*cancelMatrix);
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
    bestLambda
end