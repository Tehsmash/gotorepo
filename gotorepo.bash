#!/bin/bash

gotorepo () {
  found=0
  searchresult=""
  find $(go env GOPATH)/src -type d -maxdepth 6 -regex ".*${1}/.git" | while read file; do
    if [ $found -gt 0 ]; then
      searchresult+=" "
    fi
    searchresult+="$(dirname $file)"
    let "found=found+1"
  done

  if [ $found -lt 1 ]; then
    echo "No matching repo found."
    return 1
  elif [ $found -gt 1 ]; then
    echo "Multiple matching repos found:"
    return 2
  fi

  cd "$searchresult"
}

function _gotorepo() {
  local state
  _arguments '1: :->first'

  case $state in
    first)
      find $(go env GOPATH)/src -maxdepth 6 -type d -name ".git" | while read file; do compadd -- $(basename $(dirname $file)); done
      ;;
  esac
}

# Install zsh commandline completion if available
if ! [ -x "$(command -v compdef)" ]; then
  compdef _gotorepo gotorepo
fi
