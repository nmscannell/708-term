% Trapezoid Rule Integration
%   Calculates the integral of f(x)=2+sin(2(sqrt(x)) over
%   the interval [1,6] using Trapezoid Rule 
%   
% Input: array of N values
% Output: array of results for each N values

function results = trapezoid(n_values)
    results = zeros(size(n_values));
    for i=1:length(n_values)
        h = 5/n_values(i);
        sum = 0;
        for k=1:n_values(i)-1
            x = 1 + k * h;
            sum = sum + f(x);
        end
        results(i) = sum * 2 + f(1) + f(6);
        results(i) = results(i) * h/2;
    end
end

function out = f(x)
    out = 2;
    out = out + sin(2*sqrt(x));
end