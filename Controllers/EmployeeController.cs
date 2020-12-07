using MockData.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MockData.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: /Employee/
        public ActionResult Index()
        {
            using (EmployeeContext context = new EmployeeContext())
            {
                var employees = context.Employees.OrderBy(x => x.first_name).ToList();
                ViewData["empList"] = employees; // Send this list to the view

            }
            return View();
        }

        /*Add and Update Employee Details*/
        [HttpPost]
        public JsonResult Add(Employee emp)
        {
            try
            {
                var employees = new List<Employee>();
                using (EmployeeContext context = new EmployeeContext())
                {
                    if (ModelState.IsValid)
                    {
                        if (emp.employee_id > 0) 
                            context.Entry<Employee>(emp).State = System.Data.EntityState.Modified;
                        else
                            context.Employees.Add(emp);
                        context.SaveChanges();
                    }
                    employees = context.Employees.OrderBy(x => x.first_name).ToList();
                }
                return Json(employees, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /*Fetch details of the selected employee, based on its primary key*/
        [HttpGet]
        public JsonResult Edit(int Id) 
        {
            try
            {
                var emp = new Employee();
                using (EmployeeContext context = new EmployeeContext())
                {
                    emp = context.Employees.Find(Id);
                }

                return Json(emp, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /*Delete the selected employee details*/
        [HttpGet]
        public JsonResult Delete(int Id)
        {
            try
            {
                var employees = new List<Employee>();
                using (EmployeeContext context = new EmployeeContext())
                {
                    var emp = context.Employees.Find(Id);
                    if (emp != null)
                    {
                        context.Employees.Remove(emp);
                        context.SaveChanges();
                    }
                    employees = context.Employees.OrderBy(x => x.first_name).ToList();
                }
                return Json(employees, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
