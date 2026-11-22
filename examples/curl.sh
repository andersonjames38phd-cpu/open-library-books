#!/usr/bin/env bash
# Book Data Scraper - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~open-library-books"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. Most read personal finance books (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "subjects": [
      "personal finance"
    ],
    "sort": "readinglog",
    "maxResults": 200
  }'

# 2. Every book by an author, highest rated first (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "authors": [
      "Brandon Sanderson"
    ],
    "sort": "rating"
  }'

# 3. Look up ISBNs (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "isbns": [
      "9780593189641",
      "9780441172719"
    ]
  }'
