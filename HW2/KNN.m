clear;clc;
load mnist_data.mat;
K = [1 5 9 13];
%s = RandStream('mt19937ar','Seed',0);
%RandStream.setGlobalStream(s);
test_sample_index = randperm(size(test,1),100);
class_l2 = zeros(100,4);
class_l1 = zeros(100,4);
for i = 1:100
    index = test_sample_index(i);
    diff = train(:,2:end) - repmat(test(index,2:end),size(train,1),1);
    diff_l2 = sqrt(sum(diff.^2,2)); % L2-norm
    diff_l1 = sum(abs(diff),2); % L1-norm
    [B2 I2] = sort(diff_l2);
    [B1 I1] = sort(diff_l1);
    for j = 1:size(K,2)
        class_l2(i,j) = mode(train(I2(1:K(j)),1));
        class_l1(i,j) = mode(train(I1(1:K(j)),1));
    end
end
accuracy_rate_l2 = zeros(1,4);
accuracy_rate_l1 = zeros(1,4);
for n = 1:4
    accuracy_rate_l2(n) = sum(class_l2(:,n) == test(test_sample_index,1))/100;
    accuracy_rate_l1(n) = sum(class_l1(:,n) == test(test_sample_index,1))/100;
end