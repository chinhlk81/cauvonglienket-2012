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
    public class AdsManagementController : BaseController
    {
        //
        // GET: /AdManagement/
        DBContainer ctx = new DBContainer();
        public int PageSize=10;
        const string virtualPath = "~/Content/Advertising/";
        const string physicalPath = "../../../Content/Advertising/";
        public ActionResult Index(int page=0)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
           IEnumerable<Ad> ad =ctx.Ads_GetAll().ToList();
           var model =new AdListViewModel();
           model.AdList = ad.Skip((page) * PageSize).Take(PageSize).ToList();
           model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = ad.Count() };
           return PartialView(model);
          
        }
        //Paging
        public ActionResult Paging(string Filter, int page = 0)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            IEnumerable<Ad> ad = null;
            if (String.IsNullOrEmpty(Filter))
                ad = ctx.Ads_GetAll().ToList();
            else
                ad = ctx.Ads_GetAll().Where(p => p.OnPage == Filter).ToList();
            var model = new AdListViewModel();
            model.Filter = Filter;
            model.AdList = ad.Skip((page) * PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = ad.Count() };
            return PartialView("UCAdList",model);

        }
        //
        // GET: /AdManagement/Details/5
        public ActionResult FilterOnPage(String onPage, int page = 0)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");

            IEnumerable<Ad> ads = ctx.Ads_GetAll().Where(p => p.OnPage == onPage).ToList();
            var model = new AdListViewModel();
            model.Filter = onPage;
            model.AdList = ads.Skip((page) * PageSize).Take(PageSize).ToList();
            model.PagingInfo = new PagingInfo { CurrentPage = page, ItemsPerPage = PageSize, TotalItems = ads.Count() };
            return PartialView("UCAdList", model);
        }
        //
      
        public ActionResult Details(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Ad ad = ctx.Ads_GetByID(id).SingleOrDefault();
            return View(ad);
        }

        //
        // GET: /AdManagement/Create

        public ActionResult Create()
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            InitialStatusControl("");
            return View();
        } 

        //
        // POST: /AdManagement/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Exclude = "AdID")]CVLK2011.Models.Ad ad, FormCollection collection, HttpPostedFileBase uploadFile)
        {
            try
            {
                //// TODO: Add insert logic here
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                if (String.IsNullOrWhiteSpace(collection["AdTitle"].ToString()))
                {
                    ViewData["AdMsg"] = "Vui  lòng nhập tiêu đề!";
                    InitialStatusControl(ad.AAStatus);
                    return View();
                }
                if (uploadFile != null && uploadFile.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = GenerateFileNameByNo(Request, virtualPath, fileName,"AdImage");
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                    uploadFile.SaveAs(filePath);
                    //String fileThumbPath = Path.Combine(Request.MapPath(virtualPath + "Thumbs/"), sFileName);
                    //MakeImagesAndThumbFile(uploadFile.InputStream, filePath, fileThumbPath, 400, 300, 130, 130, 75);
                    ad.AdImagePath = physicalPath + sFileName;
                    ad.AdImageThumbPath = physicalPath + sFileName;

                }
                ad.AACreateDate = DateTime.Today;
                ad.AAStatus = collection["status"].ToString();
                ad.AdContent=collection["FckEditor1"].ToString();
                ctx.AddToAds(ad);
                ctx.SaveChanges();
                ViewData["AdMsg"] = "Đã tạo thành công!!";
                InitialStatusControl("");
                return View();
            }
            catch
            {
                InitialStatusControl("");
                ViewData["AdError"] = "Đã có lỗi xẩy ra trong quá trình tạo. Vui long kiểm tra lại!!";
                return View();
                
            }
        }
        
        //
        // GET: /AdManagement/Edit/5
 
        public ActionResult Edit(int id)
        {
            if (!IsAuthenticateAdmin())
                return RedirectToAction("LogOn", "AdminHome");
            Ad ad = ctx.Ads_GetByID(id).SingleOrDefault();
            InitialStatusControl(ad.AAStatus);
           
            return View(ad);
        }

        //
        // POST: /AdManagement/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(CVLK2011.Models.Ad model, int id, FormCollection collection, HttpPostedFileBase uploadFile)
        {
            try
            {
                //// TODO: Add update logic here
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Ad ad = ctx.Ads_GetByID(id).SingleOrDefault();
                //// TODO: Add insert logic here
                if (String.IsNullOrWhiteSpace(collection["AdTitle"].ToString()))
                {
                    ViewData["AdMsg"] = "Vui  lòng nhập tiêu đề!";
                    InitialStatusControl(ad.AAStatus);
                    return View(ad);
                }
                if (uploadFile != null && uploadFile.ContentLength > 0)
                {
                    String oldImage = ad.AdImagePath;
                    String oldThmbImage = ad.AdImageThumbPath;
                    var fileName = Path.GetFileName(uploadFile.FileName);
                    String sFileName = GenerateFileNameByNo(Request, virtualPath, fileName, "AdImage");
                    string filePath = Path.Combine(Request.MapPath(virtualPath), sFileName);
                   // String fileThumbPath = Path.Combine(Request.MapPath(virtualPath + "Thumbs/"), sFileName);
                    // MakeImagesAndThumbFile(uploadFile.InputStream, filePath, fileThumbPath, 400, 300, 130, 130, 75);
                    uploadFile.SaveAs(filePath);
                    ad.AdImagePath = physicalPath + sFileName;
                    ad.AdImageThumbPath = physicalPath + sFileName;
                    DeleteFile(Request, virtualPath, oldImage);
                    //DeleteFile(Request, virtualPath + "Thumbs/", oldThmbImage);

                }
               
                ad.AAStatus = collection["status"].ToString();
                ad.AdContent = collection["FckEditor1"].ToString();
                ad.AdTitle = collection["AdTitle"].ToString();
                ad.OnPage = collection["OnPage"].ToString();
                ad.Position = collection["Position"].ToString();
                ad.AdLink = model.AdLink;
                ad.AdDesc = model.AdDesc;
                ctx.SaveChanges();
                InitialStatusControl(ad.AAStatus);
                ViewData["AdMsg"] = "Cập nhật thành công!!!";
                return View(ad);
                
            }
            catch
            {
                InitialStatusControl("");
                ViewData["AdError"] = "Đã có lỗi xẩy ra trong quá trình tạo. Vui long kiểm tra lại!!";
                model.AdID = id;
                return View(model);
            }
        }

        //
        // GET: /AdManagement/Delete/5
 
       
        public ActionResult Delete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                if (!IsAuthenticateAdmin())
                    return RedirectToAction("LogOn", "AdminHome");
                Ad ad = ctx.Ads_GetByID(id).SingleOrDefault();
                ctx.Ads_Delete(id);
                DeleteFile(Request, virtualPath,ad.AdImagePath);
               // DeleteFile(Request, virtualPath + "Thumbs/", ad.AdImageThumbPath);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        private void InitialStatusControl(String status)
        {
            IEnumerable<ConfigValue> cfg = ctx.Config_GetByGroup("Ads").ToList();
            ViewData["Status"] = new SelectList(cfg, "ConfigKey", "ConfigText", status);
        }
        //public void CheckIsHot(int id)
        //{
        //    try
        //    {
        //        //if (!IsAuthenticateAdmin())
        //        //    return;
        //        Ad fun = ctx.Ads_GetByID(id).SingleOrDefault();
        //        if (fun.IsHot)
        //            fun.IsHot = false;
        //        else
        //            fun.IsHot = true;
        //        ctx.SaveChanges();


        //    }
        //    catch
        //    {
        //        return;
        //    }
        //}
        public bool IsExistNo(String AdName)
        {
            Ad fun = ctx.Ads_GetByTitle(AdName).SingleOrDefault();
            if (fun != null)
                return true;
            return false;
        }
        public bool IsExistName(String AdName, int id)
        {
            Ad ad = ctx.Ads_GetByTitle(AdName).SingleOrDefault();
            if (ad == null)
                return false;
            else
            {
                if (ad.AdID == id)
                    return false;
                else
                    return true;

            }
        }
    }
}
