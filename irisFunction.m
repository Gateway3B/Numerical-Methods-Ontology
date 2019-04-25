function [rTrainX, rTrainY, trainingX, trainingY, testingX, testingY, crossX, crossY] = irisFunction()

    fileID = fopen('iris.data','r');
    
    A = zeros(150, 4);
    B = zeros(150, 3);
    
    for x = 1:150
        tline = fgetl(fileID);
        A(x,1) = str2double(tline(1:3));
        A(x,2) = str2double(tline(5:7));
        A(x,3) = str2double(tline(9:11));
        A(x,4) = str2double(tline(13:15));
        if extractBetween(tline, 17, strlength(tline)) == "Iris-virginica"
            B(x,:) = [0,0,1];
        elseif extractBetween(tline, 17, strlength(tline)) == "Iris-versicolor"
            B(x,:) = [0,1,0];
        else
            B(x,:) = [1,0,0];
        end
    end
    fclose(fileID);
    %%loading done
    
    setosaTrainingX = zeros(25, 4);
    setosaTrainingY = zeros(25, 3);
    counter = 1;
    for x = 1 : 25
        setosaTrainingX(counter,:) = A(x,:);
        setosaTrainingY(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    %50 percent for training
    setosaTestingX = zeros(20, 4);
    setosaTestingY = zeros(20, 3);
    for x = 26 : 45
        setosaTestingX(counter,:) = A(x,:);
        setosaTestingY(counter,:) = B(x,:);
        counter = counter + 1;
    end
    counter = 1;
    %40 percent for testing
    setosaCrossValidationX = zeros(5, 4);
    setosaCrossValidationY = zeros(5, 3);
    for x = 46 : 50
        setosaCrossValidationX(counter,:) = A(x,:);
        setosaCrossValidationY(counter,:) = B(x,:);
        counter = counter + 1;
    end
    %10 percent for cross-validation
    %setosa done
    counter = 1;
    
    versicolorTrainingX = zeros(25, 4);
    versicolorTrainingY = zeros(25, 3);
    for x = 1 : 25
        versicolorTrainingX(counter,:) = A(x + 50,:);
        versicolorTrainingY(counter,:) = B(x + 50,:);
        counter = counter + 1;
    end
    counter = 1;
    %50 percent for training
    versicolorTestingX = zeros(20, 4);
    versicolorTestingY = zeros(20, 3);
    for x = 26 : 45
        versicolorTestingX(counter,:) = A(x + 50,:);
        versicolorTestingY(counter,:) = B(x + 50,:);
        counter = counter + 1;
    end
    counter = 1;
    %40 percent for testing
    versicolorCrossValidationX = zeros(5, 4);
    versicolorCrossValidationY = zeros(5, 3);
    for x = 46 : 50
        versicolorCrossValidationX(counter,:) = A(x + 50,:);
        versicolorCrossValidationY(counter,:) = B(x + 50,:);
        counter = counter + 1;
    end
    %10 percent for cross-validation
    %versicolor done
    counter = 1;
    
    virginicaTrainingX = zeros(25, 4);
    virginicaTrainingY = zeros(25, 3);
    for x = 1 : 25
        virginicaTrainingX(counter,:) = A(x + 100,:);
        virginicaTrainingY(counter,:) = B(x + 100,:);
        counter = counter + 1;
    end
    counter = 1;
    %50 percent for training
    virginicaTestingX = zeros(20, 4);
    virginicaTestingY = zeros(20, 3);
    for x = 26 : 45
        virginicaTestingX(counter,:) = A(x + 100,:);
        virginicaTestingY(counter,:) = B(x + 100,:);
        counter = counter + 1;
    end
    counter = 1;
    %40 percent for testing
    virginicaCrossValidationX = zeros(5, 4);
    virginicaCrossValidationY = zeros(5, 3);
    for x = 46 : 50
        virginicaCrossValidationX(counter,:) = A(x + 100,:);
        virginicaCrossValidationY(counter,:) = B(x + 100,:);
        counter = counter + 1;
    end
    %10 percent for cross-validation
    %virginica done
    
    %Order: Virginica, Setosa, Versicolor
    trainingX = cat(1, cat(1, setosaTrainingX, virginicaTrainingX), versicolorTrainingX);
    trainingY = cat(1, cat(1, setosaTrainingY, virginicaTrainingY), versicolorTrainingY);
    
    testingX = cat(1, cat(1, setosaTestingX, virginicaTestingX), versicolorTestingX);
    testingY = cat(1, cat(1, setosaTestingY, virginicaTestingY), versicolorTestingY);
    
    crossX = cat(1, cat(1, setosaCrossValidationX, virginicaCrossValidationX), versicolorCrossValidationX);
    crossY = cat(1, cat(1, setosaCrossValidationY, virginicaCrossValidationY), versicolorCrossValidationY);
    
    for i = 1:(size(setosaTrainingX,1)/5)
            rSetosaTrainX(i,:) = setosaTrainingX(i,:);
            rSetosaTrainY(i,:) = setosaTrainingY(i,:);
    end
    
    for i = 1:(size(virginicaTrainingX,1)/5)
            rVirginicaTrainX(i,:) = virginicaTrainingX(i,:);
            rVirginicaTrainY(i,:) = virginicaTrainingY(i,:);
    end
    
    for i = 1:(size(virginicaTrainingX,1)/5)
            rVersicolorTrainX(i,:) = versicolorTrainingX(i,:);
            rVersicolorTrainY(i,:) = versicolorTrainingY(i,:);
    end
    
    rTrainX = cat(1, cat(1, rSetosaTrainX, rVirginicaTrainX), rVersicolorTrainX);
    rTrainY = cat(1, cat(1, rSetosaTrainY, rVirginicaTrainY), rVersicolorTrainY);
    
    end