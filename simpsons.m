% Simpson's Rule Integration
%   Calculates the integral of f(x)=2+sin(2(sqrt(x)) over
%   the interval [1,6] using Simpson's Rule 
%   
% Input: array of N values
% Output: array of results for each N value

function results = simpsons(n_values) 
    % The function to compute the integral for 
    f = @(x) 2 + sin((2*sqrt(x)));
    % The number of N values in the array 
    numN = length(n_values);
    % Declare array for results 
    results = zeros(size(n_values));
    
    % For each N in the n_values array, calculate approximate integral 
    for i=1:(numN) 
        a = 1; b = 6; sum = 0; 
        n = n_values(i);
        % Find delta x for the n
        deltax = (b - a) / n; 
        
        % Do the even summation 
        x1 = (n/2)-1; 
        sum1 = doFirstSummation(x1, f, deltax, a);
            
        % Do the odd summation 
        x2 = (n/2);
        sum2 = doSecSummation(x2, f, deltax, a);
          
        % Add results together for final result 
        sum = sum + (deltax/3)*(f(a) + sum1 + sum2 + f(b));  

        % Add sum to the results array 
        results(i) = sum;   
        
    end
    
end 


% A function to calcuate the "even" summation for Simpson's rule
% Inputs: 
% upperBnd : upper limit for summation 
% func : the function to calculate integral for 
% h : size of the subinterval 
% a : lower limit of integral to compute 
% Output: 
% The value of the summation 
function sum = doFirstSummation(upperBnd, func, h, a)
    k = 1; sum = 0; 
    while k <= upperBnd
        sum = sum + func(a + (2*k)*h);
        k = k + 1;
    end   
    sum = 2*sum;
end 

% A function to calcuate the "odd" summation for Simpson's rule
% Inputs: 
% upperBnd : upper limit for summation 
% func : the function to calculate integral for 
% h : size of the subinterval 
% a : lower limit of integral to compute 
% Output: 
% The value of the summation 
function sum = doSecSummation(upperBnd, func, h, a)
    k = 1; sum = 0; 
    while k <= upperBnd
        sum = sum + func(a + (2*k-1)*h);
        k = k + 1;
    end   
    sum = 4*sum;
end 
