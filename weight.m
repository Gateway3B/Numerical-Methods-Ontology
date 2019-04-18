function w = weight(x, y)
    lambda = 0;
    sum1, sum2 = zeros(size(x,1), size(x,2));

    for i = 1:size(x,1)
        sum1 = sum1 + (x(i,:) * x(i,:)') + lambda;
        sum2 = sum2 + (x(i,:) * y(i,:)');
    end;

    w = inv(sum1) * sum2;
