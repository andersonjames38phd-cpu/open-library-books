"""Book Data Scraper - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# Most read personal finance books
run = client.actor("Turboextract/open-library-books").call(run_input={
    "searchQueries": [],
    "subjects": [
        "personal finance"
    ],
    "sort": "readinglog",
    "maxResults": 200
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("title"), item.get("firstPublishedYear"), item.get("wantToRead"), item.get("ratingAverage"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
