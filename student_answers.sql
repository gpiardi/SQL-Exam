-- Name / student ID:
Giovanni Piardi
-- Q1. Write one SELECT below.
SELECT COUNT(DISTINCT s.user_id) AS active_users
FROM sessions AS s
JOIN users AS u
  ON u.user_id = s.user_id
WHERE s.session_start >= DATE '2026-09-01'
  AND s.session_start <  DATE '2026-10-01';
-- Q2. Write one SELECT below.
SELECT c.category,
       SUM(e.watch_seconds) AS total_watch_seconds
FROM events AS e
JOIN content AS c
  ON c.content_id = e.content_id
WHERE e.event_time >= TIMESTAMP '2026-01-01 00:00:00'
  AND e.event_time <  TIMESTAMP '2027-01-01 00:00:00'
GROUP BY c.category
HAVING SUM(e.watch_seconds) > 100000
ORDER BY total_watch_seconds DESC;
-- Q3. Corrected SELECT below; explanation in submission/answers.md.
SELECT u.country,
       SUM(s.monthly_price) AS monthly_subscription_value
FROM subscriptions AS s
JOIN users AS u
  ON u.user_id = s.user_id
WHERE s.start_date <= DATE '2026-09-01'
  AND (s.end_date IS NULL OR s.end_date > DATE '2026-09-01')
  AND u.country IS NOT NULL
GROUP BY u.country
ORDER BY u.country;
-- Q4. Corrected SELECT below; explanation in submission/answers.md.
SELECT CAST(DATE_TRUNC('month', u.signup_date) AS DATE) AS signup_month,
       COUNT(DISTINCT u.user_id) AS registered_users,
       COUNT(DISTINCT CASE WHEN s.session_id IS NOT NULL THEN u.user_id END) AS september_active_users
FROM users AS u
LEFT JOIN sessions AS s
  ON s.user_id = u.user_id
 AND s.session_start >= DATE '2026-09-01'
 AND s.session_start <  DATE '2026-10-01'
GROUP BY CAST(DATE_TRUNC('month', u.signup_date) AS DATE)
ORDER BY signup_month;
-- Q5A. Corrected SELECT below; explanation in submission/answers.md.
WITH the CURRENT query the Count(*) IS giving us 1 FOR users that had NO sessions
-- Q5B. Corrected SELECT below; explanation in submission/answers.md.

-- Q5C. Proposed DDL, if applicable, below; reasoning in answers.md.

-- BONUS (optional). ALTER the existing subscriptions_bonus table below.
-- Do not reset or replace the table. Run the bonus separately from your SELECTs.
