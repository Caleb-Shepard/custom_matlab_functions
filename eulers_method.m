clear;
a = 1; b = 3;                     % Define initial and terminal points
h = 0.1;                          % Discretization

% Call eulers method for defined values
eulers_method(a,b,h);
% to print the return values of the function, uncomment the following
% eulers_method(a,b,h) % note that there is no semicolon

% Define Eulers Method
function [x, y] = eulers_method(a,b,h)
    n = (b - a)/h;                        % n = # of subintervals aka loop iterations
    fprintf ('Using %d subintervals ... ', n) % Announce the number of subintervals used
    f = @ (x, y) y^2* sin(x) + 1;         % Define the function

    x(1) = a; y(1) = -2;                  % In Matlab index should start with 1.
    for i = 1:n
        y(i+1) = y(i) + h*f(x(i), y(i));  % Calculate yi+1
        x(i+1) = x(i) + h;                % Calculate xi+1
    end

    fprintf ('y(%d) is %7.5f', b, y(n+1)) % This is formatted output 
end

