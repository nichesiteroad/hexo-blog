@echo off
cd /d D:\HexoSite
echo ===== Pull latest =====
git pull --rebase origin main
echo ===== Add =====
git add .
echo ===== Commit =====
git commit -m "update"
echo ===== Push =====
git push origin main
pause