using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebDevExam.Helper
{
    public class HelperClass
    {
        private WebDevExamEntities db = new WebDevExamEntities();
        public Student getStudentByID(int StudentID)
        {
            var student = (from s in db.Students
                           where s.StudentID == StudentID
                           select s).FirstOrDefault();
            return student;
        }
        public Course getCourseByID(int courseID)
        {
            var course = (from s in db.Courses
                           where s.CourseID == courseID
                           select s).FirstOrDefault();
            return course;
        }
    }
}