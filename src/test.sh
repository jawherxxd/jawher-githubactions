# ...existing code...
#!/bin/bash
set -euo pipefail
set -x

# run a robust Node check: support module being a function or an object with .greet
output=$(node -e "try { const m = require('./app'); const greet = (typeof m==='function') ? m : (m && m.greet); if (!greet) { console.error('ERROR: greet not found'); process.exit(2); } console.log(greet('Test')); } catch (e) { console.error('ERROR:', e && e.message); process.exit(3); }" 2>&1)

# If node printed an error message, show it and fail
if [[ "$output" == ERROR* || -z "$output" ]]; then
  echo "Test failed: got '$output'"
  exit 1
fi

if [ "$output" = "Hello, Test!" ]; then
  echo "Test passed!"
  exit 0
else
  echo "Test failed: got '$output'"
  exit 1
fi
# ...existing code...