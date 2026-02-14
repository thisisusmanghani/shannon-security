# 🚀 Running Shannon Security Scans in GitHub Actions

Your Shannon pentester is now configured to run in **GitHub's cloud** instead of your PC!

## ✅ Benefits

- 💾 **No local storage used** - Everything runs on GitHub's servers
- ⚡ **Faster execution** - GitHub runners have more resources
- 📊 **Automatic reports** - Results saved as downloadable artifacts
- 🔄 **CI/CD integration** - Scan on every commit/PR
- 💰 **Free for public repos** - 2000 minutes/month for private repos

---

## 🔧 Setup Instructions

### Step 1: Push Shannon to GitHub

```bash
cd "c:\Users\ghani\Desktop\Test\test anylead auth\shannon"

# Initialize git if not already done
git init
git add .
git commit -m "Add Shannon security scanner with GitHub Actions"

# Create a new repo on GitHub, then:
git remote add origin https://github.com/YOUR-USERNAME/shannon-security.git
git branch -M main
git push -u origin main
```

### Step 2: Add Anthropic API Key as Secret

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Name: `ANTHROPIC_API_KEY`
5. Value: Your Anthropic API key (from https://console.anthropic.com)
6. Click **Add secret**

![GitHub Secrets](https://docs.github.com/assets/cb-66188/images/help/settings/actions-secrets-add-secret.png)

### Step 3: Add Your Code to Scan

**Option A: Scan Code in Same Repo**
```bash
# Copy your backend code to the shannon repo
cp -r "../Developments/anylead-backend" "./repos/anylead/"
git add repos/anylead/
git commit -m "Add code to scan"
git push
```

**Option B: Scan External URL**
- Just use the workflow_dispatch trigger with your production URL
- No need to include code in the repo

---

## 🎯 Running Scans

### Method 1: Automatic Scans (on every commit)

The workflow runs automatically when you:
- Push to `main` branch
- Open a pull request

Just commit and push - Shannon will scan automatically!

```bash
git add .
git commit -m "Update authentication code"
git push
```

Then check: **Actions** tab in GitHub → See your scan running live!

### Method 2: Manual Scans (on-demand)

1. Go to your GitHub repo
2. Click **Actions** tab
3. Click **Shannon Security Scan** (left sidebar)
4. Click **Run workflow** (right side)
5. Fill in:
   - **Target URL**: `https://your-app.com` or `http://localhost:3000`
   - **Config file**: `anylead-auth-config.yaml`
6. Click **Run workflow**

![Run Workflow](https://docs.github.com/assets/cb-30927/images/help/actions/workflow-dispatch-button.png)

### Method 3: Quick Scan (Faster, Less Detailed)

1. **Actions** tab
2. **Shannon Quick Scan (Lite)** workflow
3. **Run workflow**
4. Enter your target URL
5. Click **Run workflow**

---

## 📥 Viewing Results

### During Scan:
1. Go to **Actions** tab
2. Click on the running workflow
3. Click on the `shannon-pentest` job
4. Watch live logs as Shannon scans your app!

### After Scan:
1. Scroll to bottom of workflow run
2. **Artifacts** section
3. Download `shannon-security-report-XXX.zip`
4. Extract and read the `.md` report file

**OR** view the summary directly in GitHub:
- Scroll to the job summary
- Security findings are shown inline!

---

## 📊 Example Workflow Runs

### For Your AnyLead Auth:

**Scan Production:**
```yaml
Target URL: https://anylead-api.yoursite.com
Config: anylead-auth-config.yaml
```

**Scan Staging:**
```yaml
Target URL: https://staging-api.yoursite.com
Config: anylead-auth-config.yaml
```

**Scan Local (if you use Codespaces):**
```yaml
Target URL: http://localhost:3000
Config: anylead-auth-config.yaml
```

---

## 🔥 Pro Tips

### 1. Use GitHub Codespaces (Perfect for You!)
Since you have GitHub Pro:

```bash
# In your repo on GitHub:
# 1. Click "Code" button
# 2. Click "Codespaces" tab
# 3. Click "Create codespace on main"

# This gives you a cloud development environment!
# Then run your backend there and scan it:

cd Developments/anylead-backend
npm install
npm run dev  # Runs on localhost:3000

# Trigger GitHub Action to scan localhost:3000
```

### 2. Scan Multiple Environments

Create separate workflow files:
- `.github/workflows/scan-production.yml`
- `.github/workflows/scan-staging.yml`
- `.github/workflows/scan-dev.yml`

### 3. Schedule Regular Scans

Add to your workflow:
```yaml
on:
  schedule:
    - cron: '0 2 * * 1'  # Every Monday at 2 AM
```

### 4. Fail CI on Critical Vulnerabilities

Add this step to fail builds if critical issues found:
```yaml
- name: Check for Critical Issues
  run: |
    if grep -q "CRITICAL" shannon/audit-logs/*.md; then
      echo "❌ Critical vulnerabilities found!"
      exit 1
    fi
```

---

## 💰 Cost Estimation

### GitHub Actions (Free Tier):
- **Public repos**: Unlimited minutes ✅
- **Private repos**: 2,000 minutes/month free (then $0.008/min)
- **Storage**: 500MB artifacts free

### Shannon Full Scan:
- Time: ~30-90 minutes
- Cost: **FREE** on public repos
- Cost on private repos: ~$0.24 - $0.72 per scan

### Your Monthly Budget (Private Repo):
- Free tier: ~20-60 scans/month
- After free tier: ~$10/month for weekly scans

**Recommendation:** Make Shannon repo public (just don't include secrets!)

---

## 🆘 Troubleshooting

### "No space left on device"
✅ This can't happen in GitHub Actions - they have ~14GB per runner!

### "ANTHROPIC_API_KEY not found"
1. Check GitHub repo → Settings → Secrets
2. Make sure it's named exactly `ANTHROPIC_API_KEY`
3. Re-run the workflow

### "Workflow not running"
1. Make sure `.github/workflows/` folder exists in repo
2. Check workflow file is valid YAML (no tabs!)
3. Check Actions are enabled: Settings → Actions → Allow all actions

### "Can't access localhost"
- If scanning localhost, you need to start your app in the workflow
- Or use Codespaces with port forwarding
- Or scan a deployed URL instead

---

## 🎯 Quick Start Commands (Copy-Paste)

```bash
# 1. Navigate to Shannon folder
cd "c:\Users\ghani\Desktop\Test\test anylead auth\shannon"

# 2. Create GitHub repo (on GitHub.com first, then):
git init
git add .
git commit -m "Initial commit: Shannon security scanner"
git remote add origin https://github.com/YOUR-USERNAME/shannon-security.git
git branch -M main
git push -u origin main

# 3. Add your Anthropic API key as GitHub Secret:
#    Go to: Settings → Secrets → Actions → New secret
#    Name: ANTHROPIC_API_KEY
#    Value: sk-ant-...

# 4. Run your first scan:
#    Go to: Actions → Shannon Security Scan → Run workflow
#    Enter URL: https://your-app.com
#    Click: Run workflow

# 5. Wait ~30 min, then download results from Artifacts!
```

---

## 📚 Next Steps

1. ✅ Push Shannon to GitHub (see commands above)
2. ✅ Add `ANTHROPIC_API_KEY` secret
3. ✅ Run your first scan
4. ✅ Review the security report
5. ✅ Fix critical issues
6. ✅ Re-scan to verify fixes
7. ✅ Set up automatic scans on every commit

---

## 🎉 You're All Set!

Shannon will now scan your code in the cloud, saving your precious 3-4GB of local storage for more important things! 🚀

**Questions?** Check the Shannon docs or create an issue on GitHub.

---

**Created:** February 14, 2026  
**For:** AnyLead Auth Security Testing  
**Platform:** GitHub Actions + Shannon AI Pentester
