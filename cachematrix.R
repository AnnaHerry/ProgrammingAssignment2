## The "makeCacheMatrix" function creates and caches variable
## named "inverse".This variable serves to store the value of 
## inverse matrix of a given square matrix "x".
## Also this function creates a list of internal functions 


makeCacheMatrix <- function(x = matrix()) {
  ## Initialise variable "inverse", the first value is set to NULL
  inverse <- NULL 
 
  ## Store the value and labelle the adress as "inverse"
  set <- function(y)  
  { x <<- y
    inverse <<- NULL
  }
  
  ## Return original matrix
  get <- function() x 
  
  ## Store the inverse matrix
  setinv <- function(solve) inverse <<- solve 
  
  ## Return inverse matrix
  getinv <- function() inverse 
  
  ## Create a list on internal functions "set", "get", "setinv", "getinv"
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## By using the output from "makeCacheMatrix" function 
## the "cacheSolve" function computes the inverse matrix, stores 
## and returns it. In the case if inverse matrix has already been 
##  computed and cashed, the "cacheSolve" retrieves and returns it.

cacheSolve <- function(x, ...) {
     ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinv()
  
  ## Check if it is available 
  if(!is.null(inverse)) {
    
   ## if TRUE then write message 
    message("getting cached data")
    
    ## and return it
    return(m)
  }
  
  ## if FALSE then get the original matrix
  data <- x$get()
  
  ## Compute the inverse
  inverse <- solve(data, ...)
  
  ## Store it
  x$setinv(inverse)
  
  ## Return it
  inverse

}
