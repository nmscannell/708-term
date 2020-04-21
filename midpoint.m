% Midpoint Rule Integration
%   Calculates the integral of f(x)=2+sin(2(sqrt(x)) over
%   the interval [1,6] using Midpoint Rule 
%   
% Input: array of N values
% Output: array of results for each N value

function results = midpoint(n_values)
    % The function to compute the integral for 
    f = @(x) 2 + sin((2*sqrt(x)));
    % The end of the interval 
    endInt = 6;
    % The number of N values in the array 
    numN = size(n_values,2);
    % Declare array for results 
    results = zeros(1, numN);

    % For each N in the n_values array, calculate integral 
    for i=1:(numN)
        a = 1; b = 0; sum = 0;
        % Find delta x for the N value
        deltax = (endInt - a) / n_values(i); 

        % While in the interval [1, 6], find f(a+b)/2 * deltax 
        % for each subinterval. Add to the total sum. 
        while b <= endInt
            b = a + deltax; 
            sum = sum + f((a+b)/2)*deltax; 
            a = b; 
        end
        % Store the end result in the results array. 
        results(i) = sum;
    end

end