@echo off
<<<<<<< HEAD
cd /d D:\HexoSite
=======
cd /d D:\Hexo\hexo-blog
>>>>>>> 05ca0cc (update)
echo ===== Pull latest =====
git pull --rebase origin main
echo ===== Add =====
git add .
echo ===== Commit =====
git commit -m "update"
echo ===== Push =====
git push origin main
pause