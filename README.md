# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in  Data Analyst roles in Australia.

🔍 SQL queries? Check them out here: [project_sql folder](/Project_SQL/)

# Background

The demand for Data Analysts 📊 has been growing rapidly across industries as organizations increasingly rely on data-driven insights 📈 to drive decisions and improve operational efficiencies. Australia 🌏, being a hub of diverse industries and technological advancements, offers a dynamic job market for Data Analysts, with remote opportunities 💻 further enhancing its appeal for professionals. This project aims to explore the Australian job market for Data Analysts, focusing on identifying high-paying opportunities 💰, in-demand skills 🛠️, and trends 📅 that could help professionals align their expertise with market requirements.

The project leverages a dataset 🗂️ comprising job postings across Australia and remote roles, enriched with details like salaries 💵, skills required 🧑‍💻, job types 🕒, and company information 🏢. By using SQL queries 🛠️ to extract actionable insights, the project seeks to provide a comprehensive overview of the Data Analyst job market, helping job seekers 👩‍💼👨‍💼 make informed career decisions and guiding organizations in shaping their hiring strategies.

## The Questions I Wanted to Answer Through My SQL Queries Were:
1. ***What are the top-paying Data Analyst roles in Australia and remote positions? 💰***
🏢 Focused on identifying the highest-paying full-time Data Analyst jobs, highlighting the companies offering them.

2. ***What skills are required for the top-paying Data Analyst jobs? 🛠️***
🔍 Extracted the specific skills demanded by the highest-paying roles to understand the technical expertise valued by top employers.

3. ***What are the most in-demand skills for Data Analysts in Australia? 📊***
📈 Analyzed job postings to uncover the top skills most frequently required by employers.

4. ***What skills correlate with the highest average salaries? 💵***
📉 Explored the average salaries associated with different skills to identify the most financially rewarding technical proficiencies.

5. ***What are the optimal skills to learn that are both in high demand and financially rewarding? 🎯***
💡 Combined insights on skill demand and salary data to pinpoint skills that offer the best balance between job security and earning potential.

6. ***How do job trends vary across Australian locations? 🌏***
🗺️ Investigated job counts and work-from-home opportunities across different cities to understand regional trends.

7. ***What percentage of Data Analyst roles in Australia offer work-from-home options? 💻***
🏠 Evaluated the flexibility in job offerings, reflecting the shift toward remote work.

8. ***What are the most prominent companies hiring Data Analysts in Australia? 🏢***
📋 Identified companies with the highest number of job postings to highlight major employers in the field.

9. ***How do job requirements and salaries align for Data Analyst roles in Australia? 📜***
🔍 Analyzed job descriptions for no-degree requirements and health benefits to assess inclusivity and perks in the job market.

10. ***What are the average salaries for Data Analyst roles in Australia? 💵***
📊 Computed average yearly and hourly salaries to provide insights into earning expectations in the field.

# 🧑‍💻 Tools Used:

For my in-depth exploration of the data analyst job market, I leveraged several essential tools:

- ***SQL*** 🛠️: Served as the core of my analysis, enabling me to query the database and uncover valuable insights.
PostgreSQL 
- 🗄️***PostgreSQL:*** : Selected as the database management system, perfectly suited for handling job posting data.
Visual Studio Code 
- 💻***Visual Studio Code***: My preferred tool for managing databases and running SQL queries efficiently.
Git & GitHub 
- 🌐***Git & GitHub***: Vital for version control and sharing SQL scripts and analyses, facilitating collaboration and project tracking.

- ***Python***: For creating 📊visualizations and deeper analysis.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs.
I used an SQL query to extract job postings from the dataset, focusing on roles with specified salaries, full-time schedules, and locations listed as "Australia" or "Anywhere." The query joined job and company tables to retrieve job details along with company names. I ordered the results by average annual salary in descending order and limited the output to the top 10 highest-paying positions. 

```sql
SELECT 
    jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.job_schedule_type,
    jp.salary_year_avg,
    jp.job_posted_date,
    c.name AS company_name
FROM 
    job_postings_fact jp
LEFT JOIN 
    company_dim c 
ON 
    jp.company_id = c.company_id
WHERE 
    jp.job_title_short = 'Data Analyst' 
    AND jp.job_location IN ('Anywhere', 'Australia')
    AND jp.salary_year_avg IS NOT NULL
    AND jp.job_schedule_type = 'Full-time'
ORDER BY 
    jp.salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in Australia or Anywhere in 2023:
![Top 10 Salaries by Company](/Visulisations/output_1.3.png)
- ***Wide Salary Range***
The salaries among the top-paying companies range from $184,000 to $650,000, highlighting significant earning potential in the data analytics field. The large gap reflects varied compensation strategies, driven by role seniority, specialization, and industry demand.

- ***Diverse Employers***
Companies such as Mantys, Meta, and AT&T are leading in offering high salaries, showcasing the broad interest in data analytics talent across diverse industries, including technology, telecommunications, and social media.

- ***Job Title Variety***
The roles span a wide variety, from Data Analyst and Principal Data Analyst to Director of Analytics. This diversity reflects the evolving nature of data analytics positions, accommodating both technical and strategic roles at various levels of responsibility.

This analysis underscores the dynamic opportunities in the data analytics sector and the growing demand for skilled professionals. Let me know if you'd like a deeper breakdown!



### Salary Distribution
- **Observation**: The histogram shows that most salaries cluster in the $180,000 - $250,000 range, with only a few roles offering salaries significantly above this range.
- ***Insight***: This suggests that while high-paying roles like the one offering $650,000 exist, the majority of roles are in a more moderate salary band, indicating varied opportunities across experience and skill levels.
![Salary Distribution](/Visulisations/output_1.1.png)

### Job Salaries by Posting Date
- ***Observation***: The scatter plot reveals that higher salaries, such as the $650,000 job, tend to be posted earlier in the year, while jobs with salaries in the $180,000–$250,000 range are spread throughout the year.
- ***Insight***: Companies might prioritize advertising high-paying roles early in the year to secure top talent, while mid-range roles are consistently available throughout the year.

![Salaries by Posting Date](/Visulisations/output_1.2.png)

Python code? Check it out here: [code for visulisation](/Visulisations/1_Top_Paying_Job_Australia.ipynb)

These graphs were created using Python's powerful data visualization libraries, such as Matplotlib
📊 and Pandas 🐼. The data was first processed and analyzed in a Pandas DataFrame 📋, and then visualized to provide insights into salary distributions, posting trends, and top-paying companies for data analyst roles. The Python scripts used functions like plt.hist 📈, plt.scatter ✨, and plt.bar 📊 to generate the charts, showcasing the flexibility and effectiveness of Python in data analysis and visualization tasks. 🚀

### 2.What skills are required for the top-paying Data Analyst jobs? 🛠️

To determine the skills required for the top-paying Data Analyst jobs, I first identified the top 10 highest-paying Data Analyst roles using a query that ranked jobs by their average annual salary. Then, I joined this result with the skills data using the job_id to extract the specific skills associated with these roles. By linking job postings to their respective required skills through a skills table, I was able to uncover the technical and domain-specific expertise valued in the highest-paying positions. The final query provided insights into the most critical skills demanded by top employers.

```sql
WITH top_paying_jobs AS (
    SELECT	
        jp.job_id,
        jp.job_title,
        jp.salary_year_avg,
        c.name AS company_name
    FROM
        job_postings_fact jp
    LEFT JOIN company_dim c ON jp.company_id = c.company_id
    WHERE
        jp.job_title_short = 'Data Analyst' 
        AND jp.job_location IN ('Anywhere', 'Australia') 
        AND jp.salary_year_avg IS NOT NULL
    ORDER BY
        jp.salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg,
    top_paying_jobs.company_name,
    s.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim sj ON top_paying_jobs.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;
```
### Insights from the Visualizations
#### ***Frequency of Skills Across Job Listings***
- ***Observation***: The most frequently required skills are SQL, Python, and Tableau, indicating their importance in data analytics roles.
- ***Insight***: These skills are foundational for most data analytics jobs and are highly valued across industries. Other notable skills like Snowflake, Pandas, and Excel also highlight the need for data manipulation and cloud technologies.
![Frequency Of Skills Across Job Listings](/Visulisations/output_2.1.png)
#### ***Average Salary by Company***
- ***Observation***: AT&T offers the highest average salary, followed by Pinterest Job Advertisements and Uclahealthcareers.
- ***Insight***: Companies with higher salaries likely prioritize experienced professionals and leadership roles in data analytics. This trend shows the variation in salary expectations across different organizations and industries.
![Average Salary By Company](/Visulisations/output_2.2.png)
#### ***Job Title Frequency***
- ***Observation***: The most common roles are Associate Director- Data Insights and Director, Data Analyst - HYBRID, indicating a demand for senior-level positions.
- ***Insight***: Senior roles reflect an emphasis on leadership and strategic decision-making in data analytics. Other job titles like Data Analyst, Marketing and ERM Data Analyst suggest niche areas within the field.

![Job Title Frequency](/Visulisations/output_2.3.png)

### 3.What are the most in-demand skills for Data Analysts in Australia? 📊

To identify the most in-demand skills for Data Analysts in Australia 📊, I analyzed job postings to determine the frequency of specific skills required. Here's how I approached it:

***Data Collection***: I gathered job postings for Data Analyst positions located in Australia.

***Data Processing***: I joined the job postings data with the skills data using the job_id to associate each job posting with its required skills.

***Frequency Analysis***: I counted the occurrences of each skill across all job postings to determine which skills were most frequently requested by employers.

***Ranking***: I sorted the skills by their frequency in descending order to identify the top in-demand skills.

```
SELECT 
    s.skills,
    COUNT(sj.job_id) AS demand_count
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE 
    jp.job_location LIKE '%Australia%' 
    AND jp.job_title_short = 'Data Analyst'
GROUP BY
    s.skills
ORDER BY 
    demand_count DESC
LIMIT 5;
```
![Demand Count Of Skills](/Visulisations/output_3.1.png)

The bar chart visualizes the Demand Count of Skills:

***SQL*** leads with the highest demand, reflecting its critical role in database management.

***Power BI*** and ***Python*** are equally in demand, showcasing the need for both business intelligence tools and programming skills.

***Excel*** follows closely, underlining its continued importance despite newer tools.

***R*** has the least demand among the listed skills but is still significant in specialized roles.


### 4. What skills correlate with the highest average salaries?
To identify skills that correlate with the highest average salaries, I analyzed job postings with specified salaries and joined the job postings table with the skills table using the job_id. I then calculated the average annual salary for each skill and ordered the results in descending order. This approach highlighted the technical and domain-specific skills associated with the most lucrative Data Analyst roles, helping to identify the most financially rewarding expertise in the field.

```
SELECT 
    s.skills,
    ROUND(AVG(jp.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE
    jp.job_title_short = 'Data Analyst'
    AND jp.salary_year_avg IS NOT NULL
    A
GROUP BY
    s.skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

![Top 10 Skills By Average Salary](/Visulisations/output_4.1.png)

The bar chart visualizes the Top 10 Skills by Average Salary, highlighting the skills with the highest earning potential:

PySpark leads with the highest average salary of $208,172.
Bitbucket and Couchbase follow closely, indicating their high demand in specialized roles.
The chart shows that advanced skills in tools like Datarobot, GitLab, and Jupyter also command competitive salaries.


### 5. What are the optimal skills to learn that are both in high demand and financially rewarding?

To identify optimal skills that are both in high demand and financially rewarding, I combined two analyses:

Skill Demand: I calculated the frequency of each skill across job postings to determine the most in-demand skills.

Financial Reward: I computed the average salary associated with each skill to find those linked to higher pay.

I then joined the results of these two analyses and filtered for skills with both high demand (occurring frequently) and high average salaries. By ranking the skills based on salary and demand, I highlighted those offering the best combination of job security and financial benefit.

```
WITH skills_demand AS (
    SELECT
        s.skill_id,
        s.skills,
        COUNT(sj.job_id) AS demand_count
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
    GROUP BY
        s.skill_id
), 
average_salary AS (
    SELECT 
        s.skill_id,
        ROUND(AVG(jp.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim sj ON jp.job_id = sj.job_id
    INNER JOIN skills_dim s ON sj.skill_id = s.skill_id
    WHERE
        jp.job_title_short = 'Data Analyst'
        AND jp.salary_year_avg IS NOT NULL
    GROUP BY
        s.skill_id
)
SELECT
    d.skills,
    d.demand_count,
    a.avg_salary
FROM
    skills_demand d
INNER JOIN average_salary a ON d.skill_id = a.skill_id
WHERE  
    d.demand_count > 10
ORDER BY
    a.avg_salary DESC,
    d.demand_count DESC
LIMIT 25;
```
The visualizations represent the insights from the dataset:

***Top 10 Skills by Demand Count***:

***Python*** and ***Tableau*** lead the chart, showcasing their widespread demand across industries.
Other notable skills like R, Snowflake, and Azure also indicate their relevance in data and cloud computing roles.

![Top 10 Skills by Demand Count](/Visulisations/output_5.1.png)

***Top 10 Skills by Average Salary***:

***Go*** offers the highest average salary, highlighting its specialized demand in software development and backend systems.
Skills like ***Confluence***, ***Hadoop***, and ***Snowflake*** are also highly lucrative, reflecting their niche roles in data management and collaboration.

![Top 10 Skills by Average Salary](/Visulisations/output_5.2.png)


