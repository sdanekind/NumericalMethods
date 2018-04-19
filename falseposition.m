function [root,fx,ea,iter] = falseposition(func,xl,xu,es,maxiter)
%falseposition This function estimates the root of a given funtion.
%inputs:
%func - the function being evaluated
%xl - the lower guess, also known as the lower bound of the bracketed root
%xu - the upper guess, also known as the upper bound of the bracketed root
%es - the desired relative error (should default to 0.0001%)
%maxiter - the number of iterations desired (should default to 200)
%outputs:
%root - the estimated root location
%fx - the function evaluated at the root location
%ea - the approximate relative error (%)
%iter - how many iterations were performed

%checking that 5 inputs were given
if nargin > 5
    error('Please do not enter more than 5 input arguments.');   
end

%approximate relative error ea defaults to 100% for the first guesss
ea = 1;

%first iteration
iter = 1;

%f1 is f(xu)
f1 = func(xu);

%fx is f(xl)
f2 = func(xl);

%initializing variables oldroot and root
oldroot = 0;
root = 0;

%while loop that runs while the approximate relative error ea is less than
%the desired relative error es
while ea > es && iter < maxiter
    %false position equation calculates the root approximation xr
    xr = xu - (f1)*(xl-xu)/(f2-f1);
    oldroot = root;
    %storing root approximation xr in a vector called root
    root = xr;
    %calculating relative approximate error ea 
    %using equation error = (true-approx)/true
    ea = abs(root - oldroot)/(root);
    %evaluating the function at xr
    fx = func(xr);
    %if the sign of root approximation xr is the same as the sign of f(xr),
    %replace the upper bound with xr and f(xr) with f(xu)
    if sign(xr) == sign(f1)
        xu = xr;
        f1 = fx;
    %otherwise replace the lower bound with xr and f(xl) with f(xr)
    else
        xl = xr;
        f2 = fx;
    end
    iter = iter + 1; %increasing the iteration counter
end
 fprintf('Number of iterations: %d\n',iter);
end




