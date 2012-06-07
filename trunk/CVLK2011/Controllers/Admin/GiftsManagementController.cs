using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CVLK2011.Controllers.Admin
{
    public class GiftsManagementController : BaseController
    {
        //
        // GET: /QuanLyQuaTang/

        public ActionResult Index()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }
        //
        public ActionResult Details(int id)
        {
            return View();
        }

        //
    }
}
