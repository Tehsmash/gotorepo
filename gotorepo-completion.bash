#/usr/bin/env bash

_dothis_completions()
{
  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  search_result="$(find $(go env GOPATH)/src -maxdepth 3 -mindepth 3 -type d -printf "%f\n")"

  COMPREPLY=($(compgen -W "$search_result" "${COMP_WORDS[1]}"))


}

complete -F _dothis_completions gotorepo
