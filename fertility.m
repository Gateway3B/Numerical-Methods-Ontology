function fertility

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
end