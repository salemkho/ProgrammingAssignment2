
## Below two functions defined are to computes inverse matrix
## of an input matrix.
## They have to be used together as below:
## cacheSolve(makeCacheMatrix(y)) where y is input matrix
## It will either return either value of inverse_matrix.
## or calculate from input matrix for 1st time. After that,
## it will always capture from existing inverse_matrix.


## makeCacheMatrix simply a list of functions defined and
## does not performance any calculation by itself
## Four function have been created which is 
## set, get, setsolve and getsolve

makeCacheMatrix <- function(x = matrix()) {
  
  set <- function(test_matrix) {
    x <<- test_matrix
    inverse_matrix <<- NULL
  }
  
  get <- function() x
  
  setsolve <- function(solve) inverse_matrix <<- solve
  
  getsolve <- function() inverse_matrix
  
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## cacheSolve return an inverse matrix of input matrix.
## It will either return either value of inverse_matrix.
## or calculate from input matrix for 1st time. After that,
## it will always capture from existing inverse_matrix.

cacheSolve <- function(x, ...) {
## inverse_matrix2 is local variable here
  
  inverse_matrix2 <- x$getsolve()
  
  if(!is.null(inverse_matrix2)) {
    message("getting cached data")
    return(inverse_matrix2)
  }

## below only run when the inverse_matrix2 is NULL
  data <- x$get()
  inverse_matrix2 <- solve(data, ...)

## this is to keep local value back to inverse_matrix
  x$setsolve(inverse_matrix2)
  
  inverse_matrix2
  
}
