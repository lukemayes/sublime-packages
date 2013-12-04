#!/bin/bash
#====================================================================
#== Finds the first parent directory with a pom.xml and changes to
#== it. After changing to the correct directory, it calls mvn (maven)
#== passing any arguments that were given to the script.
#== 
#== Thanks to http://unix.stackexchange.com/users/4194/arcege and his
#== answer (http://unix.stackexchange.com/a/29033) for the head
#== start.
#====================================================================
owd=$PWD
cwd=$PWD
while [ ! -e "$cwd/pom.xml" ] && [ "x$cwd" != x/ ]; do
    cwd=`dirname "$cwd"`
done
cd "$cwd"
mvn $*
cd $owd
