@echo off
REM Quick setup script for pushing Shannon to GitHub

echo ========================================
echo  Shannon GitHub Actions Setup
echo ========================================
echo.

REM Check if git is initialized
if not exist .git (
    echo [1/5] Initializing Git repository...
    git init
    git branch -M main
) else (
    echo [1/5] Git already initialized ✓
)

echo.
echo [2/5] Checking files...
git status

echo.
echo [3/5] Staging files...
git add .github/
git add configs/
git add QUICKSTART-CLOUD.md
git add GITHUB-ACTIONS-SETUP.md
git add .gitignore
git add README.md

echo.
echo [4/5] Creating commit...
git commit -m "Add GitHub Actions workflows for cloud-based Shannon security scanning"

echo.
echo ========================================
echo  NEXT STEPS:
echo ========================================
echo.
echo 1. Create a new GitHub repository at:
echo    https://github.com/new
echo.
echo 2. Copy the remote URL, then run:
echo    git remote add origin https://github.com/YOUR-USERNAME/REPO-NAME.git
echo    git push -u origin main
echo.
echo 3. Add your Anthropic API key as a secret:
echo    - Go to repo Settings ^> Secrets and variables ^> Actions
echo    - Click "New repository secret"
echo    - Name: ANTHROPIC_API_KEY
echo    - Value: Your API key
echo.
echo 4. Run your first scan:
echo    - Go to Actions tab
echo    - Click "Shannon Security Scan"
echo    - Click "Run workflow"
echo.
echo ========================================
echo Ready to push to GitHub!
echo ========================================

pause
