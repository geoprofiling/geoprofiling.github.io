# Troubleshooting 403 Permission Denied Error

If you're getting a 403 error when pushing to `geoprofiling.github.io`, check the following:

## 1. Verify Repository Exists on GitHub

First, make sure the repository exists:
- Go to: https://github.com/geoprofiling/geoprofiling.github.io
- If you get a 404, the repository doesn't exist yet. Create it first!

## 2. Create the Repository (if it doesn't exist)

1. Log in to GitHub as `geoprofiling`
2. Go to: https://github.com/new
3. Repository name: `geoprofiling.github.io` (must be exact!)
4. Make it **Public** (required for free GitHub Pages)
5. **DO NOT** initialize with README, .gitignore, or license
6. Click "Create repository"

## 3. Verify Personal Access Token Permissions

Your Personal Access Token needs these scopes:
- ✅ **repo** (Full control of private repositories)
  - This includes: repo:status, repo_deployment, public_repo, repo:invite, security_events

To check/create a token:
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Name it: `geoprofiling-pages-push`
4. Select scope: **repo** (check the box)
5. Click "Generate token"
6. **COPY THE TOKEN IMMEDIATELY** (you won't see it again!)

## 4. Test Token with curl

Test if your token works:
```bash
curl -H "Authorization: token YOUR_TOKEN_HERE" https://api.github.com/user
```

This should return your user info if the token is valid.

## 5. Try Pushing with Token Script

Use the token script for easier authentication:
```bash
cd /data3/abhipsa/datacomp/laion-en/project_page
./push_geoprofiling_token.sh ghp_YOUR_TOKEN_HERE
```

## 6. Alternative: Use SSH Instead

If HTTPS continues to have issues, you can use SSH:

1. Generate SSH key (if you don't have one):
   ```bash
   ssh-keygen -t ed25519 -C "geoprofiling@github.com" -f ~/.ssh/id_ed25519_geoprofiling
   ```

2. Add SSH key to GitHub:
   - Copy the public key: `cat ~/.ssh/id_ed25519_geoprofiling.pub`
   - Go to: https://github.com/settings/keys
   - Click "New SSH key"
   - Paste the key and save

3. Update remote to use SSH:
   ```bash
   cd /data3/abhipsa/datacomp/laion-en/project_page
   git remote set-url origin git@github.com:geoprofiling/geoprofiling.github.io.git
   git push -u origin main
   ```

## 7. Check Repository Access

Make sure you're logged into the correct GitHub account:
- Go to: https://github.com/settings/profile
- Verify the username is `geoprofiling`
- If not, log out and log in with the correct account

## Common Issues:

- **Token expired**: Generate a new token
- **Wrong token**: Make sure you're using the token for `geoprofiling` account, not `abhipsabasu`
- **Repository doesn't exist**: Create it first on GitHub
- **Token doesn't have repo scope**: Regenerate token with `repo` scope
- **Repository is private**: Make it public (required for free GitHub Pages)
