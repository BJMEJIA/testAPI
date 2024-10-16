clear_repo(){
  echo "Cleaning repo"
  git clean -xdf
  git checkout .
}

cd "$REPO_DIR"

NEED_TO_BUILD=($(echo "$SELECTED_VERSIONS" | jq -r 'to_entries | map(select(.value == "true" )) | .[].key'))

echo "${NEED_TO_BUILD[@]}"

clear_repo

git checkout main
