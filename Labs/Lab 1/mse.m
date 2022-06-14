function [mse] = mse(f,g)
%Mean Squared Error
%   Assume f, g same size array
[row, col] = size(f);
mse = sum((double(f) - double(g)).^2, 'all')/(row * col);
end

