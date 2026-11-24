#!/usr/bin/env bash
# backup.sh — Miniflux ডেটা + ফিড তালিকা ব্যাকআপ করুন
# ব্যবহার: ./backup.sh [backup-dir]
# ব্যাকআপে থাকে: docker volume (freshrss-data নয়, miniflux-data) + bangla-feeds.opml
set -e
cd "$(dirname "$0")"
OUT="${1:-$HOME/miniflux-backup-$(date +%Y%m%d)}"
mkdir -p "$OUT"
docker compose stop miniflux 2>/dev/null || true
docker run --rm -v "$(pwd)/miniflux-data:/data" -v "$OUT:/backup" alpine tar czf /backup/miniflux-data.tar.gz -C /data . 2>/dev/null || echo "নোট: miniflux-data ভলিউম পাওয়া যায়নি — শুধু OPML ব্যাকআপ হচ্ছে।"
cp bangla-feeds.opml "$OUT/"
docker compose start miniflux 2>/dev/null || true
echo "ব্যাকআপ শেষ: $OUT"
ls -la "$OUT"
