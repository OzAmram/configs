#!/bin/bash
# Re-run after every pod start: links persistent config on /workspace into the (ephemeral) home dir.
set -e
mkdir -p /workspace/.vscode-server /root/.ssh
[ -L /root/.gitconfig ] || { rm -f /root/.gitconfig; ln -s /workspace/.gitconfig /root/.gitconfig; }
[ -L /root/.vscode-server ] || { rm -rf /root/.vscode-server; ln -s /workspace/.vscode-server /root/.vscode-server; }
for f in .bashrc .vimrc; do ln -sfn /workspace/configs/$f /root/$f; done
grep -q github.com /root/.ssh/known_hosts 2>/dev/null || ssh-keyscan -t ed25519,rsa github.com >> /root/.ssh/known_hosts 2>/dev/null
[ -x /root/.local/bin/claude ] || curl -fsSL https://claude.ai/install.sh | bash
echo "pod-setup: done"
