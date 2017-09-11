#!/bin/sh

myfunc()
{
  echo "I was called as : $@"
}

### Main script starts here 

myfunc 1 2 3
