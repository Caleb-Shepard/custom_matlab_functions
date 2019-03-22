clear;

% Define test variables --------------------------------------------------
a = 1; b = 3;                     % Define initial x and x terminal points
% y(1) = -2;                      'iv' in var names means initial value
y_iv_x = 1;                       % y(1)
y_iv_y = -2;                      % = -2
h = 0.1;                          % Discretization
f = @ (x, y) y^2* sin(x) + 1;     % Define the function f; this needs x, y

% Call eulers method for defined values ----------------------------------
ode_eulers_method(a,b,h,f,y_iv_x,y_iv_y);
% to print the return values of the function, uncomment the following
% eulers_method(a,b,h) % note that there is no semicolon

% Define Eulers Method ---------------------------------------------------
function [x, y] = ode_eulers_method(a,b,h,f,y_iv_x,y_iv_y)
    n = (b - a)/h;                        % n = # of subints | loop iters
    fprintf ('Using %d subintervals: ', n)% Number of subintervals used

    x(1) = a; y(y_iv_x) = y_iv_y;         % Matlab indices start with 1
    for i = 1:n
        y(i+1) = y(i) + h*f(x(i), y(i));  % Calculate yi+1
        x(i+1) = x(i) + h;                % Calculate xi+1
    end

    fprintf ('y(%d) is %7.5f', b, y(n+1)) % This is formatted output 
end
