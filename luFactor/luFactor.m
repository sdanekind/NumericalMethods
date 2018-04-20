function [L,U,P] = luFactor(A)
%luFactor This function determines the LU Factorization of a square matrix using partial pivoting.  
%inputs:
%   A - coefficient matrix
%outputs:
%L - lower triangular matrix
%U - upper triangular matrix
%P - the pivot matrix

%declaring a variable for the size of the matrix
[m, n] = size(A); %size of m x n matrix

%error if matrix isn't square
if m ~= n
    error('The matrix has to be square. Please input a square matrix.');
end

%returning error if the number of inputs is wrong
if nargin ~= 1
    error('Please enter only one matrix');
end

%initializing variables
L = eye(n); % n x n identity matrix
P = eye(n); % n x n identity matrix
U = A; %setting U equal to A

for k = 1:m-1 %from row 1 to the second to last row
    pivot = max(abs(U(k:m,k))); %takes absolute value of each element in row k of the U matrix, 
    %then finds the maximum element value, sets this equal to variable pivot
    
    %rearranging rows for pivoting
    for j = k:m  
        if (abs(U(j,k)) == pivot) %if the absolute value of element j,k of matrix U = pivot
            new = j; %variable new is equal to variable j
            break;
        end
    end
    
U([k,new],k:m)=U([new,k],k:m); %change element value to new,k from k to m in matrix U 
L([k,new],1:k-1)=L([new,k],1:k-1); %change element to new,k from 1 to k-1 in matrix L
P([k,new],:)=P([new,k],:); %change element to new,k for all elements in matrix P
    for j=k+1:m
        L(j,k)=U(j,k)/U(k,k); %change element to j,k divided by k/k in matrix L
        U(j,k:m)=U(j,k:m)-L(j,k)*U(k,k:m); %change element to matrix U element j, k to m minus matrix L jk...
        %times matrix U k,k to m
    end
    
    %checking that the lu decomposition is correct
    if L * U ~= A %checking that L * U = A to make sure the LU decomposition is correct
       fprintf('A problem occurred and the LU decomposition is incorrect.')
    elseif L * U ~= A % L * U should = A, so no error if this is true
        fprintf('LU decomposition is correct.')
    end
 
end

end