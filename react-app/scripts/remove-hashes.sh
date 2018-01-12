#!/bin/bash
DIRECTORY="./build"
JS_REGEX="\/main\.(.*\.(js))$"
CSS_REGEX="\/main\.(.*\.(css))$"

# if a regex matches, return the matching sections
get_regex_match() {
  if [[ $1 =~ $2 ]];  then
    eval $3="${BASH_REMATCH[1]}"
    eval $4="${BASH_REMATCH[2]}"
  fi
}

# find files based on regex
find_files() {
  echo $(find $DIRECTORY | egrep $1)
}

# replaces instances both within files and on filenames
replace_instances() {
  grep -rl $1 $DIRECTORY | xargs sed -i '' "s/$1/$2/g"
  local files=$(find_files $1)
  for file in $files; do
    local temp=$(echo $file | sed "s/$1/$2/g")
    mv $file $temp
  done
}

main() {
  for regex in $(echo $JS_REGEX $CSS_REGEX); do
    local filename=$(find_files $regex)
    get_regex_match $filename $regex string0 string1
    replace_instances $string0 $string1
  done
}

main "$@"
