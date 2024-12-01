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
![Top 10 Salaries by Company](Visulisations\output_1.3.png)
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
![Salary Distribution](Visulisations\output_1.1.png)

### Job Salaries by Posting Date
- ***Observation***: The scatter plot reveals that higher salaries, such as the $650,000 job, tend to be posted earlier in the year, while jobs with salaries in the $180,000–$250,000 range are spread throughout the year.
- ***Insight***: Companies might prioritize advertising high-paying roles early in the year to secure top talent, while mid-range roles are consistently available throughout the year.

![Salaries by Posting Date](Visulisations\output_1.2.png)

Python code? Check it out here: [code for visulisation](/Visulisations/1_Top_Paying_Job_Australia.ipynb)

These graphs were created using Python's powerful data visualization libraries, such as Matplotlib
📊 and Pandas 🐼. The data was first processed and analyzed in a Pandas DataFrame 📋, and then visualized to provide insights into salary distributions, posting trends, and top-paying companies for data analyst roles. The Python scripts used functions like plt.hist 📈, plt.scatter ✨, and plt.bar 📊 to generate the charts, showcasing the flexibility and effectiveness of Python in data analysis and visualization tasks. 🚀