#make function that creates a matrix object that can cache its inverse
#get - function to get value of matrix
#setmat - function to cache inverse of matrix
#getmat - function used to get value of m,  either inverse of matrix or NULL

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL

        get <- function()
        x

        setmat <- function(my.mat)
        m <<- my.mat

        getmat <- function()
        m

        list( get = get, setmat = setmat, getmat = getmat)

}




#make function that calculates the inverse of a matrix
#first check to see if inverse has been calculated
#if inverse has been calculated it returns the cached data
#if inverse has not been calculated and m is NULL then function
#calculates the inverse of the matrix and caches the data

cacheSolve <- function(x, ...) {
        m <- x$getmat()

        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }

        data <- x$get()

        m <- solve(data)
        x$setmat(m)
        m
}