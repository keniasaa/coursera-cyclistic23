# Cyclistic Case Study: Google Data Analytics Capstone 
(https://www.coursera.org/learn/google-data-analytics-capstone)

## Introduction
I will conduct data analysis to finalize my project in the Google Data Analytics Capstone. For this purpose, I will utilize SQL BigQuery and Tableau as my primary analytical tools.

## Background
### Scenario
As a junior data analyst within the marketing analyst team at Cyclistic, a bike-share company located in Chicago, the director of marketing has expressed the perspective that the organization's future prosperity hinges on optimizing the count of annual memberships.
### About The Company
Cyclistic, the bike-share company in Chicago, started in 2016 and now has 5,824 bikes at 692 stations. You can pick up and return bikes at any station. Until now, they tried to get a lot of people interested by offering different passes – single rides, full days, and yearly memberships. But now, they see that yearly members bring in more money. The marketing director, Moreno, wants to focus on getting more people to become yearly members instead of trying to find entirely new customers. She thinks it's a good idea because many people already know about Cyclistic and use it for getting around.

## Approach
### 1. Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### 2. Prepare
**Data Source:** [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

[Please be aware that Motivate International Inc. has provided the data for access under these terms. [<ins>license</ins>](https://www.divvybikes.com/data-license-agreement).]

**Tools:** <br>
- Data cleaning & processing - SQL on Google Big Query 
- Data visualization - [Tableau](https://public.tableau.com/views/Cyclistic23_updated/Totaltripsmc?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

### 3. Process
On this occasion, I utilized data spanning from January 2023 to December 2023, resulting in a total of 12 files in CSV format. Each file contains attributes providing information about ride ID, bike type, start station, end station, and membership type of the riders. The column names are as follows: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual.

#### Data Combining
✿ SQL Query: [Data Combining](https://github.com/keniasaa/coursera-cyclistic23/blob/main/01.%20Data%20Combining.sql)

During the data combining step, I uploaded 12 CSV files to BigQuery. Afterward, I merged these 12 files into one CSV file, and it now contains a total of 5,719,877 rows.

#### Data Exploration
✿ SQL Query: [Data Exploration](https://github.com/keniasaa/coursera-cyclistic23/blob/main/02.%20Data%20Exploration.sql)

In the data exploration phase, let's take a look at some findings I've come across.
- The following table displays all the columns present in the file along with their respective data types
  ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/f639f45e-59c8-40f0-a1eb-16af3de1b1b2)

- The table below illustrates all columns that contain __null values__
![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/d9a16578-6ef6-4241-840f-8598ed90ebe0)
![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/5ab72d58-738d-46c3-a8fc-2c9b4491196c)

  We can observe in the table that there are columns with null values, namely in the following fields: start_station_name, start_station_id, end_station_name, end_station_id, end_lat, and end_lng.

- Now, let's take a look at how many bike types are available.
  
  ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/17f1bff8-2e43-46ce-bc0f-43e5809270d7)
  
  There are three bike types available: electric, classic, and docked.

- Now, let's check if there is any incoming data that indicates riders with a duration of less than one minute or more than 24 hours, as this could represent outlier data that is advisable to be excluded.

  ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/abce1e01-27f5-4700-8d8a-1e9f4113e9b5)

  ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/df48c181-57c5-41f0-9cfd-069262d857a0)

- The table below illustrates the rider types at Cyclistic.

  ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/1f93cd3f-ac1a-4626-b6ef-b1869652e646)

  There are two rider types: member and casual.

#### Data Cleaning
✿ SQL Query: [Data Cleaning](https://github.com/keniasaa/coursera-cyclistic23/blob/main/03.%20Data%20Cleaning.sql)

  After exploring the data, it's time for some data cleaning with the following modifications: 
  1. Removing data with null values
  2. Adding columns for ride duration, month, and day of the week
  3. Eliminating data with trip durations less than one minute and more than 24 hours, as such data is considered outliers. 

#### Data Analysis and Visualization
✿ SQL Query: [Data Analysis](https://github.com/keniasaa/coursera-cyclistic23/blob/main/04.%20Data%20Analysis.sql)

✿ Tableau Visualization: [Tableau](https://public.tableau.com/views/Cyclistic23_updated/Totaltripsmc?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)
 
  - Looking at the pie chart, it's evident that members constitute 64.53% of the total rides in 2023, while casual riders make up 35.47%. This implies that in 2023, Cyclistic had more riders from the casual category than members.
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/a5902aaf-b521-480f-891c-1a8c9fa4246b)

  - Analyzing the bike types offered, it's evident that classic bikes are favored by riders, both members and casual users. Electric bikes come in second place, and docked bikes are less popular, with only 1.78% of casual riders using them in 2023. Members take a larger share than casual riders in terms of the number of rides taken on both classic and electric bikes.
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/9ef7afbb-2de0-40b2-aa0e-a4536f1afc45)

  - Let's examine Cyclistic usage throughout the year. We observe high usage from May to September, peaking in August. It can be assumed that people use Cyclistic services from early to late summer. During the spring in April and the fall in October and November, usage tends to be moderate. Usage is relatively low in December, January, and February, considering these are winter months.
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/1fbcc802-cba5-4ca0-8462-26978970bb42)

    
  - Looking at the usage duration, the peak usage duration occurs in July, aligning with the previously mentioned data that indicates a higher Cyclistic ridership during the summer season. However, the duration for casual riders surpasses that of members. The duration gap for casual riders sees a drastic increase from March to April. For both membership types, usage declines as we transition into the fall and further decreases in the winter season.

    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/7900e944-cb45-4152-a1cc-99f205448957)

  - The following chart provides an overview of Cyclistic riders on a weekly basis. It is evident that the highest number of users occurs on Saturday, with Thursday following closely in second place. During weekdays, member riders dominate, while on weekends, the composition of member and casual riders is balanced.
  
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/ffb9c335-5d3b-4da5-811e-a63013bf0c39)

  - The line chart below illustrates the weekly duration of Cyclistic riders. For casual riders, the longest usage duration occurs on Sunday, while for members, it peaks on Saturday. It's noticeable that over the weekends, the riding duration is quite extensive, decreases on Monday, remains stable during weekdays, and then rises again on Saturday.
  
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/e444cc2f-8469-4710-a29c-653af12b26e9)

  - Let's take a look at the top 10 starting stations where Cyclistic riders initiate their journeys. It's evident that a significant portion, accounting for 17.17% of riders, start their trips from the Streeter Dr & Grand Ave station.
  
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/41d21c88-57e7-4ec3-901b-0a614d2f1fda)

  - Here's the list of the top 10 stations where riders conclude their journeys. Similar to the starting stations, Streeter Dr & Grand Ave station holds the first position at the ending station as well, with a percentage of 26.69%.
  
    ![image](https://github.com/keniasaa/coursera-cyclistic23/assets/157902229/8f87e185-1003-4f6e-8b25-adfc4ea8c22f)


### 4. Summary

  #### Member
  - Engages more with Cyclistic
  - Prefers riding on weekdays
  - Shows a tendency to use classic bikes
  - Dominates ridership throughout the year, with a peak from May to September
  - Riding durations tend to be short

  #### Casual
  - Constitutes a smaller proportion of Cyclistic ridership
  - Prefers riding on weekends
  - Only casual riders who utilize docked bikes, at a percentage of only 1.78%
  - Engages more with Cyclistic from May to September, with reduced usage during the winter season
  - Riding durations are more than double on average

### 5. Act
  After identifying the characteristics of both member and casual riders, we can provide recommendations to the marketing team for revenue enhancement:
  
  ★ Introduce special weekend benefits.
  
  ★ Initiate Cyclistic promotions with diverse advertisements at each station during the spring to attract a broader user base.

  ★ During the summer, maintain rider engagement by offering additional benefits for both members and casual riders.

  ★ Create enticing promotions targeting the working professional and student demographics to boost weekday ridership.

  ★ Focus docked bike services in tourist destinations or city parks.

  ★ Given the lower rider engagement during the winter season, in addition to offering significant discounts for both member and casual riders, consider establishing an indoor Cyclistic facility. This way, riders can engage in physical activities, and members can also take advantage of their memberships.


  
    
    







