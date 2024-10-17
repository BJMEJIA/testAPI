clear_repo(){
  echo "Cleaning repo"
  git clean -xdf
  git checkout .
}

# Flags to pass variables
while getopts u:p: opts
do
    case "${opts}" in
        u) USERNAME=${OPTARG};;
        p) PASSWORD=${OPTARG};;
        *) usage;;
    esac
done

cd "$REPO_DIR"

echo "my username is: $USERNAME and password is $PASSWORD"

SELECTED_VERSIONS=".github/versions.json"

cat "$SELECTED_VERSIONS"

ls -alh

NEED_TO_BUILD=($(cat "$SELECTED_VERSIONS" | jq -r 'to_entries | map(select(.value == "true" )) | .[].key'))

for i in "${NEED_TO_BUILD[@]}"; do
  echo "We will build version: $i"
done 

clear_repo

unzip --help

git checkout main
