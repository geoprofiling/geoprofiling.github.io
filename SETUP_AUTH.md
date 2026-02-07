# GitHub Authentication Setup

If you're getting authentication errors, here are the solutions:

## Option 1: Use SSH (Recommended if you have SSH keys)

The remote URL has been changed to SSH. Try pushing again:
```bash
cd /data3/abhipsa/datacomp/laion-en/project_page
git push -u origin main
```

If it still fails, you may need to:
1. Add your SSH key to the `abhipsabasu` GitHub account
2. Or use Option 2 below

## Option 2: Use Personal Access Token (HTTPS)

1. **Create a Personal Access Token:**
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token" → "Generate new token (classic)"
   - Name it (e.g., "geoprofile-repo")
   - Select scopes: `repo` (full control of private repositories)
   - Click "Generate token"
   - **Copy the token immediately** (you won't see it again!)

2. **Change remote to HTTPS and use token:**
   ```bash
   cd /data3/abhipsa/datacomp/laion-en/project_page
   git remote set-url origin https://github.com/abhipsabasu/geoprofile-multimodal-datasets.git
   ```

3. **Push using token:**
   ```bash
   git push -u origin main
   ```
   When prompted:
   - Username: `abhipsabasu`
   - Password: **paste your personal access token** (not your GitHub password)

## Option 3: Use GitHub Credential Helper (Store token)

After getting your token, you can store it:
```bash
git config --global credential.helper store
git push -u origin main
# Enter username: abhipsabasu
# Enter password: <paste your token>
```

## Troubleshooting

- If SSH shows you're authenticated as a different user, you need to add your SSH key to the `abhipsabasu` account
- If using HTTPS, make sure you use the token, not your password
- Check that the repository exists on GitHub first
