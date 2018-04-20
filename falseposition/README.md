# falseposition README


## Purpose of Algorithm
I intend for this algorithm to be used to estimate the root of a given function using the False Position Method.

## Inputs
* func - the function being evaluated 
* xl- the lower guess for the value of the root
* xu- the upper guess for the value of the root
* es - the desired relative error, defaults to 0.0001% if not inputted
* maxiter - the number of iterations desired, defaults to 200 if not inputted

## Outputs
* root - the estimated root location using the False Position function
* fx - the function evaluated at the root location
* ea - the approximate relative error 
* iter - how many iterations were performed

## Limitations
* es defaults to 0.0001% if not inputted
* maxiter defaults to 200 if not inputted




