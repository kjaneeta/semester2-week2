.mode columns
.headers on

-- 1) Show raw LEFT JOIN rows so you can see which columns are NULL (blank)
SELECT
  Courses.id   AS CourseID,
  Courses.name AS CourseName,
  StudentCourses.student_id AS StudentID,
  -- replace NULLs with a readable label for inspection
  COALESCE(CAST(StudentCourses.student_id AS TEXT), '(no student)') AS StudentID_display
FROM Courses
LEFT JOIN StudentCourses ON Courses.id = StudentCourses.course_id
ORDER BY CourseName;

-- Note: NULL means "no matching row" on the right side of a LEFT JOIN.

-- 2) Aggregated view (counts per course) — same idea as before
SELECT name AS CourseName, COUNT(student_id) AS TotalStudents
FROM Courses
LEFT JOIN StudentCourses ON Courses.id = StudentCourses.course_id
GROUP BY CourseName
HAVING TotalStudents < 21
ORDER BY CourseName;