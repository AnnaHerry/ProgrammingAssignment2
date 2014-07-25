## The "makeCacheMatrix" function creates and caches variable
## named "inverse".This variable serves to store the value of 
## inverse matrix of a given square matrix "x".
## Also this function creates a list of internal
## functions "set", "get", "getinv", "setinv".


makeCacheMatrix <- function(x= matrix ()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inverse <<- solve
  getinv <- function() inverse
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## By using the output from "makeCacheMatrix" function 
## the following  function "cacheSolve"  computes the inverse matrix, 
## stores and returns it. In the case if inverse matrix has already been 
## computed and cashed, the "cacheSolve" retrieves and returns it.

cacheSolve <- function(x, ...) {
  inverse <- x$getinv()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinv(inverse)
  inverse
}
