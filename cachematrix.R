#This function creates a matrix object of class list and stores the inverse of the matrix.
#It includes functions to set and retrieve the matrix value, as well as
#to set and retrieve its inverse.

makeCacheMatrix <- function(x = matrix())
{
  i <- NULL
  set <- function(y)
  {
    x <<- y
    i <<- NULL
  }
  g <- function() x
  setInv <- function(inv) i <<- inv
  getInv <- function() i
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

## This function calculates the inverse of the matrix as created by the
## makeCacheMatrix function. Before calculating the inverse of the
## matrix it checks to see if it has already been calculated by using
## the getInv function, if there is no value it calculates it and
## stores it using the setInv function to save further computations.

cacheSolve <- function(x, ...) 
{
  i <- x$getInv()
  if(!is.null(i))
  {
    message("getting the cache data")
    return(i)
  }
  m <- x$get()
  i <- solve(m, ...)
  x$setInv(i)s
  i
}
