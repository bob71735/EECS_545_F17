clear;clc;
filename = 'diabetes_scale.csv';
data = csvread(filename);

train_X = data(1:500,2:end);
train_Y = data(1:500,1);
test_X = data(501:end,2:end);
test_Y = data(501:end,1);
C = linspace(0.1, 2, 20);
idx = crossvalind('Kfold', 500, 5);
rng(42);
%Soft-Margin
ce = zeros(20,1);
for i = 1:20
    SM_mdl = fitcsvm(train_X,train_Y,'KFold',5,'BoxConstraint',C(i));
    ce(i) = kfoldLoss(SM_mdl);
end
[~,I] = min(ce);
C_best = C(I);
SM_mdl = fitcsvm(train_X,train_Y,'BoxConstraint',C_best);
SM_label = predict(SM_mdl,test_X);
SM_accuracy = sum(SM_label==test_Y)/length(test_Y);    

%Hard-Margin
HM_mdl = fitcsvm(train_X,train_Y,'BoxConstraint',1e6);
HM_label = predict(HM_mdl,test_X);
HM_accuracy = sum(HM_label==test_Y)/length(test_Y);