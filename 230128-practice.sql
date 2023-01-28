-- 보기 중 옳은 것 찾기
select 
	students.nickname,
	courses.title,
	grades.exam_score,
	grade_points.grade,
	grade_points.point 
from 
	students
join grades on
	grades.student_id = students.id
join courses on
	grades.course_id = courses.id
join grade_points on
	grade_points.grade = grades.grade
where
	(nickname, title, exam_score, grade_points.grade, point) in (
	('홍팍', '프로그래밍', 80, 'A0', 4.0), 		-- a
	('라이언', '프로그래밍', 79, 'B+', 3.5), 	-- b
	('젤리', '대학 수학', 68, 'C+', 2.5), 		-- c 
	('알파고', '영작문', 91, 'A+', 5.0)  		-- d 
	)
	
;

-- 과목별 평균 시험점수
select 	
	courses.title as "과목명",
	avg_exam_score.round as "평균 시험점수"
from 
	courses
join (
	 -- 평균 시험 점수
		select
			course_id,
			round(avg(exam_score), 2)
		from
			grades
		group by 
			course_id
		
) as avg_exam_score on
	courses.id = avg_exam_score.course_id
;

-- 평균 학점이 3.5 미만인 학생 조회
select 
	students.nickname as "닉네임",
	avg_grade_point.round as "평균 학점"
from 
	students
join (
	-- 학생별 평균 학점
	select
		grades.student_id,
		round(avg(point), 2)		
	from 
		grades
	join grade_points on 
		grades.grade = grade_points.grade
	group by 
		grades.student_id
	having 
		avg(point) <= 3.5
	) as avg_grade_point on
	students.id = avg_grade_point.student_id
;

-- 강의별 평균 학점과 평균학점이 높은 강의 top 3 조회 
select 
	title as "강의명",
	round as "평균학점"
from 
	courses
join (
		-- 강의별 평균학점
		select
			course_id,
			round(avg(point), 2)
		from 
			grades
		join grade_points on 
			grades.grade = grade_points.grade
		group by 
			course_id
	 	having
	 		avg(point) > (
	 		-- 모든 강의의 평균 학점
	 		select
	 			avg(point)
	 		from
	 			grades
	 		join grade_points on
	 			grade_points.grade = grades.grade
							)
		order by
			avg(point) desc
	 	limit 
	 		3
	) as ggul_courses on
	ggul_courses.course_id = courses.id
;
