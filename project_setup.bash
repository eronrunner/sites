#!/usr/bin/env bash
python -m venv ./venv
ENV=./venv/bin/activate
if test -f "$FILE"; then
    source $FILE;
else
  ENV=./venv/Scripts/activate
fi
. $ENV
pip install -r ./requirements/dev_requirements.txt
pip install -r ./requirements/requirements.txt

# .gitignore - adjust
curl https://raw.githubusercontent.com/eronrunner/sites/main/.gitignore > ./.gitignore
# .pre-commit
curl https://raw.githubusercontent.com/eronrunner/sites/main/.pre-commit-config.yaml > .pre-commit-config.yaml
git add .pre-commit-config.yaml
pre-commit install
pre-commit
#
