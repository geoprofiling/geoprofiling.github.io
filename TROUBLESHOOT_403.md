# Troubleshooting 403 Error

## Common Causes:

### 1. Repository Doesn't Exist Yet
**Solution:** Create the repository on GitHub first:
- Go to: https://github.com/new
- Repository name: `geoprofile-multimodal-datasets`
- **DO NOT** initialize with README, .gitignore, or license
- Click "Create repository"

### 2. Personal Access Token Issues

**Check your token has the right permissions:**
- Go to: https://github.com/settings/tokens
- Find your token and verify it has:
  - ✅ `repo` scope (full control of private repositories)
  - ✅ Not expired
  - ✅ Not revoked

**Create a new token if needed:**
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Name: `geoprofile-repo-push`
4. Expiration: Choose appropriate (90 days, 1 year, or no expiration)
5. **Select scopes:**
   - ✅ `repo` (this gives full repository access)
6. Click "Generate token"
7. **Copy the token immediately** (you won't see it again!)

### 3. Using Password Instead of Token

**Important:** GitHub no longer accepts passwords for HTTPS. You MUST use a personal access token.

When prompted for "Password", paste your **personal access token**, not your GitHub password.

### 4. Try SSH Instead

If you have SSH keys set up for the `abhipsabasu` account:

```bash
cd /data3/abhipsa/datacomp/laion-en/project_page
git remote set-url origin git@github.com:abhipsabasu/geoprofile-multimodal-datasets.git
git push -u origin main
```

### 5. Verify Token Works

Test your token:
```bash
curl -H "Authorization: token YOUR_TOKEN" https://api.github.com/user
```

This should return your user info if the token is valid.

## Step-by-Step Fix:

1. **Verify repository exists:**
   - Visit: https://github.com/abhipsabasu/geoprofile-multimodal-datasets
   - If 404, create it first

2. **Create/verify token:**
   - Go to: https://github.com/settings/tokens
   - Create new token with `repo` scope
   - Copy the token

3. **Clear cached credentials:**
   ```bash
   cd /data3/abhipsa/datacomp/laion-en/project_page
   git config --local --unset credential.helper
   git credential-cache exit 2>/dev/null || true
   ```

4. **Push again:**
   ```bash
   git push -u origin main
   ```
   - Username: `abhipsabasu`
   - Password: **paste your token** (not your password!)
