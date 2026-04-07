@echo off
cd /d D:\Hexo\hexo-blog

echo ===== Pull latest =====
git pull --rebase origin main

echo ===== Add =====
git add .

echo ===== Commit =====
git commit -m "update"

echo ===== Push =====
git push origin main

pause