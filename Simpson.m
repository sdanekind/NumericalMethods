function I = Simpson(x,y)
%This function uses Simpson's 1/3 rule and the trapezoidal rule to estimate
%the integral of an experimental data set. 
%   If the number of segments is even, Simpson's Composite 1/3 Rule is used
%   to estimate the integral of x with respect to y. If the number of
%   segments is odd, Simpson's Composite 1/3 Rule is used
%   to estimate the integral of x with respect to y for all segments except
%   the last segment. The trapezoidal rule is used to approximate the area
%   of the last segment. The area of the trapezoid is added to the results
%   of Simpson's Composite 1/3 Rule. The function will not run if the
%   elements in the x matrix aren't evenly spaced, or if the x and y
%   elements aren't the same size. 

if numel(x) ~= numel(y) %if the number of elements in matrices x and y aren't equal
    error('Inputs x and y must be the same dimensions.')
end

diffmat = diff(x); %difference matrix of matrix x

if min(diffmat) ~= max(diffmat) || max(diffmat) - min(diffmat) ~= 0
    error('The elements in matrix x must be evenly spaced.')
end

c = numel(x); %assigning the number of elements in matrix x to variable c
remain = mod(c,2); %assigning variable to remainder of length of x divided by 2
n = length(x); %assigning length of matrix x to variable n
b = x(n); %assigning b variable
a = x(1); %assigning a variable
h = (b-a)/n; %creating h variable
s4 = 0; %initializing 4*f(xi)
s2 = 0; %initializing 2*f(xj)

%using only the simpson's 1/3 rule to evaluate
if remain ~= 0 %if the number of segments is even
   
   for i = 2: 2: n %for the even numbered elements of matrix x starting at the second element and ending at n
       s4 = s4 + 4*y(i); %new sum is 4 times element i of matrix y
   end
   
   for i = 3:2:n-1 %for the odd numbered elements of matrix x starting at the third element and ending at n-1
       s2 = s2 + 2*y(i); %new sum is 2 times element i of matrix y 
   end
   
   integral = (h/3)*(y(1)+s4+s2+y(n)); %integral is y value of 1st element + s4 + s2 + y value of last element
   
   disp('The area calculated using the Simpson''s 1/3 composite rule is approximately:'); %printing results
   disp(integral); %printing results
   I = integral; %assigning integral variable to output variable I
end

%using simpson's 1/3 rule for all segments except the last, and using the
%trapezoidal rule for the last segment
if remain == 0
    
    n = n-1; %reassigning n so the last segment will be evaluated using the trapezoidal rule
    
    %simpson's 1/3 rule
    for i = 2: 2: n %for the even numbered elements of matrix x starting at the second element and ending at n
       s4 = s4 + 4*y(i); %new sum is 4 times element i of matrix y
   end
   
   for i = 3:2:n-1 %for the odd numbered elements of matrix x starting at the third element and ending at n-1
       s2 = s2 + 2*y(i); %new sum is 2 times element i of matrix y 
   end
   
   integral = (h/3)*(y(1)+s4+s2+y(n)); %integral is y value of 1st element + s4 + s2 + y value of last element
    
 %using trapezoidal rule for last segment
   disp('Warning: the trapezoidal rule had to be used in the last segment.'); %warning user that trap rule had to be used   
    a1 = y(n-1); %defining variable a1
    b1 = y(n); %defining variable b1
    h1 = x(n-1,1) - x(n, 1); %defining height variable
    area = ((a1+ b1)*h1)/2; %calculating area of trapezoid
    newI = integral + area; %adding area calculated by simpson's rule to area calculated by trapezoidal rule
    disp('The area calculated using the Simpson''s 1/3 composite rule for all segments except the last, and using the trapezoidal rule for the last segment is:');
    disp(newI);
    I = newI; %assigning newI variable to output variable I
end
end
   


