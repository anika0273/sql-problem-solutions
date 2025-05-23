SELECT candidate_id /*, COUNT(skill) AS no_of_skills --> We are only displaying the candidate ID */
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL') /* Filter the table with the 3 needed skills */
GROUP BY candidate_id /* This will display the cancdidate with their total skill counts */
HAVING COUNT(skill) = 3 /* HAVING is the filter used after GROUP BY, we are lookig for someone with all 3 skills */
ORDER BY candidate_id