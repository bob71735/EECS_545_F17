clear;clc;
filename = 'train_features.dat';
train_X = importdata(filename);
train_X = [ones(length(train_X),1) train_X];
filename = 'train_labels.dat';
train_Y = importdata(filename);
filename = 'test_features.dat';
test_X = importdata(filename);
test_X = [ones(length(test_X),1) test_X];
filename = 'test_labels.dat';
test_Y = importdata(filename);

eps = 1e-8;
w_update = zeros(3,1);
w = zeros(3,1);
diff = 1;
iter = 0;
training_error = [log_likelihood(train_Y,train_X,w)];
testing_error = [log_likelihood(test_Y,test_X,w)];
while diff >= eps
    iter = iter + 1;
    g = Gradient(train_Y,train_X,w);
    h_inv = inv(Hessian(train_X,w));
    w_update = w - h_inv*g;
    error1 = log_likelihood(train_Y,train_X,w_update);
    error2 = log_likelihood(test_Y,test_X,w_update);
    training_error = [training_error error1];
    testing_error = [testing_error error2];
    diff = abs(error1 - training_error(end-1));
    w = w_update;    
end
x = 0:1:iter;
plot(x,training_error,x,testing_error);
xlabel('Iteration');
ylabel('Negative log-likelihood'); 
legend('Traning error','Testing error');

