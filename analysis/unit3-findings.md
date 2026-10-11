# Unit 3 Finding

The dashboard reported that about some of the bookings ended in a failure. However, our tests have not confirmed whether this result is correct. We found that missing values can affect query results and that a query can fail when it uses a calculated value too early.

During testing, I used a temporary copy of the flights table to demonstrate how missing values can be skipped. The original country column did not contain missing values, so this test alone does not prove that missing values caused the dashboard problem. I also tested different ways to find records and found that some methods handle missing values more safely than others.

I recommend reviewing the dashboard query and checking the booking statuses again to make sure the results are accurate. The team should make sure cancelled, confirmed, and disputed bookings are counted correctly and that missing information does not lead to misleading results. This will help the dashboard provide a more reliable picture of booking activity.
