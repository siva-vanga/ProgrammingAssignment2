## Caching the Inverse of a Matrix:
## Matrix inversion is usually a costly computation and there may be some 
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## Below are a pair of functions that are used to create a special object that 
## stores a matrix and caches its inverse.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
    inv <- NULL
    set <- function(y) {
      # use `<<-` to assign a value to an object in an environment 
      # different from the current environment. 
      x <<- y
     inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse 
    getinv <- function() inv
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## This function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then it should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
  
    # if the inverse has already been calculated
    # get it from the cache and skips the computation.
    
    if (!is.null(inv)){
          message("getting cached data")
          return(inv)
    }
  
    # otherwise, calculates the inverse 
    mat.data <- x$get()
    inv <- solve(mat.data, ...)
  
    # sets the value of the inverse in the cache via the setinv function.
    x$setinv(inv)
    inv
}