
-- All job postings in Australia along with the associated company names.

SELECT 
jp.job_id, 
jp.job_title, 
c.name AS company_name, 
jp.job_location
FROM public.job_postings_fact jp
JOIN public.company_dim c ON jp.company_id = c.company_id
WHERE jp.job_location LIKE '%Australia%';

-- List all companies with jobs that require Python skills.

SELECT DISTINCT 
    c.name AS company_name
FROM public.company_dim c
JOIN public.job_postings_fact jp ON c.company_id = jp.company_id
JOIN public.skills_job_dim sj ON jp.job_id = sj.job_id
JOIN public.skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.job_location LIKE '%Australia%' 
  AND s.skills IN ('sql', 'python');


-- Count the number of jobs in Australia grouped by company name.

SELECT c.name AS company_name, COUNT(jp.job_id) AS job_count
FROM public.company_dim c
JOIN public.job_postings_fact jp ON c.company_id = jp.company_id
WHERE jp.job_location LIKE '%Australia%' 
GROUP BY c.name
ORDER BY job_count DESC;

-- All jobs in Australia with required skills and company details.

SELECT jp.job_id, jp.job_title, jp.job_location, s.skills, c.name AS company_name
FROM public.job_postings_fact jp
JOIN public.company_dim c ON jp.company_id = c.company_id
JOIN public.skills_job_dim sj ON jp.job_id = sj.job_id
JOIN public.skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.job_location LIKE '%Australia%';


-- Identify the top 3 skills most required in Australian job postings.

SELECT s.skills, COUNT(sj.job_id) AS job_count
FROM public.skills_job_dim sj
JOIN public.job_postings_fact jp ON sj.job_id = jp.job_id
JOIN public.skills_dim s ON sj.skill_id = s.skill_id
WHERE jp.job_location LIKE '%Australia%'
GROUP BY s.skills
ORDER BY job_count DESC
LIMIT 3;
