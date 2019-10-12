using SEG.BOL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SEG.Client.Controllers
{
    public class EmployeeController : Controller
    {
        public EmployeeController()
        {
        }
        public ActionResult Index()
        {
            return View(new List<Employee>());
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult LogOut()
        {
            //Session.Remove("accessToken");
            return View("Login");
        }
        public ActionResult Edit(int id)
        {
            @ViewBag.EmployeeId = id;
            return View("Create");
        }
        public ActionResult Create()
        {
            @ViewBag.EmployeeId = 0;
            return View();
        }
    }
}