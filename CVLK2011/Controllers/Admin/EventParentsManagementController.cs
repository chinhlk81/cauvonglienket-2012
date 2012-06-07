using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CVLK2011.Models;
using System.IO;
namespace CVLK2011.Controllers.Admin
{
    [HandleError]
    public class EventParentsManagementController : BaseController
    {
        //
        // GET: /EventParents/
        private const string virtualPath = "~/Images/Events/";
        string physicalPath = "../../Images/Events/";
        DBContainer ctx = new DBContainer();
        public int PageSize = 10;
        public ActionResult Index(String currentEvParents, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetAllEventParents_Result> evparent = ctx.GetAllEventParents().ToList();
                var viewModel = new EventParentsListViewModel();
                viewModel.EventParentsList = evparent.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = evparent.Count() };
                viewModel.CurrentEventParents = currentEvParents;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /EventParents/Details/5

        public ActionResult Details(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetEventParentByID_Result eprt = ctx.GetEventParentByID(id).Single(p => p.EventParentID == id);
                if (eprt != null)
                    return View(eprt);
                return View();
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /EventParents/Create

        public ActionResult Create()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                EventParent evp = new EventParent();
                IEnumerable<ConfigValue> config = ctx.GetConfigValuesByEventParentsGroup();
                ViewData["Status"] = new SelectList(config, "ConfigKey", "ConfigText");
                return View(evp);
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /EventParents/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Exclude = "EventParentID")] EventParent evp, FormCollection collection, HttpPostedFileBase uploadFile)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                evp.EventParentImage = "";
                if (uploadFile != null)
                {
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, fileName, Session["Admin"].ToString());
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    uploadFile.SaveAs(filePath);
                    evp.EventParentImage = physicalPath + sFileName;
                }
                evp.EventParentDesc = collection["FckEditor1"];
                ctx.AddToEventParents(evp);
                ctx.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Create");
            }
        }
        
        //
        // GET: /EventParents/Edit/5

        public ActionResult Edit(int id)
        {
            try
            {
               Models.EventParent evp = ctx.EventParents.Where(p => p.EventParentID == id).SingleOrDefault();
                IEnumerable<ConfigValue> config = ctx.GetConfigValuesByEventParentsGroup();
                ViewData["Status1"] = new SelectList(config, "ConfigKey", "ConfigText", evp.Status);
                if(evp!=null)
                    return View(evp);
                return View();
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /EventParents/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection, HttpPostedFileBase uploadFile)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                // TODO: Add update logic here
                EventParent evp = ctx.EventParents.Single(p => p.EventParentID == id);
                evp.EventParentDesc = collection["FckEditor1"].ToString();
                evp.EventParentName = collection["EventParentName"].ToString();
                evp.Status = collection["Status"].ToString();
                String oldName = String.Empty;
                //uload image present
                if (uploadFile != null)
                {
                    oldName = evp.EventParentImage;
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, fileName, Session["Admin"].ToString());
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    uploadFile.SaveAs(filePath);
                    evp.EventParentImage = physicalPath + sFileName;

                }
                //UpdateModel(evp);
                ctx.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /EventParents/Delete/5

        public ActionResult Delete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                EventParent evp = ctx.EventParents.Single(p => p.EventParentID == id);
                evp.Status = Models.Utilities.cstDeleteStatus;
                ctx.SaveChanges();
                string evfile = evp.EventParentImage;
                Utilities.DeleteFile(Request, virtualPath, evfile);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /EventParents/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
