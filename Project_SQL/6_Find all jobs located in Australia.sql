SELECT 
    jp.job_location, 
    COUNT(*) AS job_count
FROM job_postings_fact jp
WHERE 
    jp.job_title ILIKE '%Data Analyst%' 
    AND jp.job_location LIKE '%Australia%'
GROUP BY 
    jp.job_location
ORDER BY 
    job_count DESC;