## Task 4.1: Measure the platform

### Q1. Overall Booking Statistics

I did the first query calculate the total number of booking, total and average fare paid, min and max fare and the number of unique passengers. These give me a concept of booking activity. But the overall average didn't show how result would be different across individual flight. It also didn't tell me which flights contribute the most activity.


### Q2. Booking Statistics by Flight

The next query I group bookings by flight and calculates the number of bookings and average fare for each flight. I sorted the result from highest to the lowest. We could use this breakdown to tell which fligh has the most booking activitiy and decide which need closer review. But the average fare didn't tell me the distributuion of fares across individual bookings, neither the total booking count tell which passengers and booking outcomes make up that count. It didn't show show whether bookings were confirmed, cancelled or disputed. In order for me to understand the result better, I would need to see the distribution of individual fares, booking statuses and cancellation reasons for each flight, and which passengers or bookings contribute to the results. This way it can help explain why some flights have different averages or booking volumes and whether further investigation is needed.

### Q3. Using HAVING

Then I used `HAVING` to select flights with at least 10 bookings. I chose 10 bookings as the minimum because I wanted to focus on flights with more booking activity rather than flights with only few bookings. This makes it easier to compare flights with more booking data. However, flights with fewer than 10 bookings could still have problems, even though I didn't include them in the results.

### Q4. Grouping by Two Dimensions

The next I used groups bookings by origin country and flight. It shows the number of bookings, total and average fare paid, and number of different passengers for each group. This helps me compare booking activity between flights in different countries. 

## Task 4.2: Build the breakdown leadership asked for

### Part A: Two numbers in one pass
I used conditional aggregation to find the total number of bookings and how many of them failed for each flight. It also calculates the failure rate so I can compare the flights more easily. The results show that some flights have higher failure rates than others. Flight 3 had the highest failure rate at 38.46%, with 5 out of 13 booking failures. Flight 1 had a failure rate of 36.36%, and Flight 9 had 35.71%. This helps me see which flights might need more attention. However, I also need to look at the total number of bookings because a flight with only a few bookings might have a high failure rate. I counted bookings marked with `cancelled` or `disputed` as failures, but I need to check if this matches the definition of a failure.

### Part B: Subtotals and a grand total

I used the `ROLLUP` query to show the number of bookings for each country and the total for all countries. The `GROUPING` function helps me identify the grand total. We could use these results to easily compare regions without checking every flight. Singapore had the highest failure rate at 35.00%, followed by Korea at 25.42%, Japan at 24.53%, Thailand at 18.37%, and Vietnam at 0.00%. Overall, there were 200 bookings and 44 failures, which giving an failure rate of 22.00%. This helps the manager decide if there is a bigger problem with the booking system and which countries might need more attention.

### Part C: A two-step pipeline

I used the CTE query to count the total bookings and failures for each flight. Then I only included flights with at least 10 bookings to find their overall failure rate. The results showed 12 flights with 194 bookings and 42 failures, giving a failure rate of 21.65%. I can use this number to compare flights with more bookings. This is a bit different from the overall failure rate of 22.00% because I didn't inclide flights with fewer than 10 bookings.

## Reflection

I used conditional aggregation with `CASE` to calculate different results in one query. For example, I can count the total bookings and failed bookings for each flight at the same time. Also I learned another way to do this is to write two separate queries using `WHERE`, one to count all bookings and another one to count only failed bookings. Both methods can give the same results, but conditional aggregation makes it easier to compare them in one table.

I think conditional aggregation is more useful when working with a large amount of data because the database can calculate both results in one pass instead of reading the same table multiple times. If the table has a million rows, running separate queries could be less efficient and use more resources. But the actual speed also depends on how the database runs the queries.

I also learned that looking at the failure rate is more helpful than only looking at the number of failures. For example, a flight with fewer bookings might have a higher failure rate even if it has fewer failures. This is why I think it is important to look at both the total bookings and failed bookings before making the decision on which flights need more attention.
