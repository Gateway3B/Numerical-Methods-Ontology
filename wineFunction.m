function wine
    format long g
    A = zeros(178, 13);
    B = zeros(178, 3);
    fileID = fopen('wine.txt','r');
    for x = 1:178
        tline = fgetl(fileID);
        C = strsplit(tline, ',');
        
        if C(1, 1) == "1"
            B(x,:)=[1,0,0];
        elseif C(1, 1) == "2"
            B(x,:)=[0,1,0];
        else
            B(x,:)=[0,0,1];
        end
        for y = 1:13
            A(x,y) = str2double(C(1,y + 1));
        end
    end
    fclose(fileID);
    %loading done

    %1 - 59: 29 for training, 24 for testing, 6 for cross-validation
    %2 - 71: 35 for training, 29 for testing, 7 for cross-validation
    %3 - 48: 24 for training, 19 for testing, 5 for cross-validation
    1TrainingX = zeros(29, 13);
    1TrainingY = zeros(29, 3);
    1TestingX = zeros(24, 13);
    1TestingY = zeros(24, 3);
    1CrossValidationX = zeros(6, 13);
    1CrossValidationY = zeros(6, 3);
    counter = 1;
    for x = 1:29
        1TrainingX(counter,:) = A(x,:);
        1TrainingY(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 30:53
        1TestingX(counter,:) = A(x,:);
        1TestingY(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 54:59
        1CrossValidationX(counter,:) = A(x,:);
        1CrossValidationY(counter,:) = B(x,:);
        counter = counter + 1;
    end

    counter = 1;
    2TrainingX = zeros(35, 13);
    2TrainingY = zeros(35, 3);
    2TestingX = zeros(29, 13);
    2TestingY = zeros(29, 3);
    2CrossValidationX = zeros(7, 13);
    2CrossValidationY = zeros(7, 3);
    for x = 60:94
        2TrainingX(counter,:) = A(x + 59,:);
        2TrainingY(counter,:) = B(x + 59,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 95:123
        2TestingX(counter,:) = A(x + 59,:);
        2TestingY(counter,:) = B(x + 59,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 124:130
        2CrossValidationX(counter,:) = A(x + 59,:);
        2CrossValidationY(counter,:) = B(x + 59,:);
        counter = counter + 1;
    end

    counter = 1;
    3TrainingX = zeros(24, 13);
    3TrainingY = zeros(24, 3);
    3TestingX = zeros(19, 13);
    3TestingY = zeros(19, 3);
    3CrossValidationX = zeros(5, 13);
    3CrossValidationY = zeros(5, 3);
    for x = 131:154
        3TrainingX(counter,:) = A(x + 59 + 71,:);
        3TrainingY(counter,:) = B(x + 59 + 71,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 155:173
        3TestingX(counter,:) = A(x + 59 + 71,:);
        3TestingY(counter,:) = B(x + 59 + 71,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 174:178
        3CrossValidationX(counter,:) = A(x + 59 + 71,:);
        3CrossValidationY(counter,:) = B(x + 59 + 71,:);
        counter = counter + 1;
    end
end