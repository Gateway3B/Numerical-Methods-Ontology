function iris

fileID = fopen('iris.txt','r');

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
end