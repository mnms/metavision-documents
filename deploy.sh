#!/bin/bash

# MkDocs 사이트 빌드
mkdocs build

cp -rp ./site ../
# gh-pages 브랜치로 전환 (없으면 생성)
git checkout gh-pages 

# 이전 파일 삭제
git rm -rf .

# 빌드된 파일 복사
cp -rp ../site/* .

# 파일 커밋 및 푸시
git add .
git commit -m "Update site"
git push origin gh-pages --force

# main 브랜치로 돌아가기
git checkout master

