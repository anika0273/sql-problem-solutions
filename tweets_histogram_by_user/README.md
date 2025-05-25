# Tweets Histogram by User

## Problem

Given a table of tweets, we need to generate a histogram showing how many users posted a specific number of tweets in the year 2022.

### Table: `tweets`

| Column Name | Type      |
|-------------|-----------|
| tweet_id    | integer   |
| user_id     | integer   |
| msg         | string    |
| tweet_date  | timestamp |

---

## Example Input:

| tweet_id | user_id | msg                                                           | tweet_date             |
|----------|---------|---------------------------------------------------------------|------------------------|
| 214252   | 111     | Am considering taking Tesla private at $420. Funding secured. | 12/30/2021 00:00:00    |
| 739252   | 111     | Despite the constant negative press covfefe                   | 01/01/2022 00:00:00    |
| 846402   | 111     | Following @NickSinghTech on Twitter changed my life!         | 02/14/2022 00:00:00    |
| 241425   | 254     | If the salary is so competitive why won’t you tell me what it is? | 03/01/2022 00:00:00 |
| 231574   | 148     | I no longer have a manager. I can't be managed                | 03/23/2022 00:00:00    |

---

## Expected Output:

| tweet_bucket | users_num |
|--------------|-----------|
| 1            | 2         |
| 2            | 1         |

---

## Thought Process

1. First, filter the tweets to only include those posted in 2022.
2. Group by `user_id` and count how many tweets each user posted that year.
3. Then, group this result again to get a count of how many users fall into each "tweet count" bucket.

