function misclassifications = testing(w, x, y)
    misclassifications = zeros(1, size(y,2));
    testMatrix = zeros(size(x,1), size(y,2));
    x = [x ones(size(x,1), 1)];
        indexT = 0;
        indexC = 0;
        greatest = 0;

    for i = 1:size(x,1)
        for j = 1:size(y,2)
            testMatrix(i,j) = w(j,:) * x(i,:)';
        end
        for j = 1:size(y,2)
            greatest = 0;
            if(testMatrix(i,j) > greatest)
                greatest = testMatrix(i,j);
                indexT = j;
            end
            if(y(i, j) == 1)
                indexC = j;
            end
        end
        if(indexT ~= indexC)
            misclassifications(indexC) = misclassifications(indexC) + 1;
        end
    end