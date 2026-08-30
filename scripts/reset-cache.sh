#!/bin/bash

# Script untuk reset cache dan restart server sebelum testing
# Penggunaan: ./scripts/reset-cache.sh

set -e

echo "🔄 Resetting cache dan restart server..."

# 1. Kill semua proses Next.js yang berjalan
echo "⏹️  Menghentikan proses Next.js..."
pkill -f "next dev" || true
sleep 2

# 2. Clear Next.js cache
echo "🧹 Membersihkan cache Next.js..."
rm -rf .next
rm -rf node_modules/.cache

# 3. Clear Playwright cache (optional)
echo "🧹 Membersihkan cache Playwright..."
rm -rf test-results
rm -rf playwright-report

# 4. Restart dev server
echo "🚀 Starting dev server..."
npm run dev > /tmp/next-dev.log 2>&1 &

# 5. Wait for server to be ready
echo "⏳ Menunggu server siap..."
for i in {1..30}; do
  if curl -s http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Server ready!"
    exit 0
  fi
  sleep 1
done

echo "❌ Server gagal start dalam 30 detik"
exit 1
