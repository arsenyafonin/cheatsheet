DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$(printf %q "$DIR")
eval cd $DIR

mkdocs serve
read -rsp $'Press enter to continue...\n'
