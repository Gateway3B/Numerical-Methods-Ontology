function w = training(x, y, lambda)
    sum1 = 0;
    sum2 = 0;
    x = [x ones(size(x,1), 1)];
    for i = 1:size(x,1)
        sum1 = sum1 + (x(i,:)' * x(i,:)) + (lambda * eye(size(x,2)));
        sum2 = sum2 + (x(i,:)' * y(i,:));
    end
    w = inv(sum1)*sum2;