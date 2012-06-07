using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;

namespace CVLK2011.Controllers.Admin
{
    public class ConsultingsManagementController : BaseController
    {
        //
        // GET: /ConsultingsManagement/
        Models.DBContainer ctx = new Models.DBContainer();
        public int PageSize = 20;

        public ActionResult Index(string category, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetAllConsultings_Result> result = ctx.GetAllConsultings().ToList();
                var viewModel = new CVLK2011.Models.ConsultingsListViewModel();
                viewModel.Products = result.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = result.Count() };
                viewModel.CurrentCategory = category;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /ConsultingsManagement/Details/5

        public ActionResult Details(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            GetConsultingByID_Result result = ctx.GetConsultingByID(id).Single<GetConsultingByID_Result>();
            return View(result);
        }

        //
        // GET: /ConsultingsManagement/Create

        public ActionResult Create()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            CVLK2011.Models.Consulting c = new Models.Consulting();
            IEnumerable<GetConsultingStatus_Result> status = ctx.GetConsultingStatus().ToList();
            ViewData["ConsultStatus"] = new SelectList(status, "ConfigKey", "ConfigText");           
            return View(c);
        }

        //
        // POST: /ConsultingsManagement/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(CVLK2011.Models.Consulting cons, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");  
                cons.Status = collection["consulStatus"].ToString();
                cons.ConsultingAnwsers = collection["FckEditor1"].ToString();
                cons.DatePost = DateTime.Today;
                ctx.AddToConsultings(cons);
                ctx.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return RedirectToAction("Create");
            }
        }

        //
        // GET: /ConsultingsManagement/Edit/5

        public ActionResult Edit(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetConsultingByID_Result result = ctx.GetConsultingByID(id).Single<GetConsultingByID_Result>();
                IEnumerable<GetConsultingStatus_Result> status = ctx.GetConsultingStatus().ToList();
                ViewData["ConsultStatus"] = new SelectList(status, "ConfigKey", "ConfigText");
                return View(result);
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /ConsultingsManagement/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection)
        {           
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Consulting cons = ctx.Consultings.Single(p => p.ConsultingID == id);
                cons.Status = collection["consulStatus"].ToString();
                cons.ConsultingAnwsers = collection["FckEditor1"].ToString();
                //hieu.nguyen Fix
                cons.ConsultingQuestions = collection["ConsultingQuestions"].ToString();
                cons.ConsultingDesction = collection["ConsultingDesction"].ToString();
               //remvoe updateModel
                // UpdateModel(cons);
                ctx.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /ConsultingsManagement/Delete/5

        public ActionResult Delete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                int result = ctx.DeleteConsulting(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
