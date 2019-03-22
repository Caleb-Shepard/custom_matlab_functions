% Exercise 3:Use Newton’s method to find satisfactory solutions to
% 2x = 3 * cos(x) + 1;
% 49t + 245e^(-t/5) = 545

f  = "2*x - 3*cos(x)-1";
df = "2 + 3*sin(x)";
g  = "49*t + (245 * 2.71828)^(-t/5) - 545";
%dg = "49 + (-1/5)*245*e.*(-t/5)"; -> but "e" is not a recognized constant in matlab. Must use the constant value below.
%dg = "49 + (-1/5)*245*2.71828.*(-t/5)";
dg = "49 + ((-1/5) * 245 * 2.71828)^(-t/5)";

% Call our newton method, at the end of our file
disp(newton(f, df, 1, 3, 35));
disp(newton(g, dg, 1, 2.5, 1000));

% NEWTON Newton's Method
%   Newton's method for finding successively better approximations to the 
%   zeroes of a real-valued function.

% Input:
%   f - input funtion
%   df - derived input function
%   x0 - initial aproximation
%   tolerance - tolerance
%   max_number_of_iterations - maximum number of iterations
%   argc number of arguments


% Output:
%   x - aproximation to root
%   ex - error estimate

% Example:
%	[ x, ex ] = newton( 'exp(x)+x', 'exp(x)+1', 0, 0.5*10^-5, 10 )

function [ x, ex ] = newton( f, df, x0, tolerance, max_number_of_iterations )

    % rename nargin
    argc = nargin;
    
    if argc == 3
        tolerance = 1e-4;
        max_number_of_iterations = 1e1;
    elseif argc == 4
        max_number_of_iterations = 1e1;
    elseif argc ~= 5
        error('newton: invalid input parameters');
    end
    
    f = inline(f);
    df = inline(df);
    
    x(1) = x0 - (f(x0)/df(x0));
    ex(1) = abs(x(1)-x0);
    k = 2;
    
    % iterate to the point of desired accuracy
    while (ex(k-1) >= tolerance) && (k <= max_number_of_iterations)
        x(k) = x(k-1) - (f(x(k-1))/df(x(k-1)));
        ex(k) = abs(x(k)-x(k-1));
        k = k+1;
    end
end
