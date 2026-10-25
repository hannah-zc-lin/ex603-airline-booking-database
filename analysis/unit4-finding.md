# Unit 4 Finding: Booking Failure Analysis

## The Breakdown

The results show that 44 out of 200 bookings failed, giving an overall failure rate of 22.00%. For flights with at least 10 bookings, there were 194 bookings and 42 failures with an overall failure rate of 21.65% for these flights. Some flights had higher failure rates than others. Flight 3 had the highest rate at 38.46%, with 5 out of 13 booking failures. Flight 1 was next at 36.36%, with 4 out of 11 booking failures, followed by Flight 9 at 35.71%, with 5 out of 14 booking failures. I also compared the results by country. Singapore had the highest failure rate at 35.00%, with 7 out of 20 booking failures. Korea had the most failed bookings, with 15 out of 59 bookings, giving a failure rate of 25.42%.

## Recommended Investigation

I recommend investigating these three flight IDs first:

* **Flight 3:** 5 failures out of 13 bookings (38.46%).
* **Flight 1:** 4 failures out of 11 bookings (36.36%).
* **Flight 9:** 5 failures out of 14 bookings (35.71%).

These flights had highest failure rates, so I think the team should review their booking statuses and cancellation reasons to see if there is a common problem. I would also suggest checking Singapore because its failure rate is the highest compared to the other countries.

For this analysis, I counted bookings marked with `cancelled` or `disputed` as failures, but I need to check if this matches the definition of a failure.


## Reflection

I used conditional aggregation with `CASE` to calculate different results in one query. For example, I can count the total bookings and failed bookings for each flight at the same time. Also I learned another way to do this is to write two separate queries using `WHERE`, one to count all bookings and another one to count only failed bookings. Both methods can give the same results, but conditional aggregation makes it easier to compare them in one table.

I think conditional aggregation is more useful when working with a large amount of data because the database can calculate both results in one pass instead of reading the same table multiple times. If the table has a million rows, running separate queries could be less efficient and use more resources. But the actual speed also depends on how the database runs the queries.

I also learned that looking at the failure rate is more helpful than only looking at the number of failures. For example, a flight with fewer bookings might have a higher failure rate even if it has fewer failures. This is why I think it is important to look at both the total bookings and failed bookings before making the decision on which flights need more attention.

