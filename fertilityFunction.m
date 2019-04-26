function [rTrainX, rTrainY, trainingX, trainingY, testingX, testingY, crossX, crossY] = fertilityFunction()

    A = zeros(100, 9);
    B = zeros(100, 2);
    fileID = fopen('fertility.txt','r');

    for x = 1:100
        tline = fgetl(fileID);
        C = strsplit(tline, ',');
        
        if C(1, 10) == "N"
            B(x,:)=[1,0];
        else
            B(x,:)=[0,1];
        end
        for y = 1:9
            A(x,y) = str2double(C(1,y));
        end
    end
    fclose(fileID);
%N - 44, 39, 5
%O - 6, 5, 1


TrainingXN = zeros(44, 9);
TrainingYN = zeros(44, 2);
TestingXN = zeros(39, 9);
TestingYN = zeros(39, 2);
CVXN = zeros(5, 9);
CVYN = zeros(5, 2);
count = 1;

for x = 1:44
    TrainingXN(count,:)=A(x,:);
    TrainingYN(count,:)=B(x,:);
    count = count + 1;
end
count = 1;
for x = 45:83
    TestingXN(count,:) = A(x,:);
    TestingYN(count,:) = B(x,:);
    count = count + 1;
end
count = 1;
for x = 84:88
    CVXN(count,:) = A(x,:);
    CVYN(count,:) = B(x,:);
    count = count + 1;
end
count = 1;

TrainingXO = zeros(6, 9);
TrainingYO = zeros(6, 2);

rTrainingXO = zeros(6, 9);
rTrainingYO = zeros(6, 2);

TestingXO = zeros(5, 9);
TestingYO = zeros(5, 2);
CVXO = zeros(1, 9);
CVYO = zeros(1, 2);

for x = 1:6
    TrainingXO(count,:)=A(x + 88,:);
    TrainingYO(count,:)=B(x + 88,:);
    count = count + 1;
end
count = 1;
for x = 7:11
    TestingXO(count,:) = A(x + 88,:);
    TestingYO(count,:) = B(x + 88,:);
    count = count + 1;
end
count = 1;
for x = 12:12
    CVXO(count,:) = A(x + 88,:);
    CVYO(count,:) = B(x + 88,:);
    count = count + 1;
end


%Order: N, O
trainingX = cat(1, TrainingXO, TrainingXN);
trainingY = cat(1, TrainingYO, TrainingYN);

testingX = cat(1, TestingXO, TestingXN);
testingY = cat(1, TestingYO, TestingYN);

crossX = cat(1, CVXO, CVXN);
crossY = cat(1, CVYO, CVYN);

for i = 1:(size(TrainingXO,1)/5)
        rTrainingXO(i,:) = TrainingXO(i,:);
        rTrainingYO(i,:) = TrainingYO(i,:);
end

for i = 1:(size(TestingXN,1)/5)
        rTrainingXN(i,:) = TrainingXN(i,:);
        rTrainingYN(i,:) = TrainingYN(i,:);
end

rTrainX = cat(1, rTrainingXO, rTrainingXN);
rTrainY = cat(1, rTrainingYO, rTrainingYN);
end