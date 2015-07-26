

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  ##inverse_matrix <- NULL
  
  set <- function(test_matrix) {
    x <<- test_matrix
    inverse_matrix <<- NULL
  }
  
  get <- function() x
  
  setsolve <- function(solve) inverse_matrix <<- solve
  
  getsolve <- function() inverse_matrix
  
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse_matrix2 <- x$getsolve()
  if(!is.null(inverse_matrix2)) {
    message("getting cached data")
    return(inverse_matrix2)
  }
  data <- x$get()
  inverse_matrix2 <- solve(data, ...)
  x$setsolve(inverse_matrix2)
  
  inverse_matrix2
  
}
