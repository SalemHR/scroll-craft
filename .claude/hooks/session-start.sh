#!/bin/bash
set -euo pipefail

# Only needed in Claude Code on the web: each remote session starts in a
# fresh, isolated container, so the scrollcraft plugin has to be
# (re-)installed every time. On a persistent machine (desktop CLI) a single
# user-scope `claude plugin install` already covers every project forever.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

claude plugin marketplace add SalemHR/scroll-craft --scope project >/dev/null 2>&1 || true
claude plugin install nateherk-design@nateherk --scope project -y >/dev/null 2>&1 || true
