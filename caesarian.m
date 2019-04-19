function caesarian
    A = zeros(80, 5);
    B = zeros(80, 2);
    fileID = fopen('caesarian.txt','r');
    for x = 1:80
        tline = fgetl(fileID);
        C = strsplit(tline, ',');
        
        if C(1, 1) == "1"
            B(x,:)=[1,0];
        else
            B(x,:)=[0,1];
        end
        for y = 1:5
            A(x,y) = str2double(C(1,y));
        end
    end
    fclose(fileID);
%1 - 20, 16, 4
%0 - 20, 16, 4

TrainingX1 = zeros(20, 5);
TrainingY1 = zeros(20, 2);
TestingX1 = zeros(16, 5);
TestingY1 = zeros(16, 2);
CVX1 = zeros(4, 5);
CVY1 = zeros(4, 2);
count = 1;

for x = 1:20
    TrainingX1(count,:)=A(x,:);
    TrainingY1(count,:)=B(x,:);
    count = count + 1;
end
count = 1;
for x = 21:36
    TestingX1(count,:) = A(x,:);
    TestingY1(count,:) = B(x,:);
    count = count + 1;
end
count = 1;
for x = 37:40
    CVX1(count,:) = A(x,:);
    CVY1(count,:) = B(x,:);
    count = count + 1;
end
count = 1;

TrainingX0 = zeros(20, 5);
TrainingY0 = zeros(20, 2);
TestingX0 = zeros(16, 5);
TestingY0 = zeros(16, 2);
CVX0 = zeros(4, 5);
CVY0 = zeros(4, 2);

for x = 1:20
    TrainingX0(count,:)=A(x + 40,:);
    TrainingY0(count,:)=B(x + 40,:);
    count = count + 1;
end
count = 1;
for x = 21:36
    TestingX0(count,:) = A(x + 40,:);
    TestingY0(count,:) = B(x + 40,:);
    count = count + 1;
end
count = 1;
for x = 37:40
    CVX0(count,:) = A(x + 40,:);
    CVY0(count,:) = B(x + 40,:);
    count = count + 1;
end
end