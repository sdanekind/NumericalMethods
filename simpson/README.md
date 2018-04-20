# Simpson README


## Purpose of Algorithm
I intend for this algorithm to be used to approximate the area bounded by data points on a graph by the Simpsons 1/3 Rule and the trapezoidal method. The function outputs an approximation for the integral of the experimental data. If there is an even number of intervals between data points, only the Simpsons 1/3 Rule will be used. If there is an odd number of intervals, the Simpsons 1/3 Rule will be used for all intervals except the last; the last interval will be approximated using a single application of the trapezoidal rule. 

## Inputs
* x - vector containing experimental data points
* y - vector containing experimental data points, the function will integrate function values y with respect to x

## Outputs
* I - estimated value of the integral of the function values y with respect to x

## Limitations
* the function will not work if the inputs are not the same length
* the function will not work if the x input is not equally spaced


## Other Information
* the function will warn the user if the trapezoidal rule had to be used on the last interval



