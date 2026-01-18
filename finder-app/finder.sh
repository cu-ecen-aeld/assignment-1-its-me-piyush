#!/bin/sh
# finder.sh
# Usage: ./finder.sh <filesdir> <searchstr>

filesdir="$1"
searchstr="$2"

# Check args
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
  echo "ERROR: Missing required arguments."
  echo "Usage: $0 <filesdir> <searchstr>"
  exit 1
fi

# Check directory exists
if [ ! -d "$filesdir" ]; then
  echo "ERROR: '$filesdir' is not a directory."
  exit 1
fi

# X = number of files (recursively)
X=$(find "$filesdir" -type f | wc -l | tr -d ' ')

# Y = number of matching lines across all files (recursively)
# -r: recursive, -h: no filenames, -F: fixed string match (not regex)
Y=$(grep -rhnF -- "$searchstr" "$filesdir" 2>/dev/null | wc -l | tr -d ' ')

echo "The number of files are $X and the number of matching lines are $Y"
exit 0
