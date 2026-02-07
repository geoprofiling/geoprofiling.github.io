# Fix GitHub Pages 404 Error

## The Issue
GitHub Pages shows 404 because it's not configured correctly in the repository settings.

## Solution: Enable GitHub Pages

1. **Go to your repository settings:**
   - Visit: https://github.com/abhipsabasu/geoprofile-multimodal-datasets/settings/pages

2. **Configure GitHub Pages:**
   - Under "Source", select:
     - **Branch:** `main` (or `master` if that's your branch name)
     - **Folder:** `/ (root)`
   - Click **"Save"**

3. **Wait for deployment:**
   - GitHub Pages takes 1-2 minutes to build and deploy
   - You'll see a green checkmark when it's ready
   - Check the "Actions" tab to see the deployment status

4. **Verify your files are in the root:**
   - Make sure `index.html` is in the root of your `main` branch
   - Check: https://github.com/abhipsabasu/geoprofile-multimodal-datasets
   - You should see `index.html` in the file list

## If index.html is not in the root:

If your files are in a subdirectory, you have two options:

### Option A: Move files to root (Recommended)
```bash
cd /data3/abhipsa/datacomp/laion-en/project_page
# Make sure index.html is in the current directory
git add index.html
git commit -m "Ensure index.html is in root"
git push origin main
```

### Option B: Configure Pages to use a subdirectory
- In GitHub Pages settings, select the folder containing `index.html`
- For example, if it's in a `docs` folder, select `/docs`

## Verify Setup

After enabling Pages, check:
1. Repository Settings → Pages should show: "Your site is live at https://abhipsabasu.github.io/geoprofile-multimodal-datasets/"
2. Wait 1-2 minutes, then visit the URL
3. Check the Actions tab for any build errors

## Common Issues:

- **404 after enabling:** Wait 1-2 minutes for deployment
- **Still 404:** Check that `index.html` is in the root of the selected branch
- **Build errors:** Check the Actions tab for error messages
