select  count(*) from finance_2;


SELECT YEAR(ISSUE_D) AS YEAR_OF_ISSUE_D,SUM(LOAN_AMNT) AS TOTAL_LOAN_AMNT
FROM finance_1
GROUP BY Year_of_issue_d
ORDER BY year_of_issue_d;

SELECT GRADE,SUB_GRADE,SUM(REVOL_BAL) AS TOTAL_REVOL_BAL
FROM finance_1 Inner join finance_2
ON finance_1.id = finance_2.id
GROUP BY GRADE ,SUB_GRADE
ORDER BY GRADE,SUB_GRADE;

SELECT verification_status,
CONCAT('$', FORMAT (ROUND(SUM(last_pymnt_amnt) / 10000, 2), 2), 'K') AS total_amount
FROM finance_1 INNER JOIN finance_2
ON finance_1.id = finance_2.id
GROUP BY verification_status;

SELECT addr_state,last_credit_pull_D,loan_status
from finance_1 inner join finance_2
on finance_1.id = finance_2.id
group by addr_state,last_credit_pull_D,loan_status
order by loan_status;

SELECT home_ownership, Last_pymnt_d,
CONCAT('$', FORMAT (ROUND(SUM(last_pymnt_amnt) / 10000, 2), 2), 'K') AS total_amount
FROM finance_1 INNER JOIN finance_2
ON finance_1.id = finance_2.id
GROUP BY home_ownership, last_pymnt_d
ORDER BY last_pymnt_d DESC, home_ownership DESC;