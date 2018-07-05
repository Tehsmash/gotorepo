# goToRepo
A utility for going directly to a source repo that is underneath the go get src structure based on a regex.

## Installation

* git clone this repo
* Add line `source <git clone location>/gotorepo.bash` to your bashrc

## Usage

`$ gotorepo <repo name>`

## Example

```
$ pwd
/home/sam

$ go env GOPATH
/home/sam/gostuff

$ go get github.com/tehsmash/gotorepo
package github.com/Tehsmash/gotorepo: no Go files in /home/sam/gostuff/src/github.com/Tehsmash/gotorepo

$ gotorepo gotorepo

$ pwd
/home/sam/gostuff/src/github.com/Tehsmash/gotorepo
```
