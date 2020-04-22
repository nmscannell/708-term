% Monte Carlo Integration
%   Calculates the integral of f(x)=2+sin(2(sqrt(x)) over
%   the interval [1,6] using Monte Carlo Simulation. For each
%   N value, the average is calculated for the function evaluated
%   at N random points within the interval [1,6]. The average is
%   then multiplied by the length of the interval. As N increases,
%   the accuracy of Monte Carlo increases.
%   
% Input: array of N values
% Output: array of results for each N value

function results = monte_carlo(n_values)
    f = @(x) 2 + sin((2*sqrt(x)));
    results = zeros(size(n_values));
    for i=1:length(n_values)
        sum = 0;
        for j=1:n_values(i)
            sum = sum + f(5*rand + 1);
        end
        sum = sum/n_values(i);
        results(i) = sum * 5;
    end
end