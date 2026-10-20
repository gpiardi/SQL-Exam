# Investigation and corrections

Name / student ID:

## Q3 — Subscription snapshot

**SELECT** *u*.country, **SUM**(*su*.monthly_price) **AS** *monthly_subscription_value*

**FROM** users **AS** *u*

**JOIN** subscriptions **AS** *su* **ON** *su*.user_id = *u*.user_id

**where** *su*.start_date <= **DATE** '2026-09-01'

**AND** (*su*.end_date **IS** **NULL** **OR** su.end_date > **DATE** '2026-09-01')

**GROUP** **BY** *u*.country

**ORDER** **BY** *u*.country;
Problem identified:

Explanation: adding the schema session didn’t make sense

Correction and reasoning:

## Q4 — Signup population

Problem identified and explanation:

Correction and reasoning:

## Q5A — Counting

Problem identified and explanation:

Correction and reasoning:

## Q5B — Previous session

Problem identified and explanation:

Correction and reasoning:

## Q5C — Design recommendation

Change and concrete SQL (or reference to my SQL file):

Reasoning:

Cost or limitation:

## Q6 — Visual critique

| Issue (exactly three) | Consequence for interpretation | Proposed correction |
|---|---|---|
| 1 | | |
| 2 | | |
| 3 | | |

Changes made in the saved workbook:

## Q7 — Metric and grain

Source row grain:

Problem identified and explanation:

Corrected calculation:

One-sentence interpretation of my corrected value, with unit, population and period:

## Bonus — Optional

Why user_id must permit multiple subscription rows:

## Submission check

- [ ] SQL saved in sql/student_answers.sql.
- [ ] Explanations above completed.
- [ ] submission/corrected_workbook.twbx saved and reopened.
