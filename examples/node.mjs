// Book Data Scraper - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// Every book by an author, highest rated first
const run = await client.actor('Turboextract/open-library-books').call({
    "searchQueries": [],
    "authors": [
        "Brandon Sanderson"
    ],
    "sort": "rating"
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.title, item.firstPublishedYear, item.wantToRead, item.ratingAverage);
}
