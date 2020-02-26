#!/bin/sh

# deletes git branches from origin using a list of branches like this:
#
# cat list_of_branches | ./delete_branches_git
#
# this script could be a snippet to read something from stdin

while read line
do
  git push --delete origin $line
done < "${1:-/dev/stdin}"
