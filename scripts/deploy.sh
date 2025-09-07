#!/bin/bash

# Ensure script stops on error
set -e

echo "🚀 Compiling Move contracts..."
aptos move compile --package-dir ./move_project

echo "📤 Publishing to Testnet..."
aptos move publish \
  --package-dir ./move_project \
  --named-addresses my_addr=default

echo "✅ Deployment complete!"
