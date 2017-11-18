function g = Gradient(y,x,w)
    linear_comb = -x*w;
    a = y - 1./(1+exp(linear_comb));
    g = -transpose(x)*a;
end