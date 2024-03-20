Cyclistic Analysis
================
Janis C.
2024-02-29

``` r
knitr::opts_chunk$set(echo = TRUE)
```

# Cyclistic Case Study

## **Case Background**

Cyclistic is a company based in Chicago that offers a network of
shareable bikes at docking stations throughout the city. It was launched
in 2016, and has successfully been providing transportation since then.
The company offers flexible pricing plans for both casual riders, who
have the option to use one of the single-ride or day passes, and annual
membership holders, who have unlimited access to the bikes. The
marketing director speculates that for the business to continue to grow,
the number of annual memberships needs to be maximized by converting
casual riders to membership holders. The executive team needs to know
that the data reflects this hypothesis, so that the team can proceed
with a new marketing strategy to encourage casual rides to purchase the
annual membership.

Link to my findings presentation
[here](https://docs.google.com/presentation/d/1Cwr5pyeJQim2mJ0pF1uY1Yj932HAEyMPYWKFuswiXZg/edit#slide=id.p).

Scope of Project:

<table style="width:86%;">
<colgroup>
<col style="width: 22%" />
<col style="width: 63%" />
</colgroup>
<thead>
<tr class="header">
<th>Deliverables</th>
<th>Outcomes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Define and Discuss the Project</td>
<td><ul>
<li>Create scope of work documentation</li>
<li>Identify problem statement and stakeholders</li>
<li>Define goals</li>
<li>Establish metrics of success and expectations</li>
</ul></td>
</tr>
<tr class="even">
<td>Prepare the Data for Exploration</td>
<td><ul>
<li>Identify source of data, collect, and store</li>
<li>Determine data reliability, origin, comprehensiveness, current
relevance, credibility, and licensing</li>
<li>Identify data organization; sort and filter</li>
</ul></td>
</tr>
<tr class="odd">
<td>Process the Data for Analysis</td>
<td><ul>
<li>Determine the tools that will be used for the analysis/why</li>
<li>Check for data errors/ “dirty” data</li>
<li>Transform data to correct data types</li>
<li>Ensure that data being used is clean</li>
<li>Document the cleaning process</li>
</ul></td>
</tr>
<tr class="even">
<td>Conduct a Descriptive Analysis</td>
<td><ul>
<li>Organize, and format data properly</li>
<li>Identify trends in the data with calculations, data aggregation, and
visualization</li>
<li>Provide a detailed analytical summary of the clean, unbiased and
representative data</li>
</ul></td>
</tr>
<tr class="odd">
<td>Share Findings with Stakeholders</td>
<td><ul>
<li>What story is the analysis telling and how does it relate to the
business problem?</li>
<li>Determine way best communicate findings to the audience</li>
<li>Create an effective and accessible presentation that helps solve the
business problem discussed beforehand</li>
</ul></td>
</tr>
<tr class="even">
<td>Act on Key Findings</td>
<td><ul>
<li>Explore how additional data parameters would expand upon the
analysis and insights</li>
<li>Share recommendations based on analytical findings, with
shareholders to to help the marketing team in their project.</li>
</ul></td>
</tr>
</tbody>
</table>

Cyclistic Details:

- 5,824 geo-tracked bicycles
- 692 lock docking stations through-out Chicago
- Flexible pricing plans:
  - Single ride pass
  - Full-day pass
  - Annual membership
- Options for types of bikes used (inclusive usage for those who cannot
  use a standard two-wheeled bike–8% of users use assistive options):
  - Standard bicycle
  - Reclining bikes
  - Hand tricycles
  - Cargo bikes
- 30% of users bike to work daily (assuming annual members)
- Casual riders are more likely to use the bikes for leisure

## Data Analysis Process

### Define and Discuss the Project

Financial analysts for Cyclistic have found that annual members are more
profitable than casual riders. Based on these findings, Lily Moreno, the
director of marketing, believes that the “key to growth” lies in
converting casual riders to members. Moreno has assigned the Cyclistic
marketing analytics team to investigate and **understand how casual
riders and annual members differ in their usage of the bike-sharing
network**. We must identify historical trends that would identify why
casual riders (who know about the access to Cyclistic for their
transportation needs) would buy a membership, and how digital media
could affect the marketing tactics.

| Stakeholders                       | Establish Metrics of Success and Expectations                                          | Project Goals                                                                              |
|------------------------------------|----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Marketing Analytics Team           | Discover differences in usage between the two bike user types and their motivations    | Provide data-driven results to inform Cyclistic’s decision making                          |
| Lily Moreno, Director of Marketing | Gather data-driven evidence to allow the marketing team to proceed with new strategies | Create a marketing strategy to convert as many casual riders to annual members as possible |
| Cyclistic Executive Team           | Observe compelling and relevant insights to allow advancement in marketing decisions   | Implement initiatives based on the data to advance Cylistic’s business growth              |

### Prepare the Data for Exploration

**Tasks:**

- Collect data-sets from its source and not how it is organized
- Ensure data analysis standards are met
- Verify data integrity
- Ensure data ethics (security, privacy, accessibility, and licensing)
- Organize: filter and sort data-sets

The data-sets being used in this analysis are gathered from Cyclistic’s
historical trip data. (Note: Cylistic is a fictional organization. I
collected data-sets from Divvy bicycle sharing service who have licensed
out their data [here](https://divvybikes.com/data-license-agreement) for
public use.) The data is stored in an [online
database](https://divvy-tripdata.s3.amazonaws.com/index.html) that the
internal organization upkeep. Although I have downloaded the data .csv
files onto an “out of network” computer for analysis, I have saved them
to a work file that only the analytics team has access to.

The data available is made up of structured primary, quantitative data
points that have been collected over time to measure the ride uses of
the bikes. The data is automatically anonymized and assigned a
randomized ID code representing a ride. Each data point represents a
single trip, from the time a bike is collected and docked from station
to station. This type of data provides an overview of **how the rides
differ between casual users and membership holders**. To really dive
into the data further and provide more in-depth insights, we should
consider collecting data to answer why the riders are using this
transportation platform. It could also be extremely useful to anonymize
the rides by a user identification instead of trip identification so
that we can show how individual usage patterns reflect the difference
between casual and member users. Assuming that we do not have the
resources to investigate these points further at this time, we will
focus on the data we currently have available.

We have pulled data-sets from comma-separated value files to examine and
compare first-quarter 2019 and first-quarter 2020. Each record is
represented by the following attributes: unique trip identification
(primary key), starting date and time, ending date and time, bike
type/ID number, start station name/ID number, end station name/ID
number, and user-type (casual vs member).

- Data Analytical Standards
  - 🗷Reliability:

    - there are several instances of negative ride time duration (an
      impossibility) that needs to be further investigated
    - missing data points for some records, but they will be unused
      attributes at this point in the analysis

  - 🗹Originality: primary-source repository, with no outside influence

  - 🗹Comprehensiveness: allows for observations and comparisons between
    casual and member usership

  - 🗹Current: within time-frame parameters that we were asked to review

  - 🗹Credibility: automatically recorded bike trips free of notable
    errors
- Data Integrity
  - Time inconsistencies are present that need to be investigated
    further for consistency/accuracy.
- Data Ethics
  - Security: data-sets are managed through a reputable and authorized
    cloud repository which provides safety and security
  - Privacy: all data points have been anonymized to protect personal
    information
  - Accessibility: Cyclistic records are open to the public
  - [Data Licensing
    Agreement](https://divvybikes.com/data-license-agreement) made
    available by Motivate International Inc.
- Data Organization
  - We have randomized data points organized by the first quarters
    (Jan. 1-Mar. 31) of 2019 and 2020. I will not be filtering out any
    data points at this moment of the data analysis process.

To advance with this project we assume that the data collection process
is completed with integrity. The original repositories represent
accurate, credible, and unbiased data that has not been modified in
unauthorized manners. There is no belief that there is known
misrepresentation in the data.

**Pre-processing changes to the data:**

- Unzip and open .csv files

  - Save as .xlxs file for smooth data transformation

- Open *Q1 2019* Excel file and complete the following preparation of
  the data

1.  Select *trip_id column* -\> Conditional Formatting -\> Highlight
    Cells Rules -\> Duplicate Values…

2.  Select *start_time* and *end_time* columns, format Date/Time as
    MM:DD:YYYY HH:MM:SS

3.  Select *usertype* column, find and replace: Subscriber to member and
    Customer to casual

4.  Select *Row 1*, make all attributes bold and freeze the first row to
    the pane and select all cells to fit the cells around the data, so
    that we everything we are looking at can be identified easier

No duplicate entries were located. It is noted that there are missing
data points in both the *gender* and *birthyear* columns, however these
attributes will not be used during this analysis, therefore this will
not affect this project.

- Open *Q1 2020* Excel file and complete the following preparation of
  the data

5.  Select *ride_id* column -\> Conditional Formatting -\> Highlight
    Cells Rules -\> Duplicate Values…
6.  Select *started_at* and *ended_at* columns, format Date/Time as
    MM:DD:YYYY HH:MM:SS
7.  Select *Row 1*, make all attributes bold and freeze the first row to
    the pane so that we everything we are looking at can be identified
    easier

No duplicate entries were located. No missing data points in this table.
It is noted that attribute names have changed and additional metrics
will be documented, because at the beginning of 2020 it was decided that
new data would be collected this way going forward. Because of this, we
are going to change the attribute names to align with what will be used
going forward.

8.  Rename columns in both documents to match what will be used going
    forward.

### Process the Data for Analysis

**Tasks:**

- Determine the tools that will be used for the analysis/why
- Check for data errors/ “dirty” data
- Transform data to correct data types
- Ensure that data being used is clean
- Document the cleaning process

We begin the data processing, keeping in mind that we are needing to
answer the business problem of how to convert casual riders to annual
membership holders. We do have questions that proceed answering the main
business problem that will make the analysis a bit more efficient.
Firstly, we need to compare the casual rider and member usage of the
network. Then we need to explore how marketing will be able to persuade
annual membership purchases.

The team has agreed that **Excel** and **RStudio** will be used to
*process and analyze* the data, **RMarkdown** will be used for
*documentation purposes*, then the aggregated data will be visualized
through **Tableau** to be able to *implement an accessible and
interactive dashboard* for the stakeholders.

Now that the basis for analysis is set up, we are going to add a bit of
data that will streamline the analysis process. Open both data-sets in
Excel. Complete the following steps in the individual files.

1.  In the next open and available column, add attribute name
    *ride_length*
2.  Add a formula to calculate the length of the ride and apply it to
    the entire column; take the *ended_at* time and subtract by the
    *started_at* time to calculate the ride length (ex. =D2-C2), noting
    that there are several data points that have negative ride times.
3.  Select *ride_length* column, Conditional Formatting -\> Highlight
    Cells Rules -\> Less than… -\> Cell Value \< 0 (117 negative ride
    times, all with station name being “HQ QR”)
4.  In the next open and available column, add attribute name
    *day_of_week*
5.  Add a function to determine what day of the week the ride occurred
    and apply it to the entire column; use the WEEKDAY command (ex.
    =WEEKDAY(C2,1)). This will return a General number with no decimals,
    noting that 1=Sunday and 7=Saturday.

Adding these practical attributes will assist us during the analysis
phase.

6.  Complete calculations for minimum, maximum, and average ride times

    - Q1 2019
      - MIN: 00:01:01; =MIN(M:M)
      - MAX: 01:20:22; =MAX(M:M)
      - MEAN: 00:16:56; AVERAGE(M:M)
    - Q1 2020
      - MIN: 00:00:01; =MIN(IF(N:N\>0,N:N))

      - MAX: 15:30:24; =MAX(N:N)

      - MEAN: 00:22:07; =AVERAGE(N:N)

7.  Run counts for casual and member users that completed trips 

    1.  Q1 2019

        1.  Casual Riders: 23,163; =COUNTIF(J:J, “casual”)

        2.  Member Holders: 341,906; =COUNTIF(J:J, “member”)

        3.  Total Rides: 365,069; =P9+P10

    2.  Q1 2020

        1.  Casual Riders: 48,480; =COUNTIF(M:M, “casual”)

        2.  Member Holders: 378,407; =COUNTIF(M:M, “member”)

        3.  Total Rides: 426,887; =R12+R13

The data’s integrity was previously established during the preparation
phase, but nothing has occurred during the processing of the data that
has given rise to suspicion that the data’s integrity is at stake.
Nothing outdated, duplicated, incomplete, inconsistent or inaccurate
will affect analysis. The processing has been reviewed by the analytics
team and we feel comfortable proceeding with the data analysis process.

8.  Load and library packages that will help the analysis of the data in
    R

    ![](images/library_packages.png)

9.  Wrangle/upload cleaned data to Rstudio (ensure that everything is in
    the correct data type for analysis)

<!-- -->

    library(readr)

    q1_2019 <- read_csv("~/Data Analytics Projects/Portfolio Case Studies/Case Study-Cyclistic/Divvy_Trips_2019_Q1/Cyclistic_2019_Q1.csv", ended_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"), col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"), ended_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"), ride_length = col_time(format = "%H:%M:%S"), ...15 = col_skip(), ...16 = col_skip(), ...17 = col_skip()), na = "null")

    View(q1_2019)

    library(readr)

    q1_2020 <- read_csv("~/Data Analytics Projects/Portfolio Case Studies/Case Study-Cyclistic/Divvy_Trips_2020_Q1/Cyclistic_2020_Q1.csv", col_types = cols(started_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"), ended_at = col_datetime(format = "%m/%d/%Y %H:%M:%S"), ride_length = col_time(format = "%H:%M:%S"), ...16 = col_skip(), ...17 = col_skip(), ...18 = col_skip(), ...19 = col_skip(), ...20 = col_skip()), na = "null")

    View(q1_2020)

10. Compare the column names

<!-- -->

    colnames(q1_2019)
    colnames(q1_2020)

![](images/q1_2019_q1_2020_original_column_names.png)

11. Change the attribute names so that everything matches in both
    tables; this will allow for merging the tables easily

<!-- -->

    (q1_2019 <- rename(q1_2019,
                       rideable_type = bikeid,
                       started_time = started_at,
                       ended_time = ended_at,)
    )
    (q1_2020 <- rename(q1_2020,
                       started_time = started_at,
                       ended_time = ended_at,)
    )

12. Observe the structure of both tables for any incongruities

    <img src="images/structure_q1_2019.png" width="677" />![](images/structure_q1_2020.png)

13. Convert the types of data so that they can be stacked into a single
    column when the *q1_2019* and *q1_2020* tables are merged

14. Combine/stack the tables

15. Delete *lat, long, birthyear*, and *gender* fields

<!-- -->

    # Convert ride_id and rideable_type to character so that they can stack correctly
    q1_2019 <- mutate(q1_2019, trip_id = as.character(trip_id),
                      rideable_type = as.character(rideable_type))

    # Combine/stack the tables
    all_trips <- bind_rows(q1_2019, q1_2020)
    view(all_trips)

    # Remove lat, long, birthyear, and gender fields as this data was dropped beginning in 2020
    all_trips <- all_trips %>%  
      select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender,  "tripduration"))
    view(all_trips)

16. In the *all_trips* table review the column names, number of rows in
    the table, and dimensions (number of rows and number of columns)

![](images/all_trips_colnames_nrow_dim.png)

17. Observe the first six rows and last six rows of data in the
    *all_trips* table

![](images/all_trips_head_tail.png)

18. Review the structure and summary of *all_trips* table

![](images/all_trips_str_summary.png)

19. Create additional columns based on the date of the ride to provide
    more avenues of aggregation; before doing this we would have to
    aggregate using only a DateTime format

<!-- -->

    all_trips$date <- as.Date(all_trips$started_time)
    all_trips$month <- format(as.Date(all_trips$date), "%m")
    all_trips$day <- format(as.Date(all_trips$date), "%d")
    all_trips$year <- format(as.Date(all_trips$date), "%Y")

20. Remove “bad” data from *all_trips* creating a second
    version(*all_trips_v2*) of the data frame; review the new table to
    ensure that all of the deletions have been applied properly

        all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]
        view(all_trips_v2)

        library(janitor)
        all_trips_v2 <- all_trips_v2 %>% remove_empty("rows")
        view(all_trips_v2)

    - The *all_trips* data frame includes bikes that were taken out of
      docking stations for quality assurance purposes, but were counted
      as actual trips. These data points resulted in negative ride
      lengths that were observed in Excel. Now that we know why these
      ride lengths are present, we can remove them since they do not
      actually contribute to the analysis.
    - There are a lot of rows that simply have “*nulls*” across the
      board with no other supporting data, however they do contribute to
      the number of rows in the column, so it is beneficial to remove
      these rows from the data frame.

<!-- -->

21. Add a weekday name and time of day columns to *all_trips_v2* to
    provide more levels for aggregation

<!-- -->

    all_trips_v2$weekday_name <- format(as.Date(all_trips_v2$date), "%A")
    view(all_trips_v2)

    all_trips_v2$time_of_day <- lubridate::hour(all_trips_v2$started_time)
    view(all_trips_v2)

### Complete Descriptive Analysis

**Tasks:**

- Organize and format data properly
- Complete data aggregation
- Identify trends in the data with calculations, data aggregation, and
  visualization.
- Provide a detailed analytical summary of the clean, unbiased and
  representative data

Our ability to analyze has been streamlined during the process phase, so
now we are ready to begin the analysis process. I first created a couple
of pivot tables to review the individual years data. Then I could look
at the combined data frame, to gain a sense of how casual users and
member holders use the biking platform.

1.  Review pivot tables for Q1 2019 and 2020

2019:

![](images/pivot_table_2019.png)

2020:

<figure>
<img src="images/pivot_table_2020.png"
alt="The numbers were not necessarily expected here. Members tend to have way more rides than casual rides, which makes complete sense. However, the average ride lengths per group did come at a shock. Casual riders, on average, use the bike over seven times longer than members use the bike per trip." />
<figcaption aria-hidden="true">The numbers were not necessarily expected
here. Members tend to have way more rides than casual rides, which makes
complete sense. However, the average ride lengths per group did come at
a shock. Casual riders, on average, use the bike over <strong>seven
times</strong> longer than members use the bike per trip.</figcaption>
</figure>

2.  Collect the average, median, maximum, and minimum of *all_trips_v2*
    data frame

<figure>
<img src="images/ride_length_mean_median_max_min.png" width="254"
alt="Ride duration average is 0:13:51, the median is 0:08:59, the maximum is 23:57:54, and the minimum is 1 second." />
<figcaption aria-hidden="true">Ride duration average is 0:13:51, the
median is 0:08:59, the maximum is 23:57:54, and the minimum is 1
second.</figcaption>
</figure>

3.  Aggregate comparisons of ride duration averages, medians, maximums
    and minimums between user type classes

<figure>
<img src="images/usertypeVSride_length_mean_median_max_min.png"
width="503"
alt="In every category, casual riders tend to use the bikes for longer periods of time than people who have the annual membership." />
<figcaption aria-hidden="true">In every category, casual riders tend to
use the bikes for longer periods of time than people who have the annual
membership.</figcaption>
</figure>

4.  Find the busiest days of the week

<figure>
<img src="images/usertypeVSride_length_by%20day.png"
alt="As we can see, workdays (Monday-Friday) generate the most usage for annual members and casual riders tend to use the bikes more on Saturday and Sunday." />
<figcaption aria-hidden="true">As we can see, workdays (Monday-Friday)
generate the most usage for annual members and casual riders tend to use
the bikes more on Saturday and Sunday.</figcaption>
</figure>

**Relevant Visuals:**

Interactive visuals are available for viewing on [Tableau
Public](https://public.tableau.com/app/profile/janis.christophe/viz/Cyclistic_Visuals/Dashboard1#1).

**Identifying Trends:**

- From Q1 2019 to Q1 2020 there has been substantial growth in ride
  count (over 60,000 rides)!
- Of the 787,899 total rides completed during the two first quarters,
  720,249 (91.4%) of the users are annual members and 67,650 (8.6%) are
  casual riders.
- For members, weekdays tend to get the most action. Monday thru Friday
  have high usage while Saturday and Sunday have about half the traffic.
- Casual riders tend to use the network on Saturday and Sunday (the
  weekend taking up almost half of the data points). Monday thru Friday
  cover a little over half of the data points and are fairly equivalent
  in usage.
- Peak usage times for members are around commuting times–5am to 9am and
  3pm to 7pm–with peaks around 8am and 5pm.
- Usage times for casual users are fairly steady throughout the day with
  11am to 7pm being the busiest times for this group.
- Although annual members are the majority of users–dominating the
  amount of rides–casual riders tend to use the bikes about 27 minutes
  longer than members on average. The amount of rides was expected
  because members are going to use the bikes more than the casual users,
  but the ride length averages did come as a surprise. Casual riders use
  the bikes almost 8 times longer than members

**Analysis Summary:**

Our analysis has been able to identify notable differences in the usage
patterns between casual rides and riders who have annual memberships.
The two groups do differ in total amount of usage, most popular days of
use, time of day they use the bikes, and ride durations, so we can gain
considerable insights in that respect. The distinctions between groups
can lead to understanding generalizations about the populations;
however, the data is not sufficient enough to answer the why aspect of
the question.

Considering the days, times, and duration of the rides, we can assume
several things:

Annual Members:

- Consistently ride the bikes though the work week
- Have peek ride times around commuting hours for 9-5 jobs
- Motivated to use the bikes more often because, they have financially
  committed to use the network
- Use the bikes for commuting and leisure purposes

Casual Riders:

- Bike twice as much on the weekend (Saturday and Sunday) when compared
  to the other weekdays
- Tend to use the bikes mid-day
- Have significantly longer ride durations per trip on average,
  suggesting that they are spending more time outdoors; this suggests
  leisure activity on the weekends
- Do not truly use the bikes often enough to warrant a membership

### Share Findings with Stakeholders

**Tasks:**

- Determine the best way to share your findings
- Create effective data visualizations
- Ensure your work is accessible
- Present your findings

Tableau dashboard visuals can be located
[here](https://public.tableau.com/app/profile/janis.christophe/viz/Cyclistic_Visuals/Dashboard1#1).

I have created a presentation to share with all stakeholders on my
data-driven insights that can be reviewed
[here](https://docs.google.com/presentation/d/1Cwr5pyeJQim2mJ0pF1uY1Yj932HAEyMPYWKFuswiXZg/edit#slide=id.pv).

### Act on Key Findings

**Tasks:**

- Inform how addition data can lead to more in-depth insights
- Provide three data-driven recommendations

While presenting insights, we have provided stakeholders with three
recommendations going forward in the marketing strategy.

1.  **Offer privileges with annual memberships**

Incentivizing a membership is probably the easiest way to bump casual
users to members. At the moment, no matter what level the rider chooses,
they receive the same level of service. This can be as simple as
minimizing any inconveniences for members. This could include the
benefit of providing geo-tracked availability of the number and type of
bikes that will be available at each station. To add to this they could
have the option to reserve their bike of choice ahead of time instead of
arriving at a station that they are not able to collect a bike from at
the moment. We could even partner with the city to provide an attraction
pass (museums and city gardens) that comes along with the
membership–this would especially incentivise the casual riders who use
the bikes for leisure. Any perk that we will be able to offer can pull
people to purse the annual pass.

2.  **Update Pricing Model**

Instead of pushing conversion, there may be a more lucrative way to
implement a new pricing model. Expanding upon the tree-tiered model we
are currently using, it may be beneficial to offer a service that fits
between a single ride and unlimited rides. The daily pass is nice, but
there may be other avenues we could offer that may be more fiscally
favorable. This gives more options that do not see the need for an
annual membership. The day pass is a good option, but providing
something like a weekend pass would encourage users who use the system
for leisure on the Saturdays and Sundays to purchase. It is also
important to note that the change in the pricing model may affect annual
members downgrading their plan.

3.  **Benefits of Biking Frequently**

It may be beneficial to simply begin a rider email and text campaign to
launch our new information to the masses. In this messaging, we could
offer discounts to riders before peak times of the year for new members.
We could also send statistical evidence to show the benefits of a daily
bike commute. If they are using the bikes for leisure already, they are
likely to consider switching over simply because they would enjoy having
it as an option to get around town.

In the end, the marketing team would have to explore the options and go
forward with what they best believe casual riders would respond to most
effectively. In all earnestness, the number of people who use the
bike-share network pales in comparison to the large amount of rides that
are attributed to members. This could simply be due to the members using
the bikes any time that they would like. For more in depth insights, I
feel as though we should observe rides not only by user type category
(member versus casual riders) but we should consider grouping the rides
by user. This could allow for us to see if there is a comparatively
small group of members that use the bikes several times a day or if
there is truly a vast difference in the amount of riders between the two
groups. We could also dig further into the why aspect of analysis. I
would recommend collecting more pertinent data that explore the more
qualitative nature of bike usage. We could survey users to ask what
purpose their ride is for. Or we could ask if there is anything that
discourages bike use. By doing this, we could find what motivates the
different user types to use the network of bikes. Further questions like
this could lead to deeper insights that would provide new avenues to
help convert casual riders to member holders.
