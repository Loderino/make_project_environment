#!/bin/bash

env_name="venv"
requirements="false"
create_git_repo="false"

while getopts ":e:r:g" opt; do
  case ${opt} in
    e )
      env_name=$OPTARG
      ;;
    r )
      requirements="true"
      ;;
    g )
      create_git_repo="true"
      ;;
    \? )
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
shift $((OPTIND -1))

python3 -m venv $env_name
source $env_name/bin/activate

if [ "$requirements" = "true" ]; then
    pip install -r requirements.txt
fi

if [ "$create_git_repo" = "true" ]; then
    git init
    touch README.md
    echo "# Название проекта" > README.md
fi

