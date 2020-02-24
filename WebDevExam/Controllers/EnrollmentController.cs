using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebDevExam.Controllers
{
    public class EnrollmentController : Controller
    {
        private WebDevExamEntities db = new WebDevExamEntities();
        // GET: Enrollment
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Edit(int id)
        {
            var item = (from e in db.Enrollments
                        where e.EnrollmentID == id
                        select e).FirstOrDefault();
            return View("EditEnrollment",item);
        }
        public ActionResult Delete(int id)
        {
            var item = (from e in db.Enrollments
                        where e.EnrollmentID == id
                        select e).FirstOrDefault();
            return View("DeleteEnrollment", item);
        }

        [HttpPost]
        public ActionResult Update(FormCollection form)
        {
            int enID = int.Parse(form["EnrollmentID"]);
            int grade = int.Parse(form["Grade"]);
            var item = (from e in db.Enrollments
                        where e.EnrollmentID == enID
                        select e).FirstOrDefault();
            item.Grade = grade;
            db.SaveChanges();

            int CourseID = int.Parse(form["CourseID"]);
            var listEnrollment = (from e in db.Enrollments
                                  where e.CourselD == CourseID
                                  select e).ToList();
            var course_selected = (from c in db.Courses
                                   where c.CourseID == CourseID
                                   select c).FirstOrDefault();
            ViewBag.Course = course_selected;
            return View("~/Views/Home/ListEnrollment.cshtml", listEnrollment);
        }
        public ActionResult ConfirmDelete(int id,int courseID)
        {
            var item = (from e in db.Enrollments
                        where e.EnrollmentID == id
                        select e).FirstOrDefault();
            db.Enrollments.Remove(item);
            db.SaveChanges();

            var listEnrollment = (from e in db.Enrollments
                                  where e.CourselD ==courseID
                                  select e).ToList();
            var course_selected = (from c in db.Courses
                                   where c.CourseID == courseID
                                   select c).FirstOrDefault();
            ViewBag.Course = course_selected;
            return View("~/Views/Home/ListEnrollment.cshtml", listEnrollment);
        }

    }
}