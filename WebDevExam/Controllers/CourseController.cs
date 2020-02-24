using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebDevExam.Controllers
{
    public class CourseController : Controller
    {
        private WebDevExamEntities db = new WebDevExamEntities();
        // GET: Course
        public ActionResult Index()
        {
            var listCourse = db.Courses.ToList();
            return View("ListCourse", listCourse);
        }
        public ActionResult Create()
        {
            return View("CreateCourse");
        }
        public ActionResult Edit(int id)
        {
            var course = (from c in db.Courses
                          where c.CourseID == id
                          select c).FirstOrDefault();
            return View("EditCourse",course);
        }
        [HttpPost]
        public ActionResult Update(FormCollection form)
        {
            var courseID = int.Parse(form["CourseID"]);
            var course = (from c in db.Courses
                          where c.CourseID == courseID
                          select c).FirstOrDefault();
            course.Title = form["Title"];
            course.Credits = float.Parse(form["Credits"]);
            db.SaveChanges();
            var listCourse = db.Courses.ToList();
            return View("ListCourse", listCourse);
        }
        public ActionResult Delete(int id)
        {
            var course = (from c in db.Courses
                          where c.CourseID == id
                          select c).FirstOrDefault();
            db.Courses.Remove(course);
            db.SaveChanges();
            var listCourse = db.Courses.ToList();
            return View("ListCourse", listCourse);
        }
        public ActionResult CreateNew(FormCollection form)
        {
            Course c = new Course();
            c.Title = form["Title"];
            c.Credits = float.Parse(form["Credits"]);
            db.Courses.Add(c);
            db.SaveChanges();
            var listCourse = db.Courses.ToList();
            return View("ListCourse", listCourse);
        }
    }
}