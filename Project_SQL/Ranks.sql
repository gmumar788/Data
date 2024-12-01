
--Using ROW_NUMBER()
SELECT 
    jp.job_id,
    jp.job_title,
    jp.job_location,
    jp.salary_hour_avg,
    ROW_NUMBER() OVER (PARTITION BY jp.job_location ORDER BY jp.salary_hour_avg DESC) AS row_number
FROM public.job_postings_fact jp
WHERE jp.job_location LIKE '%Australia%';

--Extract all jobs with "Data Analyst" in the job_title
SELECT *
FROM public.job_postings_fact
WHERE job_title ILIKE '%Data Analyst%'
  AND job_location LIKE '%Australia%';

--2. Analyze Job Locations

SELECT job_location, COUNT(*) AS job_count
FROM public.job_postings_fact
WHERE job_title ILIKE '%Data Analyst%'
  AND job_location LIKE '%Australia%'
GROUP BY job_location
ORDER BY job_count DESC;

--Analyze Work-From-Home Trends

SELECT 
    SUM(CASE WHEN job_work_from_home = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS work_from_home_percentage
FROM public.job_postings_fact
WHERE job_title ILIKE '%Data Analyst%'
  AND job_location LIKE '%Australia%';

--Salary Insights

SELECT 
    ROUND(AVG(salary_year_avg), 2) AS avg_yearly_salary,
    ROUND(AVG(salary_hour_avg), 2) AS avg_hourly_salary
FROM public.job_postings_fact
WHERE job_title ILIKE '%Data Analyst%'
  AND job_location LIKE '%Australia%';

--Skill Requirements

SELECT s.skills, COUNT(*) AS skill_count
FROM public.skills_job_dim sj
JOIN public.job_postings_fact jp ON sj.job_id = jp.job_id
JOIN public.skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.job_title ILIKE '%Data Analyst%'
  AND jp.job_location LIKE '%Australia%'
GROUP BY s.skills
ORDER BY skill_count DESC;
