clear_repo(){
  echo "Cleaning repo"
  git clean -xdf
  git checkout .
}

cd "$REPO_DIR"

SELECTED_VERSIONS=".github/versions.json"

echo "$SELECTED_VERSIONS"

ls -alh

NEED_TO_BUILD=($(echo "$SELECTED_VERSIONS" | jq -r 'to_entries | map(select(.value == "true" )) | .[].key'))

for i in "${NEED_TO_BUILD[@]}"; do
  echo "We will build version: $i"
done 

clear_repo

unzip --help

git checkout main
