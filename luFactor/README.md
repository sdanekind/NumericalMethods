# luFactor README


## Purpose of Algorithm
I intend for this algorithm to be used to determine the LU Factorization of a square matrix using partial pivoting. 

## Inputs
* A = coefficient matrix, must be a square

## Outputs
* L - the lower triangular matrix from LU Factorization
* U - the upper triangular matrix from LU Factorization
* P - the pivot matrix

## Limitations
* the function will not work if the coefficient matrix isn't square

## Other Information
* the function does not work for some cases, this needs to be fixed in the future
* the function returns an error if the wrong number of inputs is inputted
* the function checks that the LU Factorization was correct by doing L * U = A



