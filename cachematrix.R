## Put comments here that give an overall description of what your
## fuctions do

## The function creates a special objects that stores the matrix and catches its inverse.


R session:

> makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
> 
 ## This function calculates the matrix created by makeCacheMatrix above.

> cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}

## Testing my function
source("R_coursera_assignment/cachematrix.R")
