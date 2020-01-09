#!/bin/bash

echo "set git config."
git config --global user.name "${GITHUB_USERNAME}"
git config --global user.email "${GITHUB_USEREMAIL}"

git remote set-url origin https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git

git checkout -b ${GITHUB_BRANCH}
git branch -a

ls -la

echo "build tex."
pandoc -sN -f markdown -t latex ${MD_NAME} -o output.tex -t latex --template ${TEMPLATE_NAME} -N --top-level-division=chapter -B abstract.tex --bibliography=references.bib && cat ./output.tex
echo "build pdf."
pandoc -F pandoc-crossref ${MD_NAME} -o ${PDF_NAME} --pdf-engine=lualatex --template ${TEMPLATE_NAME} -N --top-level-division=chapter -B abstract.tex --bibliography=references.bib

echo "git push."
git status
git add ${PDF_NAME}
git commit -m '[updater] update pdf.'
git push origin HEAD
