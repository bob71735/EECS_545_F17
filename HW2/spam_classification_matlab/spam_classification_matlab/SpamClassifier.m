clear;clc;
%Training
filename_Y = 'DENSE.TRAIN.Y.1400';
filename_X = 'DENSE.TRAIN.X.1400';
Y = importdata(filename_Y);
X = importdata(filename_X);
count = zeros(2,size(X,2));
count(1,:) = sum(X(Y == 1,:));
count(2,:) = sum(X(Y == -1,:));
p_w_y = zeros(size(count,2),size(count,1));
p_w_y(:,1) = (1 + count(1,:))/(size(count,2) + sum(count(1,:)));
p_w_y(:,2) = (1 + count(2,:))/(size(count,2) + sum(count(2,:)));
py = [sum(Y == 1)/size(Y,1), sum(Y == -1)/size(Y,1)];
clear filename_Y filename_X count Y X;

%Testing
filename_Ytest = 'DENSE.TEST.Y';
filename_Xtest = 'DENSE.TEST.X';
Y_test = importdata(filename_Ytest);
X_test = importdata(filename_Xtest);
Test_result = zeros(size(Y_test));
prob = zeros(size(Y_test,1),2);
prob(:,1) = log10(py(1)) + X_test*log10(p_w_y(:,1));
prob(:,2) = log10(py(2)) + X_test*log10(p_w_y(:,2));
Test_result = 1*(prob(:,1) > prob(:,2));
Test_result(Test_result == 0) = -1;
error = sum(Test_result ~= Y_test)/size(Y_test,1);
clear filename_Ytest filename_Xtest Test_result Y_test X_test prob;

token_ratio = log10(p_w_y(:,1))- log10(p_w_y(:,2));
[n,I] = sort(token_ratio,'descend');
token = importdata('TOKENS_LIST');
Indicator = token(I(1:5));
disp(Indicator);
clear token_ratio n I token;




 