# 🚀 Quick Start: Run Shannon in GitHub Actions

**Problem:** Only 3-4 GB storage left on PC  
**Solution:** Run Shannon in GitHub's cloud! ☁️

---

## ⚡ 3-Minute Setup

### 1️⃣ Push to GitHub
```bash
cd shannon
git init
git add .
git commit -m "Add Shannon with GitHub Actions"

# Create repo on GitHub.com, then:
git remote add origin https://github.com/YOUR-USERNAME/shannon-security.git
git push -u origin main
```

### 2️⃣ Add API Key Secret
1. GitHub repo → **Settings** → **Secrets and variables** → **Actions**
2. **New repository secret**
3. Name: `ANTHROPIC_API_KEY`
4. Value: Your API key from https://console.anthropic.com
5. **Add secret**

### 3️⃣ Run Your First Scan
1. GitHub repo → **Actions** tab
2. Click **Shannon Security Scan**
3. **Run workflow** button
4. Enter your target URL (e.g., `https://your-app.com`)
5. **Run workflow**

### 4️⃣ Get Results (30-90 min later)
1. Go to the workflow run
2. Scroll to **Artifacts** section
3. Download `shannon-security-report-XXX.zip`
4. Extract and read the report!

---

## 📁 Files Created

| File | Purpose |
|------|---------|
| `.github/workflows/shannon-security-scan.yml` | Full security scan (90 min) |
| `.github/workflows/shannon-quick-scan.yml` | Quick scan (45 min) |
| `GITHUB-ACTIONS-SETUP.md` | Detailed documentation |
| `configs/anylead-auth-config.yaml` | Your auth scan config |

---

## 💡 Why This is Better

✅ **No local storage used** - Runs on GitHub's servers  
✅ **No Docker on your PC** - All in the cloud  
✅ **Free for public repos** - Unlimited scans  
✅ **Automatic scanning** - Runs on every commit  
✅ **Downloadable reports** - Saved for 90 days  

---

## 🎯 Scan Your AnyLead Auth

**Full Scan:**
```
Actions → Shannon Security Scan → Run workflow
URL: https://your-anylead-api.com
Config: anylead-auth-config.yaml
```

**Quick Scan:**
```
Actions → Shannon Quick Scan → Run workflow
URL: https://your-anylead-api.com
```

---

## 📊 What Gets Scanned

✅ SQL Injection in login/signup  
✅ JWT token manipulation  
✅ Auth bypass vulnerabilities  
✅ XSS attacks  
✅ RBAC authorization issues  
✅ OTP brute force  
✅ Session security  

All automatically tested with real exploits!

---

## 🆘 Need Help?

Read: [GITHUB-ACTIONS-SETUP.md](GITHUB-ACTIONS-SETUP.md) for full docs

**Common Issues:**
- API key not working? Check it's named exactly `ANTHROPIC_API_KEY`
- Workflow not running? Make sure `.github/workflows/` folder is in root
- Want to scan localhost? Use GitHub Codespaces!

---

**Ready?** Push to GitHub and start your first cloud scan! 🚀
