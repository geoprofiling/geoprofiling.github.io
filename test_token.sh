#!/bin/bash
# Test if your Personal Access Token works

if [ -z "$1" ]; then
    echo "Usage: $0 <personal_access_token>"
    echo ""
    echo "This script tests if your token is valid and has the right permissions."
    echo "Example: $0 ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    exit 1
fi

TOKEN=$1

echo "Testing Personal Access Token..."
echo ""

# Test authentication
echo "1. Testing authentication..."
RESPONSE=$(curl -s -H "Authorization: token ${TOKEN}" https://api.github.com/user)
USERNAME=$(echo $RESPONSE | grep -o '"login":"[^"]*' | cut -d'"' -f4)

if [ -z "$USERNAME" ]; then
    echo "   ❌ FAILED: Token is invalid or expired"
    echo "   Response: $RESPONSE"
    exit 1
else
    echo "   ✅ SUCCESS: Authenticated as: $USERNAME"
fi

# Check if it's the right account
if [ "$USERNAME" != "geoprofiling" ]; then
    echo ""
    echo "   ⚠️  WARNING: Token is for account '$USERNAME', not 'geoprofiling'"
    echo "   You need a token for the 'geoprofiling' account!"
    exit 1
fi

# Test repository access
echo ""
echo "2. Testing repository access..."
REPO_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token ${TOKEN}" https://api.github.com/repos/geoprofiling/geoprofiling.github.io)

if [ "$REPO_RESPONSE" = "200" ]; then
    echo "   ✅ SUCCESS: Can access repository"
elif [ "$REPO_RESPONSE" = "404" ]; then
    echo "   ❌ FAILED: Repository not found or no access"
    echo "   Make sure the repository exists at: https://github.com/geoprofiling/geoprofiling.github.io"
    exit 1
else
    echo "   ❌ FAILED: HTTP $REPO_RESPONSE - Check token permissions"
    exit 1
fi

# Test push permission
echo ""
echo "3. Testing push permissions..."
PERM_RESPONSE=$(curl -s -H "Authorization: token ${TOKEN}" https://api.github.com/repos/geoprofiling/geoprofiling.github.io)
PERM=$(echo $PERM_RESPONSE | grep -o '"permissions":{[^}]*}' | grep -o '"push":[^,]*' | cut -d':' -f2)

if [ "$PERM" = "true" ]; then
    echo "   ✅ SUCCESS: Token has push permissions"
else
    echo "   ❌ FAILED: Token does not have push permissions"
    echo "   Regenerate token with 'repo' scope at: https://github.com/settings/tokens"
    exit 1
fi

echo ""
echo "=========================================="
echo "✅ Token is valid and ready to use!"
echo "=========================================="
echo ""
echo "You can now push using:"
echo "  ./push_geoprofiling_token.sh $TOKEN"
echo ""
