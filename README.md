# 📰 Miniflux Bangla

[![Bangla](https://img.shields.io/badge/UI-Bangla%20%2B%20English-orange)](#)

**A self-hosted Bangla news feed reader — 5 verified Bangla feeds, Dhaka timezone, one-command backup, no tracking.**

> বাংলা সংস্করণ নিচে আছে। / Bangla version below.

## ✨ Features

- `docker-compose.yml` — feed reader + PostgreSQL database, ready to run on port 8080 with persistent volumes and a database healthcheck. Timezone is `Asia/Dhaka` and feeds refresh every 60 minutes (`POLLING_FREQUENCY=60`).
- `bangla-feeds.opml` — 5 Bangladeshi news feeds, every URL live-checked (HTTP 200) on 2026-11-24: Prothom Alo, BBC Bangla, bdnews24 Bangla, The Daily Star, Channel i Online.
- `backup.sh [backup-dir]` — backs up the data volume and the feed list to a dated folder (default `~/miniflux-backup-YYYYMMDD`).
- Dead feeds were left out on purpose: Dhaka Tribune `/feed` (404), Somoy TV `/feed` (403), Ittefaq `/feed` (404), Jugantor `/feed` (403) and Kaler Kantho (403) are not in the OPML.

## 🚀 How to use

```bash
# 1. Start the reader (change the admin password in docker-compose.yml first)
docker compose up -d

# 2. Open http://localhost:8080, log in (admin / the password you set)

# 3. Import the Bangla feeds: Settings → Import → OPML → upload bangla-feeds.opml

# 4. Back up any time
./backup.sh
```

## ⚠️ Honest limits

- Change the default admin password in `docker-compose.yml` before the first run — the file ships with a placeholder password.
- The 5 feeds were verified on 2026-11-24; a feed can break later if the site changes its URL. Re-check a feed that stops updating.
- Self-hosted: you need Docker, and the reader only runs while your machine (or server) is on.

## 🇧🇩 বাংলা

**Miniflux বাংলা — বাংলা খবরের ফিড রিডার, নিজের সার্ভারে।**

- `docker-compose.yml` — এক কমান্ডে চালু হয় (`http://localhost:8080`), ঢাকা টাইমজোন।
- `bangla-feeds.opml` — ৫টা যাচাই করা বাংলা ফিড (প্রথম আলো, বিবিসি বাংলা, বিডিনিউজ, ডেইলি স্টার, চ্যানেল আই)।
- `./backup.sh` — ডেটা + ফিডের ব্যাকআপ নেয়।
- প্রথমে `docker-compose.yml`-এ অ্যাডমিন পাসওয়ার্ড বদলে নিন — ডিফল্ট পাসওয়ার্ড দিয়ে চালাবেন না।

## 📄 License

MIT — use it however you like; credit is appreciated.
