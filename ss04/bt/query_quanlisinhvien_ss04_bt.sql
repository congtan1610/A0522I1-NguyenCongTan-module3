use quanlybanhang;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from	`subject`
group by Credit
having Credit=(select max(Credit) from `subject`);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select st.StudentID,StudentName,Address,Phone,st.`Status`,st.ClassID,ClassName,StartDate,MarkID,m.SubID,Mark,ExamTimes,	SubName,Credit
from student st join class c on st.ClassID=c.ClassID join mark m on st.StudentId=m.StudentId join `subject` s on m.SubId=s.SubId
group by mark 
having mark=(select max(Mark) from mark); 
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select st.StudentID,StudentName,Address,Phone,st.`Status`,st.ClassID,ClassName,StartDate,MarkID,m.SubID,ExamTimes,SubName,Credit,avg(Mark) as dtb
from student st join class c on st.ClassID=c.ClassID join mark m on st.StudentId=m.StudentId join `subject` s on m.SubId=s.SubId
group by StudentId
order by dtb desc; 

