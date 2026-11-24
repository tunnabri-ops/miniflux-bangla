# Miniflux Bangla — বাংলা খবরের ফিড রিডার

Bangla-ready Miniflux setup, built on **miniflux/v2**.

- **Original repo:** https://github.com/miniflux/v2 (minimalist and opinionated feed reader — fast, self-hosted, no tracking)

## কী আছে / What is inside

- `docker-compose.yml` — Miniflux + PostgreSQL, ready to run (official images, persistent volumes).
- `bangla-feeds.opml` — 5 Bangladeshi news feeds, all live-checked 2026-11-24: Prothom Alo, BBC Bangla, bdnews24 Bangla, The Daily Star, Channel i Online.

## যা ঠিক করা হয়েছে / What was fixed

- Upstream ships with no feeds — a fresh install shows an empty reader and the user has to hunt for working feed URLs. This repo ships 5 verified Bangla feeds ready to import.
- Every feed URL was checked live (HTTP 200) on 2026-11-24. Guessed URLs that failed were dropped: Dhaka Tribune `/feed` (404), Somoy TV `/feed` (403), Ittefaq `/feed` (404), Jugantor `/feed` (403), Kaler Kantho (403) — none of them are in the OPML.
- The compose file sets `TZ=Asia/Dhaka` and `POLLING_FREQUENCY=60`, so timestamps and refreshes are right for Bangladesh out of the box.

## ব্যবহার / How to use

```bash
# 1. Start Miniflux (change the admin password in docker-compose.yml first)
docker compose up -d

# 2. Open http://localhost:8080, log in (admin / the password you set)

# 3. Import the Bangla feeds: Settings → Import → OPML → upload bangla-feeds.opml
```

Self-hosted, no account with a third party, no tracking.
