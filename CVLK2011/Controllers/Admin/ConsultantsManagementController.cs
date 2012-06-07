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
 public class ConsultantsManagementController : BaseController
    {
        //
        // GET: /Consultants/
        const string virtualPath = "~/Images/Consultants/";
        string physicalPath = "../../Images/Consultants/";
        DBContainer ctx = new DBContainer();
        public int PageSize = 20;
        public static String cstDeleteStatus = "Delete";
        public ActionResult Index(String currentConsultant,int page=1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetAllConsultants_Result> cst = ctx.GetAllConsultants().ToList();
                //paging
                var viewModel = new ConsultantsListViewModel();
                viewModel.ConsultantList = cst.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cst.Count() };
                viewModel.CurrentConsultant = currentConsultant;
                return View(viewModel);
            }
            catch
            {
                return View();
            }
        }
        /// <summary>
        /// Create By Hoang.Nguyen
        /// Create date:
        /// Desc:
        /// </summary>
        /// <param name="consultantName">Tên hỗ trợ viên</param>
        /// <param name="currentConsultant"></param>
        /// <param name="page">Số trang đang hiển thị</param>
        /// <returns></returns>
        public ActionResult SearchConsultantsByName(string consultantName, String currentConsultant, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetAllConsultants_Result> cst = ctx.Admin_SearchAllConsultantsByName(consultantName).ToList();
                //paging
                var viewModel = new ConsultantsListViewModel();
                viewModel.ConsultantList = cst.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cst.Count() };
                viewModel.CurrentConsultant = currentConsultant;
                return View("Index", viewModel);
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
            }
            return RedirectToAction("Index", "AdminHome");
        }
        public ActionResult AdvanceSearchConsultantsForAdminGUI()
        {
            CVLK2011.Models.Consultant objConsultantInfo = new Consultant();
            return View(objConsultantInfo);
        }
        public ActionResult AdvanceSearchConsultantsResultForAdminGUI(FormCollection frmCollection, String currentConsultant, int page = 1)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<GetAllConsultants_Result> cst = ctx.Admin_AdvanceSearchByConsultants(
                    frmCollection["ConsultantName"], frmCollection["ConsultantEmail"],frmCollection["ConsultantPhone"],
                    frmCollection["ConsultantYahooID"], frmCollection["ConsultantSkypeID"],
                    frmCollection["ConsultantDesc"],
                    frmCollection["Status"]
                    ).ToList();
                //paging
                var viewModel = new ConsultantsListViewModel();
                viewModel.ConsultantList = cst.Skip((page - 1) * PageSize).Take(PageSize).ToList();
                viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = cst.Count() };
                viewModel.CurrentConsultant = currentConsultant;
                return View("Index",viewModel);
            }
            catch
            {
                ModelState.AddModelError("", "Search Failure, see inner exception");
            }
            return RedirectToAction("Index", "AdminHome");
        }
        //
        // GET: /Consultants/Details/5
        public void CheckFrontPage(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return;
                Consultant cst = ctx.Consultants.SingleOrDefault(p => p.ConsultantID == id);
                if (cst.ConsultantFrontPage)
                    cst.ConsultantFrontPage = false;
                else
                    cst.ConsultantFrontPage = true;
                ctx.SaveChanges();


            }
            catch
            {
                return;
            }
        }
        public ActionResult Details(int id)
        {

            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetConsultantByID_Result cst = ctx.GetConsultantByID(id).Single(ct=>ct.ConsultantID==id);
               if (cst != null)
                    return View(cst);
                return View();
            }
            catch
            {
                return View();
            }
        }
        //
        public ActionResult ActiveConsultants()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Consultant> consultants = ctx.Consultants.Where(p => p.Status != "Dummy").ToList();
                foreach (var item in consultants)
                {
                    item.Status = Utilities.cstVisible;
                    ctx.SaveChanges();
                }
                return RedirectToAction("Index");

            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        //deactive
        public ActionResult DeactivateConsultants()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                IEnumerable<Consultant> consultants = ctx.Consultants.Where(p => p.Status != "Dummy").ToList();
                foreach (var item in consultants)
                {
                    item.Status = Utilities.cstInvisible;
                    ctx.SaveChanges();
                }
                return RedirectToAction("Index");

            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        //
        // GET: /Consultants/Create

        public ActionResult Create()
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                CVLK2011.Models.Consultant cst = new Models.Consultant();
                IEnumerable<ConfigValue> result = ctx.GetStatusByConsultantsGroup().ToList();
                ViewData["Status"] = new SelectList(result, "ConfigKey", "ConfigText");
                return View(cst);
            }
            catch
            {
                return View();
                     
            }
        }

        //
        // POST: /Consultants/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Exclude = "ConsultantID")] CVLK2011.Models.Consultant cst, FormCollection collection, HttpPostedFileBase uploadFile)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                cst.ConsultantPicture = String.Empty;
                if (uploadFile != null)
                {
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, fileName, Session["Admin"].ToString());
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    uploadFile.SaveAs(filePath);
                    cst.ConsultantPicture = physicalPath + sFileName;
                    cst.ConsultantDesc = collection["FckEditor1"].ToString();
                }
                String ConsultantFrontPage = collection["ConsultantFrontPage"].ToString();
                if (ConsultantFrontPage.StartsWith("true"))
                    cst.ConsultantFrontPage = true;
                else
                    cst.ConsultantFrontPage = false;
                
                ctx.AddToConsultants(cst);
                ctx.SaveChanges();
                return Redirect("Index");
            }
            catch(Exception ex)
            {
                return Redirect("Create");
            }
        }
        
        //
        // GET: /Consultants/Edit/5
       
        public ActionResult Edit(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Consultant cst = ctx.Consultants.Single(ct=>ct.ConsultantID==id);
               // GetConsultantByID_Result cst = ctx.GetConsultantByID(id).Single(ct => ct.ConsultantID == id);
                IEnumerable<ConfigValue> result = ctx.GetStatusByConsultantsGroup().ToList();
                ViewData["Status1"] = new SelectList(result, "ConfigKey", "ConfigText", cst.Status);
                if (cst != null)
                    return View(cst);
                return View();
            }
            catch
            {
                return View();
            }
        }

        //
        // POST: /Consultants/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, FormCollection collection, HttpPostedFileBase editFile)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Consultant cst = ctx.Consultants.Single(p => p.ConsultantID == id);
                if (editFile != null)
                {
                    String oldName = cst.ConsultantPicture;
                    var fileName = Path.GetFileName(editFile.FileName);
                    //const string pathStoredImage = "../../Images/Consultants/";
                    String sFileName = Utilities.GenerateImageName(Request, virtualPath, fileName, Session["Admin"].ToString());
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    editFile.SaveAs(filePath);
                    cst.ConsultantPicture = physicalPath + sFileName;
                    
                    //delete old file
                    if (!String.IsNullOrEmpty(oldName))
                    {
                        FileInfo info = new FileInfo(oldName);
                        Utilities.DeleteFile(Request, virtualPath, oldName);
                    }
                }
                cst.ConsultantDesc = collection["FckEditor1"].ToString();
                String ConsultantFrontPage = collection["ConsultantFrontPage"].ToString();
                if (ConsultantFrontPage.StartsWith("true"))
                    cst.ConsultantFrontPage = true;
                else
                    cst.ConsultantFrontPage = false;
                
                UpdateModel(cst);
                ctx.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Consultants/Delete/5

        public ActionResult Delete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                GetConsultantByID_Result cst = ctx.GetConsultantByID(id).FirstOrDefault();
                ctx.DeleteConsultant(id);
                //delete old file
                    Utilities.DeleteFile(Request, virtualPath, cst.ConsultantPicture);
                return RedirectToAction("Index");
            }catch
            {
                return View();
            }
        }

        //
        // POST: /Consultants/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.DeleteConsultant(id);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        #region--Oline Support
        public ActionResult OSCreate()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Models.OlineSupport os = new OlineSupport();
            return View(os);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult OSCreate([Bind(Exclude = "OSID")] Models.OlineSupport os, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                String typical = collection["Active"].ToString();
                if (typical.StartsWith("true"))
                    os.IsActive = true;
                else
                    os.IsActive = false;
                EnCrypto cript = new EnCrypto();
                os.OSPwdEmailFrom= cript.Encrypt(os.OSPwdEmailFrom);
                ctx.AddToOlineSupports(os);
                ctx.SaveChanges();
                return RedirectToAction("OSIndex");
            }
            catch
            {
                return RedirectToAction("Index","AdminHome");
            }
        }
        public ActionResult OSIndex(string currentpage, int page =1)
        {
           
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            IEnumerable<OlineSupport> osLists = ctx.OlineSupports.ToList();
            var viewModel = new OlineSupportListViewModel();
            viewModel.Products = osLists.Skip((page-1)*PageSize).Take(PageSize).ToList();
            viewModel.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = osLists.Count() };
            viewModel.CurrentCategory = currentpage;
            return View(viewModel);
        }
        //details
        public ActionResult OSDetails(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                OlineSupport  os = ctx.OlineSupports.Single(p => p.OSID == id);
                if (os != null)
                    return View(os);
                return View();
            }
            catch
            {
                return View();
            }
        }

        //update
        public ActionResult OSUpdate(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Models.OlineSupport os = ctx.OlineSupports.Single(p => p.OSID == id);
            return View(os);
            
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult OSUpdate(int id, FormCollection collection)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Models.OlineSupport os = ctx.OlineSupports.Single(p => p.OSID == id);
                String typical = collection["Active"].ToString();
                if (typical.StartsWith("true"))
                    os.IsActive = true;
                else
                    os.IsActive = false;
               UpdateModel(os);
               EnCrypto cript = new EnCrypto();
               os.OSPwdEmailFrom =cript.Encrypt(os.OSPwdEmailFrom);
                ctx.SaveChanges();
                return RedirectToAction("OSIndex");
            }
            catch
            {
                return RedirectToAction("Index", "AdminHome");
            }
        }
        public ActionResult OSDelete(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                ctx.OSDelete(id);
                return RedirectToAction("OSIndex");
            }
            catch
            {
                return RedirectToAction("Index", "AdminHome");
            }
        }
        public ActionResult OSCheck(int id)
        {
            try
            {
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Models.OlineSupport os = ctx.OlineSupports.Single(p => p.OSID == id);
                if (os.IsActive == true)
                {
                    os.IsActive = false;
                }
                // ctx.OSDeActivate(id);
                else
                {
                    os.IsActive = true;
                    //ctx.OSActive(id);
                }
               // UpdateModel(os);
                ctx.SaveChanges();
                return RedirectToAction("OSIndex");
            }
            catch
            {
                return RedirectToAction("Index", "AdminHome");
            }
        }
       
        #endregion
    }
}
