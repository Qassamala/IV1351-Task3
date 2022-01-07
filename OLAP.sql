CREATE VIEW AllLessons AS SELECT date_trunc('month', starttime) AS month, COUNT(*) AS nr_of_lessons_in_month, COUNT(*) AS ensembles FROM ensemble GROUP BY month UNION ALL SELECT date_trunc('month', starttime) AS month, COUNT(*) AS nr_of_lessons_in_month, COUNT(*) AS group_lessons FROM group_lesson GROUP BY month UNION ALL SELECT date_trunc('month', starttime) AS month, COUNT(*) AS nr_of_lessons_in_month, COUNT(*) AS individual_lessons FROM individual_lesson GROUP BY month;
SELECT EXTRACT(Year FROM month) as year, EXTRACT(MONTH FROM month) as month, nr_of_lessons_in_month, ensembles, group_lessons, individual_lessons FROM (SELECT month, SUM(nr_of_lessons_in_month) AS nr_of_lessons_in_month FROM AllLessons WHERE EXTRACT(YEAR FROM month) = 2021 GROUP BY month ORDER BY month DESC) as total LEFT JOIN (SELECT date_trunc('month', e.starttime) AS e_month, COUNT(*) AS ensembles FROM ensemble AS e GROUP BY e_month) as ensembles ON month = e_month LEFT JOIN (SELECT date_trunc('month', g.starttime) AS g_month, COUNT(*) AS group_lessons FROM group_lesson AS g GROUP BY g_month) as group_lessons ON month = g_month LEFT JOIN (SELECT date_trunc('month', i.starttime) AS i_month, COUNT(*) AS individual_lessons FROM individual_lesson AS i GROUP BY i_month) as individual_lessons ON month = i_month ORDER BY month DESC;

SELECT SUM(nr_of_lessons_in_month)/12 AS total_lessons_avg_per_month, SUM(ensembles)/12 AS ensemble_avg_per_month, SUM(group_lessons)/12 AS group_lesson_avg_per_month , SUM(individual_lessons)/12 AS individual_lesson_avg_per_month FROM (SELECT month, SUM(nr_of_lessons_in_month) AS nr_of_lessons_in_month FROM AllLessons WHERE EXTRACT(YEAR FROM month) = 2021 GROUP BY month ORDER BY month DESC) as total LEFT JOIN (SELECT date_trunc('month', e.starttime) AS e_month, COUNT(*) AS ensembles FROM ensemble AS e GROUP BY e_month) as ensembles ON month = e_month LEFT JOIN (SELECT date_trunc('month', g.starttime) AS g_month, COUNT(*) AS group_lessons FROM group_lesson AS g GROUP BY g_month) as group_lessons ON month = g_month LEFT JOIN (SELECT date_trunc('month', i.starttime) AS i_month, COUNT(*) AS individual_lessons FROM individual_lesson AS i GROUP BY i_month) as individual_lessons ON month = i_month;

CREATE MATERIALIZED VIEW InstructorWorkLoad AS SELECT firstName, lastName, id, nr_of_lessons FROM instructor LEFT JOIN (SELECT instructor_id, COUNT(*) AS nr_of_lessons FROM (SELECT instructor_id FROM ensemble WHERE starttime >= date_trunc('month', CURRENT_DATE) UNION ALL SELECT instructor_id FROM group_lesson WHERE starttime >= date_trunc('month', CURRENT_DATE) UNION ALL SELECT instructor_id FROM individual_lesson WHERE starttime >= date_trunc('month', CURRENT_DATE)) AS union_table GROUP BY instructor_id HAVING COUNT(*) > 0 ORDER BY COUNT(*) DESC) as sub ON id = instructor_id;
SELECT * from InstructorWorkLoad;


CREATE VIEW ensembleNextWeek AS SELECT id as ensemble_id, genre, maxStudents, SUM(enlisted_students) as enlisted_students, CASE WHEN maxStudents - enlisted_students <= 0 THEN 'Fully booked' WHEN maxStudents - enlisted_students < 3 AND maxStudents - enlisted_students > 0 THEN '1-2 seats left' WHEN maxStudents - enlisted_students > 2 THEN 'More than 2 seats left' ELSE 'Seats left' END seats_left FROM ((SELECT id, genre, starttime, minStudents, maxStudents FROM ensemble WHERE date_part('week', CURRENT_DATE) +1 = date_part('week', starttime) ORDER BY genre, date_part('dow', starttime) DESC ) as ensemble LEFT JOIN (SELECT ensemble_id, COUNT(*) as enlisted_students FROM student_ensemble GROUP BY ensemble_id) as students_per_ensemble ON id = ensemble_id) GROUP BY id, maxStudents, genre, enlisted_students;
SELECT * FROM ensembleNextWeek;