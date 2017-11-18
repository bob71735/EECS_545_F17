clear;clc;
X = double(rgb2gray(imread('harvey-saturday-goes7am.jpg')));
[U,S,V] = svd(X);
k = [2 10 40];
X_approximate = zeros(size(X,1),size(X,2),size(k,2));
error = [];
for i = 1:size(k,2)
    X_approximate(:,:,i) = U(:,1:k(i))*S(1:k(i),1:k(i))*transpose(V(:,1:k(i)));
    error = [error norm(X - X_approximate(:,:,i),'fro')/norm(X,'fro')]; 
    subplot(1,size(k,2),i);
    imshow(uint8(X_approximate(:,:,i)));
    txt = sprintf('k = %d ', k(i));
    title(txt);
end
disp(error);