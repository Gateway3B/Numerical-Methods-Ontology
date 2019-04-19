function misclassifications = testing(w, x, y)
    misclassifications = zeros(1, size(y,2));
    testMatrix = zeros(size(x,1), size(y,2));

    for i = 1:size(x,1)
        testMatrix(i,:) = w(i,:)' * x(i,:);
        greatest, indexT, indexC = 0;
        for j = 1:size(y,2);
            if(testMatrix(i,j) > greatest)
                greatest = testMatrix(i,j);
                indexT = j;
            end
            if(y(i, j) = 1)
                indexC = j;
            end
        end
        if(indexT ~= indexC)
            misclassifications(indexC) = misclassifications(indexC) + 1;
        end
    end