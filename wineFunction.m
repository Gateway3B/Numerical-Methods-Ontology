function [trainingX, trainingY, testingX, testingY, crossX, crossY] = wineFunction()
    format long g
    A = zeros(178, 13);
    B = zeros(178, 3);
    fileID = fopen('wine.data','r');
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
    TrainingX1 = zeros(29, 13);
    TrainingY1 = zeros(29, 3);
    TestingX1 = zeros(24, 13);
    TestingY1 = zeros(24, 3);
    CrossValidationX1 = zeros(6, 13);
    CrossValidationY1 = zeros(6, 3);
    counter = 1;
    for x = 1:29
        TrainingX1(counter,:) = A(x,:);
        TrainingY1(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 30:53
        TestingX1(counter,:) = A(x,:);
        TestingY1(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 54:59
        CrossValidationX1(counter,:) = A(x,:);
        CrossValidationY1(counter,:) = B(x,:);
        counter = counter + 1;
    end

    counter = 1;
    TrainingX2 = zeros(35, 13);
    TrainingY2 = zeros(35, 3);
    TestingX2 = zeros(29, 13);
    TestingY2 = zeros(29, 3);
    CrossValidationX2 = zeros(7, 13);
    CrossValidationY2 = zeros(7, 3);
    for x = 60:94
        TrainingX2(counter,:) = A(x,:);
        TrainingY2(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 95:123
        TestingX2(counter,:) = A(x,:);
        TestingY2(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 124:130
        CrossValidationX2(counter,:) = A(x,:);
        CrossValidationY2(counter,:) = B(x,:);
        counter = counter + 1;
    end

    counter = 1;
    TrainingX3 = zeros(24, 13);
    TrainingY3 = zeros(24, 3);
    TestingX3 = zeros(19, 13);
    TestingY3 = zeros(19, 3);
    CrossValidationX3 = zeros(5, 13);
    CrossValidationY3 = zeros(5, 3);
    for x = 131:154
        TrainingX3(counter,:) = A(x,:);
        TrainingY3(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 155:173
        TestingX3(counter,:) = A(x,:);
        TestingY3(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    for x = 174:178
        CrossValidationX3(counter,:) = A(x,:);
        CrossValidationY3(counter,:) = B(x,:);
        counter = counter + 1;
    end

    trainingX = cat(1, cat(1, TrainingX1, TrainingX2), TrainingX3);
    trainingY = cat(1, cat(1, TrainingY1, TrainingY2), TrainingY3);

    testingX = cat(1, cat(1, TestingX1, TestingX2), TestingX3);
    testingY = cat(1, cat(1, TestingY1, TestingY2), TestingY3);

    crossX = cat(1, cat(1, CrossValidationX1, CrossValidationX2), CrossValidationX3);
    crossY = cat(1, cat(1, CrossValidationY1, CrossValidationY2), CrossValidationY3);

    for i = 1:(size(TrainingX1,1)/13)
        rTrainingX1(i,:) = TrainingX1(i,:);
        rTrainingY1(i,:) = TrainingY1(i,:);
    end

    for i = 1:(size(TrainingX2,1)/13)
        rTrainingX2(i,:) = TrainingX2(i,:);
        rTrainingY2(i,:) = TrainingY2(i,:);
    end

    for i = 1:(size(TrainingX3,1)/13)
        rTrainingX3(i,:) = TrainingX3(i,:);
        rTrainingY3(i,:) = TrainingY3(i,:);
    end

    rTrainX = cat(1, cat(1, rTrainingX1, rTrainingX2), rTrainingX3);
    rTrainY = cat(1, cat(1, rTrainingY1, rTrainingY2), rTrainingY3);
end
