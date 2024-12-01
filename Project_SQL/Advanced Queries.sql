
--Find the top 3 companies with the most job postings in Australia.

SELECT 
company_id,
COUNT(*) AS job_count
FROM job_postings_fact
WHERE job_location LIKE '%Australia%'
GROUP BY company_id
ORDER BY job_count DESC
LIMIT 3;


-- List all jobs in Australia where job_no_degree_mention is TRUE and salary_year_avg is greater than 80,000.

SELECT 
job_title,
job_location,
salary_year_avg
FROM job_postings_fact
WHERE job_location LIKE '%Australia%' 
  AND job_no_degree_mention = TRUE 
  AND salary_year_avg > 80000;

-- Find the percentage of jobs in Australia that offer health insurance

SELECT 
    (COUNT(*) * 100.0 / 
    (SELECT COUNT(*) 
    FROM public.job_postings_fact 
    WHERE job_location LIKE '%Australia%')) AS percentage_with_health_insurance
FROM public.job_postings_fact
WHERE job_location LIKE '%Australia%' 
AND job_health_insurance = TRUE;
