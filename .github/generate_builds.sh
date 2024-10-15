clear_repo(){
  echo "Cleaning repo"
  git clean -xdf
  git checkout .
}

cd "$REPO_DIR"

clear_repo

git checkout main