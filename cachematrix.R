## The following functions can be used when one need to 
## calculate a set of inverse matrices with potentially
## identical contents in less time and computational 
## costs

## The function "makeCacheMatrix" can both store the 
## matrix with assigned values ("set" subfunction) and
## the inverse matrices ("getinv" subfunction) which is
## saved to "mat" variavle

makeCacheMatrix <- function(x = matrix()) {
    mat <- NULL
    x <- as.data.frame(x)
    set <- function(y) {
        x <<- y
        mat <<- NULL
    }
    get <- function() {x}
    setinv <- function(solve) {mat <<- solve}
    getinv <- function() {mat}
        
}

## The function "cacheSolve" is used here either to produce 
## the inverse matrix specified in "makeCacheMatrix" from the 
## "getinv" subfunction or if the inverse matrix has already 
## been created (stored in "mat" variable) to return cached 
## value of inverse matrix as well as to infor about the later

cacheSolve <- function(x, ...) {
    mat <- x$getinv()
        if(!is.null(mat)) {
        message("getting cached data")
        return(mat)
    }
    invmat <- x$get()
    mat <- solve(invmat, ...)
    x$setinv(mat)
    mat
}
