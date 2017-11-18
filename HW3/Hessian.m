function H = Hessian(x,w)
    linear_comb = -x*w;
    a = exp(linear_comb);
    b = 1./(1 + exp(linear_comb)).^2;
    c = a.*b;
    xx = x.*repmat(c,1,3);
    H = transpose(x)*xx;
end