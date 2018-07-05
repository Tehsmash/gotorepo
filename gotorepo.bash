#!/bin/bash

gotorepo () {
  search_result="$(find $(go env GOPATH)/src -maxdepth 3 -type d -name "$1")"
  num=$(echo -e "$search_result" | wc -l)

  if [ $num -lt 1 ]; then
    echo "No matching repo found."
    return 1
  elif [ $num -gt 1 ]; then
    echo "Multiple matching repos found:"
    echo "$search_result"
    return 2
  fi

  cd $search_result
}
