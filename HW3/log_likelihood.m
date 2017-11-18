function l_w = log_likelihood(y,x,w)
    % y: n by 1, x: n by m+1, w: m+1 by 1
    l_w = -transpose(y)*x*w + sum(log(exp(x*w)+1));
end