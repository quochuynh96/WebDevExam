using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebDevExam.Controllers
{
    public class HomeController : Controller
    {
        WebDevExamEntities db = new WebDevExamEntities();
        public ActionResult Index()
        {
            var listCourse = db.Courses.ToList();
            return View("Index",listCourse);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        [HttpPost]
        public ActionResult ListEnrollment(FormCollection form)
        {
            int CourseID = int.Parse(form["CourseID"]);
            var listEnrollment = (from e in db.Enrollments
                                  where e.CourselD == CourseID
                                  select e).ToList();
            var course_selected = (from c in db.Courses
                                   where c.CourseID == CourseID
                                   select c).FirstOrDefault();
            ViewBag.Course = course_selected;
            return View("ListEnrollment", listEnrollment);
        }
    }
}